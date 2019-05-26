Return-Path: <SRS0=EZ/G=T2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6532C282E3
	for <linux-mtd@archiver.kernel.org>; Sun, 26 May 2019 15:40:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AE3920815
	for <linux-mtd@archiver.kernel.org>; Sun, 26 May 2019 15:40:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ce3EBgPG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBCP+WGW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AE3920815
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iXdiWwJiQZUfiyAc4xTF6ZZAtv8QvwrYZv8Etfo856M=; b=ce3EBgPG1wmUH0CIu9b/029wpj
	BnL70QoOxvMmpLED1PHs8Mb0OJL5CnKPF8ah+KzkS89bbhOyflTgWzJGBHY4CpDA2uqx0vkMewa+u
	W0wN/Y9TWUUg7avzBC2/vEw/MVV3+zODdqXobpSmYJWy+Gw05qDwx7A6RwzuFuWnR3CAILYcGbBJq
	W05rogWJfkS+dAIy25W3t8I3Svl3WKkQBWy0J3RqiHCD49wROhwNhsbIHAwJgGk+vUgzCthHFzxdZ
	2HpQXFJCpqHPAiGCMvzosLO4D+wV7d0+QxLPqXyzTwhmXiwfMjuHioHCSbm5A3uMZW+H1geQQ+Wz6
	vGNIm6AQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUvFp-0000VD-Qs; Sun, 26 May 2019 15:40:09 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUvFB-0007fy-M9
 for linux-mtd@lists.infradead.org; Sun, 26 May 2019 15:39:36 +0000
Received: by mail-pg1-x543.google.com with SMTP id z3so3045537pgp.8
 for <linux-mtd@lists.infradead.org>; Sun, 26 May 2019 08:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=piqaFyLMeP043A4gvuuzaxgMoFvZApjPff8UsrTmECk=;
 b=mBCP+WGW0hmozygYzQTr/UdUMI+GOR8rNbBPlOaUs+wm+kDB2CNo/NCwLBFP7tjwqW
 CLfbbfHFQE+P3CtSEhXPjxdG+NBtIPkCBiWQjTQhQegKvmlrUxkVPGiRrWV0Z2sWx5w6
 LCFYR7+63LCJk4l8m41MFGXzoZUMv5pxu1XWK45w5PkpD5CL/drlIMvFz4gM30f0c/PC
 W/kdRkcX8ulli+RynfGNg3GL9vR25eBYtrO847Hv6L4dJXPcz/5DrDA+rw67WdPrmVdu
 Fa6RTdyYDzTuMJI3c1S0igO0zWfKuLTq59Zo+hjAwmJ2mtbGa9uGCp3lVZxYc0HS7roc
 sK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=piqaFyLMeP043A4gvuuzaxgMoFvZApjPff8UsrTmECk=;
 b=PMY9srIqPws6SE1LN7IbZHt/z8GLVQuqaMGg55qatftCOqZL1Rap1T7I7OQHsmL3eJ
 ygGJ4w+RxK+9n7eBMe1EzZseASKLlVJ8DBXVRAx1VAtTP42liCLlLboUt9QpuUjxlZY4
 o1nCYT+FGy4Y2yAbgAkmc1TxJK+3/5eSGjmAoPPDggDXRGSHEb2HRkmo7IIQb+M5aWc6
 htK4VLXbdXKzgjfaNWxXZpR+HfVdS8pc8MjkqPHuVRM3DySOSTMLN/axmsqYAlcdyxBN
 J/Mxq3m/AWIt7Jj+uszCGsICbLikfedFAwjY0uUlAl2nI9MIDuMroNmtgksmCpCyZwUg
 9TJA==
X-Gm-Message-State: APjAAAWo9B7TpcHaiEwuW6NPHWRh3c58jUUQpPsNNqj7kygL/1XH3OTU
 /8UfTXxMghH3b4FE+EieYWw=
X-Google-Smtp-Source: APXvYqyv2kt0RbJo/Ri6nGxj0BqDk9GeeFYEo/tmOQsIZ/TzKbe8wJbOKRLhK8gtku2LNUbUcUkAoQ==
X-Received: by 2002:a62:62c1:: with SMTP id
 w184mr127679298pfb.95.1558885168674; 
 Sun, 26 May 2019 08:39:28 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id o2sm863129pgm.51.2019.05.26.08.39.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 May 2019 08:39:28 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v6 04/11] mtd: cfi_cmdset_0002: Split do_write_oneword() to
 reduce function size
Date: Mon, 27 May 2019 00:38:57 +0900
Message-Id: <20190526153904.28871-5-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190526153904.28871-1-ikegami.t@gmail.com>
References: <20190526153904.28871-1-ikegami.t@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190526_083930_122987_80C7614C 
X-CRM114-Status: GOOD (  19.09  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Tokunori Ikegami <ikegami.t@gmail.com>, linux-mtd@lists.infradead.org,
 Fabio Bettoni <fbettoni@gmail.com>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Reduce the size of do_write_oneword() by extracting a helper function
for the hardware access.

Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v5:
- Rebased on top of Liu Jian's fixes in master.
- Change the email address of Tokunori Ikegami to ikegami.t@gmail.com.

Changes since v4:
- None.

Changes since v3:
- Drop the unnecessary comment and blank line.
- Change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- Just update the commit message for the comment
- Add Reviewed-by tag.

Changes since v1:
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 89 ++++++++++++++++++++-----------------
 1 file changed, 49 insertions(+), 40 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 2654019ee24b..3cd491c54ff5 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1548,11 +1548,10 @@ static int cfi_amdstd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
 				   do_otp_lock, 1);
 }
 
-static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
-				     unsigned long adr, map_word datum,
-				     int mode)
+static int __xipram do_write_oneword_once(struct map_info *map, struct flchip *chip,
+					  unsigned long adr, map_word datum,
+					  int mode, struct cfi_private *cfi)
 {
-	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long timeo = jiffies + HZ;
 	/*
 	 * We use a 1ms + 1 jiffies generic timeout for writes (most devices
@@ -1565,42 +1564,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	 */
 	unsigned long uWriteTimeout = (HZ / 1000) + 1;
 	int ret = 0;
-	map_word oldd;
-	int retry_cnt = 0;
-
-	adr += chip->start;
-
-	mutex_lock(&chip->mutex);
-	ret = get_chip(map, chip, adr, mode);
-	if (ret) {
-		mutex_unlock(&chip->mutex);
-		return ret;
-	}
 
-	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
-		 __func__, adr, datum.x[0]);
-
-	if (mode == FL_OTP_WRITE)
-		otp_enter(map, chip, adr, map_bankwidth(map));
-
-	/*
-	 * Check for a NOP for the case when the datum to write is already
-	 * present - it saves time and works around buggy chips that corrupt
-	 * data at other locations when 0xff is written to a location that
-	 * already contains 0xff.
-	 */
-	oldd = map_read(map, adr);
-	if (map_word_equal(map, oldd, datum)) {
-		pr_debug("MTD %s(): NOP\n",
-		       __func__);
-		goto op_done;
-	}
-
-	XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));
-	ENABLE_VPP(map);
-	xip_disable(map, chip, adr);
-
- retry:
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
@@ -1647,7 +1611,52 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 		UDELAY(map, chip, adr, 1);
 	}
 
-	/* Did we succeed? */
+	return ret;
+}
+
+static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
+				     unsigned long adr, map_word datum,
+				     int mode)
+{
+	struct cfi_private *cfi = map->fldrv_priv;
+	int ret = 0;
+	map_word oldd;
+	int retry_cnt = 0;
+
+	adr += chip->start;
+
+	mutex_lock(&chip->mutex);
+	ret = get_chip(map, chip, adr, mode);
+	if (ret) {
+		mutex_unlock(&chip->mutex);
+		return ret;
+	}
+
+	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
+		 __func__, adr, datum.x[0]);
+
+	if (mode == FL_OTP_WRITE)
+		otp_enter(map, chip, adr, map_bankwidth(map));
+
+	/*
+	 * Check for a NOP for the case when the datum to write is already
+	 * present - it saves time and works around buggy chips that corrupt
+	 * data at other locations when 0xff is written to a location that
+	 * already contains 0xff.
+	 */
+	oldd = map_read(map, adr);
+	if (map_word_equal(map, oldd, datum)) {
+		pr_debug("MTD %s(): NOP\n",
+		       __func__);
+		goto op_done;
+	}
+
+	XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));
+	ENABLE_VPP(map);
+	xip_disable(map, chip, adr);
+
+ retry:
+	ret = do_write_oneword_once(map, chip, adr, datum, mode, cfi);
 	if (ret) {
 		/* reset on all failures. */
 		map_write(map, CMD(0xF0), chip->start);
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
