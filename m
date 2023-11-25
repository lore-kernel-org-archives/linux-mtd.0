Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B80C636BD
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Nov 2023 12:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4xcjyxMdDOKsTV9pCHYybxqdA3/ng6OTdqbJzdMYCYA=; b=xOlaEFaMxSSviJ
	xUxNTTnvZCTprP6cbGZhMJRMZ644cD412Hlr5/BDQ8cHMK2KHr85y89Dgja5hxDS8yJD9ZlJFR5dX
	CcGJE5HiEySP3sRhLqsM4qNrsN1lGHSM8rVLJvPSgenu5lSx7R+ZyATqvEagHasQTXoYH2U1o3fJR
	dqQP9JroxqckBMhpShJSPe9d68Tdj+3vDx/iMNoNSRAkqyzUzYmJGd5devYX3UYVgNhvu3kEDg51k
	vwRP6crqaKtcrEXbriFyWnIoRzdVuf41NZAKlpfALzx8CsfOjy80xfr9OUjEdYmtP3HMp7N+0rkOy
	PXq/aHoDOfBSSrJNyeeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6rt2-009EfW-0T;
	Sat, 25 Nov 2023 12:35:52 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6rsy-009Edz-2m
	for linux-mtd@lists.infradead.org;
	Sat, 25 Nov 2023 12:35:50 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-54af61f2a40so1850211a12.3
        for <linux-mtd@lists.infradead.org>; Sat, 25 Nov 2023 04:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700915747; x=1701520547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRVqX+0ahP3hP/THbaHoTXImqdkW4hzKFigoAdVJ+tc=;
        b=cCChuQWZyOtjnozBCdGfOY0ITIIA5sKt00g6x5mlY+GiUJirWouD3Qh8DyFa8axoPn
         QiFeEORwI1T1DZ3a0p/aCW7w4iTulrm+rzlfcYQ3dQ8/et3forFfAwU6s3zeBtJ+Gvrv
         ZQZIoCh12l343JOVuJMSkOMqhPE/FQ+wUt838ZB+tK7oHPyzX2rvUKPbPMDAWe20mdvU
         jUXixjcZn3NQk6VVVjUv0lL5v3Qr/rYpo8TtzsrHBYLNnA551Td/RIxucszNbcsgTjfl
         cfc4gqugpXADHWGaniUjVbQdsuZWl6T5BmPbnDxhpImIj+bN+JtSMuBAMm20WSPi2Mbd
         0dFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700915747; x=1701520547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRVqX+0ahP3hP/THbaHoTXImqdkW4hzKFigoAdVJ+tc=;
        b=YqF0WXRQFH9Kxnby7yXRayvNOEIa4nGFT0tw/UhXEl6tGgB+Zn7V93Q47QElmT6lBe
         cmjtnMJpQH1ZrNdhqfleddGVhHkK2Z7B5weBZHR4ZsAHbwRviCCMoJ0QZh4f5NC+9xnY
         YDSL/4R5semV4eQgtbxUdfx6PEdwVx6mmeeaY0odtm7cJP48KmEpidYt8Z3KTcU+aKq+
         T2jQ2LXWEL+pm2NNpXOqKuJgWHpZYtyVnrxmdcLXyxqOwQ4yg4w5aLqSIQ0smZnVHTyH
         EQu1ubp1+2ZBrIqe6uy8I3OSY3KR8Vn5eQT+RAB7Hy7TTO81m7RwZrVTOyoQDM737Bpm
         63mg==
X-Gm-Message-State: AOJu0YwLkxMrQKt+RWMW+C8kqdK0YX8Zm/++XpTeO7fgS2FC6u/FTGOm
	asoYyaSuAUSxEi2JuWCmeAPe1w==
X-Google-Smtp-Source: AGHT+IGCzZkHJ01zddYYZyY7G1FynXO7V/Sr1FyMQrUeiJnGt2U+RhocZAE4ny7OjDOfx0vGfKUaBQ==
X-Received: by 2002:a17:906:583:b0:9d3:ccf0:761e with SMTP id 3-20020a170906058300b009d3ccf0761emr4438046ejn.49.1700915747228;
        Sat, 25 Nov 2023 04:35:47 -0800 (PST)
Received: from 1.. ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id lv23-20020a170906bc9700b009f28db2b702sm3390163ejb.209.2023.11.25.04.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 04:35:46 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc,
	fastevam@denx.de
Cc: linux-mtd@lists.infradead.org,
	takahiro.kuwano@infineon.com,
	bacem.daassi@infineon.com,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v3 2/5] mtd: spi-nor: spansion: enable die erase for multi die flashes
Date: Sat, 25 Nov 2023 14:35:26 +0200
Message-Id: <20231125123529.55686-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231125123529.55686-1-tudor.ambarus@linaro.org>
References: <20231125123529.55686-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1697; i=tudor.ambarus@linaro.org; h=from:subject; bh=2CCTjENYaOp4KjdgQLpG9dbq/tdNpT2/M9c0IJnNCs4=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlYeoRWECU8zlwpkWjK8Gxq1ZVckDE6TznyRPi0 dovpaLFBOuJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZWHqEQAKCRBLVU9HpY0U 6XxvCAC5nwYsSD43zvsYNX9DI8fXGcVIgYDaFnE7sgVaKHBcsP+navdzFbNzaixLSs6xu3Razg2 fipVsEMjGz1hx2pZHh5zNksOAw/nrpFelt4ZyGA/6jCsdK6OVBinSAxb76HheGfKfvlBsEXrSc9 TzNNwHdUvz1VmjF4SY27xBNk+9np0pGbvjdCJgt+0xzfWlLjHqqjiUqqEdu9Q3mKtg1i2hmItb3 S4qQ+7r6farjgZkubIIsIKqKJBustVSGU98TS6vuQnsFUuPxsRSr1fLxIQruNI46y1GdbH1DFEf IF72cHhC2L3vf9xnBeXqmI3xhoj/sRuz1H+zBDldgyAsHdMX
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_043548_902215_D8CD2682 
X-CRM114-Status: GOOD (  12.17  )
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

Enable die erase for spansion multi die flashes.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Tested-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 12921344373d..6cc237c24e07 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -17,6 +17,7 @@
 
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
 #define SPINOR_OP_CLPEF		0x82	/* Clear program/erase failure flags */
+#define SPINOR_OP_CYPRESS_DIE_ERASE		0x61	/* Chip (die) erase */
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
 #define SPINOR_REG_CYPRESS_VREG			0x00800000
@@ -644,6 +645,7 @@ static int s25hx_t_late_init(struct spi_nor *nor)
 	params->ready = cypress_nor_sr_ready_and_clear;
 	cypress_nor_ecc_init(nor);
 
+	params->die_erase_opcode = SPINOR_OP_CYPRESS_DIE_ERASE;
 	return 0;
 }
 
@@ -933,7 +935,6 @@ static const struct flash_info spansion_nor_parts[] = {
 		.id = SNOR_ID(0x34, 0x2a, 0x1c, 0x0f, 0x00, 0x90),
 		.name = "s25hl02gt",
 		.mfr_flags = USE_CLPEF,
-		.flags = NO_CHIP_ERASE,
 		.fixups = &s25hx_t_fixups
 	}, {
 		.id = SNOR_ID(0x34, 0x2b, 0x19, 0x0f, 0x08, 0x90),
@@ -954,7 +955,6 @@ static const struct flash_info spansion_nor_parts[] = {
 		.id = SNOR_ID(0x34, 0x2b, 0x1c, 0x0f, 0x00, 0x90),
 		.name = "s25hs02gt",
 		.mfr_flags = USE_CLPEF,
-		.flags = NO_CHIP_ERASE,
 		.fixups = &s25hx_t_fixups
 	}, {
 		.id = SNOR_ID(0x34, 0x5a, 0x1a),
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
