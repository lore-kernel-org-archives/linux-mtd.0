Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5EFD4335D
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2024 13:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pB+lCClpETuSTNYB52D3Z/A+dyEc7Q902q6qmdSg/48=; b=ljon41POgj5glM
	2KhZZpzY3MiOCWzqM3DDAAFlrZyh1cx+XSGb29Xu8ywKZ5zAku4PEvpEs6YR5kj4F/Z8wJREh5mWT
	NmkAYLULrjJGtXbkRtlDDqh4/13HkmUP+7i1ab+OrEvGfy2RANAZ2VMAXc+3aF1ouWZ3VkZQhE6wW
	kd0ksCuJupz5gjt6sv3lxHSFv4yR16z37rAJC9Z9tnAxW7KakbVvdFNi4gI4Dqmh7r7BLMx/oAT4M
	YizFk5dKWv83cVCR6WEGKsC3Zx0w263/5HqgZKXAzdX+5BaShiJ6Glo97N5bYLzA2gCjXaHRKNrzf
	mOK2kiITFx2yBIAXUJDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t92rM-00000007ARi-2ASd;
	Thu, 07 Nov 2024 13:47:40 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t92rI-00000007APm-2mFE
	for linux-mtd@lists.infradead.org;
	Thu, 07 Nov 2024 13:47:37 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2fc968b3545so9068221fa.2
        for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2024 05:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730987255; x=1731592055; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smTKmYgVjf2tZh/nJwAXDtC0KskLoU7un/mwCANgBrg=;
        b=foxgK0hAhnszGdSBDHtA4PaUWop4xZr4vB5aBeaZLgeAl2NiaAlCsOXQuiv29NQ7o4
         yyFa/gKHMH+9/f4LoR00yEEyjyc0nFvKYsG+sp11vSvF774/aG3TgnTZ9JlnQ+yYC0+d
         IYh0WMJO4BY34zdpkSGRbQrFikkZs7e6H+nABOx35qgLfqItNeAOdenINeQs4Eynznn9
         iQlRS9lf8p4tfYiJpq6RRBNLrx14vcgp/nLbFNBZ+UU+Lx+j7mvBD11wKfdqYVWX7Q2v
         zp6C+B+L54m4U+FwFyo+EQDw4T5I3hfWVXIQNHWSVpXw7O99Viq2Wnbodk4xTj/9clQD
         P7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730987255; x=1731592055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smTKmYgVjf2tZh/nJwAXDtC0KskLoU7un/mwCANgBrg=;
        b=krLIIkbXLjCKc3B5IsPmKiSHkkZNjPSeNYQTYEcSLzlYr21Y+PuWFrjVQ7vpXm/mO8
         K7OInS9WTAUpoNyldotYYtSPcDnFC+t/ZIJ1htwnHEi9ibSoIwL71FGuoFHeYIqXo4/X
         qv8GkqmB7NokjsolZkWUj28Dpv43f/Pgz0b7rdZdEYmICHDgdeA60GBcecI0aPo801s3
         5VLzTkp/KFGyS9nRl0i6gNGGfMHBk+/dXAV7PaFqcIexEnqK8D3AbxsdbLf6W1gKjt8I
         COikNCXMrAPOqrrE0R5ySINnJEfxEE8PZzB5t1jxX3eU8gZX+tpkcn82B/8ydX+Uh8Ls
         KYWQ==
X-Gm-Message-State: AOJu0Yy4FAankSwyqvjMsYyBLFRdSgerqns3x66Tm/DpaaQ/HdMVNJdI
	5si0cqm/QSJuYW7JUCwiXKpN680vejAua5+XzeuHLD9Rm9mfO94G
X-Google-Smtp-Source: AGHT+IFhbSo5pXZ6+Sbeo6H9y9g5iMqsCOoUVCmNbcBaUywv9O9gtHsU2QUKclCRiOp0TTaJsxBQSw==
X-Received: by 2002:a05:651c:2226:b0:2fb:8de8:7f9e with SMTP id 38308e7fff4ca-2ff1e889520mr330911fa.1.1730987254965;
        Thu, 07 Nov 2024 05:47:34 -0800 (PST)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff179d80f5sm2276591fa.105.2024.11.07.05.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 05:47:33 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 07 Nov 2024 14:47:07 +0100
Subject: [PATCH v7 1/2] mtd: nand: davinci: add support for on-die ECC
 engine type
MIME-Version: 1.0
Message-Id: <20241107-ondie-v7-1-98829fc8a958@gmail.com>
References: <20241107-ondie-v7-0-98829fc8a958@gmail.com>
In-Reply-To: <20241107-ondie-v7-0-98829fc8a958@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=aEezSAYRZux5sp8R/V/BZi69L/f49HVcP44j8wR1Vf8=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnLMTomdUX6qyJCp5iC5mJbbMGc/zZt+dO48AXd
 cJzzvAvBlOJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZyzE6AAKCRCIgE5vWV1S
 MrR3D/sFuhOd8C3qeA1eeAPtI5jyaqZ501Z7Jvnijo/eKG2sexB2doGkM5mDbHfmanCYTEaX6R6
 OfVO03LCSAqElMilqYG8q0o8hfo2Ad/dmDg58tjrKCAqaEsiElMjdr5FpI7Q782s3XnbZ8vq5Ih
 6SlzQwyMLQxeJMVlaIUVYnm6gh5X4y37NHABs7Kr+IpbpppUdcHjyxc6gUOZQFopGA65uQIaDZy
 X4gc0yO8d+qxyRTpnZkNcZoLz3TyyakL3ikVLYXkxjryeLYF9p7bO95vXytU4Zi1SLNyyJ6hCdW
 KV1rItkX1Id4+3HyqWrEii90BIw/CzoVoCOUSMHxSc//BKihZgFznpbLuJXHCWh/afTzBvMuH6B
 Z8zp+knjRwbcfgU5vpkiDSvMTLrM1xKL2wvmwcy2P+mJiAYDYo8VMJBUOPV8eHAmMQwM9KBXhge
 NhhyD5hRC8Nlq03Kju7D+IMnB+M3P+9I3CNrh5BxS0W5pkaMyIiJDcZ5mbfTEGa+D1RtHq+X8xe
 dLHMUdHHBpe2F/fZ7jMJ1/PW5iuq1xyqyb5yGHDfcLVTBycTD9UEojc5drZlHyyz50YMs9Ueoe5
 W+FW0e5ZT7WXTNHG5u5TP6RZHRkpsdfAzg/6OHTridZcPbUi5i6hkUE8mID/0j2Y9UGbVQI/u8+
 7qd1Wm3wWJnLchQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_054736_717943_F1F11DC4 
X-CRM114-Status: GOOD (  14.31  )
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

Some chips, e.g. Micron MT29F1G08ABBFAH4, has a mandatory on-die ECC.
Add "on-die" as ECC engine type in order to be compatible with those.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/mtd/nand/raw/davinci_nand.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 392678143a36b20b42c1827eee8203dc2e41889a..79e768d337ae12f6e8d7f21f1acd4e259f4f3020 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -66,6 +66,7 @@ struct davinci_nand_pdata {
 
 	/* none  == NAND_ECC_ENGINE_TYPE_NONE (strongly *not* advised!!)
 	 * soft  == NAND_ECC_ENGINE_TYPE_SOFT
+	 * on-die == NAND_ECC_ENGINE_TYPE_ON_DIE
 	 * else  == NAND_ECC_ENGINE_TYPE_ON_HOST, according to ecc_bits
 	 *
 	 * All DaVinci-family chips support 1-bit hardware ECC.
@@ -524,6 +525,8 @@ static struct davinci_nand_pdata
 				pdata->engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
 			if (!strncmp("hw", mode, 2))
 				pdata->engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
+			if (!strncmp("on-die", mode, 6))
+				pdata->engine_type = NAND_ECC_ENGINE_TYPE_ON_DIE;
 		}
 		if (!of_property_read_u32(pdev->dev.of_node,
 			"ti,davinci-ecc-bits", &prop))
@@ -580,6 +583,7 @@ static int davinci_nand_attach_chip(struct nand_chip *chip)
 
 	switch (chip->ecc.engine_type) {
 	case NAND_ECC_ENGINE_TYPE_NONE:
+	case NAND_ECC_ENGINE_TYPE_ON_DIE:
 		pdata->ecc_bits = 0;
 		break;
 	case NAND_ECC_ENGINE_TYPE_SOFT:
@@ -914,4 +918,3 @@ module_platform_driver(nand_davinci_driver);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Texas Instruments");
 MODULE_DESCRIPTION("Davinci NAND flash driver");
-

-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
