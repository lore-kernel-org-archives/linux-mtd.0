Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QFAA1-0007no-GI
	for linux-mtd@lists.infradead.org; Wed, 27 Apr 2011 19:12:30 +0000
Received: by wwb39 with SMTP id 39so1596795wwb.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Apr 2011 12:12:27 -0700 (PDT)
Message-ID: <4DB86A96.6080607@gmail.com>
Date: Wed, 27 Apr 2011 21:12:22 +0200
From: Angelo Dureghello <angelo70@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: SST flash issues
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

Hi all,

my name is angelo, i am new to this list to ask for some help to mtd experts.

I installed uClinux in a custom board i developed, the kernel is stored inside a parallel flash, SST 29VF3201B (4MB, 16bit bus, word-readable) and loaded into RAM from the bootloader.

I prepared 3 partitions from my board.c, "bootloader", "kernel+romfs", and a final small "jffs2" data partition. 
My idea is to use this small third partition (1024Kb) to store some non-volatile data. 

The partitions seems to be detected correctly from the dmesg:

Using physmap partition information
Creating 3 MTD partitions on "physmap-flash":
0x000000000000-0x000000010000 : "Colilo (64K)"
mtd: Giving out device 0 to Colilo (64K)
0x000000010000-0x000000300000 : "Kernel+ROMfs (3008K)"
mtd: Giving out device 1 to Kernel+ROMfs (3008K)
0x000000300000-0x000000400000 : "JFFS2 (1024K)"
mtd: Giving out device 2 to JFFS2 (1024K)
uclinux[mtd]: RAM probe address=0x1ab704 size=0xa7000
Creating 1 MTD partitions on "RAM":
0x000000000000-0x0000000a7000 : "ROMfs"
mtd: Giving out device 3 to ROMfs
Generic platform RAM MTD, (c) 2004 Simtec Electronics

The first thing i don't understand is why the erasesize is for all 3 partitions as the same flash size, 0x400000:
/ # cd proc
/proc # cat mtd
dev:    size   erasesize  name
mtd0: 00010000 00400000 "Colilo (64K)"
mtd1: 002f0000 00400000 "Kernel+ROMfs (3008K)"
mtd2: 00100000 00400000 "JFFS2 (1024K)"
mtd3: 000a7000 00001000 "ROMfs"
/proc #

I was supposing that the erasesize was different for every partition. This is probably the first fact that don't allow to access for writing the 3rd partition (mtd2).

Then, as a first step, i try to read the mtdblock2 (cat), and i read exactly what i written inside, the data bytes of a little jffs2 fs i programmed in from the bootloader.

Then as a second step i would try to unlock/erase, to see if the flash has been detected correctly.

If i try to unlock the partition i get:

/proc # unlock /dev/mtdblock2
mtdblock_open
ok
Comtdblock_release
uok
ld not get MTD device info from /dev/mtdblock2
/proc #

If i try to erase:/proc # erase /dev/mtdblock2
mtdblock_open
ok
Ermtdblock_release
aok
se Total 1 Units
/proc #

But now, if i cat /dev/mtdblock2, original data are still there.

It is obvious now that also trying to mount the jffs2 fs nothing will work;:

/var # mount -t jffs2 /dev/mtdblock2 jffs2
MTDSB: lookup_bdev() returned 0
MTDSB: New superblock for device 2 ("JFFS2 (1024K)")
jffs2: Flash size not aligned to erasesize, reducing to 0KiB
jffs2: Too few erase blocks (0)
mount: mounting /dev/mtdblock2 on jffs2 failed: Invalid argument
/var #

So i guess i am wrong in more than one assumption,
every help is very appreciated,

many thanks,
angelo
