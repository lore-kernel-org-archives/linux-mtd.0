Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1elLGO-0006tF-G2
 for linux-mtd@lists.infradead.org; Mon, 12 Feb 2018 21:03:50 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: Joern Engel <joern@lazybastard.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Solarflare linux maintainers <linux-net-drivers@solarflare.com>,
 Edward Cree <ecree@solarflare.com>, Bert Kenward <bkenward@solarflare.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
 devel@driverdev.osuosl.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/5] mtd: Initialize ->fail_addr early in mtd_erase()
Date: Mon, 12 Feb 2018 22:03:07 +0100
Message-Id: <20180212210311.23244-2-boris.brezillon@bootlin.com>
In-Reply-To: <20180212210311.23244-1-boris.brezillon@bootlin.com>
References: <20180212210311.23244-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd_erase() can return an error before ->fail_addr is initialized to
MTD_FAIL_ADDR_UNKNOWN. Move this initialization at the very beginning
of the function.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/mtdcore.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index a1c94526fb88..c87859ff338b 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -953,6 +953,8 @@ EXPORT_SYMBOL_GPL(__put_mtd_device);
  */
 int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
+	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
+
 	if (!mtd->erasesize || !mtd->_erase)
 		return -ENOTSUPP;
 
@@ -961,7 +963,6 @@ int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
 
-	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
 	if (!instr->len) {
 		instr->state = MTD_ERASE_DONE;
 		mtd_erase_callback(instr);
-- 
2.14.1
