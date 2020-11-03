Return-Path: <SRS0=zrsi=EJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D766C2D0A3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 15:00:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE70820757
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 15:00:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fp6BRFd9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1NnBJ4e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE70820757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2ChOXJR01k6WxpVS8isyaon000xcAn2Ohmd6kC5L+lo=; b=Fp6BRFd9bbGAWZoZeZD8VqYPez
	G51TVEDG1GQ41K/kqPuqx7RmDQ+6QQBjb616Z6flftqWrb2eGlIxtuixINdw60pSbJsmwYiIHTz3s
	0JZvFcAqdCYm2PsL8uzgymoDx3syXuYzxkw9NE13RCpj7Rsri+V5nb010XwlJjuV9lph2+QO1KNKb
	7eAj2d8gHuPPOjp6whMzNpFb59q/GMK1oFxNYXbw3Tumbxy7gEHNd4H3ZjdbYcuak1UtnFS4xC5Ow
	rnMAbEwMwU7ar0mVMWdd7bLHH3jxhZ1pDdX9ltPKl5duStXkZMZcslJEDN9DnzG9VRbYhlS7ZQTN5
	S4R64CNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZxmR-00030K-9i; Tue, 03 Nov 2020 14:59:27 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZxmN-0002zE-Io
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2020 14:59:24 +0000
Received: by mail-pf1-x444.google.com with SMTP id o129so14425077pfb.1
 for <linux-mtd@lists.infradead.org>; Tue, 03 Nov 2020 06:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p1znv2jWNrmi22OqPXW74w+OnkS6Me6ZJw6wE4UUB2k=;
 b=I1NnBJ4ePtd63zagyGAsfHOxT26rkFPYBstQvX4Xgfzo92xheALwY+4POfazC4MTId
 atBPEVEvT67aMa15ZhQ02hZK9Io+Mz3ywwqDt85Zlt5326o37C9h6DFKPJDmj9RkFXCR
 EU2QObPWjrbTJTHRlhi0bHMT41RyQxX/7JvJbUKJmDMI8L2mBR+LmyG9FP/rIliUXt9v
 /oAN29hbiXpu0HzpoQ7bHFKXuF3P5Xqx4JNU6vkYqe3/Xg+FYPLbY7wvyxd7L3y1fd5i
 b+HuafSadFgbIgTUAvt+hxIU1SuVgBMby67Hk8+sChdpzMYsnyb7wGf999JkKCHgNGZ+
 tQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p1znv2jWNrmi22OqPXW74w+OnkS6Me6ZJw6wE4UUB2k=;
 b=bYS3EmpCTPWh9fOhCNDSTlHDm6a1eY63wQylb5nQJh5A51PMR+eBrIlG0weBjWntFn
 /wNJSsJuHVjJUEObeYQYpz5xlbYJJv9rIxJErgdnrdrsuO/XroAOvKvmb1X3/q+zM4rh
 9fnrOUcE/aGneUqZQBVXasMEFDTLnJQd3qYaEcxwVaRtCZmaTBf78/fcM9vIuhyj7+Bv
 nR5M3zM6LV2mpQv3i4SoTSZhyfkz3tedNHsCL2RIuIulyDfUk1eVDaT1SsuQ8rvEHGei
 XWxwAAJVmUVL/UnvDk0uGoXgJzY84JTVjZR/BfdMJUbLtoKSp7Hh+29YIQgYw0IPBFi6
 x4NQ==
X-Gm-Message-State: AOAM530WQBjuOWYu0z4DKcPinPtl0/j2M1pj11IKrd/NiO+Mxqo8nC9O
 SzUn/bpdJkBMWKhBmd6r4o2Ndd12usR8562q
X-Google-Smtp-Source: ABdhPJwfz/Q6nzXPTDrE0Ai21Zv954MXiGu1V9MLzKg2B16DwbSiBaTOEPkq86/4rVoYwJ93jpF1cQ==
X-Received: by 2002:a62:e40b:0:b029:18b:2d21:45cd with SMTP id
 r11-20020a62e40b0000b029018b2d2145cdmr4554889pfh.36.1604415559916; 
 Tue, 03 Nov 2020 06:59:19 -0800 (PST)
Received: from Thiru.localdomain ([27.104.143.83])
 by smtp.gmail.com with ESMTPSA id j140sm8346047pfd.216.2020.11.03.06.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 06:59:18 -0800 (PST)
From: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Shivamurthy Shastri <sshivamurthy@micron.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Chuanhong Guo <gch981213@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5] mtd: spinand: micron: add support for MT29F2G01AAAED
Date: Tue,  3 Nov 2020 22:59:01 +0800
Message-Id: <20201103145901.29372-1-nthirumalesha7@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_095923_685910_441A4018 
X-CRM114-Status: GOOD (  16.25  )
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
Cc: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The MT29F2G01AAAED is a single die, 2Gb Micron SPI NAND Flash with 4-bit
ECC

Signed-off-by: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
---

v5: As per the review comments, the changes were reverted to the v2,
except the MT29F2G01AAAED device related (including the review comments)

v4: Split patch into two parts,
    1. Generalise the oob structure name & function names as show in v3
    2. Add support for MT29F2G01AAAED device
       a. Add oob section check in micron_ooblayout_free function
       b. Rename mt29f2g01aaaed_* to generic name micron_4_*

v3: As per the review comments,
     1. Renamed read_cache_variants as quadio_read_cache_variants,
write_cache_variants as
      x4_write_cache_variants/x1_write_cache_variants,
update_cache_variants as
      x4_update_cache_variants/x1_update_cache_variants,
read_cache_variants as x4_read_cache_variants
     2. Renamed micron_8_ooblayout as micron_grouped_ooblayout &
mt29f2g01aaaed_ooblayout as
      micron_interleaved_ooblayout
     3. Generalized page size based oob section check in
mt29f2g01aaaed_ooblayout_ecc function
      and separate case check for two bytes BBM reserved in
mt29f2g01aaaed_ooblayout_free function
     4. Removed mt29f2g01aaaed_ecc_get_status function &
MICRON_STATUS_ECC_1TO4_BITFLIPS

v2: Removed SPINAND_SELECT_TARGET as per the comments & fixed typo
errors

v1: Add support for Micron SPI Nand device MT29F2G01AAAED

 drivers/mtd/nand/spi/micron.c | 64 +++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 5d370cfcdaaa..0b1e48d5c9d4 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -44,6 +44,19 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD(false, 0, NULL, 0));
 
+/* Micron  MT29F2G01AAAED Device */
+static SPINAND_OP_VARIANTS(micron_4_read_cache_variants,
+			   SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
+			   SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
+			   SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
+			   SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+
+static SPINAND_OP_VARIANTS(micron_4_write_cache_variants,
+			   SPINAND_PROG_LOAD(true, 0, NULL, 0));
+
+static SPINAND_OP_VARIANTS(micron_4_update_cache_variants,
+			   SPINAND_PROG_LOAD(false, 0, NULL, 0));
+
 static int micron_8_ooblayout_ecc(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *region)
 {
@@ -74,6 +87,47 @@ static const struct mtd_ooblayout_ops micron_8_ooblayout = {
 	.free = micron_8_ooblayout_free,
 };
 
+static int micron_4_ooblayout_ecc(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *region)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+
+	if (section >= spinand->base.memorg.pagesize /
+			mtd->ecc_step_size)
+		return -ERANGE;
+
+	region->offset = (section * 16) + 8;
+	region->length = 8;
+
+	return 0;
+}
+
+static int micron_4_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+
+	if (section >= spinand->base.memorg.pagesize /
+			mtd->ecc_step_size)
+		return -ERANGE;
+
+	if (section) {
+		region->offset = 16 * section;
+		region->length = 8;
+	} else {
+		/* section 0 has two bytes reserved for the BBM */
+		region->offset = 2;
+		region->length = 6;
+	}
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops micron_4_ooblayout = {
+	.ecc = micron_4_ooblayout_ecc,
+	.free = micron_4_ooblayout_free,
+};
+
 static int micron_select_target(struct spinand_device *spinand,
 				unsigned int target)
 {
@@ -217,6 +271,16 @@ static const struct spinand_info micron_spinand_table[] = {
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
 				     micron_8_ecc_get_status),
 		     SPINAND_SELECT_TARGET(micron_select_target)),
+	/* M69A 2Gb 3.3V */
+	SPINAND_INFO("MT29F2G01AAAED",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x9F),
+		     NAND_MEMORG(1, 2048, 64, 64, 2048, 80, 2, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&micron_4_read_cache_variants,
+					      &micron_4_write_cache_variants,
+					      &micron_4_update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&micron_4_ooblayout, NULL)),
 };
 
 static int micron_spinand_init(struct spinand_device *spinand)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
