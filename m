Received: from smtp.mei.co.jp ([133.183.100.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQu4z-00055Z-SF
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 08:13:42 +0000
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/7] mtd: denali: A collection of trivial coding style fixes
Date: Mon,  8 Sep 2014 17:10:06 +0900
Message-Id: <1410163813-31783-1-git-send-email-yamada.m@jp.panasonic.com>
Cc: Jiri Kosina <trivial@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>,
 Masahiro Yamada <yamada.m@jp.panasonic.com>,
 Rashika Kheria <rashika.kheria@gmail.com>,
 "grmoore@altera.com" <grmoore@altera.com>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>




Masahiro Yamada (7):
  mtd: denali: fix the format of comment blocks
  mtd: denali: remove unnecessary variable initializations
  mtd: denali: remove unnecessary casts
  mtd: denali: change the type of "i" to int
  mtd: denali: remove a set-but-unused variable
  mtd: denali: remove unnecessary parentheses
  mtd: denali: fix indentations and other trivial things

 drivers/mtd/nand/denali.c | 532 +++++++++++++++++++++++++---------------------
 1 file changed, 290 insertions(+), 242 deletions(-)

-- 
1.9.1
