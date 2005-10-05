Received: from s131.mittwaldmedien.de ([62.216.178.31])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EN8YV-0000aj-BH
	for linux-mtd@lists.infradead.org; Wed, 05 Oct 2005 08:39:42 -0400
Received: from localhost (localhost [127.0.0.1])
	by s131.mittwaldmedien.de (Postfix) with ESMTP id ECAEC5E4129
	for <linux-mtd@lists.infradead.org>;
	Wed,  5 Oct 2005 14:39:29 +0200 (CEST)
Received: from lin01.mn-solutions.de (p54B28E33.dip0.t-ipconnect.de
	[84.178.142.51])
	by s131.mittwaldmedien.de (Postfix) with ESMTP id C91185E4122
	for <linux-mtd@lists.infradead.org>;
	Wed,  5 Oct 2005 14:39:28 +0200 (CEST)
Received: from mnz66.mn-solutions.de (mnz66.mn-logistik.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id 2CC201E014A
	for <linux-mtd@lists.infradead.org>;
	Wed,  5 Oct 2005 14:38:57 +0200 (CEST)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: linux-mtd@lists.infradead.org
Date: Wed, 5 Oct 2005 14:37:11 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200510051437.11856.hs4233@mail.mn-solutions.de>
Subject: Bug: Flash writing & suspending
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi !  I get the above error message sometimes when I write to the flash.

I use Kernel 2.6.13-rc2, but with the MTD (drivers/mtd/, include/mtd, 
include/linux/mtd) from today's CVS. JFFS2 is still the old one.

 partitions are

I wrote a little tests script which can trigger the error:

----------------------------------------------
#!/bin/sh
cd /tmp
for i in 0 1 2 3 4 5 6 7 8 9; do
        logread >log$i.txt
done

for i in 0 1 2 3 4 5 6 7 8 9; do
        rm -f /opt/mn/log*.txt
        cp log*.txt /opt/mn
done

ls /opt/mn/

echo mem >/sys/power/state

ls /opt/mn/
----------------------------------------------

Now I run this script, resume by pressing a key, run it, resume, run it etc. 
Sometimes at the first run, sometimes at the second or third I get this 
error:

Flash: Waiting for chip to be ready timed out. Status 913ad69c
Write of 48 bytes at 0x01db67b4 failed. returned -5, retlen 0
Not marking the space at 0x01db67b4 as dirty because the flash driver returned 
retlen zero
Flash: Waiting for chip to be ready timed out. Status e0011985
error -5 reading node at 0x00890c44 in get_inode_nodes()
jffs2_get_inode_nodes() for ino 1086 returned -5
...



So, where is the culprit?






Additional infos


My partitions are:

/dev/root on / type jffs2 (rw,noatime)
proc on /proc type proc (rw,nodiratime)
devpts on /dev/pts type devpts (rw)
none on /sys type sysfs (rw)
tmpfs on /var type tmpfs (rw)
tmpfs on /tmp type tmpfs (rw)


Flash related kernel messages are:

...
JFFS2 version 2.2. (C) 2001-2003 Red Hat, Inc.
...
Flash: Found 2 x16 devices at 0x0 in 32-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
Creating 3 MTD partitions on "Flash":
0x00000000-0x00040000 : "Boot"
0x00040000-0x00140000 : "Linux"
0x00140000-0x02000000 : "Files"
...
VFS: Mounted root (jffs2 filesystem).
...


The flash chips are Intel Strataflash 28F128J3A-150 on an Intel PXA255 device.


Flash related kernel .config is like this (all non-mention 
CONFIG_MTD-variables are in the 'is not set'-state):

CONFIG_MTD=y
CONFIG_MTD_PARTITIONS=y

CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y

CONFIG_MTD_CFI=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_NOSWAP=y
CONFIG_MTD_CFI_GEOMETRY=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_UTIL=y  
CONFIG_MTD_MAP_MN=y

CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
CONFIG_JFFS2_COMPRESSION_OPTIONS=y
CONFIG_JFFS2_ZLIB=y
CONFIG_JFFS2_RTIME=y
