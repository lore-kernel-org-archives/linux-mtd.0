Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SDMeV-0005tf-ME
 for linux-mtd@lists.infradead.org; Thu, 29 Mar 2012 21:13:04 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 15/17] mtd: mark const init data with __initconst instead of
 __initdata
Date: Thu, 29 Mar 2012 23:12:32 +0200
Message-Id: <1333055554-31300-15-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20120329211131.GA31250@pengutronix.de>
References: <20120329211131.GA31250@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As long as there is no other non-const variable marked __initdata in the
same compilation unit it doesn't hurt. If there were one however
compilation would fail with

	error: $variablename causes a section type conflict

because a section containing const variables is marked read only and so
cannot contain non-const variables.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/maps/wr_sbc82xx_flash.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/wr_sbc82xx_flash.c b/drivers/mtd/maps/wr_sbc82xx_flash.c
index aa7e0cb..4f6bf60 100644
--- a/drivers/mtd/maps/wr_sbc82xx_flash.c
+++ b/drivers/mtd/maps/wr_sbc82xx_flash.c
@@ -59,7 +59,7 @@ static struct mtd_partition bigflash_parts[] = {
 	}
 };
 
-static const char *part_probes[] __initdata = {"cmdlinepart", "RedBoot", NULL};
+static const char *part_probes[] __initconst = {"cmdlinepart", "RedBoot", NULL};
 
 #define init_sbc82xx_one_flash(map, br, or)			\
 do {								\
-- 
1.7.9.1
