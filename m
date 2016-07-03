Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bJhc6-0005Em-KU
 for linux-mtd@lists.infradead.org; Sun, 03 Jul 2016 13:39:11 +0000
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
From: Richard Weinberger <richard@nod.at>
Subject: Race-free NAND device removal
Message-ID: <57791562.2020703@nod.at>
Date: Sun, 3 Jul 2016 15:38:42 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

While working on nandsim I realized that nand_release() ignores the return
value from mtd_device_unregister().

That means NAND devices cannot removed in a race-free manner.
Consider a NAND driver that registers ->_get_device() and ->_put_device()
callbacks for refcounting. In its removal function it will return -EBUSY
whenever the refcount is > 0.
But when device is claimed while removing it, it can happen that the refcount
increments after the check.
MTD can deal with that and mtd_device_unregister() will return EBUSY.
But nand_release() won't notice and the NAND driver continues with the tear down
process.

Would be a change like the following one acceptable or is a NAND driver
allowed to call mtd_device_unregister() itself?
AFAICT the additional call to mtd_device_unregister() in nand_release() would
be an nop then.

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 0b0dc29..dc76bc6 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4604,16 +4604,19 @@ EXPORT_SYMBOL(nand_scan);
  * nand_release - [NAND Interface] Free resources held by the NAND device
  * @mtd: MTD device structure
  */
-void nand_release(struct mtd_info *mtd)
+int nand_release(struct mtd_info *mtd)
 {
+	int ret;
 	struct nand_chip *chip = mtd_to_nand(mtd);

+	ret = mtd_device_unregister(mtd);
+	if (ret)
+		return ret;
+
 	if (chip->ecc.mode == NAND_ECC_SOFT &&
 	    chip->ecc.algo == NAND_ECC_BCH)
 		nand_bch_free((struct nand_bch_control *)chip->ecc.priv);

-	mtd_device_unregister(mtd);
-
 	/* Free bad block table memory */
 	kfree(chip->bbt);
 	if (!(chip->options & NAND_OWN_BUFFERS))
@@ -4623,6 +4626,8 @@ void nand_release(struct mtd_info *mtd)
 	if (chip->badblock_pattern && chip->badblock_pattern->options
 			& NAND_BBT_DYNAMICSTRUCT)
 		kfree(chip->badblock_pattern);
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(nand_release);

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index fbe8e16..c15b1c4 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -39,7 +39,7 @@ extern int nand_scan_ident(struct mtd_info *mtd, int max_chips,
 extern int nand_scan_tail(struct mtd_info *mtd);

 /* Free resources held by the NAND device */
-extern void nand_release(struct mtd_info *mtd);
+extern int nand_release(struct mtd_info *mtd);

 /* Internal helper for board drivers which need to override command function */
 extern void nand_wait_ready(struct mtd_info *mtd);

Thanks,
//richard
