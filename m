Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGM1R-000690-UF
 for linux-mtd@lists.infradead.org; Tue, 25 Sep 2012 03:41:24 +0000
Received: by padbi5 with SMTP id bi5so1915646pad.36
 for <linux-mtd@lists.infradead.org>; Mon, 24 Sep 2012 20:41:19 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/9] mtd: nand: improve NAND ID detection
Date: Mon, 24 Sep 2012 20:40:46 -0700
Message-Id: <1348544455-17656-1-git-send-email-computersforpeace@gmail.com>
Cc: Angus Clark <angus.clark@st.com>, Mike Dunn <mikedunn@newsguy.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Huang Shijie <b32955@freescale.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I've been working on some changes to nand_base.c's nand_get_flash_type()
routine for improving its structure and readability as well as to detect some
new chips. Generally, this patch series does the following:

(1) split several of the big blocks of detection code into separate functions,
    each designated with different tasks
(2) add support for several "new" Hynix and Samsung NAND, which have new
    decoding tables
(3) provide a better baseline on which I or others can make future changes
    (esp., the "generic READ ID length calculation" is useful for detecting
    other patterns that will determine BB marker options)

I have tested this patch series for regressions against a few chips:

  Samsung K9GAG08U0D
  Samsung K9LBG08U0E
  Hynix H27U8G8G5D
  Micron MT29F32G08CBACA

Additionally, I used a test harness for nand_get_flash_type() provided Angus
Clark to test for both regressions and proper fixes (contact Angus if you need
the suite; I'm not sure I have permission to redistribute). The test uses some
data from:

  http://www.linux-mtd.infradead.org/nand-data/nanddata.html

I do not have actual samples of most of the new Samsung and Hynix but have
largely relied on datasheets and support from others who have these chips. Any
testing -- with either old or new chips -- is appreciated.

Thanks,
Brian

Brian Norris (9):
  mtd: nand: remove unnecessary variable
  mtd: nand: remove redundant ID read
  mtd: nand: split BB marker options decoding into its own function
  mtd: nand: split extended ID decoding into its own function
  mtd: nand: split simple ID decode into its own function
  mtd: nand: add generic READ ID length calculation functions
  mtd: nand: increase max OOB size to 640
  mtd: nand: decode Hynix MLC, 6-byte ID length
  mtd: nand: detect Samsung K9GBG08U0A, K9GAG08U0F ID

 drivers/mtd/nand/nand_base.c | 360 +++++++++++++++++++++++++++++--------------
 include/linux/mtd/nand.h     |   2 +-
 2 files changed, 248 insertions(+), 114 deletions(-)

-- 
1.7.11.3
