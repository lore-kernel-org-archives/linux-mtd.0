Received: from thorgal.et.tudelft.nl ([130.161.40.91])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19h852-00066P-Q9
	for <linux-mtd@lists.infradead.org>; Mon, 28 Jul 2003 14:30:24 +0100
Mime-Version: 1.0
Message-Id: <a05200f13bb4ad4689358@[130.161.115.44]>
Date: Mon, 28 Jul 2003 15:30:18 +0200
To: linux-mtd@lists.infradead.org
From: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
Content-Type: text/plain; charset="us-ascii" ; format="flowed"
Subject: nand_verify_buf broken ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Context: drivers/mtd/nand/nand.c in the latest CVS.

static int nand_verify_buf(struct mtd_info *mtd, const u_char *buf, int len)
{
	int i;
	struct nand_chip *this = mtd->priv;

	for (i=0; i<len; i++)
		if (buf[i] != readb(this->IO_ADDR_R))
			return i;

	return 0;
}

This will yield a false positive if the first byte of the buffer is 
corrupted. I didn't dig deep enough to find out who's using this and 
why (or if buf[0] is guaranteed to be correct) so no patch, sorry.

HTH,

JDB.
-- 
LART. 250 MIPS under one Watt. Free hardware design files.
http://www.lart.tudelft.nl/
