Received: from thorgal.et.tudelft.nl ([130.161.40.91])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19g4FL-00032Y-9V
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jul 2003 16:12:39 +0100
Mime-Version: 1.0
Message-Id: <a05200f4ebb46f6708c1c@[130.161.115.44]>
Date: Fri, 25 Jul 2003 17:12:36 +0200
To: linux-mtd@lists.infradead.org
From: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
Content-Type: text/plain; charset="us-ascii" ; format="flowed"
Subject: Handling multiple NAND chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I have an expansion board for the LART (an embedded computer based on 
the DEC/Intel StrongARM) with eight NAND flash devices on it. As 
suggested by the Toshiba datasheet, they share data, CLE, ALE, nWE 
and nRE and RDY. Each chip has its own nCE line.

I would like to use all eight chips with mtdconcat and YAFFS. Given 
the above, how should I hook the eight NANDs up to the mtd layer ? 
I've gone through CVS, but haven't found any hints in The Source.

By the way, is mtd multi-threaded whne using multiple devices ? 
Should I worry about overlapping address/data phases to separate NAND 
chips ?

Thanks,

Jan-Derk Bakker
[who inflicted the LART_ENDIAN_BYTE ordering on mtd]
-- 
LART. 250 MIPS under one Watt. Free hardware design files.
http://www.lart.tudelft.nl/
