Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D972EB64DC
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jul 2023 08:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6mkrTIaH1Ijo90Q1XOHscBGJFddc+zqrZoInCKjKGEU=; b=2vQI9XNF8J5Glx
	4Mc4qa2LPSX6ie58QwsPWuRI0dlCiB+1xrKMyAv7Ae0JiIZr76XSWissHgpj6RQO+k3pMFTButrC/
	Dh+0+RforWFlAw0h+sR8REsZb3XcP02FSYFMVAeAgI6PTs988dCBFyl6B6p4isnBMdQg/3I9+1322
	Rwcq8xHC3DZKCkpyiOSleRmmw+IlK1FudYaAfoJ+noW3jqkONtH76H0mOwOpOtDSYtz2JMySQaFG4
	klg08XiRlDmsmlXhNa42dBNnlpEXwewOmxhFt1MO2qiqwjYD1e12Fh1ALEIKxs7aXsxP8OwgM9j0E
	cyU3YNrXVuSiyFUkPx9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN8AO-00GAFo-2p;
	Sat, 22 Jul 2023 08:40:44 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN8AI-00GABw-1y
	for linux-mtd@lists.infradead.org;
	Sat, 22 Jul 2023 08:40:39 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-98e39784a85so803535166b.1
        for <linux-mtd@lists.infradead.org>; Sat, 22 Jul 2023 01:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690015237; x=1690620037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkHM3RFGQ0WIr5v2TWHAHkTdJrhHVucyrUvsad9WfOo=;
        b=vRimpBOHp1L4wof8poOTIEpL8OUE8DOYT7U0dk3OIiI+euEJnyezDBX21g1cbp2Bg2
         VMIuHqxT7nFfa9vqrACBS55vEGN7wsvLeRVWQQeiayOJZcOyk2SMvSBa3HqDMB4C+LV1
         3kZZfkUrIkeDXV91UHlw60ILSW/Qcxawi5xT8yYZRdFQPx/Lc8UQG+UMeXhgGPxqawDw
         ZMw7ppBwctyGSUBIgEWS0EYTfFtkIo5uGqwZX079YubDF2vjiI2T6qd+8L4p7SbHWsk/
         E5IY4rL7WWn9Z2KwfvgxkJhpWdWBh6kZaPAElZsMI45emieBT74VyHilB9OVAQSHb8Ci
         hCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690015237; x=1690620037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkHM3RFGQ0WIr5v2TWHAHkTdJrhHVucyrUvsad9WfOo=;
        b=S/NoXqJzGYT4u93zvE8feqtMzTbPrXc7lEt/ulEm4oP+BPljlwByBO7D07ylDHvn80
         PJ09aQMzo4L3eH6vmjIZ7x3T8qGKqwcfcZJgRvj/nm3729rTvH2nhbo4XZWYvAcu2rJ0
         KQ+g4+vS4vg7F8qONiAjwLD8Rf1774fqwazcidksBvALnf1haUB+5rAoGvlVxow+A4fT
         g/TWFAVmVlupUdAouu0IpkOy34cC6qq5ue0sU6aUmH/bz3Azq+SdwZNar45H1RUi6lya
         0bSjNXEM9sMKBqTqBCZdrfsbZBHIji8X6uTQQ0ddUSIg76HM34QU5oS3JONjKmutxdPo
         v37A==
X-Gm-Message-State: ABy/qLY/9l3TZUtumkHEuzGU9Vb5/GBILIIu3m404OoPLuH5vQzKsZCm
	alhEtq8b+18dOv9OBOCtNVgdkA==
X-Google-Smtp-Source: APBJJlEk3C6yfEANJoJEFcZ7mnWGruo5N082AVMMno65jwWmpMMczKQ1IyWK6+BDMwK6pijWPlCiGA==
X-Received: by 2002:a17:907:270e:b0:993:e695:b585 with SMTP id w14-20020a170907270e00b00993e695b585mr4666497ejk.9.1690015237350;
        Sat, 22 Jul 2023 01:40:37 -0700 (PDT)
Received: from 1.. ([79.115.63.16])
        by smtp.gmail.com with ESMTPSA id w8-20020a170906130800b00992b510089asm3253861ejb.84.2023.07.22.01.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 01:40:36 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com,
	takahiro.kuwano@infineon.com,
	michael@walle.cc
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v3 07/11] mtd: spi-nor: spansion: add octal DTR support in RD_ANY_REG_OP
Date: Sat, 22 Jul 2023 11:40:02 +0300
Message-Id: <20230722084004.21857-8-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230722084004.21857-1-tudor.ambarus@linaro.org>
References: <20230722084004.21857-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1173; i=tudor.ambarus@linaro.org; h=from:subject; bh=ARtE+Fv/l4a+BkMfBrTfq2ov79VZLg+i8bYbcphxQmM=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBku5XjbqmEDqHMfs1PJlBNahV34jcDlLvGaPX+Z cKEiovvOcyJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZLuV4wAKCRBLVU9HpY0U 6buHCACtlNOMz7joEkDiwxVMGe9W9J1dOVkmWSjupR0a0KXu3VB2a88w1PHj7FhDFiy9h5mhn88 RftVhay8xwYW0Ar9iZ+0Ztx9GBYpKwiHOOhyc/c7DfuNQHL8ZmjJl+rMg3+bbfQRiM2z+nNew5g czhkgamz7pjWWws3qP0gh4luGXZeFe8FITa7AA0Z/NmGHdu/zPo39PcKIaZKJPO8nTy/PHWrYv9 5VEKb1iVfesv9eoRZCNUcnnt1WdgQ8FTcczZNdEPLhHvWJYIGIQMc6bdB6UYLw9+jLnEJQiWKA+ GtNGC+WILZs1DITtddgu3it7f/jWbPL/sKWabczIDxm8DAZW
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_014038_673986_F02A7414 
X-CRM114-Status: GOOD (  10.48  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

S28HS02GT uses RD_ANY_REG_OP to read status of each die. In Octal DTR
mode, RD_ANY_REG_OP needs dummy cycles (same as params->rdsr_dummy) and
data length should be 2.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 28d0a995f3b9..2fc3e65686b3 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -104,11 +104,17 @@ static void spansion_nor_clear_sr(struct spi_nor *nor)
 
 static int cypress_nor_sr_ready_and_clear_reg(struct spi_nor *nor, u64 addr)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	struct spi_mem_op op =
-		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes, addr,
+		CYPRESS_NOR_RD_ANY_REG_OP(params->addr_mode_nbytes, addr,
 					  0, nor->bouncebuf);
 	int ret;
 
+	if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
+		op.dummy.nbytes = params->rdsr_dummy;
+		op.data.nbytes = 2;
+	}
+
 	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
 	if (ret)
 		return ret;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
