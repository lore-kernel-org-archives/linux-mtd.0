Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02BBC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Mar 2022 16:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9gUpnCiwS+QJjdYppUZKnzquR6N8yjtaA97PgDges4c=; b=CjHRRqosY2dJ8R
	T81t5gMGCJaLbQZ70PEzkcJMYRLQKrGyVC5c3f+qjiDp6eFeQGzsFKf/qr+ozgGddjBbSOsFT1qUr
	UndrU5ieKShDRLpkCvgizywJpNqxhpG9kZEpYA8FeFbOxeV4WU2QZU/zMfkFzVNJxk5qG70NZNuQQ
	7hBvaSqnV68++WbtRtT81MKObjPAU3Q3MC2lnZMwc7BTRxw2MQY5qQWtP4+yI4iAfWWr0aJguiji8
	4a0MSiHTFj9Nq4eXZFJKxRnHf+QZBcnuCSy4rXtKi+fLP9mN5E3paT+0sexKhET+Rgmc8Wu9sj8pA
	C++DUT4RiLr7muY42Eug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUAU0-009wgD-7a; Tue, 15 Mar 2022 16:57:16 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUATo-009wdy-4s
 for linux-mtd@lists.infradead.org; Tue, 15 Mar 2022 16:57:05 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 kx6-20020a17090b228600b001bf859159bfso2839575pjb.1
 for <linux-mtd@lists.infradead.org>; Tue, 15 Mar 2022 09:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TDWHrnaDq7KtP2rFgicG6TgTdTVVFBWUxb9I0veChgc=;
 b=Wfb7zncwwRiU6sFtFSAnLpXk9nB9OFOidJ7IiaVQhM+ksz45bhT1QPYBrEJHwypKoq
 k4akaX6jloAwWH+ob9jZ/ykho34NQRj9rlfkfD0W9vgejTlB/Gk6axKmhhvvpaX0qicI
 XmkiIFKF35/TkOcvNC/98ybaKB9s4zVyJl4ncJAxH01xz3PA5n/nd24ACYHvw/hqTUFX
 4WimNGWrSyV8sxUfaZVlSCKP+RvA1ym0D1cDFf4jFGQ6l6PTwfXreEUByJAQvcaj+T3A
 61gXpBpUrVmS6QKl2500fSM1WFl/nsLXlK1xXBtRssW2PbONBhQT327oxtLPUSVhkqR0
 k6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TDWHrnaDq7KtP2rFgicG6TgTdTVVFBWUxb9I0veChgc=;
 b=qETWesnhtmI99wUp5AePr1YVfI80ui54QULB6QZ8DkKX9zOapW/+JEYfeXiVn3SsIa
 VzfYG/9WXfbIaIqd4+QROt1wrikrMAcB/3sEbBxR/5oGPIw3ZdGYfCzDh7YcJqoe50C4
 m8X4/EZ6SyDeq4brfaKT142oTvFtP7nYIrX+EEakmIhhoupWWHnU9hbsuupGsPOQDAC+
 MUsRZDZ+Wk8b+k8er+v8U3ssJUhVQyw1qq3bvQRlxbYKPX7TsPyUYQRnMExfMXhA2xxi
 0lG1XuoygEMVTvvImGJVIsLf/JNfN/fAe9ZrW+2DA8pWFC9RCSnRisA0tdydeGDllHIk
 9prw==
X-Gm-Message-State: AOAM5326YKaXrc4Odd0cRQjp2+ll8xfA/DQ0/jYyvHIgDMq22Eiugacm
 891rGW1uVssLIBTesDKchUE=
X-Google-Smtp-Source: ABdhPJyjftJX0WKU1PAFWsl8XRBmV4uxTdkhswKto0MH0ajt+baHYwrDPpHqX2hjHlng345AFFZI2g==
X-Received: by 2002:a17:90a:4289:b0:1bc:275b:8986 with SMTP id
 p9-20020a17090a428900b001bc275b8986mr5539896pjg.153.1647363422905; 
 Tue, 15 Mar 2022 09:57:02 -0700 (PDT)
Received: from tokunori-desktop.flets-east.jp
 ([240b:10:2720:5500:3e36:8008:b94b:774d])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a056a00140a00b004c55d0dcbd1sm24835809pfu.120.2022.03.15.09.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 09:57:02 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org, Tokunori Ikegami <ikegami.t@gmail.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v3 2/3] mtd: cfi_cmdset_0002: Move and rename
 chip_check/chip_ready/chip_good_for_write
Date: Wed, 16 Mar 2022 01:56:06 +0900
Message-Id: <20220315165607.390070-3-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220315165607.390070-1-ikegami.t@gmail.com>
References: <20220315165607.390070-1-ikegami.t@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_095704_227832_3C64A3CE 
X-CRM114-Status: GOOD (  19.23  )
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

This is a preparation patch for the functinal change to fix the issue.

Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 82 +++++++++++++----------------
 1 file changed, 38 insertions(+), 44 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 0125658a1d30..8f3f0309dc03 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -802,22 +802,12 @@ static struct mtd_info *cfi_amdstd_setup(struct mtd_info *mtd)
 	return NULL;
 }
 
-/*
- * Return true if the chip is ready.
- *
- * Ready is one of: read mode, query mode, erase-suspend-read mode (in any
- * non-suspended sector) and is indicated by no toggle bits toggling.
- *
- * Note that anything more complicated than checking if no bits are toggling
- * (including checking DQ5 for an error status) is tricky to get working
- * correctly and is therefore not done	(particularly with interleaved chips
- * as each chip must be checked independently of the others).
- */
-static int __xipram chip_ready(struct map_info *map, struct flchip *chip,
-			       unsigned long addr)
+static int __xipram chip_check(struct map_info *map, struct flchip *chip,
+			       unsigned long addr, map_word *expected)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	map_word d, t;
+	map_word oldd, curd;
+	int ret;
 
 	if (cfi_use_status_reg(cfi)) {
 		map_word ready = CMD(CFI_SR_DRB);
@@ -827,17 +817,35 @@ static int __xipram chip_ready(struct map_info *map, struct flchip *chip,
 		 */
 		cfi_send_gen_cmd(0x70, cfi->addr_unlock1, chip->start, map, cfi,
 				 cfi->device_type, NULL);
-		d = map_read(map, addr);
+		curd = map_read(map, addr);
 
-		return map_word_andequal(map, d, ready, ready);
+		return map_word_andequal(map, curd, ready, ready);
 	}
 
-	d = map_read(map, addr);
-	t = map_read(map, addr);
+	oldd = map_read(map, addr);
+	curd = map_read(map, addr);
+
+	ret = map_word_equal(map, oldd, curd);
 
-	return map_word_equal(map, d, t);
+	if (!ret || !expected)
+		return ret;
+
+	return map_word_equal(map, curd, *expected);
 }
 
+/*
+ * Return true if the chip is ready.
+ *
+ * Ready is one of: read mode, query mode, erase-suspend-read mode (in any
+ * non-suspended sector) and is indicated by no toggle bits toggling.
+ *
+ * Note that anything more complicated than checking if no bits are toggling
+ * (including checking DQ5 for an error status) is tricky to get working
+ * correctly and is therefore not done	(particularly with interleaved chips
+ * as each chip must be checked independently of the others).
+ */
+#define chip_ready(map, chip, addr) chip_check(map, chip, addr, NULL)
+
 /*
  * Return true if the chip is ready and has the correct value.
  *
@@ -856,28 +864,14 @@ static int __xipram chip_ready(struct map_info *map, struct flchip *chip,
 static int __xipram chip_good(struct map_info *map, struct flchip *chip,
 			      unsigned long addr, map_word expected)
 {
-	struct cfi_private *cfi = map->fldrv_priv;
-	map_word oldd, curd;
-
-	if (cfi_use_status_reg(cfi)) {
-		map_word ready = CMD(CFI_SR_DRB);
-
-		/*
-		 * For chips that support status register, check device
-		 * ready bit
-		 */
-		cfi_send_gen_cmd(0x70, cfi->addr_unlock1, chip->start, map, cfi,
-				 cfi->device_type, NULL);
-		curd = map_read(map, addr);
-
-		return map_word_andequal(map, curd, ready, ready);
-	}
-
-	oldd = map_read(map, addr);
-	curd = map_read(map, addr);
+	return chip_check(map, chip, addr, &expected);
+}
 
-	return	map_word_equal(map, oldd, curd) &&
-		map_word_equal(map, curd, expected);
+static int __xipram chip_good_for_write(struct map_info *map,
+					struct flchip *chip, unsigned long addr,
+					map_word expected)
+{
+	return chip_good(map, chip, addr, expected);
 }
 
 static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr, int mode)
@@ -1700,7 +1694,7 @@ static int __xipram do_write_oneword_once(struct map_info *map,
 		 * "chip_good" to avoid the failure due to scheduling.
 		 */
 		if (time_after(jiffies, timeo) &&
-		    !chip_good(map, chip, adr, datum)) {
+		    !chip_good_for_write(map, chip, adr, datum)) {
 			xip_enable(map, chip, adr);
 			printk(KERN_WARNING "MTD %s(): software timeout\n", __func__);
 			xip_disable(map, chip, adr);
@@ -1708,7 +1702,7 @@ static int __xipram do_write_oneword_once(struct map_info *map,
 			break;
 		}
 
-		if (chip_good(map, chip, adr, datum)) {
+		if (chip_good_for_write(map, chip, adr, datum)) {
 			if (cfi_check_err_status(map, chip, adr))
 				ret = -EIO;
 			break;
@@ -1980,14 +1974,14 @@ static int __xipram do_write_buffer_wait(struct map_info *map,
 		 * "chip_good" to avoid the failure due to scheduling.
 		 */
 		if (time_after(jiffies, timeo) &&
-		    !chip_good(map, chip, adr, datum)) {
+		    !chip_good_for_write(map, chip, adr, datum)) {
 			pr_err("MTD %s(): software timeout, address:0x%.8lx.\n",
 			       __func__, adr);
 			ret = -EIO;
 			break;
 		}
 
-		if (chip_good(map, chip, adr, datum)) {
+		if (chip_good_for_write(map, chip, adr, datum)) {
 			if (cfi_check_err_status(map, chip, adr))
 				ret = -EIO;
 			break;
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
