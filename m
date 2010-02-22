Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NjVZF-0008Ks-FH
	for linux-mtd@lists.infradead.org; Mon, 22 Feb 2010 10:31:15 +0000
Received: by vws3 with SMTP id 3so549562vws.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Feb 2010 02:31:08 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 22 Feb 2010 18:31:07 +0800
Message-ID: <3a00f25a1002220231j6d2bc954hfd953a94e338e3a6@mail.gmail.com>
Subject: pagetest failed - How to Debug
From: Brian Wang <brian.wang.0721@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I'm using UBIFS on my device and found some nodes are corrupted.  I
then tested with nand-test tools.
oobtest, speedtest and scantest seem good without errors.
However, pagetest and subpagetest finish with errors.
Some of the error locations are consistent but some are random (seems to be).
What do the errors suggest?  How can I narrow down the scope of the problem?
I can even boot with rootfs on NAND (4KB-page MLC).

Thanks in advance.

Below is the log of pagetest:

$ insmod ./pagetest.ko dev=4
[10193.290000]
[10193.290000] =========================================================================================
[10193.295000] pagetest: dev = 4
[10193.300000] pagetest: scanning for bad blocks
[10193.305000] pagetest: scanned 0
[10193.310000] pagetest: Block 204 is bad
[10193.310000] pagetest: Block 226 is bad
[10193.315000] pagetest: scanned 256
[10193.315000] pagetest: scanned 512
[10193.320000] pagetest: erasing
[10193.325000] pagetest: erased 0
[10193.665000] pagetest: erased 256
[10194.015000] pagetest: erased 512
[10194.015000] pagetest: writing
[10194.250000] pagetest: written 0
[10254.920000] pagetest: written 256
[10315.685000] pagetest: written 512
[10315.685000] pagetest: verifying
[10316.270000] pagetest: verified 0
[10467.455000] pagetest: verified 256
[10523.350000] pagetest: error: verify failed at 0x0af70000
[10523.355000] pagetest: error: verify failed at 0x0af71000
[10585.475000] pagetest: error: verify failed at 0x0e396000
[10585.480000] pagetest: error: verify failed at 0x0e397000
[10614.945000] pagetest: error: verify failed at 0x0fc5e000
[10614.950000] pagetest: error: verify failed at 0x0fc5f000
[10619.265000] pagetest: verified 512
[10619.265000] pagetest: crosstest
[10619.265000] pagetest: reading page at 0x00000000
[10619.270000] pagetest: reading page at 0x0ffff000
[10619.275000] pagetest: reading page at 0x00000000
[10619.280000] pagetest: verifying pages read at 0x00000000 match
[10619.285000] pagetest: crosstest ok
[10619.290000] pagetest: erasecrosstest
[10619.290000] pagetest: erasing block 0
[10619.295000] pagetest: writing 1st page of block 0
[10619.300000] pagetest: reading 1st page of block 0
[10619.305000] pagetest: verifying 1st page of block 0
[10619.310000] pagetest: erasing block 0
[10619.315000] pagetest: writing 1st page of block 0
[10619.320000] pagetest: erasing block 511
[10619.325000] pagetest: reading 1st page of block 0
[10619.330000] pagetest: verifying 1st page of block 0
[10619.330000] pagetest: erasecrosstest ok
[10619.335000] pagetest: erasetest
[10619.340000] pagetest: erasing block 0
[10619.345000] pagetest: writing 1st page of block 0
[10619.350000] pagetest: erasing block 0
[10619.350000] pagetest: reading 1st page of block 0
[10619.355000] pagetest: verifying 1st page of block 0 is all 0xff
[10619.360000] pagetest: erasetest ok
[10619.365000] pagetest: pagetest finished with 6 errors
[10619.370000] =========================================================================================
insmod: can't insert './pagetest.ko': Operation not permitted


-- 
brian
------------------

Cool-Karaoke - The smallest recording studio, in your palm, open-sourced
http://cool-idea.com.tw/

iMaGiNaTiOn iS mOrE iMpOrTaNt tHaN kNoWlEdGe
