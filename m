Received: from mail.perches.com ([173.55.12.10])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PH1K4-000645-I2
	for linux-mtd@lists.infradead.org; Fri, 12 Nov 2010 21:38:20 +0000
From: Joe Perches <joe@perches.com>
To: Jiri Kosina <trivial@kernel.org>
Subject: [PATCH 08/14] drivers/mtd/nand: Use printf extension %pR for struct
	resource
Date: Fri, 12 Nov 2010 13:37:58 -0800
Message-Id: <7b7e68efb016f0b0d53bb3119208dd937c79d53c.1289597644.git.joe@perches.com>
In-Reply-To: <cover.1289597644.git.joe@perches.com>
References: <cover.1289597644.git.joe@perches.com>
Cc: Olof Johansson <olof@lixom.net>, linuxppc-dev@lists.ozlabs.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Using %pR standardizes the struct resource output.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/mtd/nand/pasemi_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/pasemi_nand.c b/drivers/mtd/nand/pasemi_nand.c
index 6ddb246..bb277a5 100644
--- a/drivers/mtd/nand/pasemi_nand.c
+++ b/drivers/mtd/nand/pasemi_nand.c
@@ -107,7 +107,7 @@ static int __devinit pasemi_nand_probe(struct platform_device *ofdev,
 	if (pasemi_nand_mtd)
 		return -ENODEV;
 
-	pr_debug("pasemi_nand at %llx-%llx\n", res.start, res.end);
+	pr_debug("pasemi_nand at %pR\n", &res);
 
 	/* Allocate memory for MTD device structure and private data */
 	pasemi_nand_mtd = kzalloc(sizeof(struct mtd_info) +
-- 
1.7.3.1.g432b3.dirty
