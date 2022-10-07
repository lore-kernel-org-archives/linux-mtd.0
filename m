Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1ECC4321E
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Oct 2022 21:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=r52jwEU+ECX49zv9k4gBqjEd5KRu6e4uwZI2v0yKix4=; b=2i+CjQe2WJiY8XRaZ1kweMacqx
	RTVl6lzUrr00jTrBkuhEXDvgrzxf6lNyiB4f43VqPhGQAeo1omPDCyWjowZjBOY45hMzktaPqa1ZZ
	aVRVX9VZwjymcFGesxGUKWSxeJ+pncuP+p42xOpJ2LVaO4dGu8zpWCE+0d57h8xkXFCTzXokCN2lg
	NwHqDpxWn0obJ4YRv7WFIuCrJ7hNExlp3jAGaRiO3GESS1RyTjvawCok8yKriLEwBEWLHSywAHprT
	4z4risWj9t2hMdTHcFvbzmsMDS12D/W0Bb/xSvEwE2gurvYvS01IpX3Iq87nbLEvQtzNf0xFDcgMl
	0SpIiusA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogvEw-00AhnQ-VC; Fri, 07 Oct 2022 21:50:43 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogvEs-00Ahm5-Lb
	for linux-mtd@lists.infradead.org; Fri, 07 Oct 2022 21:50:40 +0000
Received: by mail-pl1-x64a.google.com with SMTP id n10-20020a170902e54a00b001782663dcaeso4031237plf.18
        for <linux-mtd@lists.infradead.org>; Fri, 07 Oct 2022 14:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OkpszfP4h2/7GyFHKskjCX9AFVi8V6vMmb1v72zzmVg=;
        b=CM4MeXq8fYCIih2RJLdSc8UB4zjJqbwq79tXYZ1wiKA2kQMnKAo/8o57y9Y4RuYRH6
         6bEvagqc3LxGP1kPmPX3O5ZN3t9wLJiqiHttHiEynozwUk6JYm7zgIwKNrQL4qj0IrEp
         /zLpRxIv99TB4QgkY9eOAd9CGJ5Z4V0FT/LUfgVCISwsO3UUisYk+NIaOUpxKvcrnBm7
         FJ2K9E3srDAeJ3z/D2gsA9cX50Pz7YHo0Qt6ORzGQw9fdwSzXJKbpc40WbGo+9+nrfzz
         iU4spaQTqDJpnc6JtDtzXrf11B3ZcuQD6O3y6G/e+lnbgouvFxUVF1EOp8GIPcyDA3EH
         wp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OkpszfP4h2/7GyFHKskjCX9AFVi8V6vMmb1v72zzmVg=;
        b=g/RiAhbnVvdCir6K6Y2EPWkVLS/km0iyKMZWaMV4rpu5URzkB6l3vwpsqpB4YrpglE
         vMi24PjqN3uwdMJ46Gs46FeFo5cnyqWsJFk8ejqfSVEG2ihKC2ZezXS5AagdiN8nPU87
         IgrkAhrnUmtiSb1ddSjxYtKuOLFiPtJF48G3tRIFFtQ+rKD16+t9Yus+EAt51GBIkZEs
         jcnsw+H2JiuyQT+FfIb1Gb7MOfaJ7EUwwzYYaQegrjS5QOJy1vI53GBoC1JA+EHapKRD
         F3WJtM0ujAXhQGGeoIyn6y9ZBV3qoFiLppkoYbCcpaT3OV7XgzMwZGHMg+WKzh06/uYh
         vozw==
X-Gm-Message-State: ACrzQf1I4XJYCGGn1r0tFb2wSWuTcVm3XDZIEhoe3q/nxPYhWN4pDMLo
	owb3vL6KBWdsG4ZO6UGthLQPc8sjP8qB
X-Google-Smtp-Source: AMsMyM5Oi3sZ7TgLvU2Wlq5+qg8oIYkpKXnJdzrirPgwmv8mFRx4EV2O/+YhS7CCS6Y8IsU1JUmtH00+HnBN
X-Received: from sgzhang.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3d89])
 (user=sgzhang job=sendgmr) by 2002:a17:90a:cd06:b0:203:ae0e:6a21 with SMTP id
 d6-20020a17090acd0600b00203ae0e6a21mr890414pju.0.1665179435196; Fri, 07 Oct
 2022 14:50:35 -0700 (PDT)
Date: Fri,  7 Oct 2022 21:50:25 +0000
In-Reply-To: <20221007215027.918507-1-sgzhang@google.com>
Mime-Version: 1.0
References: <20221007215027.918507-1-sgzhang@google.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20221007215027.918507-2-sgzhang@google.com>
Subject: [PATCH v3 1/3] mtd: mtdoops: change printk() to counterpart pr_ functions
From: Ray Zhang <sgzhang@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ray Zhang <sgzhang@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_145038_728435_60D004CF 
X-CRM114-Status: GOOD (  14.36  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

To comply with latest kernel code requirement, change printk() to
counterpart pr_ functions in mtdoops driver:
- change printk(INFO) to pr_info()
- change printk(DEBUG) to pr_debug()
- change printk(WARNING) to pr_warn()
- change printk(ERR) to pr_err()

Note that only if dynamic debugging is enabled or DEBUG is defined,
printk(KERN_DEBUG) and pr_debug() are equivalent; Otherwise pr_debug()
is no-op, causing different behavior.

Signed-off-by: Ray Zhang <sgzhang@google.com>
---
 drivers/mtd/mtdoops.c | 50 +++++++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 3d4a2ffb5b01..84b21be347f6 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -93,9 +93,9 @@ static int mtdoops_erase_block(struct mtdoops_context *cxt, int offset)
 
 	ret = mtd_erase(mtd, &erase);
 	if (ret) {
-		printk(KERN_WARNING "mtdoops: erase of region [0x%llx, 0x%llx] on \"%s\" failed\n",
-		       (unsigned long long)erase.addr,
-		       (unsigned long long)erase.len, mtddev);
+		pr_warn("mtdoops: erase of region [0x%llx, 0x%llx] on \"%s\" failed\n",
+			(unsigned long long)erase.addr,
+			(unsigned long long)erase.len, mtddev);
 		return ret;
 	}
 
@@ -120,8 +120,8 @@ static void mtdoops_inc_counter(struct mtdoops_context *cxt)
 		return;
 	}
 
-	printk(KERN_DEBUG "mtdoops: ready %d, %d (no erase)\n",
-	       cxt->nextpage, cxt->nextcount);
+	pr_debug("mtdoops: ready %d, %d (no erase)\n",
+		 cxt->nextpage, cxt->nextcount);
 }
 
 /* Scheduled work - when we can't proceed without erasing a block */
@@ -145,20 +145,20 @@ static void mtdoops_workfunc_erase(struct work_struct *work)
 
 	while ((ret = mtd_block_isbad(mtd, cxt->nextpage * record_size)) > 0) {
 badblock:
-		printk(KERN_WARNING "mtdoops: bad block at %08lx\n",
-		       cxt->nextpage * record_size);
+		pr_warn("mtdoops: bad block at %08lx\n",
+			cxt->nextpage * record_size);
 		i++;
 		cxt->nextpage = cxt->nextpage + (mtd->erasesize / record_size);
 		if (cxt->nextpage >= cxt->oops_pages)
 			cxt->nextpage = 0;
 		if (i == cxt->oops_pages / (mtd->erasesize / record_size)) {
-			printk(KERN_ERR "mtdoops: all blocks bad!\n");
+			pr_err("mtdoops: all blocks bad!\n");
 			return;
 		}
 	}
 
 	if (ret < 0) {
-		printk(KERN_ERR "mtdoops: mtd_block_isbad failed, aborting\n");
+		pr_err("mtdoops: mtd_block_isbad failed, aborting\n");
 		return;
 	}
 
@@ -166,15 +166,15 @@ static void mtdoops_workfunc_erase(struct work_struct *work)
 		ret = mtdoops_erase_block(cxt, cxt->nextpage * record_size);
 
 	if (ret >= 0) {
-		printk(KERN_DEBUG "mtdoops: ready %d, %d\n",
-		       cxt->nextpage, cxt->nextcount);
+		pr_debug("mtdoops: ready %d, %d\n",
+			 cxt->nextpage, cxt->nextcount);
 		return;
 	}
 
 	if (ret == -EIO) {
 		ret = mtd_block_markbad(mtd, cxt->nextpage * record_size);
 		if (ret < 0 && ret != -EOPNOTSUPP) {
-			printk(KERN_ERR "mtdoops: block_markbad failed, aborting\n");
+			pr_err("mtdoops: block_markbad failed, aborting\n");
 			return;
 		}
 	}
@@ -201,7 +201,7 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 		ret = mtd_panic_write(mtd, cxt->nextpage * record_size,
 				      record_size, &retlen, cxt->oops_buf);
 		if (ret == -EOPNOTSUPP) {
-			printk(KERN_ERR "mtdoops: Cannot write from panic without panic_write\n");
+			pr_err("mtdoops: Cannot write from panic without panic_write\n");
 			goto out;
 		}
 	} else
@@ -209,7 +209,7 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 				record_size, &retlen, cxt->oops_buf);
 
 	if (retlen != record_size || ret < 0)
-		printk(KERN_ERR "mtdoops: write failure at %ld (%td of %ld written), error %d\n",
+		pr_err("mtdoops: write failure at %ld (%td of %ld written), error %d\n",
 		       cxt->nextpage * record_size, retlen, record_size, ret);
 	mark_page_used(cxt, cxt->nextpage);
 	memset(cxt->oops_buf, 0xff, record_size);
@@ -244,7 +244,7 @@ static void find_next_position(struct mtdoops_context *cxt)
 			       &retlen, (u_char *)&hdr);
 		if (retlen != sizeof(hdr) ||
 				(ret < 0 && !mtd_is_bitflip(ret))) {
-			printk(KERN_ERR "mtdoops: read failure at %ld (%zu of %zu read), err %d\n",
+			pr_err("mtdoops: read failure at %ld (%zu of %zu read), err %d\n",
 			       page * record_size, retlen, sizeof(hdr), ret);
 			continue;
 		}
@@ -324,17 +324,17 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 		return;
 
 	if (mtd->size < mtd->erasesize * 2) {
-		printk(KERN_ERR "mtdoops: MTD partition %d not big enough for mtdoops\n",
+		pr_err("mtdoops: MTD partition %d not big enough for mtdoops\n",
 		       mtd->index);
 		return;
 	}
 	if (mtd->erasesize < record_size) {
-		printk(KERN_ERR "mtdoops: eraseblock size of MTD partition %d too small\n",
+		pr_err("mtdoops: eraseblock size of MTD partition %d too small\n",
 		       mtd->index);
 		return;
 	}
 	if (mtd->size > MTDOOPS_MAX_MTD_SIZE) {
-		printk(KERN_ERR "mtdoops: mtd%d is too large (limit is %d MiB)\n",
+		pr_err("mtdoops: mtd%d is too large (limit is %d MiB)\n",
 		       mtd->index, MTDOOPS_MAX_MTD_SIZE / 1024 / 1024);
 		return;
 	}
@@ -345,7 +345,7 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 				   DIV_ROUND_UP(mtdoops_pages,
 						BITS_PER_LONG)));
 	if (!cxt->oops_page_used) {
-		printk(KERN_ERR "mtdoops: could not allocate page array\n");
+		pr_err("mtdoops: could not allocate page array\n");
 		return;
 	}
 
@@ -353,7 +353,7 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 	cxt->dump.dump = mtdoops_do_dump;
 	err = kmsg_dump_register(&cxt->dump);
 	if (err) {
-		printk(KERN_ERR "mtdoops: registering kmsg dumper failed, error %d\n", err);
+		pr_err("mtdoops: registering kmsg dumper failed, error %d\n", err);
 		vfree(cxt->oops_page_used);
 		cxt->oops_page_used = NULL;
 		return;
@@ -362,7 +362,7 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 	cxt->mtd = mtd;
 	cxt->oops_pages = (int)mtd->size / record_size;
 	find_next_position(cxt);
-	printk(KERN_INFO "mtdoops: Attached to MTD device %d\n", mtd->index);
+	pr_info("mtdoops: Attached to MTD device %d\n", mtd->index);
 }
 
 static void mtdoops_notify_remove(struct mtd_info *mtd)
@@ -373,7 +373,7 @@ static void mtdoops_notify_remove(struct mtd_info *mtd)
 		return;
 
 	if (kmsg_dump_unregister(&cxt->dump) < 0)
-		printk(KERN_WARNING "mtdoops: could not unregister kmsg_dumper\n");
+		pr_warn("mtdoops: could not unregister kmsg_dumper\n");
 
 	cxt->mtd = NULL;
 	flush_work(&cxt->work_erase);
@@ -393,15 +393,15 @@ static int __init mtdoops_init(void)
 	char *endp;
 
 	if (strlen(mtddev) == 0) {
-		printk(KERN_ERR "mtdoops: mtd device (mtddev=name/number) must be supplied\n");
+		pr_err("mtdoops: mtd device (mtddev=name/number) must be supplied\n");
 		return -EINVAL;
 	}
 	if ((record_size & 4095) != 0) {
-		printk(KERN_ERR "mtdoops: record_size must be a multiple of 4096\n");
+		pr_err("mtdoops: record_size must be a multiple of 4096\n");
 		return -EINVAL;
 	}
 	if (record_size < 4096) {
-		printk(KERN_ERR "mtdoops: record_size must be over 4096 bytes\n");
+		pr_err("mtdoops: record_size must be over 4096 bytes\n");
 		return -EINVAL;
 	}
 
-- 
2.38.0.rc1.362.ged0d419d3c-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
