Received: from mail1-relais-roc.national.inria.fr ([192.134.164.82])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T31Hi-0003sF-Ti
 for linux-mtd@lists.infradead.org; Sun, 19 Aug 2012 08:55:03 +0000
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 13/14] drivers/mtd/ubi/build.c: fix error return code
Date: Sun, 19 Aug 2012 10:44:29 +0200
Message-Id: <1345365870-29831-14-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345365870-29831-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1345365870-29831-1-git-send-email-Julia.Lawall@lip6.fr>
Cc: David Woodhouse <dwmw2@infradead.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Julia Lawall <Julia.Lawall@lip6.fr>

Initialize return variable before exiting on an error path.

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
 drivers/mtd/ubi/build.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 7b6b5f9..afe9075 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1159,8 +1159,10 @@ static int __init ubi_init(void)
 	ubi_wl_entry_slab = kmem_cache_create("ubi_wl_entry_slab",
 					      sizeof(struct ubi_wl_entry),
 					      0, 0, NULL);
-	if (!ubi_wl_entry_slab)
+	if (!ubi_wl_entry_slab) {
+		err = -ENOMEM;
 		goto out_dev_unreg;
+	}
 
 	err = ubi_debugfs_init();
 	if (err)
