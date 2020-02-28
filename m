Return-Path: <SRS0=boQ/=4Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57EF7C3F2CD
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 15:04:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2198724699
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 15:04:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gKG8Fan6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxqGCszp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2198724699
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2Z16j2KPwPXViWIfFhLRCWs+aZfxoGpqgxxJgTTFuuk=; b=gKG8Fan6bknpfNyD5NoaA9Lqtp
	XOtp/WyoDTQmPuBvk68pEO0b23pV3TN5DczagPJEg+POrtC5gWdyaix4W39HZOZ/3QZaheqg8oESU
	ElRnckbIqupML5db8wi/p7neiip0AMqJdUIOspWhMWGvH79Jk5M0P81BWArBDqh0c1wxM4B+Ie2xr
	jjZY8hZonqi+yKPmTeLEOogkZjnLYe/wWRRc8/WrKWT8NtjWmjDK+WluyxlDAwGWXTAxim7Jy5Obh
	0YOSC3B2JlBWf3u+L9WlrtN6866nkprSgU7i6geRzDer3JRyKwzVwc1lUaZWyHOSi6w5fZ+3dcWfl
	UhjHV8Ww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7hBB-0002yo-UB; Fri, 28 Feb 2020 15:03:53 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7hAj-0002Vk-HA
 for linux-mtd@lists.infradead.org; Fri, 28 Feb 2020 15:03:27 +0000
Received: by mail-wm1-x343.google.com with SMTP id t23so3533338wmi.1
 for <linux-mtd@lists.infradead.org>; Fri, 28 Feb 2020 07:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=M993Xxg570Z0qNth+AfgZmhK2IPDaBi6vXhUHO9PeJw=;
 b=fxqGCszp3U5TsaRO8DeMwhFdG9VCC5MFftPvMMFEJqZP+CwEr4KSsqnlcjv1enzIkm
 XbtoKSQk0K3qLppIp49AHQ0MG8MO9Gu9oB0Aw5+Ce3sivUFewhs/RIL2n4wFPZlK5IbC
 nj6YOkZUYbb81Nir0LBidFtn6yePYS2AVsWDf8+2wbBRcsedbSJdieZ3TAylWGVCFBnJ
 pKp2q3LsoH6MQePzJUTz+QQX7cCRsNUAouRM6c30kLJWXOqsS1asoNuSRi+K26n2RFWD
 8mHDo1wUMYUQD6co5OjEIYBKzD1Iohxt64AC/ik6DZFIUmolV7Y3d6Ur0i0zim0fQnw4
 IbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=M993Xxg570Z0qNth+AfgZmhK2IPDaBi6vXhUHO9PeJw=;
 b=flOStADHrLhmMWFjoYlo7V2UEfxITpKJRqvmi8XahzcF3kNUaL+bSb0S1PJcMYcOPt
 fuw/sTFKXo6PefP8ogdvzJgXtOYYxj5F++q0Afz9OsUC+C+B4YfzeHgjHZ7MRpq+deJ9
 gSy3T/MPnGSZ5R1oAVp6NPDn8C/Mlb753Uhz6bhHk38FLjkIZxtXNSUDpTUMcy4JCXRU
 0ohgWJbX6SECLR9+sSzPx4g/ZhDjkAEpmTbVtH6CjMcPsuv5N654eP1Cfj+LHo0e4CzF
 MXBkmaBScgigDfFd+lFhRXHXOdxSrKk0mcHu+8iXVyleHp78QbmrA+L+E8dHUC2baKwx
 XvnA==
X-Gm-Message-State: APjAAAXj9lkmwR+sdydJY5emx4E61v0dtmMdDP/gQKpn1CurSKAAn8RO
 vKUBl+n2e76ReVpR9Vk9ExU=
X-Google-Smtp-Source: APXvYqwNSQFWyVhTdvukpuDwLPKGh9J5VLffoz16pWUJG+qow3vh1xugI/kVAVbZ5FBaDlNbHvIsqg==
X-Received: by 2002:a05:600c:251:: with SMTP id
 17mr5174861wmj.59.1582902202694; 
 Fri, 28 Feb 2020 07:03:22 -0800 (PST)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id m125sm2540235wmf.8.2020.02.28.07.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 07:03:22 -0800 (PST)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/6] mtd: spinand: micron: Generalize the OOB layout
 structure and function names
Date: Fri, 28 Feb 2020 16:03:06 +0100
Message-Id: <20200228150311.12184-2-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200228150311.12184-1-sshivamurthy@micron.com>
References: <20200228150311.12184-1-sshivamurthy@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_070325_574249_5EF1B684 
X-CRM114-Status: GOOD (  11.38  )
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
Cc: Shivamurthy Shastri <sshivamurthy@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Shivamurthy Shastri <sshivamurthy@micron.com>

In order to add new Micron SPI NAND devices, we generalized the OOB
layout structure and function names.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/spi/micron.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 7d7b1f7fcf71..c028d0d7e236 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -34,38 +34,38 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD(false, 0, NULL, 0));
 
-static int mt29f2g01abagd_ooblayout_ecc(struct mtd_info *mtd, int section,
-					struct mtd_oob_region *region)
+static int micron_8_ooblayout_ecc(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *region)
 {
 	if (section)
 		return -ERANGE;
 
-	region->offset = 64;
-	region->length = 64;
+	region->offset = mtd->oobsize / 2;
+	region->length = mtd->oobsize / 2;
 
 	return 0;
 }
 
-static int mt29f2g01abagd_ooblayout_free(struct mtd_info *mtd, int section,
-					 struct mtd_oob_region *region)
+static int micron_8_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
 {
 	if (section)
 		return -ERANGE;
 
 	/* Reserve 2 bytes for the BBM. */
 	region->offset = 2;
-	region->length = 62;
+	region->length = (mtd->oobsize / 2) - 2;
 
 	return 0;
 }
 
-static const struct mtd_ooblayout_ops mt29f2g01abagd_ooblayout = {
-	.ecc = mt29f2g01abagd_ooblayout_ecc,
-	.free = mt29f2g01abagd_ooblayout_free,
+static const struct mtd_ooblayout_ops micron_8_ooblayout = {
+	.ecc = micron_8_ooblayout_ecc,
+	.free = micron_8_ooblayout_free,
 };
 
-static int mt29f2g01abagd_ecc_get_status(struct spinand_device *spinand,
-					 u8 status)
+static int micron_8_ecc_get_status(struct spinand_device *spinand,
+				   u8 status)
 {
 	switch (status & MICRON_STATUS_ECC_MASK) {
 	case STATUS_ECC_NO_BITFLIPS:
@@ -98,8 +98,8 @@ static const struct spinand_info micron_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&mt29f2g01abagd_ooblayout,
-				     mt29f2g01abagd_ecc_get_status)),
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status)),
 };
 
 static int micron_spinand_detect(struct spinand_device *spinand)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
