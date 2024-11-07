Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20665D5AE79
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2024 09:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dv4sn7f4GUy7uT1fMQOrpPS1va75ujYqDczm9MtbFAY=; b=hbjbt14TZnIwxd
	beU6zTW5TGJe+LrcBOxsK2tjGn6KmvJzNZadPl9RiNvulYKQ4otgdaxDY84l3WL8Oz4gVBNlcT1+P
	6o9qJEshQRpSMflQRv4P4m5X9oymaaCpo5nOpdx6ddqMfSaHySbmKm5LSNzvt9Bs/GVmNXaXomSKH
	bxiTxrQdJnEpCyKIDzGECB7DMMENmyozkX9eeEvfuMH0/8hTmm0qpNy6Ah/40HkccsykEYcXawnuD
	78emHeoUuhCxurjDFCsgdng0UB5RUHLQbWYY46jZynoXn485BP04fgPsCXmx5hhVsSEiSD19ZC393
	HT5ZAMjUWAr/l0OE4kQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8yrO-00000006ImG-3uE0;
	Thu, 07 Nov 2024 09:31:26 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8yrL-00000006Ilj-341p
	for linux-mtd@lists.infradead.org;
	Thu, 07 Nov 2024 09:31:24 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2e3fca72a41so602673a91.1
        for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2024 01:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730971882; x=1731576682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JeMAIR9iEI5n6d08kWR1HWHfaPm/uZGrAZ7QGzkzYV8=;
        b=V/Xa+SPpGO5+x9pPbbHmDyIblvwnQNSdp9aWIDCXkDac6Pb1FZiPeeQLJ3m8j2LEE3
         0pULpreStSZ1q5AYeO1gOqkeFgUpP7ioZM2CJUtd5fzYzM7ro8fmLPgVPCTzWqtNECyK
         PQ3G3w9h8s+99PHgh2okkULjJb8zEgSboC9XNLAk1MYulsOYTuxtrifCZNZcGxdft9xS
         Aa/jhaDoHWFadHy45KJ90yx/rnTv5LckyR4i6zDLVY3vH1cDAAjcadZyIiO1PwWfLXqx
         aFI100EKJD4AC9ulDuc8xIX5p9KncYUnP/G6wTr9tTDCiMzUD2h6izNZmflLq/E9IKVU
         2GZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730971882; x=1731576682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JeMAIR9iEI5n6d08kWR1HWHfaPm/uZGrAZ7QGzkzYV8=;
        b=KzQUrCygLqpd6UGJZZyiDDOIXVsnB4RfnbzzAL333CjI/8c/SrI/D3LphYkxnGSM+o
         SIODpJD77e8qXgY9OvF9NC3j5xyewCbsZTbi4KTrGWxaEzBGefkVjAiJ63GQlAtrzVYL
         m6Yda41FaGcaVpwYEqaMg9+7VbkFBjO94H7tv3VfbotYtv9JEauXMsl5COqap732DSIm
         q233htKHBGMCfbyIAf6Tt0ozMytcbpHhmARO1yLwIF9WTMyi61qsKCtrlXy4ijyJPzGP
         qW9unsEa6TyvJkjLtTSinSSc5GB3ga/qlrQEtB/f295dADfgoE6YW89PiTfrubNMDfK5
         3N9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWShJPPb7EER1jgK+UTVCLAx4D/eY/A178RQNzR1RLSlNHSjP00FvnkxcFeBacRKPw0F+Z7LojaRbc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSyknwvQ+w0vVPAKXimr5VQZLfe4TUm2jig5LuYNMge88ag1VI
	PySnxw5l1DvdIM5ZwTLlJTyI1so+JaUPmtuNW4XlpM15gH45/jef
X-Google-Smtp-Source: AGHT+IFrRRrnlLAowFtunzpTvMHx7ihaYENBpR9i88LgwFXGyQ6Dgby+fj35g8yAa++m97kR3E8MSA==
X-Received: by 2002:a17:90b:5444:b0:2e2:8995:dd1b with SMTP id 98e67ed59e1d1-2e9aaff9a68mr467311a91.3.1730971882207;
        Thu, 07 Nov 2024 01:31:22 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a4fae10sm3015116a91.11.2024.11.07.01.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 01:31:21 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 181048015D;
	Thu,  7 Nov 2024 17:37:59 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH] mtd: spi-nor: core: replace dummy buswidth from addr to data
Date: Thu,  7 Nov 2024 17:30:16 +0800
Message-Id: <20241107093016.151448-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_013123_792587_6AA45D21 
X-CRM114-Status: GOOD (  12.31  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

The default dummy cycle for Macronix SPI NOR flash in Octal Output
Read Mode(1-1-8) is 20.

Currently, the dummy buswidth is set according to the address bus width.
In the 1-1-8 mode, this means the dummy buswidth is 1. When converting
dummy cycles to bytes, this results in 20 x 1 / 8 = 2 bytes, causing the
host to read data 4 cycles too early.

Since the protocol data buswidth is always greater than or equal to the
address buswidth. Setting the dummy buswidth to match the data buswidth
increases the likelihood that the dummy cycle-to-byte conversion will be
divisible, preventing the host from reading data prematurely.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index f9c189ed7353..c7aceaa8a43f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -89,7 +89,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 		op->addr.buswidth = spi_nor_get_protocol_addr_nbits(proto);
 
 	if (op->dummy.nbytes)
-		op->dummy.buswidth = spi_nor_get_protocol_addr_nbits(proto);
+		op->dummy.buswidth = spi_nor_get_protocol_data_nbits(proto);
 
 	if (op->data.nbytes)
 		op->data.buswidth = spi_nor_get_protocol_data_nbits(proto);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
