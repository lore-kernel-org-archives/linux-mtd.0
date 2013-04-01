Received: from userp1040.oracle.com ([156.151.31.81])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UMY9q-0000t6-M9
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2013 06:23:55 +0000
Date: Mon, 1 Apr 2013 09:21:51 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [patch] mtd: denali_dt: harmless case of testing the wrong variable
Message-ID: <20130401062151.GA5197@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
 Rob Herring <rob.herring@calxeda.com>,
 Grant Likely <grant.likely@secretlab.ca>, Bill Pemberton <wfp5p@virginia.edu>,
 linux-mtd@lists.infradead.org, Dinh Nguyen <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is a warning message that can't be printed because we test the
wrong variable.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index 546f8cb..02988b0 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -42,7 +42,7 @@ static void __iomem *request_and_map(struct device *dev,
 	}
 
 	ptr = devm_ioremap_nocache(dev, res->start, resource_size(res));
-	if (!res)
+	if (!ptr)
 		dev_err(dev, "ioremap_nocache of %s failed!", res->name);
 
 	return ptr;
