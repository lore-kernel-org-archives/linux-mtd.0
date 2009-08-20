Received: from na3sys009aog107.obsmtp.com ([74.125.149.197])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mdyoc-000173-Mp
	for linux-mtd@lists.infradead.org; Thu, 20 Aug 2009 03:59:58 +0000
Received: by rv-out-0506.google.com with SMTP id f6so1636197rvb.25
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Aug 2009 20:59:52 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 20 Aug 2009 13:59:52 +1000
Message-ID: <ed62800908192059g57e85893ga352793e52c43a65@mail.gmail.com>
Subject: ubifs mount problem: UBIFS error (pid 1152): validate_sb: bad
	superblock, error 8
From: Aras Vaichas <arasv@magellan-technology.com>
To: MTD-LIST <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've got UBI + UBIFS running as my root partition with 2.6.30, and I'm
using mtd-utils from git downloaded just last week.

I'm building my UBI image as per the instructions at:
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_mkfubifs

I have successfully created UBI images, formatted, attached and
mounted them. I'm not an expert, but I'm familiar with the procedure
now.

For some reason, I am now having problems mounting a known working
image. The image contains 1 file with a "hello world" text string in
it. I used to be able to mount it to my 8MB spare partition, but now
it fails with:

/root # mount -t ubifs ubi1:spareubi /mnt
UBIFS error (pid 791): validate_sb: bad superblock, error 8
mount: mounting ubi1:spareubi on /mnt failed: Invalid argument

The strange thing is that I can format, attach and mount this *same*
image to my other spare partition. It's like the NAND in this
partition has some problem.

Here are the details:

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00a00000 00020000 "Bootloader Area"
mtd1: 03600000 00020000 "Main root filing system partition"
mtd2: 00800000 00020000 "Spare Partition 1"
mtd3: 1b800000 00020000 "Spare Partition 2"
mtd4: 03310800 0001f800 "rootubi"

(*) Attempt to write to the first partition (this fails)

/root # ubiformat /dev/mtd2 -f ubi.img
ubiformat: mtd2 (nand), size 8388608 bytes (8.0 MiB), 64 eraseblocks
of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
libscan: scanning eraseblock 63 -- 100 % complete
ubiformat: 64 eraseblocks have valid erase counter, mean value is 1
ubiformat: flashing eraseblock 15 -- 100 % complete
ubiformat: formatting eraseblock 63 -- 100 % complete

/root # ubiattach /dev/ubi_ctrl -m 2
UBI: attaching mtd2 to ubi1
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI: volume 0 ("spareubi") re-sized from 17 to 58 LEBs
UBI: attached mtd2 to ubi1
UBI: MTD device name:            "Spare Partition 1"
UBI: MTD device size:            8 MiB
UBI: number of good PEBs:        64
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 64
UBI: number of PEBs reserved for bad PEB handling: 2
UBI: max/mean erase counter: 4/2
UBI: background thread "ubi_bgt1d" started, PID 807
UBI device number 1, total 64 LEBs (8257536 bytes, 7.9 MiB), available
0 LEBs (0 bytes), LEB size 129024 bytes (126.0 KiB)

/root # mount -t ubifs ubi1:spareubi /mnt
UBIFS error (pid 823): validate_sb: bad superblock, error 8
mount: mounting ubi1:spareubi on /mnt failed: Invalid argument

/root # ubidetach /dev/ubi_ctrl -m 2
UBI: mtd2 is detached from ubi1

(*) Attempt to write to the second partition (this works)

/root # ubiformat /dev/mtd3 -f ubi.img
ubiformat: mtd3 (nand), size 461373440 bytes (440.0 MiB), 3520
eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
libscan: scanning eraseblock 3519 -- 100 % complete  ock 2048 -- 58 % complete
ubiformat: 3519 eraseblocks have valid erase counter, mean value is 1
ubiformat: 1 bad eraseblocks found, numbers: 989
ubiformat: flashing eraseblock 15 -- 100 % complete
ubiformat: formatting eraseblock 3519 -- 100 % complete  aseblock 3422
-- 97 % complete

/root # ubiattach /dev/ubi_ctrl -m 3
UBI: attaching mtd3 to ubi1
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI: volume 0 ("spareubi") re-sized from 17 to 3410 LEBs
UBI: attached mtd3 to ubi1
UBI: MTD device name:            "Spare Partition 2"
UBI: MTD device size:            440 MiB
UBI: number of good PEBs:        3519
UBI: number of bad PEBs:         1
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 3519
UBI: number of PEBs reserved for bad PEB handling: 105
UBI: max/mean erase counter: 3/2
UBI: background thread "ubi_bgt1d" started, PID 835
UBI device number 1, total 3519 LEBs (454035456 bytes, 433.0 MiB),
available 0 LEBs (0 bytes), LEB size 129024 bytes (126.0 KiB)

/root # mount -t ubifs ubi1:spareubi /mnt
UBIFS: mounted UBI device 1, volume 0, name "spareubi"
UBIFS: file system size:   262692864 bytes (256536 KiB, 250 MiB, 2036 LEBs)
UBIFS: journal size:       9033728 bytes (8822 KiB, 8 MiB, 71 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)

# cat /mnt/README.txt
Hello World!

Aras
