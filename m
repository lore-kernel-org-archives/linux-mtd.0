Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53849C5DF66
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Aug 2026 09:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iSL9ByR7kxDYNWP4Zlg9gUUQoJVSA3lFChGB75pn+A0=; b=HakZcs6B77zKQR
	Ji0bUpUWKaJCHHFIWhQ7DGozMRnng2m3NQ7BXgP0jc9CJLZfWh+qUQqFNMr+34UciUvdPOG8ZQ6x4
	m96KwrM7XxdmP7AGvVKlW5ImD38Ej1T1pGO3T/XhewUQs4h0e0c1piNOOMXJ9ERxAlT8UyGVRxOF4
	G/nzOHyDnpY/NdbqFqdnZ/FcgamJFtdi1cYgM7nQmPsB5u8NZLANoFbnTXmCqfKPjxdY0hdo2ztJ5
	ig4gec82wEzGXxCMXvtdrxUfVd3pn1r0wF00dXotLc7oGhewBQBfGniutK0m2B+F2Pyf+Q4eZFwYb
	fJRTKlTrhahI293k21Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvXDM-00000004c8h-3R2v;
	Sun, 16 Aug 2026 09:31:36 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvXDI-00000004c8M-06sz
	for linux-mtd@lists.infradead.org;
	Sun, 16 Aug 2026 09:31:33 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-84867f07d63so2413533b3a.2
        for <linux-mtd@lists.infradead.org>; Sun, 16 Aug 2026 02:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786872690; x=1787477490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3sow89GSV5jpBqPfbfCrprpxv/6mc7o1Uw/7hLLW1qg=;
        b=VryTYICINBDUuPIBkrz8Kq3r9VK98EcGK3SYthwkR6mqhim8Qtq/N8DGcP5YMJPWYJ
         55nu93LncTKcsP75d9U5jmJqrBGUKj4QRBnI1XpMkCrTK8QE3h2jCJQGlNx+Jqp8lMY2
         9J+7rgGdjvI14Nb/ej6PQh5hEGA+fMAApxf8QwC9Twtlh5iJseR7nv2dm6JVoxLBTdqQ
         1DlO+bOzAdJUQ1BD3zJAzq26Rfdr5gEBC1wBot0Nzkd87oLDgsrLvBnu7FaMDXDCqEyM
         9lrRZsATr/EJeCReKSCAE2bPO+lmENg0TyXkK+J7+b3rjDaIK3QfdGNcsR1HUkmqRQAA
         B82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786872690; x=1787477490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3sow89GSV5jpBqPfbfCrprpxv/6mc7o1Uw/7hLLW1qg=;
        b=IbeWCOlqAIUsvmlHJq/5WFftBo1mtOzqtSvSbkPNNAsFovmmWh5zWZAViNt25NIJOg
         h0aHm1IoNuffwLPjhhNhdKi8tzRvz87hNhR/8TIE9XECzQHpOjzId9YLLH9mszMZYM7e
         6CNJL6m1A0TYffyWEJjc9+z9yw7e3M1rCU10Bux3kaGsFKO2+xpyNRsPtvZ0/ktC07Yu
         ZwxGOh/n6TQDdyFBrWTYA47LjhasH6pv4uJMIndJ2P6VMklWH6a3BwpcOciVYkgS1lVH
         VzimQDs6V2+ZNYDpbtllmU9c4AS313nX4DhHsvZAc3IuD4q6w/UY5OZ8D0FPrpTiq2NB
         zyNA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7UfPvKXuNycT/tDu5Z7FAHcZq+gNRkzygvAo3Gfwn+B0JD+tk4EfwP3mI0dOUHiLC3hKtdywvaIo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw01GeNVS2dzqUVEyOBzn8fyQ2Uyr2a6nkFyihVnYnYzN7jyv4/
	YiW+QvjZvtGXKHI1xoSPwON+zMUAjB8QJkEO+E6+EyC1B9PopsYZKf2V
X-Gm-Gg: AR+sD13TnFZRFCRvc0x9X4odf60O9JZ+te6sy2T3AFhliGCbpcwxPvzBJRtSmGSu6hF
	270NIX93lSDXDphgQyqctJNJCfHZ1JpEt8gx4GFewkpQGlkhY1sRaJoQv+6iSinT79p2p9HZ0S7
	Z9Z4FJh2xs9a/oA7xrECQSZHea6TvZImsUo9mXL8FqSPyDGB8lVVDwHOO2ywBZfxA65OLH69TC0
	MhHkY4GTsEUJFra3h9+mcjV14zPKeB2AT+/USoa3mO6PkfIFRJdjhA3X6voYyYiFVduYKHcoYpI
	mdT3uNsnAl+Ki9WZKbnwSklC7+yE9FQ/v3+PU764xYII8Xn5UfCyqHXw3R3lZw71IaTsMdIpmSP
	+GlBATITm8jqCmsRpUmK3s7wYa/61ErxpBaOSSxYDC5SvWdLnqSmZqtlAZHDmSSwcyU2ja5cLxl
	psV/S4u9z7tEB6pLdZ7UiORu2mpNHZuB/7KGJXKQD+wN/Rt7zpRoFB4OdZodWUfuQyr0j5P+yMv
	puHj4GVUpFfUXMtBwTYCu/Iy5iMOGf2kXmR59LX1zJQPid+5wIMbd9V4JxaxlE1YRgnAaNGXJaO
	/Q==
X-Received: by 2002:a05:6a00:2da3:b0:845:cdc1:a803 with SMTP id d2e1a72fcca58-84fddfe09a8mr16917458b3a.11.1786872690269;
        Sun, 16 Aug 2026 02:31:30 -0700 (PDT)
Received: from localhost (2001-b400-e339-d3d2-5062-d98b-71d5-8271.emome-ip6.hinet.net. [2001:b400:e339:d3d2:5062:d98b:71d5:8271])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d22a341sm1718052b3a.36.2026.08.16.02.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 02:31:29 -0700 (PDT)
From: Huasin Liao <huasinliao@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	tudor.ambarus@linaro.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	huasin.liao@airoha.com,
	Huasin Liao <huasinliao@gmail.com>
Subject: [PATCH] mtd: spinand: winbond: add support for W25N04LV
Date: Sun, 16 Aug 2026 17:31:24 +0800
Message-Id: <20260816093124.12325-1-huasinliao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_023132_071399_0194AD86 
X-CRM114-Status: GOOD (  10.12  )
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

Add support for the Winbond W25N04LV. Tested on an Airoha
AN7581-based board with the on-board W25N04LV, verified
erase/read/write.

Link: https://www.winbond.com/hq/product/code-storage-flash-memory/qspinand-flash/?__locale=en&partNo=W25N04LV
Cc: huasin.liao@airoha.com
Signed-off-by: Huasin Liao <huasinliao@gmail.com>
---
 drivers/mtd/nand/spi/winbond.c | 38 ++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 9b78c1e6cbc9..892220a12b22 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -345,6 +345,35 @@ static const struct mtd_ooblayout_ops w25n02kv_ooblayout = {
 	.free = w25n02kv_ooblayout_free,
 };
 
+static int w25n04lv_ooblayout_ecc(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *region)
+{
+	if (section > 7)
+		return -ERANGE;
+
+	region->offset = 128 + (16 * section);
+	region->length = 13;
+
+	return 0;
+}
+
+static int w25n04lv_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
+{
+	if (section > 7)
+		return -ERANGE;
+
+	region->offset = (16 * section) + 2;
+	region->length = 14;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops w25n04lv_ooblayout = {
+	.ecc = w25n04lv_ooblayout_ecc,
+	.free = w25n04lv_ooblayout_free,
+};
+
 static int w25n01jw_ooblayout_ecc(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *region)
 {
@@ -759,6 +788,15 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+	SPINAND_INFO("W25N04LV", /* 3.3V */
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x8b, 0x23),
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&w25n04lv_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W25N04KW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x23),
 		     NAND_MEMORG(1, 2048, 128, 64, 4096, 40, 1, 1, 1),
-- 
2.39.3 (Apple Git-146)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
