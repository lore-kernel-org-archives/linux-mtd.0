Received: from dialpool-210-214-120-68.maa.sify.net ([210.214.120.68] helo=nikunj)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Gu4u-0006Br-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jul 2001 04:08:50 +0100
To: linux-mtd@lists.infradead.org
Subject: Permission problem on mtd block device
Cc: jffs-dev@axis.com, vmalik@danielind.com, ndadhania@yahoo.com
From: nikunj@bindaas.org (Nikunj A. Dadhania)
Date: 02 Jul 2001 08:41:20 +0530
Message-ID: <86r8w0yqhz.fsf@bindaas.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

I have compiled kernel 2.4.2 and patched it for arm.
I am using an Assabet board.

I have statically compiled the mtd and loaded jffs as modules.

The kernel booted and I got the entry in /proc too.

The outputs of various commands are as follows:

*************************************************************************
/ # ls /dev/mt* -l
crw-r--r--   1 0        0         90,   0 Jan  1 00:00 /dev/mtd0
brw-r--r--   1 0        0         31,   0 Jan  1 00:01 /dev/mtdblock0
crw-r--r--   1 0        0         90,   1 Jan  1 00:00 /dev/mtdr0

/ # ls -al
drwxr-xr-x  12 0        0            1024 Jul  2  2001 .
drwxr-xr-x  12 0        0            1024 Jul  2  2001 ..
drwxr-sr-x   2 0        1000         1024 Jul  2  2001 bin
drwxr-xr-x   3 0        0            1024 Jan  1 00:01 dev
drwxr-xr-x   4 0        0            1024 Jun 30  2001 etc
drwxr-xr-x   3 0        0            1024 Jul  1  2001 lib

/***************The mount point I used**************/
dr-xr-xr-x   1 0        0               0 Jan  1 00:03 mnt
/***************************************************/

dr-xr-xr-x  20 0        0               0 Jan  1 00:00 proc
drwxr-sr-x   2 0        1000         1024 Jul  2  2001 sbin
drwxr-xr-x   2 0        0            1024 Jun 30  2001 tmp
drwxr-sr-x   5 0        0            1024 Jul  2  2001 usr
drwxr-xr-x   5 0        0            1024 Jun 30  2001 var

/ # cat /proc/mtd 
dev:    size   erasesize  name
mtd0: 00040000 00040000 "bootloader"
mtd1: 00040000 00040000 "bootloader params"
mtd2: 01f80000 00040000 "jffs"
***************************************************************************

Then it I mounted the device using
(i tried mount -t jffs option but it didnt work)
I am using Busybox.

mount /dev/mtdblock0 /mnt 

this command works. it gives some directory listing such as..

/ # ls -al /mnt
dr-xr-xr-x   1 0        0               0 Jan  1 00:03 .
drwxr-xr-x  12 0        0            1024 Jul  2  2001 ..
dr-xr-xr-x   1 0        0               0 Jan  1 00:03 001
-r--r--r--   1 0        0               0 Jan  1 00:03 devices
-r--r--r--   1 0        0               0 Jan  1 00:03 drivers


but I cannot write to it nor can i delete any file from it ..
what could the problem possibly be??

I would be extremely grateful if i could get an early reply.

thanks in advance

nikunj

PS: I am not subscribed to this list. So please mail me at my 
personal address 
