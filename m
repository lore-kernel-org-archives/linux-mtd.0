Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34729C43217
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Oct 2022 04:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HVj3o62EdbQy/ytax4dzLvXZ8zrHyhog20xylyG52AA=; b=kVJFKKpYZ3v6feht3wxfPjrMvs
	dwPTrzAeXb1r21KNeA3/vYji63NbO0UJqLa0kD8JelSPfwNFLxO4PCef8lqXiUqyLj2B4KUO1DKLs
	GgKT6voKCejgFInYUJg5NnxSNiXEMUu6SOlmthhEGL+2N4TBnMHsJsoD0x0kEZYTs2kdZyEik0SaQ
	R3vZgcyGcXePIR8ojdZMB8CksRF9yYsmLv9xOn71uBGGZxMghVzBWNegrBs889rb1OzkGHOSYL4S6
	nsCV8EbySBvUIVhW1KSmGBbyNj1IA/UlvuMc4C77VlFTkeKxwqU3/wO7S8O7b2E0NqhXhFxtOuaPh
	3oOxdHXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohkpd-00H1kL-JG; Mon, 10 Oct 2022 04:56:01 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohkpa-00H1iX-Dr
	for linux-mtd@lists.infradead.org; Mon, 10 Oct 2022 04:56:00 +0000
Received: by mail-pg1-x549.google.com with SMTP id h2-20020a656382000000b0044b0f6c572fso5920165pgv.20
        for <linux-mtd@lists.infradead.org>; Sun, 09 Oct 2022 21:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lzwp40a62FGAnOoiZ5XoBxodmWLF61UQZ56kTVbia9E=;
        b=LhRHZodajX8y2Sx8JbDwzXp3+viYlr2Er7Erk6vEclxdP6hgm4I3icQMRRdPFOo+CB
         O0mMsk826UWFYYGzXvZJ/OsclscQh30gMMBJqvFMQU5R9V3F2LVm0mdZShlth43ecCFo
         lt956zbsUz6IRYYbWDMeBrW9MH4HBGdsJ5bzb75spGv/5sLdpyYpkJCPRXGEf+EhxAtt
         Z/rmURuLb0hO7I2gGSVTt/i/OMRN14hpYqOLG/reKOut2S8BX9zStwuT/stXtK4Deh+9
         mHBIK2JKNf2lFGSX0C6XX/mHWl6WqmrUrbu/bQUlDjLB8MAAmQo0Xb5LdU6fSWi93MH3
         KWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lzwp40a62FGAnOoiZ5XoBxodmWLF61UQZ56kTVbia9E=;
        b=Opu/sXYm0BMRlQC5NkJ3JWQ+L9z1aHUl9hA9V02z+49GyFXF74mlK2Dvw85m2s3FfJ
         Hm/9KqccFggO7b48UadwkzGm5LvyWyYbMabzte/HrADTjQpr5ts/TAbh71nuwhLq5b5J
         dtvv42P8VSTxLymtF8uX3KbnoccesSFEgwtcXJ9boY20YyNuSE5lKNWjfEBT4GJyP4F+
         ScKvbEd6DYgfZhYLj4dh1dIuvbVS9iIA0L3r7IHKqW2iOdHQDiWQ7ACHeJteL5ngQa4u
         mjpY/gi19+7QopTMjTPoPYIa4ecHapur5QJa0uQjQSv18Aqu0CFqsL/6Sck1vf3Snz3c
         GSCQ==
X-Gm-Message-State: ACrzQf23/vd4owg2W8GHNI831ApcrrZlVePpfsS12Y5V/TXLHNoY6c74
	H3ebDOVlWuV9IcOBgHZL1C9KHICi4Umk
X-Google-Smtp-Source: AMsMyM6o8NER8Y3yaSbuhO2Np81zL46aICeiXFpwpKFZMksSRanKZiO1CdsUg0xkJCwFCFo3Pr7noLl9qEoS
X-Received: from sgzhang.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3d89])
 (user=sgzhang job=sendgmr) by 2002:aa7:9250:0:b0:563:723f:7914 with SMTP id
 16-20020aa79250000000b00563723f7914mr1753359pfp.12.1665377756870; Sun, 09 Oct
 2022 21:55:56 -0700 (PDT)
Date: Mon, 10 Oct 2022 04:55:47 +0000
In-Reply-To: <20221010045549.2221965-1-sgzhang@google.com>
Mime-Version: 1.0
References: <20221010045549.2221965-1-sgzhang@google.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20221010045549.2221965-2-sgzhang@google.com>
Subject: [PATCH v4 1/3] mtd: mtdoops: change printk() to counterpart pr_ functions
From: Ray Zhang <sgzhang@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ray Zhang <sgzhang@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_215558_488503_8C9E090A 
X-CRM114-Status: GOOD (  15.49  )
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
 drivers/mtd/mtdoops.c | 52 ++++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 3d4a2ffb5b01..6b70331da3b6 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -7,6 +7,8 @@
  * Author: Richard Purdie <rpurdie@openedhand.com>
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/console.h>
@@ -93,9 +95,9 @@ static int mtdoops_erase_block(struct mtdoops_context *cxt, int offset)
 
 	ret = mtd_erase(mtd, &erase);
 	if (ret) {
-		printk(KERN_WARNING "mtdoops: erase of region [0x%llx, 0x%llx] on \"%s\" failed\n",
-		       (unsigned long long)erase.addr,
-		       (unsigned long long)erase.len, mtddev);
+		pr_warn("erase of region [0x%llx, 0x%llx] on \"%s\" failed\n",
+			(unsigned long long)erase.addr,
+			(unsigned long long)erase.len, mtddev);
 		return ret;
 	}
 
@@ -120,8 +122,8 @@ static void mtdoops_inc_counter(struct mtdoops_context *cxt)
 		return;
 	}
 
-	printk(KERN_DEBUG "mtdoops: ready %d, %d (no erase)\n",
-	       cxt->nextpage, cxt->nextcount);
+	pr_debug("ready %d, %d (no erase)\n",
+		 cxt->nextpage, cxt->nextcount);
 }
 
 /* Scheduled work - when we can't proceed without erasing a block */
@@ -145,20 +147,20 @@ static void mtdoops_workfunc_erase(struct work_struct *work)
 
 	while ((ret = mtd_block_isbad(mtd, cxt->nextpage * record_size)) > 0) {
 badblock:
-		printk(KERN_WARNING "mtdoops: bad block at %08lx\n",
-		       cxt->nextpage * record_size);
+		pr_warn("bad block at %08lx\n",
+			cxt->nextpage * record_size);
 		i++;
 		cxt->nextpage = cxt->nextpage + (mtd->erasesize / record_size);
 		if (cxt->nextpage >= cxt->oops_pages)
 			cxt->nextpage = 0;
 		if (i == cxt->oops_pages / (mtd->erasesize / record_size)) {
-			printk(KERN_ERR "mtdoops: all blocks bad!\n");
+			pr_err("all blocks bad!\n");
 			return;
 		}
 	}
 
 	if (ret < 0) {
-		printk(KERN_ERR "mtdoops: mtd_block_isbad failed, aborting\n");
+		pr_err("mtd_block_isbad failed, aborting\n");
 		return;
 	}
 
@@ -166,15 +168,15 @@ static void mtdoops_workfunc_erase(struct work_struct *work)
 		ret = mtdoops_erase_block(cxt, cxt->nextpage * record_size);
 
 	if (ret >= 0) {
-		printk(KERN_DEBUG "mtdoops: ready %d, %d\n",
-		       cxt->nextpage, cxt->nextcount);
+		pr_debug("ready %d, %d\n",
+			 cxt->nextpage, cxt->nextcount);
 		return;
 	}
 
 	if (ret == -EIO) {
 		ret = mtd_block_markbad(mtd, cxt->nextpage * record_size);
 		if (ret < 0 && ret != -EOPNOTSUPP) {
-			printk(KERN_ERR "mtdoops: block_markbad failed, aborting\n");
+			pr_err("block_markbad failed, aborting\n");
 			return;
 		}
 	}
@@ -201,7 +203,7 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 		ret = mtd_panic_write(mtd, cxt->nextpage * record_size,
 				      record_size, &retlen, cxt->oops_buf);
 		if (ret == -EOPNOTSUPP) {
-			printk(KERN_ERR "mtdoops: Cannot write from panic without panic_write\n");
+			pr_err("Cannot write from panic without panic_write\n");
 			goto out;
 		}
 	} else
@@ -209,7 +211,7 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 				record_size, &retlen, cxt->oops_buf);
 
 	if (retlen != record_size || ret < 0)
-		printk(KERN_ERR "mtdoops: write failure at %ld (%td of %ld written), error %d\n",
+		pr_err("write failure at %ld (%td of %ld written), error %d\n",
 		       cxt->nextpage * record_size, retlen, record_size, ret);
 	mark_page_used(cxt, cxt->nextpage);
 	memset(cxt->oops_buf, 0xff, record_size);
@@ -244,7 +246,7 @@ static void find_next_position(struct mtdoops_context *cxt)
 			       &retlen, (u_char *)&hdr);
 		if (retlen != sizeof(hdr) ||
 				(ret < 0 && !mtd_is_bitflip(ret))) {
-			printk(KERN_ERR "mtdoops: read failure at %ld (%zu of %zu read), err %d\n",
+			pr_err("read failure at %ld (%zu of %zu read), err %d\n",
 			       page * record_size, retlen, sizeof(hdr), ret);
 			continue;
 		}
@@ -324,17 +326,17 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 		return;
 
 	if (mtd->size < mtd->erasesize * 2) {
-		printk(KERN_ERR "mtdoops: MTD partition %d not big enough for mtdoops\n",
+		pr_err("MTD partition %d not big enough for mtdoops\n",
 		       mtd->index);
 		return;
 	}
 	if (mtd->erasesize < record_size) {
-		printk(KERN_ERR "mtdoops: eraseblock size of MTD partition %d too small\n",
+		pr_err("eraseblock size of MTD partition %d too small\n",
 		       mtd->index);
 		return;
 	}
 	if (mtd->size > MTDOOPS_MAX_MTD_SIZE) {
-		printk(KERN_ERR "mtdoops: mtd%d is too large (limit is %d MiB)\n",
+		pr_err("mtd%d is too large (limit is %d MiB)\n",
 		       mtd->index, MTDOOPS_MAX_MTD_SIZE / 1024 / 1024);
 		return;
 	}
@@ -345,7 +347,7 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 				   DIV_ROUND_UP(mtdoops_pages,
 						BITS_PER_LONG)));
 	if (!cxt->oops_page_used) {
-		printk(KERN_ERR "mtdoops: could not allocate page array\n");
+		pr_err("could not allocate page array\n");
 		return;
 	}
 
@@ -353,7 +355,7 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 	cxt->dump.dump = mtdoops_do_dump;
 	err = kmsg_dump_register(&cxt->dump);
 	if (err) {
-		printk(KERN_ERR "mtdoops: registering kmsg dumper failed, error %d\n", err);
+		pr_err("registering kmsg dumper failed, error %d\n", err);
 		vfree(cxt->oops_page_used);
 		cxt->oops_page_used = NULL;
 		return;
@@ -362,7 +364,7 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 	cxt->mtd = mtd;
 	cxt->oops_pages = (int)mtd->size / record_size;
 	find_next_position(cxt);
-	printk(KERN_INFO "mtdoops: Attached to MTD device %d\n", mtd->index);
+	pr_info("Attached to MTD device %d\n", mtd->index);
 }
 
 static void mtdoops_notify_remove(struct mtd_info *mtd)
@@ -373,7 +375,7 @@ static void mtdoops_notify_remove(struct mtd_info *mtd)
 		return;
 
 	if (kmsg_dump_unregister(&cxt->dump) < 0)
-		printk(KERN_WARNING "mtdoops: could not unregister kmsg_dumper\n");
+		pr_warn("could not unregister kmsg_dumper\n");
 
 	cxt->mtd = NULL;
 	flush_work(&cxt->work_erase);
@@ -393,15 +395,15 @@ static int __init mtdoops_init(void)
 	char *endp;
 
 	if (strlen(mtddev) == 0) {
-		printk(KERN_ERR "mtdoops: mtd device (mtddev=name/number) must be supplied\n");
+		pr_err("mtd device (mtddev=name/number) must be supplied\n");
 		return -EINVAL;
 	}
 	if ((record_size & 4095) != 0) {
-		printk(KERN_ERR "mtdoops: record_size must be a multiple of 4096\n");
+		pr_err("record_size must be a multiple of 4096\n");
 		return -EINVAL;
 	}
 	if (record_size < 4096) {
-		printk(KERN_ERR "mtdoops: record_size must be over 4096 bytes\n");
+		pr_err("record_size must be over 4096 bytes\n");
 		return -EINVAL;
 	}
 
-- 
2.38.0.rc1.362.ged0d419d3c-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
