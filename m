Received: from perches-mx.perches.com ([206.117.179.246] helo=labridge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UjsUJ-0007MG-EC
 for linux-mtd@lists.infradead.org; Tue, 04 Jun 2013 14:45:27 +0000
From: Joe Perches <joe@perches.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] mtd: onenand: samsung: Release memory after incorrect
 return/goto
Date: Tue,  4 Jun 2013 07:44:49 -0700
Message-Id: <ec732a1673510a786e5333b00730b8226e792357.1370356776.git.joe@perches.com>
In-Reply-To: <60123fd3175b7cceadf6c335b12e58b797e18f65.1370356776.git.joe@perches.com>
References: <60123fd3175b7cceadf6c335b12e58b797e18f65.1370356776.git.joe@perches.com>
Cc: linux-mtd@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The code uses

    return foo;
    goto err_type;

when instead the form should have been

    ret = foo;
    goto err_type;

Here this causes a useful kfree to be skipped.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/mtd/onenand/samsung.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index 2cf7408..90bd111 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -895,8 +895,8 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
 		dev_err(&pdev->dev, "no memory resource defined\n");
-		return -ENOENT;
-		goto ahb_resource_failed;
+		err = -ENOENT;
+		goto resource_failed;
 	}
 
 	onenand->base_res = request_mem_region(r->start, resource_size(r),
-- 
1.8.1.2.459.gbcd45b4.dirty
