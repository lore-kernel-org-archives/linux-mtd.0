Received: from host31-220.pool21757.interbusiness.it ([217.57.220.31]
	helo=wawnet.biz)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B3dDe-0008QV-QI
	for linux-mtd@lists.infradead.org; Wed, 17 Mar 2004 15:44:35 +0000
Message-Id: <6.0.1.1.0.20040317161859.01f80e70@dns.struinfo.it>
Date: Wed, 17 Mar 2004 16:44:30 +0100
To: linux-mtd@lists.infradead.org
From: llandre <r&d@wawnet.biz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
cc: Andrea Scian <andrea.scian@wawnet.biz>
cc: tglx@linutronix.de
cc: Matteo Bortolin <matteo.bortolin@wawnet.biz>
Subject: Bug in nand_select_chip?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a question about the nand_select_chip function. I wrote a driver for 
a Samsung NAND
Flash device (K9F5608U0C - 32MB). Everything worked fine with old MTD 
sources (July 2003).
After updating the MTD with latest CVS (2004-03-17) and applying the ilookup
patch 
(http://www.infradead.org/cgi-bin/cvsweb.cgi/~checkout~/mtd/patches/ilookup-2.4.23.patch?rev=1.1),
the same driver did not work anymore.
Then I had a look at the new sources and I noted that the nand_select_chip 
changed completely.

The old function, with chip==0, sets the nCE pin low:

static void nand_select_chip(struct mtd_info *mtd, int chip)
{
         struct nand_chip *this = mtd->priv;
         if (chip)
                 this->hwcontrol(mtd, NAND_CTL_SETNCE);
         else
                 this->hwcontrol(mtd, NAND_CTL_CLRNCE);

}


The new function, with chip==0, sets the nCE pin high:

static void nand_select_chip(struct mtd_info *mtd, int chip)
{
         struct nand_chip *this = mtd->priv;
         switch(chip) {
         case -1:
                 this->hwcontrol(mtd, NAND_CTL_CLRNCE);
                 break;
         case 0:
                 this->hwcontrol(mtd, NAND_CTL_SETNCE);
                 break;

         default:
                 BUG();
         }
}

For this reason the chip was clearly not detected at all.
After changing the new function as follows, everything works fine again:

static void nand_select_chip(struct mtd_info *mtd, int chip)
{
         struct nand_chip *this = mtd->priv;
         switch(chip) {
         case -1:
                 /* llandre - inverted default behaviour */
                 this->hwcontrol(mtd, NAND_CTL_SETNCE);
                 break;
         case 0:
                 /* llandre - inverted default behaviour */
                 this->hwcontrol(mtd, NAND_CTL_CLRNCE);
                 break;

         default:
                 BUG();
         }
}


1) Why did the code change this way?
2) I think the best way to overcome the problem is to define a proprietary 
nand_select_chip function
in the low-level driver and to make the select_chip pointer in the struct 
nand_chip to point to it. Correct?





Many thanks in advance,

llandre 
