from linovelib2epub import Linovelib2Epub
import threading


def download1(book):
    try:
        linovelib_epub = Linovelib2Epub(book_id=book, divide_volume=True)
        linovelib_epub.run()
        file_path = str(book) + '-success.txt'
        with open(file_path, 'w', encoding='utf-8') as file:
            file.write('')
    except Exception as e:
        file_path = str(book) + '-error.txt'
        with open(file_path, 'w', encoding='utf-8') as file:
            file.write(str(e))
        print(e)


def range_f(start, end):
    for i in range(start, end):
        download1(i)


if __name__ == '__main__':
    threads = []
    num_threads = 10    # 线程数
    start_param = 101   # 起始参数
    end_param = 200     # 结束参数--------
    range_per_thread = (end_param - start_param) // num_threads
    # 创建并启动线程
    for i in range(num_threads):
        start = start_param + i * range_per_thread
        end = start + range_per_thread if i < num_threads - 1 else end_param + 1
        thread = threading.Thread(target=range_f, args=(start, end))
        threads.append(thread)
        thread.start()

    # 等待所有线程完成
    for thread in threads:
        thread.join()
