Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14hFWZ-0005sI-00
	for mtd-list@infradead.org; Sun, 25 Mar 2001 19:45:59 +0100
Received: from ip-216-23-50-67.adsl.one.net ([216.23.50.67] helo=appserver.databrokers.net)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14hFWX-0005rY-00
	for mtd@infradead.org; Sun, 25 Mar 2001 19:45:57 +0100
Received: from databrokers.net ([10.131.76.12])
          by appserver.databrokers.net (Netscape Messaging Server 3.6)
           with ESMTP id 410 for <mtd@infradead.org>;
          Sun, 25 Mar 2001 13:44:55 -0500
Message-ID: <3ABE3CBD.59DDE321@databrokers.net>
Date: Sun, 25 Mar 2001 13:45:17 -0500
From: "Iasen Hristov" <ihristov@databrokers.net>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Can't compile 2.4.2 kernel after MTD patch
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

1. I have a Mandrake 7.2 (kernel 2.2.17)
2. Downloaded 2.4.2 version of kernel from kernel.org
        linux-2.4.2.tar.gz      21-Feb-2001 17:00  24.1M
3. Compiled with MTD options enabled, able to boot from hard disk, but
could not detect the DOC
4. downloaded MTD from CVS
5. patched in the kernel, which created the corresponding symbolic links

6. now if I do
        make bzImage (after "make mrproper", "make menuconfig" and "make
dep")
I get

make -C mtd
make[2]: Entering directory `/home/src/linux-2.4.2/drivers/mtd'
make all_targets
make[3]: Entering directory `/home/src/linux-2.4.2/drivers/mtd'
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer -fno-strict-aliasing -pipe
-mpreferred-stack-boundary=2 -march=i486    -c -o nftl.o nftl.c
nftl.c: In function `NFTL_notify_add':
nftl.c:204: warning: long int format, int arg (arg 3)
nftl.c:204: warning: long int format, int arg (arg 4)
nftl.c: In function `NFTL_findwriteunit':
nftl.c:624: `MTD_DEBUG_LEVEL_1' undeclared (first use in this function)
nftl.c:624: (Each undeclared identifier is reported only once
nftl.c:624: for each function it appears in.)
nftl.c: In function `nftl_ioctl':
nftl.c:847: warning: implicit declaration of function `blk_ioctl'
make[3]: *** [nftl.o] Error 1
make[3]: Leaving directory `/home/src/linux-2.4.2/drivers/mtd'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/home/src/linux-2.4.2/drivers/mtd'
make[1]: *** [_subdir_mtd] Error 2
make[1]: Leaving directory `/home/src/linux-2.4.2/drivers'
make: *** [_dir_drivers] Error 2


Am I doing something wrong?
-- 
Iassen Hristov
Databrokers, Inc.
513-259-6096
mailto:iassen@databrokers.net


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
