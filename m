Received: from gate.epygi.de ([212.126.211.241])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AVrG3-0006uu-My
	for linux-mtd@lists.infradead.org; Mon, 15 Dec 2003 11:51:27 +0000
Received: from sally.epygi.de (sally.epygi.de [10.20.0.18])
	by gate.epygi.de (8.12.9/8.12.9) with ESMTP id hBFBndhf026211
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Dec 2003 12:49:39 +0100 (MET)
From: "Stephan Linke" <Stephan.Linke@epygi.de>
To: "Linux-Mtd" <linux-mtd@lists.infradead.org>
Date: Mon, 15 Dec 2003 12:49:38 +0100
Message-ID: <NGENJJFPMHGLPILEKKAMMEPPCDAA.Stephan.Linke@epygi.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: reset on NAND flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

when scanning the nand device shouldn't the reset command being issued first?
I am thinking of these situations where the flash is left out of sync after a soft reset. Maybe ID detection can fail since
NAND_CMD_READID is not recognised by NAND chip?

I would prefer having a NAND_CMD_RESET in nand_scan(). What do you think?

Regards, Stephan
