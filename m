Received: from smtp06.smtpout.orange.fr ([80.12.242.128]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePMj1-0002Sp-3W
 for linux-mtd@lists.infradead.org; Thu, 14 Dec 2017 06:10:57 +0000
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: kyungmin.park@samsung.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 3/4 v3] mtd: onenand: samsung: Remove a useless include
Date: Thu, 14 Dec 2017 07:03:52 +0100
Message-Id: <3841b40286522d07585e773fb62c4c737ebf757b.1513230484.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1513230484.git.christophe.jaillet@wanadoo.fr>
References: <cover.1513230484.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1513230484.git.christophe.jaillet@wanadoo.fr>
References: <cover.1513230484.git.christophe.jaillet@wanadoo.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This include is not needed, so remove it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Cross-compiled tested-only

v3: new patch in the serie
---
 drivers/mtd/onenand/samsung.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index 206aa90140c9..c21d025fee87 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -25,8 +25,6 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 
-#include <asm/mach/flash.h>
-
 #include "samsung.h"
 
 enum soc_type {
-- 
2.14.1
