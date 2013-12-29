Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VxOXG-0005Oc-0L
 for linux-mtd@lists.infradead.org; Sun, 29 Dec 2013 22:08:38 +0000
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 18/25] mtd: nand: fix error return code
Date: Sun, 29 Dec 2013 23:47:33 +0100
Message-Id: <1388357260-4843-19-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1388357260-4843-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1388357260-4843-1-git-send-email-Julia.Lawall@lip6.fr>
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Julia Lawall <Julia.Lawall@lip6.fr>

Set the return variable to an error code as done elsewhere in the function.

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
Not tested.

 drivers/mtd/nand/fsmc_nand.c    |    3 +++
 drivers/mtd/tests/oobtest.c     |    1 +
 drivers/mtd/tests/pagetest.c    |    1 +
 drivers/mtd/tests/subpagetest.c |    1 +
 4 files changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 8b27522..6f8c4f5 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -1040,12 +1040,15 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 				pdata->read_dma_priv);
 		if (!host->read_dma_chan) {
 			dev_err(&pdev->dev, "Unable to get read dma channel\n");
+			ret = -EBUSY;
 			goto err_req_read_chnl;
 		}
 		host->write_dma_chan = dma_request_channel(mask, filter,
 				pdata->write_dma_priv);
 		if (!host->write_dma_chan) {
 			dev_err(&pdev->dev, "Unable to get write dma channel\n");
+
+			ret = -EBUSY;
 			goto err_req_write_chnl;
 		}
 		nand->read_buf = fsmc_read_buf_dma;
diff --git a/drivers/mtd/tests/oobtest.c b/drivers/mtd/tests/oobtest.c
index 2e9e2d1..26688e9 100644
--- a/drivers/mtd/tests/oobtest.c
+++ b/drivers/mtd/tests/oobtest.c
@@ -291,6 +291,7 @@ static int __init mtd_oobtest_init(void)
 
 	if (!mtd_type_is_nand(mtd)) {
 		pr_info("this test requires NAND flash\n");
+		err = -ENODEV;
 		goto out;
 	}
 
diff --git a/drivers/mtd/tests/pagetest.c b/drivers/mtd/tests/pagetest.c
index ed2d3f6..9a84460 100644
--- a/drivers/mtd/tests/pagetest.c
+++ b/drivers/mtd/tests/pagetest.c
@@ -355,6 +355,7 @@ static int __init mtd_pagetest_init(void)
 
 	if (!mtd_type_is_nand(mtd)) {
 		pr_info("this test requires NAND flash\n");
+		err = -ENODEV;
 		goto out;
 	}
 
diff --git a/drivers/mtd/tests/subpagetest.c b/drivers/mtd/tests/subpagetest.c
index a876371..2baa93d 100644
--- a/drivers/mtd/tests/subpagetest.c
+++ b/drivers/mtd/tests/subpagetest.c
@@ -301,6 +301,7 @@ static int __init mtd_subpagetest_init(void)
 
 	if (!mtd_type_is_nand(mtd)) {
 		pr_info("this test requires NAND flash\n");
+		err = -ENODEV;
 		goto out;
 	}
 
