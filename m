Date: Thu, 6 Jan 2011 17:05:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sven Neumann <s.neumann@raumfeld.com>
Subject: [patch v2] mtd: pxa3xx_nand: NULL dereference in pxa3xx_nand_probe
Message-ID: <20110106140536.GB1717@bicker>
References: <1294227801.3996.62.camel@sven> <20110106124525.GA1717@bicker>
	<1294321502.2218.5.camel@sven>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1294321502.2218.5.camel@sven>
Cc: Artem.Bityutskiy@nokia.com, eric.y.miao@gmail.com,
	David.Woodhouse@intel.com, leiwen@marvell.com,
	linux-kernel@vger.kernel.org, haojian.zhuang@marvell.com,
	linux-mtd@lists.infradead.org, Daniel Mack <daniel@caiaq.de>,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"info->cmdset" gets dereferenced in __readid() so it needs to be
initialized earlier in the function.  This bug was introduced in 
18c81b1828f8 "mtd: pxa3xx_nand: remove the flash info in driver
structure".

Cc: stable@kernel.org [2.6.37+]
Reported-and-tested-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
v2:  changed the commit text.  added stable@kernel.org and a reported-by tag.

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 17f8518..ea2c288 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -885,6 +885,7 @@ static int pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
 	/* set info fields needed to __readid */
 	info->read_id_bytes = (info->page_size == 2048) ? 4 : 2;
 	info->reg_ndcr = ndcr;
+	info->cmdset = &default_cmdset;
 
 	if (__readid(info, &id))
 		return -ENODEV;
@@ -915,7 +916,6 @@ static int pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
 
 	info->ndtr0cs0 = nand_readl(info, NDTR0CS0);
 	info->ndtr1cs0 = nand_readl(info, NDTR1CS0);
-	info->cmdset = &default_cmdset;
 
 	return 0;
 }
