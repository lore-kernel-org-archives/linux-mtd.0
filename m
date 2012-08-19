Received: from mail1-relais-roc.national.inria.fr ([192.134.164.82])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T31Er-0003n3-MR
 for linux-mtd@lists.infradead.org; Sun, 19 Aug 2012 08:52:06 +0000
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 7/14] drivers/mtd/maps/rbtx4939-flash.c: delete unneeded test
Date: Sun, 19 Aug 2012 10:44:23 +0200
Message-Id: <1345365870-29831-8-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345365870-29831-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1345365870-29831-1-git-send-email-Julia.Lawall@lip6.fr>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Julia Lawall <Julia.Lawall@lip6.fr>

Err has only been initialized to 0 at this, so it is not possible that this
test can be true.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
(
if@p1 (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret@p1 = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}

// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mtd/maps/rbtx4939-flash.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/maps/rbtx4939-flash.c b/drivers/mtd/maps/rbtx4939-flash.c
index 6f52e1f..49c3fe7 100644
--- a/drivers/mtd/maps/rbtx4939-flash.c
+++ b/drivers/mtd/maps/rbtx4939-flash.c
@@ -100,8 +100,6 @@ static int rbtx4939_flash_probe(struct platform_device *dev)
 		goto err_out;
 	}
 	info->mtd->owner = THIS_MODULE;
-	if (err)
-		goto err_out;
 	err = mtd_device_parse_register(info->mtd, NULL, NULL, pdata->parts,
 					pdata->nr_parts);
 
