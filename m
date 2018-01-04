Received: from mout.web.de ([212.227.17.12])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eX38j-0005xt-Qa
 for linux-mtd@lists.infradead.org; Thu, 04 Jan 2018 10:52:51 +0000
Subject: [PATCH 2/2] mtd/maps/sun_uflash: Improve a size determination in
 uflash_devinit()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <30c07f5a-578c-0e53-b80f-675fb24e6223@users.sourceforge.net>
Message-ID: <1c70e16b-f34c-d655-fdd4-67730f17a680@users.sourceforge.net>
Date: Thu, 4 Jan 2018 11:52:27 +0100
MIME-Version: 1.0
In-Reply-To: <30c07f5a-578c-0e53-b80f-675fb24e6223@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 Jan 2018 11:38:28 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/maps/sun_uflash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/sun_uflash.c b/drivers/mtd/maps/sun_uflash.c
index 80a253cc72e2..16a4f16a2680 100644
--- a/drivers/mtd/maps/sun_uflash.c
+++ b/drivers/mtd/maps/sun_uflash.c
@@ -61,7 +61,7 @@ int uflash_devinit(struct platform_device *op, struct device_node *dp)
 		return -ENODEV;
 	}
 
-	up = kzalloc(sizeof(struct uflash_dev), GFP_KERNEL);
+	up = kzalloc(sizeof(*up), GFP_KERNEL);
 	if (!up)
 		return -ENOMEM;
 
-- 
2.15.1
