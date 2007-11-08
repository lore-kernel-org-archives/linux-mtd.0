Received: from wa-out-1112.google.com ([209.85.146.180])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1Ipxza-0007kT-Ox
	for linux-mtd@lists.infradead.org; Wed, 07 Nov 2007 22:23:49 -0500
Received: by wa-out-1112.google.com with SMTP id v33so36062wah
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Nov 2007 19:23:41 -0800 (PST)
Message-ID: <6934efce0711071923q7fecf4a4pac2fed1e8e7db0ee@mail.gmail.com>
Date: Wed, 7 Nov 2007 19:23:41 -0800
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 6/8] MTD: add physical address to point() api -- PCI RAM card
	pmc551
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adding the ability to get a physical address from point() in addition
to virtual address.  This physical address will be required for axfs
and cramfs with XIP.

Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
----
diff --git a/drivers/mtd/devices/pmc551.c b/drivers/mtd/devices/pmc551.c
index 7060a08..67d7fd5 100644
--- a/drivers/mtd/devices/pmc551.c
+++ b/drivers/mtd/devices/pmc551.c
@@ -134,7 +134,8 @@ static int pmc551_erase(struct mtd_info *mtd,
struct erase_info *instr)
 	eoff_lo = end & (priv->asize - 1);
 	soff_lo = instr->addr & (priv->asize - 1);

-	pmc551_point(mtd, instr->addr, instr->len, &retlen, &ptr);
+	pmc551_point(mtd, instr->addr, instr->len, &retlen,
+		     (void **)&ptr, NULL);

 	if (soff_hi == eoff_hi || mtd->size == priv->asize) {
 		/* The whole thing fits within one access, so just one shot
@@ -154,7 +155,8 @@ static int pmc551_erase(struct mtd_info *mtd,
struct erase_info *instr)
 			}
 			soff_hi += priv->asize;
 			pmc551_point(mtd, (priv->base_map0 | soff_hi),
-				     priv->asize, &retlen, &ptr);
+				     priv->asize, &retlen,
+				     (void **)&ptr, NULL);
 		}
 		memset(ptr, 0xff, eoff_lo);
 	}
@@ -170,7 +172,7 @@ static int pmc551_erase(struct mtd_info *mtd,
struct erase_info *instr)
 }

 static int pmc551_point(struct mtd_info *mtd, loff_t from, size_t len,
-			size_t * retlen, u_char ** mtdbuf)
+			size_t * retlen, void **virt, resource_size_t *phys)
 {
 	struct mypriv *priv = mtd->priv;
 	u32 soff_hi;
@@ -188,6 +190,10 @@ static int pmc551_point(struct mtd_info *mtd,
loff_t from, size_t len,
 		return -EINVAL;
 	}

+	/* can we return a physical address with this driver? */
+	if (phys)
+		return -EINVAL;
+
 	soff_hi = from & ~(priv->asize - 1);
 	soff_lo = from & (priv->asize - 1);

@@ -198,13 +204,12 @@ static int pmc551_point(struct mtd_info *mtd,
loff_t from, size_t len,
 		priv->curr_map0 = soff_hi;
 	}

-	*mtdbuf = priv->start + soff_lo;
+	*virt = priv->start + soff_lo;
 	*retlen = len;
 	return 0;
 }

-static void pmc551_unpoint(struct mtd_info *mtd, u_char * addr, loff_t from,
-			   size_t len)
+static void pmc551_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 {
 #ifdef CONFIG_MTD_PMC551_DEBUG
 	printk(KERN_DEBUG "pmc551_unpoint()\n");
@@ -242,7 +247,7 @@ static int pmc551_read(struct mtd_info *mtd,
loff_t from, size_t len,
 	soff_lo = from & (priv->asize - 1);
 	eoff_lo = end & (priv->asize - 1);

-	pmc551_point(mtd, from, len, retlen, &ptr);
+	pmc551_point(mtd, from, len, retlen, (void **)&ptr, NULL);

 	if (soff_hi == eoff_hi) {
 		/* The whole thing fits within one access, so just one shot
@@ -263,7 +268,8 @@ static int pmc551_read(struct mtd_info *mtd,
loff_t from, size_t len,
 				goto out;
 			}
 			soff_hi += priv->asize;
-			pmc551_point(mtd, soff_hi, priv->asize, retlen, &ptr);
+			pmc551_point(mtd, soff_hi, priv->asize, retlen,
+			 	     (void **)&ptr, NULL);
 		}
 		memcpy(copyto, ptr, eoff_lo);
 		copyto += eoff_lo;
@@ -308,7 +314,7 @@ static int pmc551_write(struct mtd_info *mtd,
loff_t to, size_t len,
 	soff_lo = to & (priv->asize - 1);
 	eoff_lo = end & (priv->asize - 1);

-	pmc551_point(mtd, to, len, retlen, &ptr);
+	pmc551_point(mtd, to, len, retlen, (void **)&ptr, NULL);

 	if (soff_hi == eoff_hi) {
 		/* The whole thing fits within one access, so just one shot
@@ -329,7 +335,8 @@ static int pmc551_write(struct mtd_info *mtd,
loff_t to, size_t len,
 				goto out;
 			}
 			soff_hi += priv->asize;
-			pmc551_point(mtd, soff_hi, priv->asize, retlen, &ptr);
+			pmc551_point(mtd, soff_hi, priv->asize, retlen,
+				     (void **)&ptr, NULL);
 		}
 		memcpy(ptr, copyfrom, eoff_lo);
 		copyfrom += eoff_lo;
@@ -803,7 +810,7 @@ static int __init init_pmc551(void)
 		}

 		/* Keep a reference as the add_mtd_device worked */
-		pci_dev_get(PCI_Device);
+		//pci_dev_get(PCI_Device);

 		printk(KERN_NOTICE "Registered pmc551 memory device.\n");
 		printk(KERN_NOTICE "Mapped %dMiB of memory from 0x%p to 0x%p\n",
diff --git a/include/linux/mtd/pmc551.h b/include/linux/mtd/pmc551.h
index a7f6d20..fd139e9 100644
--- a/include/linux/mtd/pmc551.h
+++ b/include/linux/mtd/pmc551.h
@@ -36,8 +36,9 @@ struct mypriv {
  * Function Prototypes
  */
 static int pmc551_erase(struct mtd_info *, struct erase_info *);
-static void pmc551_unpoint(struct mtd_info *, u_char *, loff_t, size_t);
-static int pmc551_point (struct mtd_info *mtd, loff_t from, size_t
len, size_t *retlen, u_char **mtdbuf);
+static void pmc551_unpoint(struct mtd_info *, loff_t, size_t);
+static int pmc551_point (struct mtd_info *mtd, loff_t from, size_t
len, size_t *retlen, void **virt,
+		resource_size_t *phys);
 static int pmc551_read(struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int pmc551_write(struct mtd_info *, loff_t, size_t, size_t *,
const u_char *);
