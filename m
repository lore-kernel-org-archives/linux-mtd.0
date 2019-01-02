Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gehdt-00006w-VX
 for linux-mtd@lists.infradead.org; Wed, 02 Jan 2019 14:37:11 +0000
From: Boris Brezillon <bbrezillon@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Alban Bedel <albeu@free.fr>
Subject: [PATCH 1/2] mtd: Fix the check on nvmem_register() ret code
Date: Wed,  2 Jan 2019 15:36:53 +0100
Message-Id: <20190102143654.24362-1-bbrezillon@kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 20167b70c894 ("nvmem: use EOPNOTSUPP instead of ENOSYS") changed
the nvmem_register() ret code from ENOSYS to EOPNOTSUPP when
CONFIG_NVMEM is not enabled, but the check in mtd_nvmem_add() was not
adjusted accordingly.

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Alban Bedel <albeu@free.fr>
Fixes: c4dfa25ab307 ("mtd: add support for reading MTD devices via the nvmem API")
Reported-by: kernel test robot <rong.a.chen@intel.com>
Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 21e3cdc04036..999b705769a8 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -522,7 +522,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 	mtd->nvmem = nvmem_register(&config);
 	if (IS_ERR(mtd->nvmem)) {
 		/* Just ignore if there is no NVMEM support in the kernel */
-		if (PTR_ERR(mtd->nvmem) == -ENOSYS) {
+		if (PTR_ERR(mtd->nvmem) == -EOPNOTSUPP) {
 			mtd->nvmem = NULL;
 		} else {
 			dev_err(&mtd->dev, "Failed to register NVMEM device\n");
-- 
2.17.1
