Received: from [200.53.172.155] (helo=qis)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15gt0n-0007dx-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Sep 2001 20:15:58 +0100
Message-ID: <20010911182623.15217.qmail@qis>
From: "Nikolai Vladychevski" <niko@isl.net.mx>
To: linux-mtd@lists.infradead.org
Subject: duplicate DoC millenium with dd
Date: Tue, 11 Sep 2001 18:26:23 GMT
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

for some reason I can not duplicate Disc on chip Millenium (8MB) with
dd command. I can build it using dd, fdisk, nftla_format, erase.... etc, but 
not only dd. 


This is how I do it: 


#! /bin/bash 

flash_on 

insmod docecc
insmod doc2001
insmod docprobe 

eraseall /dev/mtd0 

dd conv=notrunc if=docipl of=/dev/mtd0
dd conv=notrunc if=docipl of=/dev/mtd0 seek=1
dd conv=notrunc if=linuxbios.block of=/dev/mtd0 seek=2
dd conv=notrunc if=vmlinux.bin.gz.block of=/dev/mtd0 seek=128 

nftl_format /dev/mtd0 0x100000
sfdisk /dev/nftla <<EOF
0,,83
EOF 

mkcramfs /q3 /dev/nftla1 

rmmod docprobe
rmmod doc2001
rmmod docecc 


I shutdown, I boot, the image is working ok. 

Now I copy mtd image to a file: 

[root@qis1 ecs]# dd conv=notrunc if=/dev/mtd0 of=rom.img
16384+0 records in
16384+0 records out
[root@qis1 ecs]# 

now I copy the the _same_ image to the _same_ chip again: 

[root@qis1 /root]# flash_on
[root@qis1 /root]# cd /home/niko/qisbuild/freebios/ecs
[root@qis1 ecs]# insmod docecc
Using /lib/modules/2.4.7-normal/kernel/drivers/mtd/devices/docecc.o
[root@qis1 ecs]# insmod doc2001
Using /lib/modules/2.4.7-normal/kernel/drivers/mtd/devices/doc2001.o
[root@qis1 ecs]# insmod docprobe
Using /lib/modules/2.4.7-normal/kernel/drivers/mtd/devices/docprobe.o
[root@qis1 ecs]# dd conv=notrunc if=rom.img of=/dev/mtd0
16384+0 records in
16384+0 records out
[root@qis1 ecs]# 

I shutdown, I boot again , and I get this errors: 

M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
Using configured probe address 0xfffc8000
DiskOnChip Millennium found at address 0xFFFC8000
Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba TC58V64AFT/DC)
1 flash chips found. Total DiskOnChip size: 8 MiB
NFTL driver: nftlcore.c $Revision: 1.78 $, nftlmount.c $Revision: 1.22 $
Cannot calculate an NFTL geometry to match size of 0x37c0.
Using C:1019 H:14 S:1 (== 0x37ba sects)
nftla: unknown partition table
usb.c: registered new driver hub
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 8192 bind 8192)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
nftla1: bad access: block = 2, count = 2
end_request: I/O error, dev 5d:01 (unknown), sector 2
EXT3-fs: unable to read superblock
nftla1: bad access: block = 2, count = 2
end_request: I/O error, dev 5d:01 (unknown), sector 2
EXT2-fs: unable to read superblock
cramfs: wrong magic
nftla1: bad access: block = 0, count = 2
end_request: I/O error, dev 5d:01
(unknown), sector 0
romfs: unable to read superblock
Kernel panic: VFS: Unable to mount root fs on 5d:01 


If I add eraseall /dev/mtd0 just before using dd command I get this errors: 

Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba TC58V64AFT/DC)
1 flash chips found. Total DiskOnChip size: 8 MiB
NFTL driver: nftlcore.c $Revision: 1.78 $, nftlmount.c $Revision: 1.22 $
Formatting block 130
Formatting block 131
Formatting block 132
Formatting block 133
Formatting block 134
.....
Formatting block 1023
bad access: block = 2, count =2
EXT2-fs: unable to read superblock 

I check again to make sure the image is the same and is not corrupted: 

[root@qis1 ecs]# insmod docecc
Using /lib/modules/2.4.7-normal/kernel/drivers/mtd/devices/docecc.o
[root@qis1 ecs]# insmod doc2001
Using /lib/modules/2.4.7-normal/kernel/drivers/mtd/devices/doc2001.o
[root@qis1 ecs]# flash_on
[root@qis1 ecs]# insmod docprobe
Using /lib/modules/2.4.7-normal/kernel/drivers/mtd/devices/docprobe.o
[root@qis1 ecs]# dd conv=notrunc if=/dev/mtd0 of=rom2.img
16384+0 records in
16384+0 records out
[root@qis1 ecs]# md5sum rom2.img rom.img
bf7d9fcaaba3d05245c17b67a738b9a1  rom2.img
bf7d9fcaaba3d05245c17b67a738b9a1  rom.img
[root@qis1 ecs]# 

the images are the same.... what I am missing? I thought that accessing
the DoC trough /dev/mtd0 I was accessing the whole chip, is therere
any other place that data is stored? Do I have to nftla_format again?
How to duplicate the Disk on Chip Millenium only with dd and no ohter tool? 


Nikolai
