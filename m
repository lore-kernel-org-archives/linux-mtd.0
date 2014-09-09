Received: from smtp.mei.co.jp ([133.183.100.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XRAlj-0006Ry-Mx
 for linux-mtd@lists.infradead.org; Tue, 09 Sep 2014 02:02:56 +0000
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 0/7] mtd: denali: A collection of trivial coding style fixes
Date: Tue,  9 Sep 2014 11:01:50 +0900
Message-Id: <1410228117-14820-1-git-send-email-yamada.m@jp.panasonic.com>
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



Changes in v2:
  - Join quotes strings into a single line

Masahiro Yamada (7):
  mtd: denali: fix the format of comment blocks
  mtd: denali: remove unnecessary variable initializations
  mtd: denali: remove unnecessary casts
  mtd: denali: change the type of iterators to int
  mtd: denali: remove a set-but-unused variable
  mtd: denali: remove unnecessary parentheses
  mtd: denali: fix indents and other trivial things

 drivers/mtd/nand/denali.c | 562 +++++++++++++++++++++++++---------------------
 1 file changed, 303 insertions(+), 259 deletions(-)

-- 
1.9.1
