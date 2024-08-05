Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D66C3DA7F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2024 17:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SS0VItMzp5vYI8Mi0/yoZZ8YGNBaBRPkgY87yQWjwVo=; b=GXZQ0vBVYTskaY
	GoKUipo7FZDkCl69IcTHKdLhW0CYIzc/tnkgJx96miFJSJsyX2/RfwwN+EpJvgvSt+qivsAyx960/
	dMeNLwR8yfN8e01PhfEAjOZaxZ8r+0c4jQh3oWJcZaqzu9hJI0ylZ2iT70mO6fY7OLWSP5MkBCXVO
	zu+3wVgV7l9PICPXwAYY6NZslAH4y8+B2u1iQuM/P6174lj/ixBqkIZ0Ri9/lyDhdqVv9uJU4Hm17
	RX6Lvq2zh+R+F3o5XzJxnppWe0Sl/DG7IJo4/wFy5qjUv/zOXUqx4XUSHVu4B7+7ETrZOWd3RED0M
	76S7ZoDKZtbBzZi252LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb1rq-0000000GlC9-3BZ2;
	Mon, 05 Aug 2024 17:51:34 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb1rn-0000000GlBd-2lzv
	for linux-mtd@lists.infradead.org;
	Mon, 05 Aug 2024 17:51:32 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5ab2baf13d9so14717585a12.2
        for <linux-mtd@lists.infradead.org>; Mon, 05 Aug 2024 10:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722880289; x=1723485089; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tkVJE+4Fx6/uTP+LZJrDSqoUHx3l2UcP7rIRvO3yBOk=;
        b=AHCEuVVsR37MvFf16HDAb6716Q4IYvO99gUgUKEaXlh3jgXJHCDSQUs2zzCYm6Ntul
         CPjVEo5K+1h3PDm+4paVZIrfbKfUAKPb503xnoBwM/9P5RdDAP9JDbUYcBI6XqJcHvMh
         gU0OOuori1KsJ3AU4dJPM3yBTgZtATWnShE/SAeShee4ywzz9yWIDfE6kjc6MB6tSJRk
         FeLmF5EDTRtyU2Ie43gf/bI6skpxmwbRvdkeT7x17aPfHN0Vq7KU6JmdNmhV8cTxMNaf
         6JUMkEfen+4H00RaxUKWgk9LJbAdW1BVihzRPf40VK7rppoNwVKsAv2Igtmk77DBt8/7
         nLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722880289; x=1723485089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tkVJE+4Fx6/uTP+LZJrDSqoUHx3l2UcP7rIRvO3yBOk=;
        b=tPOZy66hGL/M4EQJ7y64S3noMd2oGoKdVOB3F7UUhTvZlUx2u2mxjJ0Ae1LGp4iu7/
         vtiH63XgEFLWRP5h7UrzTU/Ay9CpgiZTTITDi0+VPvohPM6BVhga20HpIXqyuLt7sv1w
         HS9V6NklqWFZ2kGhVzcE3FPw8BSeg26Hlfj2wjPidrim03Z2xO7JEz5+f3khDBEdmPI0
         kXR0MXipKsVBFptZPeyCqLDpyfuVwosyghjO3HKZLU94BNHuoJ8w6FGWsWf7apAIochr
         Jk0julSmy4lgwgA6rHqpS1s5RkLgY4Vql9MjjOQNOkLujbwYMlXxd5S8e8JSV45YgRUM
         BFDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3fj6DxzE0dGkqAnuHs2BB14rtYdXUn7555XIxn1WTK2e0RfIXSQadUoMoWW/4NA1HVZrWGzWEuHEHkpMZw4O2m/RMr17tPfD+J9NuNA==
X-Gm-Message-State: AOJu0YwoQUNx82a2V3mHQhbwy2FEL1OsH6kurd41I20axHLNZQ1BgCqm
	QOdpDwuhQoTZksJbcHSR7SZIu9FMPF0LMDhROUSL1/DtXQic5Hwl
X-Google-Smtp-Source: AGHT+IHjO4GgAgcN5k7pxECHz/NsgP0x2hgZBtlquP4Xx433OfXJFukMMot6pi70owBA+ZhTUVZ8dg==
X-Received: by 2002:a50:ec8d:0:b0:5a2:2b56:e090 with SMTP id 4fb4d7f45d1cf-5b7f3bcf9aemr9258970a12.13.1722880288807;
        Mon, 05 Aug 2024 10:51:28 -0700 (PDT)
Received: from fedora.. (cpe-188-129-46-109.dynamic.amis.hr. [188.129.46.109])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5b83bf3b21dsm5148453a12.89.2024.08.05.10.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 10:51:27 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH] mtd: spinand: winbond: add support for W25N01KV
Date: Mon,  5 Aug 2024 19:51:02 +0200
Message-ID: <20240805175125.6658-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_105131_720682_030F1E7D 
X-CRM114-Status: GOOD (  11.58  )
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

Add support for Winbond W25N01KV 1Gbit SPI-NAND.

It has 4-bit on-die ECC.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 drivers/mtd/nand/spi/winbond.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index ba7c813b9542..f3bb81d7e460 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -76,6 +76,18 @@ static int w25m02gv_select_target(struct spinand_device *spinand,
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
 
+static int w25n01kv_ooblayout_ecc(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *region)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	region->offset = 64 + (8 * section);
+	region->length = 7;
+
+	return 0;
+}
+
 static int w25n02kv_ooblayout_ecc(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *region)
 {
@@ -100,6 +112,11 @@ static int w25n02kv_ooblayout_free(struct mtd_info *mtd, int section,
 	return 0;
 }
 
+static const struct mtd_ooblayout_ops w25n01kv_ooblayout = {
+	.ecc = w25n01kv_ooblayout_ecc,
+	.free = w25n02kv_ooblayout_free,
+};
+
 static const struct mtd_ooblayout_ops w25n02kv_ooblayout = {
 	.ecc = w25n02kv_ooblayout_ecc,
 	.free = w25n02kv_ooblayout_free,
@@ -163,6 +180,15 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
+	SPINAND_INFO("W25N01KV",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xae, 0x21),
+		     NAND_MEMORG(1, 2048, 96, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&w25n01kv_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W25N02KV",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xaa, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
