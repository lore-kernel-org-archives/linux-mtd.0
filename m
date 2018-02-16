Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1emjAc-0007NO-G0
 for linux-mtd@lists.infradead.org; Fri, 16 Feb 2018 16:47:43 +0000
Received: by mail-wr0-x244.google.com with SMTP id 34so3493806wre.13
 for <linux-mtd@lists.infradead.org>; Fri, 16 Feb 2018 08:47:24 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, David Lechner <david@lechnology.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 3/6] memory: aemif: don't rely on kbuild for driver's name
Date: Fri, 16 Feb 2018 17:47:09 +0100
Message-Id: <20180216164712.25898-4-brgl@bgdev.pl>
In-Reply-To: <20180216164712.25898-1-brgl@bgdev.pl>
References: <20180216164712.25898-1-brgl@bgdev.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We want to use aemif from board files. Use a static name in the
driver's code.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/memory/ti-aemif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
index 2744b1b91b57..588e58d40d1b 100644
--- a/drivers/memory/ti-aemif.c
+++ b/drivers/memory/ti-aemif.c
@@ -422,7 +422,7 @@ static struct platform_driver aemif_driver = {
 	.probe = aemif_probe,
 	.remove = aemif_remove,
 	.driver = {
-		.name = KBUILD_MODNAME,
+		.name = "ti-aemif",
 		.of_match_table = of_match_ptr(aemif_of_match),
 	},
 };
-- 
2.16.1
