Received: from relay01.mail-hub.dodo.com.au ([203.220.32.149])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D8H0o-0004Tk-BA
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2005 07:07:03 -0500
Received: from [220.240.204.94] (helo=APOLLO)
	by relay01.mail-hub.dodo.com.au with smtp (Exim 3.36 #2)
	id 1D8H0m-00009g-00
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2005 23:07:00 +1100
From: "Matt Garratt" <m.garratt@adfa.edu.au>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 7 Mar 2005 23:07:27 +1100
Message-ID: <HMEGLJJFEGIOMNFLAPOFEEAMCEAA.m.garratt@adfa.edu.au>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Bad black table not found
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When my computer boots, I get the following messages that concern me
regarding the DOC2000. Are these something I should worry about and if so,
is there anything that can be done to fix?

Bad Block Table not found for chip 0
Bad Block Table not found for chip 0

INFTL: corrupt block 4087 in chain 4087, chain length 0, erase mark 0x0?
INFTL: formating chain at block 4087
INFTL: formatting block 4087
nand_erase: Failed erase, page 0x0001fee0
INFTL: error while formatting block 4087
INFTL: cannot calculate a geometry to match size of 0x6d5c0
INFTL: using C:999 H:16 S:28 (==0x6d440 sects)


It appears that the BBT is missing or something, which is odd since I have
reconstructed using the M-Systems utilities
(dformat /win:d000 /USELOG:BBT.txt)

Any advice would be much appreciated.

I am using a 2.6.9 kernel patched from cvs.

Matt
