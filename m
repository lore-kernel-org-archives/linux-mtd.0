Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c4IHX-0007Am-Fg
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2016 02:06:32 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 0/3] mtd: some minor cleanups for ooblayout APIs
Date: Wed,  9 Nov 2016 11:08:07 +0900
Message-Id: <1478657290-9430-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 - Remove unnecessary initializers
 - Use min_t() helper

Masahiro Yamada (3):
  mtd: remove unneeded initializer in mtd_ooblayout_{get,set}_bytes()
  mtd: use min_t() to refactor mtd_ooblayout_{get,set}_bytes()
  mtd: remove unneeded initializer in mtd_ooblayout_count_bytes()

 drivers/mtd/mtdcore.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

-- 
1.9.1
