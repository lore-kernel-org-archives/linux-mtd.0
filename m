Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcdPt-00045I-1r
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2018 21:09:55 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 "Bean Huo (beanhuo)" <beanhuo@micron.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH 0/2] mtd: rawnand: micron: Fix on-die ECC
Date: Mon,  9 Jul 2018 23:09:35 +0200
Message-Id: <20180709210937.30150-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Chris, Bean,

Here are 2 patches for you to review/test. The first one is fixing
the layout definition, and unless I missed something it should be
correct.

The second one is just my understanding of how byte 5 of READ_ID works
based on our experience with the 4bit/512 on-die ECC chip we have
worked on and the other datasheet I had a look at.
I'm not 100% sure this will work for all chips, but might work for the
2 chips we support right now.
So please test and/or review it and let me know if this approach works.

Regards,

Boris

Boris Brezillon (2):
  mtd: rawnand: micron: Define the proper layout for 8bit/512bytes
    on-die ECC
  mtd: rawnand: micron: Fix on-die ECC detection logic

 drivers/mtd/nand/raw/nand_micron.c | 110 +++++++++++++++++++++++++------------
 1 file changed, 75 insertions(+), 35 deletions(-)

-- 
2.14.1
