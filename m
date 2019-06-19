Return-Path: <SRS0=hJJw=US=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7324BC31E5B
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 16:50:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 472C5206E0
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 16:50:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uYnTcbc2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sciS4w3i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 472C5206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2zd3FlSXs8N53c6RdwGhRnsR5mhR/53pwiiEswLqvUg=; b=uYnTcbc2IihDPJiBhLmQgXAmKM
	TBuVJAGP7Z6/krKApLto6TsnyWX2+fDT4R0gXpzQ+Imf7yBFTbhZLeU8LY/S5FdRkJuVMFcPXgHrO
	mNkDk4xv9YvhLQwCpjfl+qSQySw/uOJJuR+uhDpqaRdl2odjNl70eEnSpDujpzgvoGUDfcy84mTFH
	P9V50g8Nt9/9QkUjHmWmDoto7jYlSWvq4vjpa/c9AZFrN+M/p36N/9RjkVJ2zlk8Gtb4Lm+9f9XpO
	roneus3JEMTzS4m9jI4tuv1B87oFdKQBFoiSaC7PUNm5FVsCfCsFGaYGGypWSCjGsbJtWh4Z9irdT
	/PdvNj2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hddnN-0000jM-QP; Wed, 19 Jun 2019 16:50:49 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hddmy-0000Fe-9U
 for linux-mtd@lists.infradead.org; Wed, 19 Jun 2019 16:50:25 +0000
Received: by mail-pg1-x543.google.com with SMTP id s27so6174pgl.2
 for <linux-mtd@lists.infradead.org>; Wed, 19 Jun 2019 09:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ud2Umhj6HLbQ3SE2l2MoomyKIPxvNTNefXosbuAZXL0=;
 b=sciS4w3iecPjZfh1VyoM/xBmV3xVGamSw0aYD5S9LYxrZfhcA0oOoZZmABzLxqTPZV
 u7ikotBs76+y7dTva90FuoEUoFelFNdV3Z5EW9l1SsjKQV599FnqgeiIz2iykpYU+apO
 I9ZkbTkyUl3aH4uJ0n5rKXAwvTMMJCravNwr6NkOus2DFUOXOc2tJYxbKv0lW7Y5/N2d
 rsBnNM+XlIUgt2PBbdUlYuqH4ap4XqWHzzh9UVi2s+SUL8X6jKd+v3lsjEHHqKhFbU72
 yRt3gOQo0Ogy0a3lpDhVi0rI2Rj2gbfIn2mseq3cJhnJ7cJ0nBzRklNRQ57SX2wzCgK0
 9KNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ud2Umhj6HLbQ3SE2l2MoomyKIPxvNTNefXosbuAZXL0=;
 b=V34soHjCGk9hbti8qw70+rIGCYkHyPXAMszM4oA8Q47Jdr4+JvBH9HYamXdA1u6mTU
 9+0itsJEP+X5EQc8frqiqsHSfaHQnhPIJp1GTl51uJb7PU4EjP0xlzFwWMYh9NWU4T34
 Q8gyCXSrH8fwlHCmqKneN84q8FDLyKSf/m2ChiA0mOntrHTTOthAAt8gNDSNhwyQkMT6
 PuJck02KVmMouI/RNRkdpSs5Nd96FTrC7Z2LpRENZ4ObRzmkJK0UWv6U2LuXHQtjxL1+
 leiu3KoAVVISfCza+PRo7TweDE9iZQcrbKMVJA5+SXWH7FNJEz7Pz5vKA2dAyoYPCg8d
 CeNg==
X-Gm-Message-State: APjAAAXfhw9f7SgsXGrd+Xn0AL1jqxXPh14SpGvlmGcq4FOw2gqt/Y0C
 QP6/USqne4dkXZHn0quowKE=
X-Google-Smtp-Source: APXvYqxgdw3O6E1XVnaQm2RND369E6oUQZoYTmyF/OUTCkCg+vjo5KWjhnZ8k/1/1ETK698MkU5Ggg==
X-Received: by 2002:a63:231c:: with SMTP id j28mr8494641pgj.430.1560963023365; 
 Wed, 19 Jun 2019 09:50:23 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id j1sm21344894pfe.101.2019.06.19.09.50.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jun 2019 09:50:23 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v7 3/9] mtd: cfi_cmdset_0002: Split do_write_oneword() to
 reduce function size
Date: Thu, 20 Jun 2019 01:49:55 +0900
Message-Id: <20190619165001.28410-4-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190619165001.28410-1-ikegami.t@gmail.com>
References: <20190619165001.28410-1-ikegami.t@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_095024_331575_8C7C644D 
X-CRM114-Status: GOOD (  19.57  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v6:
- Removed the tag of Koen Vandeputte as same with the v7 1/9 patch.
- Address the ./scripts/checkpatch.pl issues.

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

 drivers/mtd/chips/cfi_cmdset_0002.c | 90 ++++++++++++++++++++-----------------
 1 file changed, 50 insertions(+), 40 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 60d3669ce5cf..08a119489b28 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1548,11 +1548,11 @@ static int cfi_amdstd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
 				   do_otp_lock, 1);
 }
 
-static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
-				     unsigned long adr, map_word datum,
-				     int mode)
+static int __xipram do_write_oneword_once(struct map_info *map,
+					  struct flchip *chip,
+					  unsigned long adr, map_word datum,
+					  int mode, struct cfi_private *cfi)
 {
-	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long timeo = jiffies + HZ;
 	/*
 	 * We use a 1ms + 1 jiffies generic timeout for writes (most devices
@@ -1565,42 +1565,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
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
-
-	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
-		 __func__, adr, datum.x[0]);
-
-	if (mode == FL_OTP_WRITE)
-		otp_enter(map, chip, adr, map_bankwidth(map));
 
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
@@ -1647,7 +1612,52 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
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
+			 __func__);
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
