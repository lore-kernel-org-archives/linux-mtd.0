Received: from cl-303.ams-04.nl.sixxs.net ([2001:960:2:12e::2]
	helo=joshuawise.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DGoKu-0001d9-NB
	for linux-mtd@lists.infradead.org; Wed, 30 Mar 2005 20:19:05 -0500
Message-ID: <424B4FFA.7050906@joshuawise.com>
Date: Wed, 30 Mar 2005 20:18:50 -0500
From: Joshua Wise <joshua@joshuawise.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Matt Reimer <mreimer@vpop.net>
Subject: oobavail issues
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,

We're debugging a mysterious crash on NAND writes on an s3c2410-derived 
driver. The culprit seems to be in how oobavail is determined:

line 2524 nand_base.c: mtd->oobavail = mtd->oobsize - 
(this->autooob->eccbytes + 1);

Our oobinfo is the same as the s3c2410's. For reference, that's:

static struct nand_oobinfo nand_hw_eccoob = {
         .useecc = MTD_NANDECC_AUTOPLACE,
         .eccbytes = 3,
         .eccpos = {0, 1, 2 },
         .oobfree = { {8, 8} }
};

We found that making our oobfree match up with oobavail seemed to do the 
trick for avoiding this, and make JFFS2 work, to boot! Here's what we did:

static struct nand_oobinfo nand_hw_eccoob = {
         .useecc = MTD_NANDECC_AUTOPLACE,
         .eccbytes = 3,
         .eccpos = {0, 1, 2 },
         .oobfree = { {8, 8}, {3, 2}, {6, 2} } /* {6, 10} instead? */
};

I suspect that oobavail should be summing oobfree instead of doing that 
arithmetic. Or is there something I'm not seeing?

joshua
