From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-arm-kernel@lists.infradead.org>,
	<linux-mtd@lists.infradead.org>
Subject: [PATCH v2 06/27] mtd: nand: pxa3xx: Prevent sub-page writes
Date: Fri, 18 Oct 2013 20:02:33 -0300
Message-Id: <1382137374-21251-7-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1382137374-21251-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1382137374-21251-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Daniel Mack <zonque@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The current driver doesn't support sub-page writing, so report
that to the NAND core.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index aa75adf..5ca3154 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1143,6 +1143,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
 		chip->read_byte		= pxa3xx_nand_read_byte;
 		chip->read_buf		= pxa3xx_nand_read_buf;
 		chip->write_buf		= pxa3xx_nand_write_buf;
+		chip->options		|= NAND_NO_SUBPAGE_WRITE;
 	}
 
 	spin_lock_init(&chip->controller->lock);
-- 
1.8.1.5
