Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R1xsK-0007WK-Fu
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2011 09:59:58 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1R1xsF-0007MV-Qa
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2011 11:59:51 +0200
Received: from 89-97-203-114.ip19.fastwebnet.it ([89.97.203.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 09 Sep 2011 11:59:51 +0200
Received: from marco_cantu_ranzani by 89-97-203-114.ip19.fastwebnet.it with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 09 Sep 2011 11:59:51 +0200
To: linux-mtd@lists.infradead.org
From: marco <marco_cantu_ranzani@libero.it>
Subject: Re: can't mount ubifs after resizing with ubirsvol
Date: Fri, 9 Sep 2011 09:59:38 +0000 (UTC)
Message-ID: <loom.20110909T115925-970@post.gmane.org>
References: <CAMwGMjxX4q2oYt-KDwoq87WP77Phbd+xEdUyL-VkaLLvYCeqfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jon Ringle <jon <at> ringle.org> writes:

> 
> Hi,
> 
> I have a ubi0 with a static squashfs part and a ubifs part. Sometimes
> I have to update the squashfs with an image that is bigger than the
> currently allocated space for the squashfs part. My plan was to use
> ubirsvol to reduce the size of the ubifs part, then use ubirsvol in
> increase the size of the squashfs part so that it is big enough for
> ubiupdatevol to accept the new image in the squashfs part.
> 
> But when I try to mount ubifs after resizing, it complains with:
> (initramfs)[/]# mount -t ubifs ubi0:ubifs /mnt
> [ 1838.350000] UBIFS error (pid 621): validate_sb: bad LEB count: 866
> in superblock, 800 on UBI volume, 19 minimum required
> [ 1838.360000] UBIFS error (pid 621): validate_sb: bad superblock, error 1
> mount: mounting ubi0:ubifs on /mnt failed: Invalid argument
> 
> Is what I want to do possible?
> 
> I am using mtd-utils-1.4.6. Here is more detail.
> 
> (initramfs)[/]# uname -a
> Linux isc3-initramfs 2.6.33.17 #10 Sat Sep 3 17:56:12 EDT 2011 armv6l GNU/Linux
> (initramfs)[/]# ubiattach -p /dev/mtd3
> [ 1744.100000] UBI: attaching mtd3 to ubi0
> [ 1744.100000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
> [ 1744.110000] UBI: logical eraseblock size:    129024 bytes
> [ 1744.120000] UBI: smallest flash I/O unit:    2048
> [ 1744.120000] UBI: sub-page size:              512
> [ 1744.130000] UBI: VID header offset:          512 (aligned 512)
> [ 1744.130000] UBI: data offset:                2048
> [ 1744.350000] UBI: attached mtd3 to ubi0
> [ 1744.360000] UBI: MTD device name:            "ubi"
> [ 1744.360000] UBI: MTD device size:            119 MiB
> [ 1744.370000] UBI: number of good PEBs:        957
> [ 1744.370000] UBI: number of bad PEBs:         0
> [ 1744.380000] UBI: max. allowed volumes:       128
> [ 1744.380000] UBI: wear-leveling threshold:    4096
> [ 1744.380000] UBI: number of internal volumes: 1
> [ 1744.390000] UBI: number of user volumes:     2
> [ 1744.390000] UBI: available PEBs:             0
> [ 1744.400000] UBI: total number of reserved PEBs: 957
> [ 1744.400000] UBI: number of PEBs reserved for bad PEB handling: 9
> [ 1744.410000] UBI: max/mean erase counter: 79/11
> [ 1744.410000] UBI: image sequence number: 0
> [ 1744.420000] UBI: background thread "ubi_bgt0d" started, PID 614
> UBI device number 0, total 957 LEBs (123475968 bytes, 117.8 MiB),
> available 0 LEBs (0 bytes), LEB size 129024 bytes (126.0 KiB)
> (initramfs)[/]# ubinfo -a
> UBI version:                    1
> Count of UBI devices:           1
> UBI control device major/minor: 10:60
> Present UBI devices:            ubi0
> 
> ubi0
> Volumes count:                           2
> Logical eraseblock size:                 129024 bytes, 126.0 KiB
> Total amount of logical eraseblocks:     957 (123475968 bytes, 117.8 MiB)
> Amount of available logical eraseblocks: 0 (0 bytes)
> Maximum count of volumes                 128
> Count of bad physical eraseblocks:       0
> Count of reserved physical eraseblocks:  9
> Current maximum erase counter value:     79
> Minimum input/output unit size:          2048 bytes
> Character device major/minor:            253:0
> Present volumes:                         0, 1
> 
> Volume ID:   0 (on ubi0)
> Type:        dynamic
> Alignment:   1
> Size:        78 LEBs (10063872 bytes, 9.6 MiB)
> State:       OK
> Name:        squashfs
> Character device major/minor: 253:1
> -----------------------------------
> Volume ID:   1 (on ubi0)
> Type:        dynamic
> Alignment:   1
> Size:        866 LEBs (111734784 bytes, 106.6 MiB)
> State:       OK
> Name:        ubifs
> Character device major/minor: 253:2
> (initramfs)[/]# mount -t ubifs ubi0:ubifs /mnt
> [ 1798.380000] UBIFS: mounted UBI device 0, volume 1, name "ubifs"
> [ 1798.390000] UBIFS: file system size:   110444544 bytes (107856 KiB,
> 105 MiB, 856 LEBs)
> [ 1798.400000] UBIFS: journal size:       5548032 bytes (5418 KiB, 5
> MiB, 43 LEBs)
> [ 1798.400000] UBIFS: media format:       w4/r0 (latest is w4/r0)
> [ 1798.410000] UBIFS: default compressor: lzo
> [ 1798.410000] UBIFS: reserved for root:  4952683 bytes (4836 KiB)
> (initramfs)[/]# umount /mnt
> [ 1804.060000] UBIFS: un-mount UBI device 0, volume 1
> (initramfs)[/]# ubirsvol /dev/ubi0 -N ubifs -S 800
> (initramfs)[/]# mount -t ubifs ubi0:ubifs /mnt
> [ 1838.350000] UBIFS error (pid 621): validate_sb: bad LEB count: 866
> in superblock, 800 on UBI volume, 19 minimum required
> [ 1838.360000] UBIFS error (pid 621): validate_sb: bad superblock, error 1
> mount: mounting ubi0:ubifs on /mnt failed: Invalid argument
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 

NAND device: Manufacturer ID: 0xec, Chip ID: 0xd3 (Samsung NAND 1GiB 3,3V 8-bit)
Bad block table not found for chip 0
Bad block table not found for chip 0
Scanning device for bad blocks
Bad eraseblock 4236 at 0x000021180000

Creating 5 MTD partitions on "NAND 1GiB 3,3V 8-bit":
0x000000000000-0x000000040000 : "bootloader"
0x000000040000-0x000000060000 : "param"
0x000000060000-0x000000560000 : "Kernel"
0x000000560000-0x000040560000 : "root"
mtd: partition "root" extends beyond the end of device "NAND 1GiB 3,3V 8-bit" --
size truncated to 0x3faa0000
0x000000000000-0x000040000000 : "nand"

>> ubiformat --version
1.5


>>ls -la /dev/ubi_ctrl 
crw-rw----    1 root     root       10,  58 Sep  5  2011 /dev/ubi_ctrl

First time:


>> ubiformat /dev/mtd3 -y -e 0 
ubiformat: mtd3 (nand), size 1068105728 bytes (1018.6 MiB), 8149 eraseblocks of
131072 bytes (128.0 KiB), min. I/O size 2048 bytes
libscan: scanning eraseblock 8148 -- 100 % complete  
ubiformat: 8144 eraseblocks are supposedly empty
ubiformat: 5 bad eraseblocks found, numbers: 4193, 8145, 8146, 8147, 8148
ubiformat: use erase counter 0 for all eraseblocks
ubiformat: formatting eraseblock 8148 -- 100 % complete  block 2397 -- 29 %
complete  

>> ubiattach /dev/ubi_ctrl -m 3
UBI: attaching mtd3 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI: max. sequence number:       0
UBI error: ubi_read_volume_table: the layout volume was not found
ubiattach: error!: cannot attach mtd3
           error 22 (Invalid argument)



Second time:


>> ubiformat /dev/mtd3 -y -e 0 -f /ubi.img 
ubiformat: mtd3 (nand), size 1068105728 bytes (1018.6 MiB), 8149 eraseblocks of
131072 bytes (128.0 KiB), min. I/O size 2048 bytes
libscan:nand_bbt: Error while writing bad block table -5
libscan: scanning eraseblock 8148 -- 100 % complete  
ubiformat: 5 bad eraseblocks found, numbers: 4193, 8145, 8146, 8147, 8148
ubiformat: warning!: 8144 of 8144 eraseblocks contain non-ubifs data
ubiformat: use erase counter 0 for all eraseblocks
ubiformat: flashing eraseblock 0 --  6 % complete  libmtd: error!: MEMERASE64
ioctl failed for eraseblock 0 (mtd3)
        error 5 (Input/output error)

ubiformat: error!: failed to erase eraseblock 0
           error 5 (Input/output error)
ubiformat: marking block 0 bad
libmtd: error!: MEMSETBADBLOCK ioctl failed for eraseblock 0 (mtd3)
        error 5 (Input/output error)
