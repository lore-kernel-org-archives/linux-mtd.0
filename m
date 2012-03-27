Received: from cooperlighting-sw.cooperlighting.com ([216.130.131.68])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SCfcG-0008PL-Is
 for linux-mtd@lists.infradead.org; Tue, 27 Mar 2012 23:15:53 +0000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message
Subject: UBIFS won't recognize ubinize image
Date: Tue, 27 Mar 2012 19:15:46 -0400
Message-ID: <5D308BD40154E4439D82454FE483A502064C7FD5@EVS4.nam.ci.root>
From: "Bishop, Mark" <Mark.Bishop@cooperindustries.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am trying to setup on my device the use case of flashing the UBIFS
image directly to NAND from the uboot prompt.

I have read the documentation extensively on how to achieve this but
have not been successful.  This is the procedure I use:

1) Verify my flash parameters on the target:
	root:/> ./mtdinfo /dev/mtd2
	mtd2
	Name:                           file system(nand)
	Type:                           nand
	Eraseblock size:                131072 bytes, 128.0 KiB
	Amount of eraseblocks:          800 (104857600 bytes, 100.0 MiB)
	Minimum input/output unit size: 2048 bytes
	Sub-page size:                  512 bytes
	OOB size:                       64 bytes
	Character device major/minor:   90:4
	Bad blocks are allowed:         true
	Device is writable:             true

2) Create the ubifs image on the host:
	./mkfs.ubifs -r filesystem/ -m 2048 -e 131072 -c 800 -o
ubifs.new.img

3) ubinize the ubifs image on the host:
	cat ubinize.cfg=20
	[ubifs]
	mode=3Dubi
	image=3Dubifs.new.img
	vol_id=3D0
	vol_type=3Ddynamic
	vol_name=3Dcooper
	vol_flags=3Dautoresize

	./ubinize -v -o ubi.new.img -m 2048 -p 128KiB -s 512 ubinize.cfg

	ubinize: LEB size:                  129024
	ubinize: PEB size:                  131072
	ubinize: min. I/O size:             2048
	ubinize: sub-page size:             512
	ubinize: VID offset:                512
	ubinize: data offset:               2048
	ubinize: UBI image sequence number: 1628386546
	ubinize: loaded the ini-file "ubinize.cfg"
	ubinize: count of sections: 1

	ubinize: parsing section "ubifs"
	ubinize: mode=3Dubi, keep parsing
	ubinize: volume type: dynamic
	ubinize: volume ID: 0
	ubinize: volume size was not specified in section "ubifs",
assume minimum to fit image 	"ubifs.new.img"1806336 bytes (1.7 MiB)
	ubinize: volume name: cooper
	ubinize: volume alignment: 1
	ubinize: autoresize flags found
	ubinize: adding volume 0
	ubinize: writing volume 0
	ubinize: image file: ubifs.new.img

	ubinize: writing layout volume
	ubinize: done

4) Transfer the ubi.new.img to my target, erase flash, write flash:
	bfin> tftp 0x1000000 ubi.new.img
	bfin> nand erase 0x880000 0x6400000
	bfin> nand write 0x1000000 0x880000 ${filesize}
=09
5) Boot and ubiattach on the target:
	bfin> boot
	....
	Creating 4 MTD partitions on "MT29F2G08ABAEAWP":
	0x000000000000-0x000000080000 : "bootloader(nand)"
	0x000000080000-0x000000880000 : "linux kernel(nand)"
	0x000000880000-0x000006c80000 : "file system(nand)"      <---
Partition I am attempting to setup
	0x000006c80000-0x000010000000 : "file system(extra)"
	....

	root:/> ubiattach /dev/ubi_ctrl -m2
	UBI: attaching mtd2 to ubi0
	UBI: physical eraseblock size:   131072 bytes (128 KiB)
	UBI: logical eraseblock size:    129024 bytes
	UBI: smallest flash I/O unit:    2048
	UBI: sub-page size:              512
	UBI: VID header offset:          512 (aligned 512)
	UBI: data offset:                2048
	UBI: empty MTD device detected
	UBI: max. sequence number:       0
	UBI: create volume table (copy #1)
	UBI: create volume table (copy #2)
	UBI: attached mtd2 to ubi0
	UBI: MTD device name:            "file system(nand)"
	UBI: MTD device size:            100 MiB
	UBI: number of good PEBs:        784
	UBI: number of bad PEBs:         16
	UBI: number of corrupted PEBs:   0
	UBI: max. allowed volumes:       128
	UBI: wear-leveling threshold:    4096
	UBI: number of internal volumes: 1
	UBI: number of user volumes:     0
	UBI: available PEBs:             773
	UBI: total number of reserved PEBs: 11
	UBI: number of PEBs reserved for bad PEB handling: 7
	UBI: max/mean erase counter: 0/0
	UBI: image sequence number:  -204216801
	UBI: background thread "ubi_bgt0d" started, PID 348
	UBI device number 0, total 784 LEBs (101154816 bytes, 96.5 MiB),
available 773 LEBs (99735552 	bytes, 95.1 MiB), LEB size 129024 bytes
(126.0 KiB)
	root:/>

I think this should be set to 1: "UBI: number of user volumes:     0"
And I have a negative number in my image sequence number.  Not sure
about that.  Does anybody see anything I am screwing up?
