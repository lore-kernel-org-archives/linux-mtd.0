Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dWTkR-0004JR-Vf
 for linux-mtd@lists.infradead.org; Sat, 15 Jul 2017 20:33:09 +0000
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: David Woodhouse <dwmw2@infradead.org>
Cc: keescook@chromium.org, kernel-janitors@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] mtd: physmap_of: Drop unnecessary static
Date: Sat, 15 Jul 2017 22:07:38 +0200
Message-Id: <1500149266-32357-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1500149266-32357-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1500149266-32357-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Drop static on a local variable, when the variable is initialized before
any possible use.  Thus, the static has no benefit.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@bad exists@
position p;
identifier x;
type T;
@@
static T x@p;
...
x = <+...x...+>

@@
identifier x;
expression e;
type T;
position p != bad.p;
@@
-static
 T x@p;
 ... when != x
     when strict
?x = e;
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
These patches are all independent of each other.

 drivers/mtd/maps/physmap_of_versatile.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/mtd/maps/physmap_of_versatile.c b/drivers/mtd/maps/physmap_of_versatile.c
--- a/drivers/mtd/maps/physmap_of_versatile.c
+++ b/drivers/mtd/maps/physmap_of_versatile.c
@@ -97,7 +97,7 @@ static const struct of_device_id ebi_mat
 static int ap_flash_init(struct platform_device *pdev)
 {
 	struct device_node *ebi;
-	static void __iomem *ebi_base;
+	void __iomem *ebi_base;
 	u32 val;
 	int ret;
 
