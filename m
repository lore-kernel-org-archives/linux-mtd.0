Received: from wsgw1.atc.army.mil ([134.194.13.55])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BfcsQ-0003wV-8A
	for linux-mtd@lists.infradead.org; Wed, 30 Jun 2004 07:03:44 -0400
Received: from atc-smtp1.atc.army.mil ([134.194.25.160])
	by wsgw1.atc.army.mil (SMSSMTP 4.0.0.59) with SMTP id
	M2004063007142225643
	for <linux-mtd@lists.infradead.org>; Wed, 30 Jun 2004 07:14:22 -0400
Message-ID: <EFF9A3506F74924AB5CC77BDC66E79351812DF@atcml01.atc.army.mil>
From: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
To: linux-mtd@lists.infradead.org
Date: Wed, 30 Jun 2004 07:05:18 -0400
MIME-Version: 1.0
Content-Type: text/plain
Subject: BBT question on DOC MIL Plus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

  Looking at the pdf file for the DOC Mil Plus 32Mbyte chip.  If I read it
right it says that the bbt for the whole chip is located on page 2 of block
0.  Looking at the current nand_bbt.c file looks like for other chips that
each block contains it bbt.  Am I understanding things correctly???  So my
question is how is the information on the Mil Plus provided and how do I
associate this with each of my 1024 blocks? (how is the table laid out???)
Also since I have two 16Mbyte chips in the device how do we keep track of
the interleaving of the chips??????  I would like to get a better
understanding of this so I can try to help and get these chips supported.

Thanks,
John
