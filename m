Received: from gate.epygi.de ([212.126.211.241])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CWyK7-0006A1-Uj
	for linux-mtd@lists.infradead.org; Wed, 24 Nov 2004 09:40:49 -0500
Received: from sally.epygi.de (imap [10.20.0.18])
	by gate.epygi.de (8.12.9/8.12.9) with ESMTP id iAOEebDV007576
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Nov 2004 15:40:37 +0100 (MET)
From: "Stephan Linke" <Stephan.Linke@epygi.de>
To: "Linux-Mtd" <linux-mtd@lists.infradead.org>
Date: Wed, 24 Nov 2004 15:40:37 +0100
Message-ID: <NGENJJFPMHGLPILEKKAMMEAECFAA.Stephan.Linke@epygi.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: using multile partitions on one NAND chip
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

anyone tried using multiple partitions on a NAND flash?
I can't find the protection mechanism that protects lets say an erase on one block against a read command on the other block.
In my case I am using 2 YAFFS patitions and 1 partition that fakes a read-only NOR flash using the nand_read_ecc() function
(mtd->read_ecc()). I'm not shure if there is an efficient protection for this. It looks like nand_chip->chip_lock should do this job
but it only protects parts of the erase loop agains parts of the nand_chip->waitfunc() wait loop. It does not keep
nand_chip->cmdfunc() from sending a command while an erase command is still active in the nand chip.

Thanks, Stephan
