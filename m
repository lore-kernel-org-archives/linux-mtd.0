Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBA960A382F
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 19:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oxxzeqtC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BnOzfeaQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uFIScW3blFb3Tkiqein7Ng5vjWYhZplFtwjngPUWyxk=; b=oxxzeqtCnrpS9KhksC8frhErF3
	tyvySKZxH59caT/rOInRH1I1MJxfgD0xnwHgC4W0Y45SQAjS9YDYlwylL1w/Cam5qnZEIb/L4nyST
	N+P/qkhTmC5Eu4QBa7a/QdZuPT6ZZtGpg+eTW9XYSUhHzNeg65brNvK4jNPSrHTw04sSghCkmg9o7
	BrzolXwNpU9f6K30IeCc/cVa7ngEgbVIzNSj3jEo5688X6XMTBmBAzHusd6Yx1PwJ54A1Zs/MEPKU
	4jnS5qgfm9ar0SyS/xnWPp3q+3sXbIlwf5urkwuXvvdQPpubig7FLLD6wVnvF97uIWdBtStm5TmtC
	EQdoZzRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVF8-00000001ZVK-2IGU;
	Mon, 09 Nov 2026 19:41:26 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVF4-00000001ZSb-3Onc
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 19:41:24 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so15715955e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 11:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253281; x=1794858081; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CJBOrzmZfEeEjj8zj4QInIClRy264Xeumf7USqg34nY=;
        b=BnOzfeaQLMVsDaMkxp7ZZ/gCZfiWSMqJdU+siJFkvnT1vAWEeV6zw1oBP46gs0GLQJ
         CZsrRanaeqOIurUnc8NGpWPSySwLUh2S8/YW9WZz2e1wLhVUKEqKCQ4Lmj1tjBRnkcYa
         8iVEyU4nhSXkYU1leXVx0vH5CVhuZpCJNu9+582cCjEaa2oPp5GF+KJHBICAmWaQVF6b
         Jq/ZtE67TfV40QHeBw0ADuDxN9eQRLkJBVpdtHjw2JHBLpAQWMI9+dVpYc5QRWlqMlcG
         +yckwSLjhwW/qe2yOli24f+UqpSWKcOEP3jf71VvM5F9QTuV9J9pZ2eqTdUo55OA+zFP
         VLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253281; x=1794858081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJBOrzmZfEeEjj8zj4QInIClRy264Xeumf7USqg34nY=;
        b=A8lS6a/g9oi0DNVwWh1k4P576pF1JFODvcVCR+oAQEF797BabTT1rjDV2z9ykYbkCG
         C5LnYOKrI2EkGDtW5cNZsdaoCl+wEMKgtHodzg16TttRKi4XvFNf2fqiPBBVdPQNSn/J
         4pBvYCGrywHyiWuaCGNTgCRxv7r4jRcT0ORKlemGXlM0ZJuZUFxRmFfpfIvoHoIFjYe4
         5O26UYNrsi7/VEoQ4O+AI4lQJR3Ux9AczOntoOlGbt6I0l98yc/v4ckrXAbIj94hx6sQ
         c0FVgFiHcMulOKg43pnztsF76ZbNLS13TdrFvHdJtRKToij117PYFKAonauPlExz+cZ1
         mGJg==
X-Forwarded-Encrypted: i=1; AL+hErHns65rO80de7rADllyMU1+M/FI1kNIhAlOVIPJXc3TFUN4B0K/ecwW2euwIg5S62FEhvTvxRyX4Vs=@lists.infradead.org
X-Gm-Message-State: APuU4Z8YRLZL1WPphWlFZwrPHE6lCH/Ur3CovZsZDh1M8wZDo7KNQrlL
	jEbwRHyZE3PvTD60s+R6nXF1AeEMfm9LDgIM6B6dpmoMZU1kmnh2zOjE
X-Gm-Gg: AYBFou3JWHq9taoieIx+UZWbLkOvDNAyeaDIuxf5tBLfV674FGtfVIzr0Sk2VaaLUdP
	jEhN4brKNmZA2nntmhfFov3NZF88xFALRaagVqg0hJOuVKTMXyCp8U4KQ0MthuGMqrJciS3Tuy+
	T8iiQif2Y04bfrP+3nCaOiZ59mzTeDKxOH7cuUu0QU6QoZoE/M4xj9W70KLmnXUzj9ukGcEv6ry
	yVHRxf+YZ5vdPitzP5Lrcfm3ZxhCXpE5vjovQM1mINaz5CuW2jLsqP3AbfdwXxE7at1YCR5MBtn
	5cMogqyCTiE6tjhFD2PGVHLOQyGsTedz+jSjfKiTsB3i8FIsplIX683Qy2zPjmE4jr4MSJTBLKI
	1LIr2OfXMrplAzmgaskA//l44qdmx3zkuaV5SjcU4Fy7g0YtU5aHHw0KVcNm9Hmp3cA4EnAKGP0
	R2p4povieJkNm2Bw3jd1KOMIzL9ho7G3lx4JhrmEUoDPJdVemgGAQfQh2B3kPamLuPnSMoqZcPr
	3mpQGuaONeVfn/6/G5IKpGG63xlrpYT4ZcGDehCq/7FlYSTb6OQ0oPePbEQPXwVtBie0/l+o4YG
	Ps10rWRw/bprypT0dHdQ25rJ60Okc1XLhVszxjm+xvGAB/6pUmQrLot2cQ==
X-Received: by 2002:a05:6000:4283:b0:491:5b1:fa73 with SMTP id ffacd0b85a97d-49827cf2a91mr1085864f8f.0.1794253280640;
        Mon, 09 Nov 2026 11:41:20 -0800 (PST)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49836b8eb11sm714822f8f.57.2026.11.09.11.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:41:20 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 09 Nov 2026 20:41:06 +0100
Subject: [PATCH 5/7] spi: spi-qpic-snand: use the common
 qcom_nandc_set_read_loc_first() function
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261109-qpic-snand-use-common-functions-v1-5-1e8601e2db84@gmail.com>
References: <20261109-qpic-snand-use-common-functions-v1-0-1e8601e2db84@gmail.com>
In-Reply-To: <20261109-qpic-snand-use-common-functions-v1-0-1e8601e2db84@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_114122_897004_2553F76D 
X-CRM114-Status: GOOD (  11.51  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The common function from the 'qpic_common' module provides the same
functionality as the locally implemented counterpart.

Use the common function and remove the local one in order to reduce
code duplication.

No functional changes intended.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 6774a0a5db2a..ad91edd5f6df 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -122,27 +122,6 @@ struct qpic_spi_nand {
 	bool quad_mode;
 };
 
-static void qcom_spi_set_read_loc_first(struct qcom_nand_controller *snandc,
-					int reg, int cw_offset, int read_size,
-					int is_last_read_loc)
-{
-	__le32 locreg_val;
-	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
-		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
-		  FIELD_PREP(READ_LOCATION_LAST_MASK, is_last_read_loc);
-
-	locreg_val = cpu_to_le32(val);
-
-	if (reg == NAND_READ_LOCATION_0)
-		snandc->regs->read_location0 = locreg_val;
-	else if (reg == NAND_READ_LOCATION_1)
-		snandc->regs->read_location1 = locreg_val;
-	else if (reg == NAND_READ_LOCATION_2)
-		snandc->regs->read_location2 = locreg_val;
-	else if (reg == NAND_READ_LOCATION_3)
-		snandc->regs->read_location3 = locreg_val;
-}
-
 static void qcom_spi_set_read_loc_last(struct qcom_nand_controller *snandc,
 				       int reg, int cw_offset, int read_size,
 				       int is_last_read_loc)
@@ -514,8 +493,10 @@ static void qcom_spi_set_read_loc(struct qcom_nand_controller *snandc, int cw, i
 		return qcom_spi_set_read_loc_last(snandc, reg_base, cw_offset,
 						  read_size, is_last_read_loc);
 	else
-		return qcom_spi_set_read_loc_first(snandc, reg_base, cw_offset,
-						   read_size, is_last_read_loc);
+		return qcom_nandc_set_read_loc_first(snandc, reg_base,
+						     cw_offset,
+						     read_size,
+						     is_last_read_loc);
 }
 
 static void

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
