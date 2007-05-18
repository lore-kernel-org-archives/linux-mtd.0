Received: from [67.18.166.194] (helo=warp.phpwebhosting.com)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hp1Mr-0002IQ-5u
	for linux-mtd@lists.infradead.org; Fri, 18 May 2007 08:15:38 -0400
Message-ID: <464D98DF.5020004@indefia.com>
Date: Fri, 18 May 2007 15:15:27 +0300
From: Semih Hazar <semih.hazar@indefia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Generic Platform NAND Driver
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

In the new generic platforn NAND driver, line 54;

	data->chip.priv = &data;
	data->mtd.priv = &data->chip;

mtd->priv->priv points to struct plat_nand_data which is defined in the 
plat_nand.c and never used by it.
Can we change it so that this priv points to a host specific data, and 
the helper functions (board specific) can make use of it.
Below is a suggested patch:

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index d2365c8..256957b 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -599,10 +599,12 @@ struct platform_nand_ctrl {
  * struct platform_nand_data - container structure for platform-specific data
  * @chip:		chip level chip structure
  * @ctrl:		controller level device structure
+ * @host:		pointer to host specific data structure
  */
 struct platform_nand_data {
 	struct platform_nand_chip	chip;
 	struct platform_nand_ctrl	ctrl;
+	void				*host;
 };
 
 /* Some helpers to access the data structures */
diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index cd725fc..1e47ad3 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -51,7 +51,7 @@ static int __init plat_nand_probe(struct platform_device *pdev)
 		return -EIO;
 	}
 
-	data->chip.priv = &data;
+	data->chip.priv = pdata->host;
 	data->mtd.priv = &data->chip;

 	data->mtd.owner = THIS_MODULE;
