Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d2pAh-0006VA-Qa
 for linux-mtd@lists.infradead.org; Tue, 25 Apr 2017 01:21:41 +0000
Received: by mail-pf0-x241.google.com with SMTP id c198so7068770pfc.0
 for <linux-mtd@lists.infradead.org>; Mon, 24 Apr 2017 18:21:19 -0700 (PDT)
Date: Mon, 24 Apr 2017 18:21:16 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marex@denx.de>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PULL v2] mtd: nand: changes for 4.12
Message-ID: <20170425012116.GB120971@google.com>
References: <20170415092058.1c514a40@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170415092058.1c514a40@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Apr 15, 2017 at 09:20:58AM +0200, Boris Brezillon wrote:
> Hi Brian,
> 
> No changes from my v1 except the fix in the new Atmel NAND controller
> driver (bug reported by Alexandre).
> 
> As you can see, the PR is pretty big compared to 4.11, and it's mainly
> due to the Denali driver rework/cleanup (which I'd like to thank
> Masahiro for), the addition of the per-vendor initialization
> infrastructure and the complete rewrite of the Atmel driver.
> 
> The rest of the commits are just simple fixes/improvements to existing
> drivers or to the core.
> 
> Let me know if you see any problem.

I've gotten partway through your PR, and fortunately Linus blessed me
with another week too :)

Can you run some of your new stuff through sparse, and maybe coccinelle
(I think 'make coccicheck' would suffice). I see a lot of complaints,
some just from migrated/refactored code, but some new. Feel free to fix
any of these on top, of course. I'll continue to review the current PR.

A starter diff is appended, though it has been only compile tested.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/atmel/nand-controller.c | 5 ++---
 drivers/mtd/nand/atmel/pmecc.c           | 8 ++++----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/atmel/nand-controller.c b/drivers/mtd/nand/atmel/nand-controller.c
index d5be88f258fc..3b2446896147 100644
--- a/drivers/mtd/nand/atmel/nand-controller.c
+++ b/drivers/mtd/nand/atmel/nand-controller.c
@@ -1744,7 +1744,6 @@ atmel_hsmc_nand_controller_legacy_init(struct atmel_hsmc_nand_controller *nc)
 		.reg_bits = 32,
 		.val_bits = 32,
 		.reg_stride = 4,
-		.val_bits = 32,
 	};
 
 	struct device *dev = nc->base.dev;
@@ -1979,7 +1978,7 @@ static int atmel_hsmc_nand_controller_probe(struct platform_device *pdev,
 	return ret;
 }
 
-const struct atmel_nand_controller_ops atmel_hsmc_nc_ops = {
+static const struct atmel_nand_controller_ops atmel_hsmc_nc_ops = {
 	.probe = atmel_hsmc_nand_controller_probe,
 	.remove = atmel_hsmc_nand_controller_remove,
 	.ecc_init = atmel_hsmc_nand_ecc_init,
@@ -2038,7 +2037,7 @@ atmel_smc_nand_controller_remove(struct atmel_nand_controller *nc)
 	return 0;
 }
 
-const struct atmel_nand_controller_ops atmel_smc_nc_ops = {
+static const struct atmel_nand_controller_ops atmel_smc_nc_ops = {
 	.probe = atmel_smc_nand_controller_probe,
 	.remove = atmel_smc_nand_controller_remove,
 	.ecc_init = atmel_nand_ecc_init,
diff --git a/drivers/mtd/nand/atmel/pmecc.c b/drivers/mtd/nand/atmel/pmecc.c
index 1528aa4713a3..55a8ee5306ea 100644
--- a/drivers/mtd/nand/atmel/pmecc.c
+++ b/drivers/mtd/nand/atmel/pmecc.c
@@ -371,7 +371,7 @@ atmel_pmecc_create_user(struct atmel_pmecc *pmecc,
 
 	user->pmecc = pmecc;
 
-	user->partial_syn = (u16 *)PTR_ALIGN(user + 1, sizeof(u16));
+	user->partial_syn = (s16 *)PTR_ALIGN(user + 1, sizeof(u16));
 	user->si = user->partial_syn + ((2 * req->ecc.strength) + 1);
 	user->lmu = user->si + ((2 * req->ecc.strength) + 1);
 	user->smu = user->lmu + (req->ecc.strength + 1);
@@ -896,20 +896,20 @@ static struct atmel_pmecc *atmel_pmecc_get_by_node(struct device *userdev,
 
 static const int atmel_pmecc_strengths[] = { 2, 4, 8, 12, 24, 32 };
 
-struct atmel_pmecc_caps at91sam9g45_caps = {
+static struct atmel_pmecc_caps at91sam9g45_caps = {
 	.strengths = atmel_pmecc_strengths,
 	.nstrengths = 5,
 	.el_offset = 0x8c,
 };
 
-struct atmel_pmecc_caps sama5d4_caps = {
+static struct atmel_pmecc_caps sama5d4_caps = {
 	.strengths = atmel_pmecc_strengths,
 	.nstrengths = 5,
 	.el_offset = 0x8c,
 	.correct_erased_chunks = true,
 };
 
-struct atmel_pmecc_caps sama5d2_caps = {
+static struct atmel_pmecc_caps sama5d2_caps = {
 	.strengths = atmel_pmecc_strengths,
 	.nstrengths = 6,
 	.el_offset = 0xac,
-- 
2.13.0.rc0.306.g87b477812d-goog
