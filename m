Date: Wed, 25 Feb 2015 16:15:58 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [patch] mtd: cfi: clean up some indenting
Message-ID: <20150225131558.GD19745@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Jingoo Han <jg1.han@samsung.com>, kernel-janitors@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Paul Gortmaker <paul.gortmaker@windriver.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These lines were all indented one tab more than they should be.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index 423666b..9a1a6ff 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -206,23 +206,23 @@ static struct mtd_info *cfi_staa_setup(struct map_info *map)
 			mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].numblocks = ernum;
 		}
 		offset += (ersize * ernum);
-		}
+	}
 
-		if (offset != devsize) {
-			/* Argh */
-			printk(KERN_WARNING "Sum of regions (%lx) != total size of set of interleaved chips (%lx)\n", offset, devsize);
-			kfree(mtd->eraseregions);
-			kfree(cfi->cmdset_priv);
-			kfree(mtd);
-			return NULL;
-		}
+	if (offset != devsize) {
+		/* Argh */
+		printk(KERN_WARNING "Sum of regions (%lx) != total size of set of interleaved chips (%lx)\n", offset, devsize);
+		kfree(mtd->eraseregions);
+		kfree(cfi->cmdset_priv);
+		kfree(mtd);
+		return NULL;
+	}
 
-		for (i=0; i<mtd->numeraseregions;i++){
-			printk(KERN_DEBUG "%d: offset=0x%llx,size=0x%x,blocks=%d\n",
-			       i, (unsigned long long)mtd->eraseregions[i].offset,
-			       mtd->eraseregions[i].erasesize,
-			       mtd->eraseregions[i].numblocks);
-		}
+	for (i=0; i<mtd->numeraseregions;i++){
+		printk(KERN_DEBUG "%d: offset=0x%llx,size=0x%x,blocks=%d\n",
+		       i, (unsigned long long)mtd->eraseregions[i].offset,
+		       mtd->eraseregions[i].erasesize,
+		       mtd->eraseregions[i].numblocks);
+	}
 
 	/* Also select the correct geometry setup too */
 	mtd->_erase = cfi_staa_erase_varsize;
