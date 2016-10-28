Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c0C0j-0006Ln-Ba
 for linux-mtd@lists.infradead.org; Fri, 28 Oct 2016 18:36:13 +0000
From: Colin King <colin.king@canonical.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] mfd: si476x-i2c: Fix spelling mistakes "Failet" and "gett"
Date: Fri, 28 Oct 2016 19:35:48 +0100
Message-Id: <20161028183548.8190-1-colin.king@canonical.com>
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

Trivial spelling mistake fixes in dev_err message.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mfd/si476x-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/si476x-i2c.c b/drivers/mfd/si476x-i2c.c
index c180b75..e6a3d99 100644
--- a/drivers/mfd/si476x-i2c.c
+++ b/drivers/mfd/si476x-i2c.c
@@ -753,7 +753,7 @@ static int si476x_core_probe(struct i2c_client *client,
 				       ARRAY_SIZE(core->supplies),
 				       core->supplies);
 	if (rval) {
-		dev_err(&client->dev, "Failet to gett all of the regulators\n");
+		dev_err(&client->dev, "Failed to get all of the regulators\n");
 		goto free_gpio;
 	}
 
-- 
2.9.3
