Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25772C001DC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 16:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=su6DOWq8EhrSgMneJAecn6EVCFIiaAUBh0Zj9QD7lus=; b=BxbhJhQXczyOZD
	qGRk42wfq1zFz2+3SwTePalJPCBX1aWgeEeD0QugGXzQRbkZcGOG32U0WX0LydzZAQgxREaZ5Px5E
	mSD98qnAM7xd8FYlnE2lAyO3SbDbiZDn/UhxdYWxqkFIHMTEQq35A4BHLxPWeHZ/O8tRT6Lp+j9/5
	21fZ+Gpklmu5AtNjKQXOkQmIliSFeIZQAk5ionn9tYNqs6RCGPXjM/xSXCA2pmtLH1VVnjNlUB1x8
	ffo6PIoOlyBrqT7cR/eQ+1jufTNTD8yg0sQ+wqkBc1jPdiYldFaQAhSz6eQ5SyMJ8Cmt3CxvBS3Jj
	HTi3XmRVzRzgrFbtQOlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLRCj-004Yeq-13;
	Mon, 17 Jul 2023 16:36:09 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLRCg-004YdX-0d
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 16:36:07 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742eso49755655e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2023 09:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689611764; x=1692203764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F8bP/ypkDEicRqegK1ckEg3dKW2SZEz72dtAjxisDjE=;
        b=Uhz2RKXFF888YxPlPlECu1mLqH98lSlnqziMcnEPgZjWbxMYgREH+eu9F7OU0PTzqB
         XEFisE5XjxVXToJrXeD806zWfZxDdTq6/777B4WBT2KYhobutH0CbrJsoFM6iJupF4/5
         gVOv1uX6J1gO4u+Cl3AYc+RAJf2gMJp7kaZHWDIEVRnWpyy4lmoh1KDK6cKwWH4VcGxw
         LCw4Z/sSzew+0GhbwYNtdPfPJeOwIzn7L02hyLmNc8VWfGgg+klrO1pPdyAuuV5Lr9wy
         VURBq8n/G+ONJ/j1750Fe7HDHt03Kj1wtH4wKX4cZsMAYxHkGfP0vugrG4HmgqUj5z3h
         KVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689611764; x=1692203764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8bP/ypkDEicRqegK1ckEg3dKW2SZEz72dtAjxisDjE=;
        b=VMVjYJlLE0DMz03AKhiwZd7xr8KdCq3nmltmhp82vaFNrWlp0LRh9uN4hpiZZW0yzb
         wI/cVJegmU1C+RmMQr//2i0tsSKzDR/E/5Vn94lbrVb8qesja9MMQjKpP5JBcUvLcRAl
         ZL3Il1fWYkmjPIa1NwpfmDJA+sMCkXVFl+/9+54G9phWK+/XQkze26CP4bxdud6t0zTa
         gm9yIJOxMauB6uGatCS+rlW4iPzzgauyL898rPntjxrGOp6D6/ypAz8l6f8zqyaVJlDd
         /NBM8RP62xF9Nvo2znJ8nvRE04lkm3lvGVGnG6tqR3Ewxj7igBGwrj+7dropjG/6KdCl
         50mA==
X-Gm-Message-State: ABy/qLaPshNBVodfsGq5Lzd97Vkm+m68MxkZfW6NqO9P1Rs3d+7dABgs
	jojC88jgQ9UHPunBGZY04jsd8A==
X-Google-Smtp-Source: APBJJlHQJOUxudXuvlRKed/GyjyonoToL8pJYFeXFNoiFadNnfM6DgMYmIUqpPPm//OTyTMqQT/46A==
X-Received: by 2002:a7b:cbc6:0:b0:3fc:70:2f76 with SMTP id n6-20020a7bcbc6000000b003fc00702f76mr10796513wmi.20.1689611764148;
        Mon, 17 Jul 2023 09:36:04 -0700 (PDT)
Received: from 1.. ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id t15-20020a1c770f000000b003fb40f5f553sm8401774wmi.31.2023.07.17.09.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 09:36:03 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	pratyush@kernel.org
Cc: miquel.raynal@bootlin.com,
	ichard@nod.at,
	Takahiro.Kuwano@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/4] mtd: spi-nor: make sure op does not contain garbage
Date: Mon, 17 Jul 2023 19:35:57 +0300
Message-Id: <20230717163600.29087-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291; i=tudor.ambarus@linaro.org; h=from:subject; bh=Mux36ybHfWkJ7tOaNPO0Gnmji/GnoNj7exBtCMurQb8=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBktW3vahCdxQWTncoi0ZBa7DE+e/QRLIPsH/eow P4JtOpNHV6JATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZLVt7wAKCRBLVU9HpY0U 6a7aB/9a81EmIo3z7HyaYE9kWA0DWCRW/eEmldo1PKGx3CcEZbhoesaemawa5NAIBE4zVzaeuPX bMVMYXEvaZnbD2XNqFDsXaUuVATmn533/BZGYO6XS2TGGFfSRFT24EXlJB3JKVOdbj8f4Cxnh+h h49p20eTTCiIERtz4erDXS0zppR4tz7stR7dP61Q2z0tutUk2VU6x9eb0nT0/nAAU4ImvoQ22sa 7hZwf/hbdnFpt/M2nfYdb1g2M8rYY/Brh5WwQUG2MXXz1A0uUvYYJXRIsZUatxlKNgvCkOkhWW0 q+RStb5mr8oj7aQDnAdktcMp13AaVp5qDb07ou26ALgkuIEz
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_093606_252998_0FF23099 
X-CRM114-Status: GOOD (  11.13  )
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

Initialize local struct spi_mem_op at declaration to avoid having
garbage data from stack for members that were not explicitly
initialized afterwards. Zeroise the local struct after the first
use, so that we have it clean for the second use.

Fixes: d73ee7534cc5 ("mtd: spi-nor: core: perform a Soft Reset on shutdown")
Cc: stable@vger.kernel.org
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 273258f7e77f..603791497523 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3235,11 +3235,9 @@ static int spi_nor_init(struct spi_nor *nor)
  */
 static void spi_nor_soft_reset(struct spi_nor *nor)
 {
-	struct spi_mem_op op;
+	struct spi_mem_op op = SPINOR_SRSTEN_OP;
 	int ret;
 
-	op = (struct spi_mem_op)SPINOR_SRSTEN_OP;
-
 	spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
 	ret = spi_mem_exec_op(nor->spimem, &op);
@@ -3248,6 +3246,7 @@ static void spi_nor_soft_reset(struct spi_nor *nor)
 		return;
 	}
 
+	memset(&op, 0, sizeof(op));
 	op = (struct spi_mem_op)SPINOR_SRST_OP;
 
 	spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
