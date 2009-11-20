Received: from mail-pz0-f193.google.com ([209.85.222.193])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NBWi8-00021w-PD
	for linux-mtd@lists.infradead.org; Fri, 20 Nov 2009 16:51:57 +0000
Received: by pzk31 with SMTP id 31so2330970pzk.28
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 Nov 2009 08:51:50 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 20 Nov 2009 11:51:50 -0500
Message-ID: <93d1fdd10911200851r6abef9b3wd6391de5df5bc0d8@mail.gmail.com>
Subject: What might cause these ECC errors?
From: Ron Yorgason <yorgasor@gmail.com>
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

I'm working on a Freescale IMX27 embedded system with a Samsung 128Mb
NAND chip.  The original BSP is based on a 2.6.19 kernel, but this
didn't have support for bad block tables, and we've got a number of
devices with bad blocks that we are trying to make usable.  Freescale
provided us with a BSP for a newer product based on a linux-2.6.22
where they have bad block table support tested and working.  I back
ported the MTD code from the newer kernel to our kernel, but I'm
running into strange problems that I'm hoping someone can point me in
the right direction.

I'm running

./nandwrite -p /dev/mtd/8 spider2.wav
cpu1# ./nanddump -l 4472108 -f /dev/shm/spider2.wav /dev/mtd/8
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 4
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00443d2c...
ECC: 1 uncorrectable bitflip(s) at offset 0x00000000
ECC: 1 uncorrectable bitflip(s) at offset 0x00000800
ECC: 1 uncorrectable bitflip(s) at offset 0x00001000
ECC: 1 uncorrectable bitflip(s) at offset 0x00001800
...
It goes on, with ECC errors in almost every single block.

The md5sums come out different on the two files, and if I do a binary
diff, the files are dramatically different.  If I write to /dev/mtd/7,
the nanddump'ed versions of the files are almost identical.  Before I
did the backport, this test would pass, although I might get a few
extra zeros at the end of the dumped file.

Looking at the two different source trees, nothing really changed in
nand_ecc.c.  There's a new ecc layout for NAND with 2k page sizes,
nand_ecclayout nand_hw_eccoob_2k in mxc_nd.c (this seems to be an add
on by Freescale), but forcing the use of nand_hw_eccoob_8 didn't fix
the problem either.  Freescale doesn't know what might be causing
these ECC errors.  Has anyone come across errors like these during
development?  I'm hoping someone here can kind of point me in the
right direction on what might cause these errors or how to go about
finding it.

Thanks,

--Ron
