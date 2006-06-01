Received: from elasmtp-banded.atl.sa.earthlink.net ([209.86.89.70])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FlqCV-0000VI-Bp
	for linux-mtd@lists.infradead.org; Thu, 01 Jun 2006 17:39:12 +0100
Message-ID: <32905508.1149179928067.JavaMail.root@elwamui-karabash.atl.sa.earthlink.net>
Date: Thu, 1 Jun 2006 09:38:47 -0700 (GMT-07:00)
From: Steve Finney <saf76@earthlink.net>
To: linux-mtd@lists.infradead.org
Subject: NAND OOB Questions...
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Reply-To: Steve Finney <saf76@earthlink.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have 3 questions about OOB and NAND chips that I'm
hoping someone can answer. Per an earlier post, I think
there may be two (obscure?) bugs in nand_base.c, but
there's too much I don't know about NAND (and the code) to be sure.
I believe the following description applies to the most recent
stable kernel source (2.6.16.19).

1) The Samsung K9F56* NAND chip allows doing more than one write
to the OOB area of a page without an erase; the second write
may zero bits that were set to 1 by the first write. Is the Samsung
chip unusual in this, or is this normal NAND behavior? (I believe
this would be normal for NOR flash).

2) In nand_base.c:nand_write_page(), OOB data is written even when
NAND_ECC_NONE is set. Under what circumstances is this useful?
(The issue with this is that, in conjunction with (1), this may
overwrite OOB in a circumstance where you're trying to write it
yourself from user space; pernaps this is something that's only relevant
for diagnostics/debugging).

3) nand_prepare_oobbuf() makes a point of setting the internal oobbuf
to 0xFF if it's had ECC bytes written to it (based on the this->oobdirty
flag). However, the default case (which includes hardware ECC) in
nand_write_page() can write the internal oobbuf without setting
this->oobdirty, and thus not triggering the later reset to 0xFF. Is
there a rationale for this? (The OOB issue induced by 1 & 2 would be
benign if oobbuf was cleared to 0xFF).

Thanks for any info.
sf
