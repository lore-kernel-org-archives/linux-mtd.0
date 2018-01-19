Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ecRWk-0004su-J6
 for linux-mtd@lists.infradead.org; Fri, 19 Jan 2018 07:55:56 +0000
From: Colin King <colin.king@canonical.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][V2] mtd: nand: marvell: fix spelling mistake: "suceed"->
 "succeed"
Date: Fri, 19 Jan 2018 07:55:31 +0000
Message-Id: <20180119075531.14841-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistakes in dev_err error message text.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/nand/marvell_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/marvell_nand.c b/drivers/mtd/nand/marvell_nand.c
index b8fec6093b75..4bd53b360277 100644
--- a/drivers/mtd/nand/marvell_nand.c
+++ b/drivers/mtd/nand/marvell_nand.c
@@ -517,7 +517,7 @@ static int marvell_nfc_prepare_cmd(struct nand_chip *chip)
 	/* Poll ND_RUN and clear NDSR before issuing any command */
 	ret = marvell_nfc_wait_ndrun(chip);
 	if (ret) {
-		dev_err(nfc->dev, "Last operation did not suceed\n");
+		dev_err(nfc->dev, "Last operation did not succeed\n");
 		return ret;
 	}
 
-- 
2.15.1
