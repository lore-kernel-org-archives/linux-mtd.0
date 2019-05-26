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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307E3C282E3
	for <linux-mtd@archiver.kernel.org>; Sun, 26 May 2019 15:40:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 042FD20815
	for <linux-mtd@archiver.kernel.org>; Sun, 26 May 2019 15:40:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qBLtASoZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rtMgPBP2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 042FD20815
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lKvEUApN/9GBLZuN3VDcDgrqewaqWMtbrrOX3lON4xI=; b=qBLtASoZyFVGr8d0irYUuRTwxD
	jPJCe0BbO62ZlPOe6MrHBLLjVHM++VvsNg0Xw7cNkKbLZFfLFayGGOwBUx9hjOpSlBdBqbyADOBhg
	gsWoFSiNK2ounTTgYxs2Ycxcaw1wQH5UjxM7hbCGoV/+AN9dnadeifuIeOz3Tos3D7+2V2OHQHLPa
	9BD+9X8OWqny04q7zEJ8XERTbUjv6lCh5ypIyL+YwjMRBr57uUUqbxvjEU0AitltqcDUYKD3HS0x9
	/2UAAM7P87F3ASHEXzB5QsLk+U6aBlzy+xuLRMOfi6WqCwwdn4GWcWLu6em75DAkPBJbD0p1oIUBH
	zPdgvVdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUvG2-0001SG-1n; Sun, 26 May 2019 15:40:22 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUvFD-0007jB-OL
 for linux-mtd@lists.infradead.org; Sun, 26 May 2019 15:39:39 +0000
Received: by mail-pf1-x441.google.com with SMTP id d126so5905702pfd.2
 for <linux-mtd@lists.infradead.org>; Sun, 26 May 2019 08:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Gu2vnmLVCujFI2teWLgAo0YoeC6N2JbwcNQIXS2vH1Q=;
 b=rtMgPBP2dwKmqcK1aEkE/5EWR5yKLmwRb9M5F2oCLjRIlJyb9iOQI7qLSQHtul1xFb
 KFE5anYzBn/MLmMDNTdCymYuNDioMeHa44V3ZhuOeiC9Ixq8f9tbWy6dBiCssVaZYWb7
 US2BvuLZ1q92N1oMN2Vy2dZ/jmHn9jQi7RwNotrsKm2Pz02VdET3eGBECBEjnqBp7rcX
 j305qWTUDQTsYoCBaMCsH0KWjjmtie/U4kBamkGrNCJhtC9I7d992JWwe+DfDga/aBGY
 HKarcgkblByaEAsp0iSjjuO4nZLYKbDj6zjEtGbF8kxwmETowaLEOlm0gY9Qo7z57nn3
 6jHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Gu2vnmLVCujFI2teWLgAo0YoeC6N2JbwcNQIXS2vH1Q=;
 b=OtcPtSVt56BF49v6rL7+GX7cIFTb3QW3IATVS1/ZUUZVCDT39Nkoyh23/R1kK9BNvV
 qRx+UbNVdO4yK219P4EOUPw3uWxU0A0NRQ2SvYsvP+ytIaCNkXQojXRybBXjMSxLAGrC
 agEbkMepdxcfIy84NIJBtEE9hKSE7zn7KqYLB4numgXKAUeZ0p37OERsW2yxGMpDnip5
 h/hnCCBZqi7Jq18ztTc+FCAi3GtQ7NOkmstBSm4a1UJIVEfwhWJEqQs1w2XDi0iP9qhJ
 iAMzxp3ycbOMbAS5Kc5IJ4V3hdw2mtogb8erTtah5us/30AWVQ3OL2rOQe1gYZg8pJJl
 2DDA==
X-Gm-Message-State: APjAAAX06AgCTnRKrKX1+1VvGOZCct88b84FaZr6zeOPBYBsHJ2qaSPS
 VxFlhjH6f3Bz1P6FRz4+rNc=
X-Google-Smtp-Source: APXvYqwb9rNgyD2ErS9LMNVCrmuRFG+7Tnl9EcoocnLtq0gJ5qK24lnFkEJBIcfUhws1BbqqqBkKvw==
X-Received: by 2002:a62:5bc1:: with SMTP id
 p184mr91614580pfb.154.1558885170743; 
 Sun, 26 May 2019 08:39:30 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id o2sm863129pgm.51.2019.05.26.08.39.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 May 2019 08:39:30 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v6 05/11] mtd: cfi_cmdset_0002: Split do_write_oneword()
 op_done goto statement
Date: Mon, 27 May 2019 00:38:58 +0900
Message-Id: <20190526153904.28871-6-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190526153904.28871-1-ikegami.t@gmail.com>
References: <20190526153904.28871-1-ikegami.t@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190526_083932_199018_5DDCAEE6 
X-CRM114-Status: GOOD (  17.38  )
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
Cc: Tokunori Ikegami <ikegami.t@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, Fabio Bettoni <fbettoni@gmail.com>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

To reduce function size and remove the goto statement split the op_done goto
statement part into do_write_oneword_done() created a function.
Also split the start part into do_write_oneword_start() to find easier pairs.

Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v5:
- Rebased on top of Liu Jian's fixes in master.
- Change the email address of Tokunori Ikegami to ikegami.t@gmail.com.

Changes since v4:
- None.

Changes since v3:
- Rebased on the patch v4 01/11.
- Change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- Change to split the start part of do_write_oneword() additionally.
- Fix indentation to call pr_debug().

Changes since v1:
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 57 ++++++++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 3cd491c54ff5..ae4d1649d47c 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1614,6 +1614,40 @@ static int __xipram do_write_oneword_once(struct map_info *map, struct flchip *c
 	return ret;
 }
 
+static int __xipram do_write_oneword_start(struct map_info *map,
+					   struct flchip *chip,
+					   unsigned long adr, int mode)
+{
+	int ret = 0;
+
+	mutex_lock(&chip->mutex);
+
+	ret = get_chip(map, chip, adr, mode);
+	if (ret) {
+		mutex_unlock(&chip->mutex);
+		return ret;
+	}
+
+	if (mode == FL_OTP_WRITE)
+		otp_enter(map, chip, adr, map_bankwidth(map));
+
+	return ret;
+}
+
+static void __xipram do_write_oneword_done(struct map_info *map,
+					   struct flchip *chip,
+					   unsigned long adr, int mode)
+{
+	if (mode == FL_OTP_WRITE)
+		otp_exit(map, chip, adr, map_bankwidth(map));
+
+	chip->state = FL_READY;
+	DISABLE_VPP(map);
+	put_chip(map, chip, adr);
+
+	mutex_unlock(&chip->mutex);
+}
+
 static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 				     unsigned long adr, map_word datum,
 				     int mode)
@@ -1625,19 +1659,14 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 
 	adr += chip->start;
 
-	mutex_lock(&chip->mutex);
-	ret = get_chip(map, chip, adr, mode);
+	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n", __func__, adr,
+		 datum.x[0]);
+
+	ret = do_write_oneword_start(map, chip, adr, mode);
 	if (ret) {
-		mutex_unlock(&chip->mutex);
 		return ret;
 	}
 
-	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
-		 __func__, adr, datum.x[0]);
-
-	if (mode == FL_OTP_WRITE)
-		otp_enter(map, chip, adr, map_bankwidth(map));
-
 	/*
 	 * Check for a NOP for the case when the datum to write is already
 	 * present - it saves time and works around buggy chips that corrupt
@@ -1646,8 +1675,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	 */
 	oldd = map_read(map, adr);
 	if (map_word_equal(map, oldd, datum)) {
-		pr_debug("MTD %s(): NOP\n",
-		       __func__);
+		pr_debug("MTD %s(): NOP\n", __func__);
 		goto op_done;
 	}
 
@@ -1669,12 +1697,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	}
 	xip_enable(map, chip, adr);
  op_done:
-	if (mode == FL_OTP_WRITE)
-		otp_exit(map, chip, adr, map_bankwidth(map));
-	chip->state = FL_READY;
-	DISABLE_VPP(map);
-	put_chip(map, chip, adr);
-	mutex_unlock(&chip->mutex);
+	do_write_oneword_done(map, chip, adr, mode);
 
 	return ret;
 }
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
