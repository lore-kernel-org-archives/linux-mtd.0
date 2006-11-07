Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GhO4n-0006FF-SE
	for linux-mtd@lists.infradead.org; Tue, 07 Nov 2006 10:21:09 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1GhO4a-00073E-Oi
	for linux-mtd@lists.infradead.org; Tue, 07 Nov 2006 11:20:52 +0100
Received: from host217-37-158-157.in-addr.btopenworld.com ([217.37.158.157])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Nov 2006 11:20:52 +0100
Received: from john.smith by host217-37-158-157.in-addr.btopenworld.com with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Nov 2006 11:20:52 +0100
To: linux-mtd@lists.infradead.org
From: John Smith <john.smith@arrows.demon.co.uk>
Subject: Re: UBI and OneNAND
Date: Tue, 7 Nov 2006 10:20:42 +0000 (UTC)
Message-ID: <loom.20061107T110704-786@post.gmane.org>
References: <32544906.187201162866905328.JavaMail.weblogic@ep_ml06>
	<1162889433.5606.15.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Frank Haverkamp <haver <at> vnet.ibm.com> writes:

> 
> Hi,
> 
> On Tue, 2006-11-07 at 02:35 +0000, 박경민 wrote:
> > Hi,
> > 
> > Sorry for changing subject. My mail program has some problem.
> > 
> > > > I think the following commands just worked:
> > > > 
> > > >   mkdir /mnt/nvm
> > > >   flash_eraseall /dev/mtd6
> > > >   mount -t jffs2 /dev/mtdblock6 /mnt/nvm 
> 
> I think there is a missunderstanding here. UBI acts as volume management
> system. The MTD you connect to UBI cannot be mounted. Instead you create
> a UBI volume (with ubimkvol) which has an associated mtd which can be
> used to host a jffs2. This can be mounted than.
> 
> > Umm. I think 'John' just mounts jffs2 without UBI.
> 
> Yes, I agree.

My original explanation was incomplete. Here is a fuller version.

The MTD code is compiled into the kernel, rather than as a kernel module.
The kernel command line includes:
   ubi.mtd=4
At boot time, the following is reported to the console:

Using static partition definition
Creating 2 MTD partitions on "Arrow 1504 Flash":
0x00000000-0x00c00000 : "BootLoader"
0x00c00000-0x01000000 : "OldCFE"
OneNAND 16MB 2.65/3.3V 16-bit (0x05)
Scanning device for bad blocks
Creating 4 MTD partitions on "Arrow-Onenand":
0x00000000-0x00100000 : "CFE"
0x00100000-0x00500000 : "Kernel"
0x00500000-0x00ff0000 : "rootfs"
0x00ff0000-0x01000000 : "CFE-NVM"
UBI: background thread "ubi_bgt0d" started, PID 14
UBI: mean erase counter:         1
UBI: attached mtd4 to ubi0
UBI: MTD device name:            "rootfs"
UBI: MTD device size:            10 MB
UBI: physical eraseblock size:   65536 bytes (64 KB)
UBI: logical eraseblock size:    63488 bytes
UBI: number of good PEBs:        175
UBI: number of bad PEBs:         0
UBI: smallest flash I/O unit:    1024
UBI: VID header offset:          1024 (aligned 1024)
UBI: data offset:                2048
UBI: max. allowed volumes:       128
UBI: wear-levelling threshold:   4096
UBI: number of internal volumes: 2
UBI: number of user volumes:     1
UBI: available PEBs:             49
UBI: total number of reserved PEBs: 126
UBI: number of PEBs reserved for bad PEB handling: 1


##
## Then with the busybox shell I can list the MTD partitions
##

/ # cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00c00000 00020000 "BootLoader"    <<< Nor Flash
mtd1: 00400000 00020000 "OldCFE"        <<< Nor Flash
mtd2: 00100000 00010000 "CFE"           <<< OneNAND Flash
mtd3: 00400000 00010000 "Kernel"        <<< OneNAND Flash
mtd4: 00af0000 00010000 "rootfs"        <<< OneNAND Flash
mtd5: 00010000 00010000 "CFE-NVM"       <<< OneNAND Flash
mtd6: 00753800 0000f800 "Kernel"        <<< UBI Partition on mtd4:

##
## I ceate a new 2M byte UBI Volume
##
/ # ubimkvol -s 2000000 -N NVM -d 0

/ # cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00c00000 00020000 "BootLoader"
mtd1: 00400000 00020000 "OldCFE"
mtd2: 00100000 00010000 "CFE"
mtd3: 00400000 00010000 "Kernel"
mtd4: 00af0000 00010000 "rootfs"
mtd5: 00010000 00010000 "CFE-NVM"
mtd6: 00753800 0000f800 "Kernel"
mtd7: 001f0000 0000f800 "NVM"            <<< New UBI Partition

##
## Look at existing devices
##
/ # ls -l /dev/mtdblock?
brw-r-----    1 0        0         31,   0 Jan  1 00:00 /dev/mtdblock0
brw-r-----    1 0        0         31,   1 Jan  1 00:00 /dev/mtdblock1
brw-r-----    1 0        0         31,   2 Jan  1 00:00 /dev/mtdblock2
brw-r-----    1 0        0         31,   3 Jan  1 00:00 /dev/mtdblock3

##
## Create a new device for my new partition
## (I do not have the udev tools installed)
##
/ # mknod /dev/mtdblock7 b 31 7

##
## Mount my new JFFS2/UBI partition
## (Note the erase size is further confirmation that I have a UBI partition)
##
/ # mkdir /mnt/nvm
/ # mount -t jffs2 /dev/mtdblock7 /mnt/nvm
JFFS2 write-buffering enabled buffer (1024) erasesize (63488)


##
## Copy a file to the JFFS2 Partition
##
/ # cp /my_module.ko /mnt/nvm

##
## Check it
##
/ # md5sum /my_module.ko /mnt/nvm/my_module.ko
bbb66a91c259fe42290bfa2952b2265f  /my_module.ko
bbb66a91c259fe42290bfa2952b2265f  /mnt/nvm/my_module.ko

##
## Unmount the jffs2 partition
##
/ # umount /mnt/nvm

##
## Check the file has gone away
##
/mnt/nfs/ubi-tools # md5sum /my_module.ko /mnt/nvm/my_module.ko
bbb66a91c259fe42290bfa2952b2265f  /my_module.ko



##
## Power cycle, and let the box boot up again
##

Using static partition definition
Creating 2 MTD partitions on "Arrow 1504 Flash":
0x00000000-0x00c00000 : "BootLoader"
0x00c00000-0x01000000 : "OldCFE"
OneNAND 16MB 2.65/3.3V 16-bit (0x05)
Scanning device for bad blocks
Creating 4 MTD partitions on "Arrow-Onenand":
0x00000000-0x00100000 : "CFE"
0x00100000-0x00500000 : "Kernel"
0x00500000-0x00ff0000 : "rootfs"
0x00ff0000-0x01000000 : "CFE-NVM"
UBI: background thread "ubi_bgt0d" started, PID 14
UBI: mean erase counter:         1
UBI: attached mtd4 to ubi0
UBI: MTD device name:            "rootfs"
UBI: MTD device size:            10 MB
UBI: physical eraseblock size:   65536 bytes (64 KB)
UBI: logical eraseblock size:    63488 bytes
UBI: number of good PEBs:        175
UBI: number of bad PEBs:         0
UBI: smallest flash I/O unit:    1024
UBI: VID header offset:          1024 (aligned 1024)
UBI: data offset:                2048
UBI: max. allowed volumes:       128
UBI: wear-levelling threshold:   4096
UBI: number of internal volumes: 2
UBI: number of user volumes:     2  <<< this time there is an extra partition
UBI: available PEBs:             17
UBI: total number of reserved PEBs: 158
UBI: number of PEBs reserved for bad PEB handling: 1


BusyBox v1.00 (2006.08.30-22:06+0000) Built-in shell (ash)
Enter 'help' for a list of built-in commands.

/ # cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00c00000 00020000 "BootLoader"  << Nor
mtd1: 00400000 00020000 "OldCFE"      << Nor
mtd2: 00100000 00010000 "CFE"         << OneNAND
mtd3: 00400000 00010000 "Kernel"      << OneNAND
mtd4: 00af0000 00010000 "rootfs"      << OneNAND
mtd5: 00010000 00010000 "CFE-NVM"     << OneNAND
mtd6: 001f0000 0000f800 "NVM"         << UBI on mtd4:
mtd7: 00753800 0000f800 "Kernel"      << UBI on mtd4:

/ # mknod /dev/mtdblock6 b 31 6
/ # mount -t jffs2 /dev/mtdblock6 /mnt/nvm
JFFS2 write-buffering enabled buffer (1024) erasesize (63488)

##
## Check the file in the jffs2 partition
##
/ # md5sum /mnt/nvm/my_module.ko
bbb66a91c259fe42290bfa2952b2265f  /mnt/nvm/my_module.ko
/ # md5sum /my_module.ko
bbb66a91c259fe42290bfa2952b2265f  /my_module.ko


So I am convinced. 
Of course, the credit belongs to all who wrote the code. 
Thanks,
John Smith
