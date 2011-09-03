Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qzz67-0004LL-AR
	for linux-mtd@lists.infradead.org; Sat, 03 Sep 2011 22:54:00 +0000
Received: by iacb35 with SMTP id b35so5704303iac.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 03 Sep 2011 15:53:56 -0700 (PDT)
MIME-Version: 1.0
Sender: jonringle@gmail.com
Date: Sat, 3 Sep 2011 18:53:56 -0400
Message-ID: <CAMwGMjxX4q2oYt-KDwoq87WP77Phbd+xEdUyL-VkaLLvYCeqfA@mail.gmail.com>
Subject: can't mount ubifs after resizing with ubirsvol
From: Jon Ringle <jon@ringle.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a ubi0 with a static squashfs part and a ubifs part. Sometimes
I have to update the squashfs with an image that is bigger than the
currently allocated space for the squashfs part. My plan was to use
ubirsvol to reduce the size of the ubifs part, then use ubirsvol in
increase the size of the squashfs part so that it is big enough for
ubiupdatevol to accept the new image in the squashfs part.

But when I try to mount ubifs after resizing, it complains with:
(initramfs)[/]# mount -t ubifs ubi0:ubifs /mnt
[ 1838.350000] UBIFS error (pid 621): validate_sb: bad LEB count: 866
in superblock, 800 on UBI volume, 19 minimum required
[ 1838.360000] UBIFS error (pid 621): validate_sb: bad superblock, error 1
mount: mounting ubi0:ubifs on /mnt failed: Invalid argument

Is what I want to do possible?

I am using mtd-utils-1.4.6. Here is more detail.

(initramfs)[/]# uname -a
Linux isc3-initramfs 2.6.33.17 #10 Sat Sep 3 17:56:12 EDT 2011 armv6l GNU/Linux
(initramfs)[/]# ubiattach -p /dev/mtd3
[ 1744.100000] UBI: attaching mtd3 to ubi0
[ 1744.100000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[ 1744.110000] UBI: logical eraseblock size:    129024 bytes
[ 1744.120000] UBI: smallest flash I/O unit:    2048
[ 1744.120000] UBI: sub-page size:              512
[ 1744.130000] UBI: VID header offset:          512 (aligned 512)
[ 1744.130000] UBI: data offset:                2048
[ 1744.350000] UBI: attached mtd3 to ubi0
[ 1744.360000] UBI: MTD device name:            "ubi"
[ 1744.360000] UBI: MTD device size:            119 MiB
[ 1744.370000] UBI: number of good PEBs:        957
[ 1744.370000] UBI: number of bad PEBs:         0
[ 1744.380000] UBI: max. allowed volumes:       128
[ 1744.380000] UBI: wear-leveling threshold:    4096
[ 1744.380000] UBI: number of internal volumes: 1
[ 1744.390000] UBI: number of user volumes:     2
[ 1744.390000] UBI: available PEBs:             0
[ 1744.400000] UBI: total number of reserved PEBs: 957
[ 1744.400000] UBI: number of PEBs reserved for bad PEB handling: 9
[ 1744.410000] UBI: max/mean erase counter: 79/11
[ 1744.410000] UBI: image sequence number: 0
[ 1744.420000] UBI: background thread "ubi_bgt0d" started, PID 614
UBI device number 0, total 957 LEBs (123475968 bytes, 117.8 MiB),
available 0 LEBs (0 bytes), LEB size 129024 bytes (126.0 KiB)
(initramfs)[/]# ubinfo -a
UBI version:                    1
Count of UBI devices:           1
UBI control device major/minor: 10:60
Present UBI devices:            ubi0

ubi0
Volumes count:                           2
Logical eraseblock size:                 129024 bytes, 126.0 KiB
Total amount of logical eraseblocks:     957 (123475968 bytes, 117.8 MiB)
Amount of available logical eraseblocks: 0 (0 bytes)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       0
Count of reserved physical eraseblocks:  9
Current maximum erase counter value:     79
Minimum input/output unit size:          2048 bytes
Character device major/minor:            253:0
Present volumes:                         0, 1

Volume ID:   0 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        78 LEBs (10063872 bytes, 9.6 MiB)
State:       OK
Name:        squashfs
Character device major/minor: 253:1
-----------------------------------
Volume ID:   1 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        866 LEBs (111734784 bytes, 106.6 MiB)
State:       OK
Name:        ubifs
Character device major/minor: 253:2
(initramfs)[/]# mount -t ubifs ubi0:ubifs /mnt
[ 1798.380000] UBIFS: mounted UBI device 0, volume 1, name "ubifs"
[ 1798.390000] UBIFS: file system size:   110444544 bytes (107856 KiB,
105 MiB, 856 LEBs)
[ 1798.400000] UBIFS: journal size:       5548032 bytes (5418 KiB, 5
MiB, 43 LEBs)
[ 1798.400000] UBIFS: media format:       w4/r0 (latest is w4/r0)
[ 1798.410000] UBIFS: default compressor: lzo
[ 1798.410000] UBIFS: reserved for root:  4952683 bytes (4836 KiB)
(initramfs)[/]# umount /mnt
[ 1804.060000] UBIFS: un-mount UBI device 0, volume 1
(initramfs)[/]# ubirsvol /dev/ubi0 -N ubifs -S 800
(initramfs)[/]# mount -t ubifs ubi0:ubifs /mnt
[ 1838.350000] UBIFS error (pid 621): validate_sb: bad LEB count: 866
in superblock, 800 on UBI volume, 19 minimum required
[ 1838.360000] UBIFS error (pid 621): validate_sb: bad superblock, error 1
mount: mounting ubi0:ubifs on /mnt failed: Invalid argument
