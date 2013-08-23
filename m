Received: from aserp1040.oracle.com ([141.146.126.69])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VCoCl-00072p-59
 for linux-mtd@lists.infradead.org; Fri, 23 Aug 2013 10:02:56 +0000
Date: Fri, 23 Aug 2013 13:02:06 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: mtd: ndfc: silence an underflow static checker warning
Message-ID: <20130823100206.GS31293@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: devicetree@vger.kernel.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 kernel-janitors@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>,
 Bill Pemberton <wfp5p@virginia.edu>, linux-mtd@lists.infradead.org,
 Grant Likely <grant.likely@linaro.org>, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"cs" is an index into the ndfc_ctrl[].  There is a sanity check which
does:

	if (cs >= NDFC_MAX_CS) {

It doesn't check for underflows and that upsets my static checker.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index 8e148f1..cd78b81 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -201,8 +201,9 @@ static int ndfc_probe(struct platform_device *ofdev)
 {
 	struct ndfc_controller *ndfc;
 	const __be32 *reg;
+	unsigned int cs;
 	u32 ccr;
-	int err, len, cs;
+	int err, len;
 
 	/* Read the reg property to get the chip select */
 	reg = of_get_property(ofdev->dev.of_node, "reg", &len);
