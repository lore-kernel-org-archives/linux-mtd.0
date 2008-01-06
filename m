Received: from smtp.ustc.edu.cn ([202.38.64.16] helo=ustc.edu.cn)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JBb7V-0003TF-Rx
	for linux-mtd@lists.infradead.org; Sun, 06 Jan 2008 19:25:24 +0000
Message-ID: <399646872.11492@ustc.edu.cn>
Message-ID: <4781288A.8080407@mail.ustc.edu.cn>
Date: Mon, 07 Jan 2008 03:14:18 +0800
From: =?GB2312?B?yrHV/Q==?= <shizheng@mail.ustc.edu.cn>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: why ubimkvol can't recognize /dev/ubi0?
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
I wanna have a try of ubifs on nandsim, and do as what the ubifs wiki
tells me
(http://osl.sed.hu/wiki/ubifs/index.php/Download_the_source).

1. compile, install and boot the new kernel(2.6.23)
the configuration option for ubi and nandsim is default turned on as module.


2. make the mtd-utils to produce ubimkvol

3. create a ubi when I got the error
# modprobe nandsim
# modprobe ubi mtd=0
# ls /dev/ubi0 -l
crw-rw---- 1 root root 253, 0 2007-12-25 01:46 /dev/ubi0
# ls /sys/class/ubi -l
drwxr-xr-x 3 root root 0 2007-12-25 01:46 ubi0
-r--r--r-- 1 root root 4096 2007-12-25 01:49 version
# ubimkvol /dev/ubi0 -n 0 -N test -s 20MiB
libubi error: readdir failed on "/sys/class/ubi"
readdir: No such file or directory
ubimkvol error: "/dev/ubi0" is not an UBI device node

it's so strange about the readdir failure, because there is the ubi0
entry in sysfs.

did I miss any step, such as kernel configuration or mtd-tools installation?

Thanks a lot!

best wishes, shizheng
