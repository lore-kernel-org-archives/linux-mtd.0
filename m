Received: from cluster-a.mailcontrol.com ([85.115.52.190])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NKtsK-0000Qc-Te
	for linux-mtd@lists.infradead.org; Wed, 16 Dec 2009 13:25:13 +0000
Received: from mail.mta.it (mail.mta.it [89.96.171.250])
	by rly19a.srv.mailcontrol.com (MailControl) with ESMTP id
	nBGDP5JL019058
	for <linux-mtd@lists.infradead.org>; Wed, 16 Dec 2009 13:25:05 GMT
From: Bosi Daniele <Daniele.Bosi@mta.it>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Wed, 16 Dec 2009 14:25:03 +0100
Subject: [UBIFS] issue with ubiattach
Message-ID: <531B6536C9F737458807DF75064873C831EB83DE20@mta-digimail.MTA.INT>
Content-Language: it-IT
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
I'm working on a linux 2.6.24.6 for powerpc MPC5121 with latest ubi patches=
 installed.
With the latest patch from the official repository I run in the following e=
rror when I try to prepare my UBI partitions on a NOR flash
I did this steps:

1. flash_eraseall /dev/mtd2;
2. ubiformat /dev/mtd2;
3. ubiattach /dev/ubi_ctrl -m 2;
4. ubimkvol /dev/ubi0 -N fredubifsCFG -s 4MiB;
5. ubimkvol /dev/ubi0 -N fredubifsRW -m;

The output of step 3 is:

[   33.815099] UBI: attaching mtd2 to ubi0
[   33.819451] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[   33.826203] UBI: logical eraseblock size:    130944 bytes
[   33.832033] UBI: smallest flash I/O unit:    1
[   33.836912] UBI: VID header offset:          64 (aligned 64)
[   33.843018] UBI: data offset:                128
[   33.867213] UBI: attached mtd2 to ubi0
[   33.874851] UBI: MTD device name:            "filesystemNOR"
[   33.882135] UBI: MTD device size:            47 MiB
[   33.888384] UBI: number of good PEBs:        376
[   33.893514] UBI: number of bad PEBs:         0
[   33.898388] UBI: max. allowed volumes:       128
[   33.903474] UBI: wear-leveling threshold:    4096
[   33.908597] UBI: number of internal volumes: 1
[   33.913458] UBI: number of user volumes:     0
[   33.918342] UBI: available PEBs:             372
[   33.923381] UBI: total number of reserved PEBs: 4
[   33.928503] UBI: number of PEBs reserved for bad PEB handling: 0
[   33.934976] UBI: max/mean erase counter: 3/1
[   33.939663] UBI: image sequence number: 0
[   33.944101] UBI: background thread "ubi_bgt0d" started, PID 424
UBI device number 0, total 376 LEBs (49234944 bytes, 47.0 MiB), available 3=
72 LEBs (48711168 bytes, 46.5 MiB), LEB size 130944 bytes (127.9 KiB)

But after step 3 I found under the directory "/dev" a device node like this=
:

root@devece:~# ls -l /dev/ubi*
brw-rw----    1 root     root     251,   0 Dec 15 17:48 /dev/ubi0
crw-rw----    1 root     root      10,  63 Jan  1  1970 /dev/ubi_ctrl

As you can see there's an error on "/dev/ubi0" that should be a char device=
 instead of a block device.
Then I get stucked on step 4 with the following output:

libubi: error!: "/dev/ubi0" is not a character device
ubimkvol: error!: error while probing "/dev/ubi0"
          error 22 (Invalid argument)

BTW the mtd partitions on the device are like this:

root@device:~# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00040000 00020000 "protected"
mtd1: 00c00000 00020000 "rootfsRO"
mtd2: 02f00000 00020000 "filesystemNOR"
mtd3: 00380000 00020000 "kernel"
mtd4: 00040000 00020000 "device-tree"
mtd5: 00100000 00020000 "u-boot"
mtd6: 04000000 00020000 "flash1"
mtd7: 04000000 00020000 "flash2"
mtd8: 04000000 00020000 "flash3"
mtd9: 40000000 00020000 "nand"

So my questions are:
Do somebody knows why the device node is wrong after the ubiattach?
Who's the device node creator (because I've seen that the device is created=
 after the ubiattach operation)?
Is it mdev / udev or the ubiattach (I didn't find any evidence of this in t=
he ubiattach srcs)?

Any comments and any answer will be very welcome,
Thanks in advance


 Bye Daniele Bosi
