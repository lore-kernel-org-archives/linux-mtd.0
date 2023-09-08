Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7D9EE57EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P8Jqwv8FUSzwvVFoS2+Ikqw1Ne8dq7amrm5Wz14FsaQ=; b=N8dSjSG/MJ1oAE
	suHZ3hFWKp3Xgw4aQW4W6nCG4C1exXJUYkdTz0qHRBYbf3APKW9duTJMfn6Lpr8pCm5ntjZ16nfKN
	j9yytl48fsF0V9iZfN0kbxWlZHrWR5+y1BL4+OUOsgx28C6PbtxcfKYB7rqE/TgrY0rarqYlo34FH
	BxYZURiybKpblkGVOeoBk44hecleAC3O2XrgxO9VpdeUU/w0C4uK8Jbi97I4DzjMmbD4GkWgs14AT
	Dl16sRGtHgdjyxKoChbin6hzWIOG2uXeQ9nSn6XUSoJngPpR++uN7cd2CHF+8Ddz7nFn5IeyhA4R2
	4XQ0rCMu63Sp1FyPMczQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYXu-00DT5d-1n;
	Fri, 08 Sep 2023 10:17:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYXr-00DT1u-1D
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:17:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CA06061499;
	Fri,  8 Sep 2023 10:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE35DC4339A;
	Fri,  8 Sep 2023 10:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168218;
	bh=AJHIitoloNWfRd5lKhp4V4mLHLnTlHTr9ZGvn4sDt+U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i989L7XhHJsOJWNi35krvoh68IOegTz48kZVl2g92uZRSuTxhRnprY6lxDzcxIs0H
	 5JPULQcgdVi6EwDlNG4GXBSu8q8B0/zkc9zsrc6sxjmygFfwsZIdyy8XmbUPiSsxc1
	 QhyPrvKptCu1CKmxbK6EB55/36LV1lqUKyFTzGFxp1zmuL4ir6jUeMbnMTVktMqmpv
	 0PzEgdRRLSQGERMg6ZdZmRvhDXOVoNNJkcpDWHofLzjivGLOixizkI+lwnGgEJX9SP
	 vBrlMRRx4oygfOReoVC4qphAErCaUxSNG4mFBBQuTEI4xGjRL5uS80TdeyMkv1q2X0
	 ldCqTTQMPe1vg==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:32 +0200
Subject: [PATCH v3 14/41] mtd: spi-nor: rename .otp_org to .otp and make it
 a pointer
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-14-e60548861b10@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_031659_475442_B2FBD9AA 
X-CRM114-Status: GOOD (  15.02  )
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

Move the OTP ops out of the flash_info structure. Besides of saving some
space, there will be a new macro SNOR_OTP() which can be used to set the
ops:
  .otp = SNOR_OTP(...),

Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v3:
 - fix winbond_nor_late_init(), test for NULL pointer
---
 drivers/mtd/spi-nor/core.c    | 2 +-
 drivers/mtd/spi-nor/core.h    | 4 ++--
 drivers/mtd/spi-nor/winbond.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 80c340c7863a..1c443fe568cf 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2978,7 +2978,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
 	struct device_node *np = spi_nor_get_flash_node(nor);
 
 	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
-	params->otp.org = &info->otp_org;
+	params->otp.org = info->otp;
 
 	/* Default to 16-bit Write Status (01h) Command */
 	nor->flags |= SNOR_F_HAS_16BIT_SR;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index fc6c8ddedc2f..6d1870d5484d 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -557,7 +557,7 @@ struct flash_info {
 
 	u8 mfr_flags;
 
-	const struct spi_nor_otp_organization otp_org;
+	const struct spi_nor_otp_organization *otp;
 	const struct spi_nor_fixups *fixups;
 };
 
@@ -607,7 +607,7 @@ struct flash_info {
 		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,		\
 
 #define OTP_INFO(_len, _n_regions, _base, _offset)			\
-		.otp_org = {						\
+		.otp = &(const struct spi_nor_otp_organization){	\
 			.len = (_len),					\
 			.base = (_base),				\
 			.offset = (_offset),				\
diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 7873cc394f07..ecf52b9e3148 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -217,7 +217,7 @@ static int winbond_nor_late_init(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 
-	if (params->otp.org->n_regions)
+	if (params->otp.org)
 		params->otp.ops = &winbond_nor_otp_ops;
 
 	/*

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
