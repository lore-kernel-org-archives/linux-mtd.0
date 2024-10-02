Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E047ACF31AC
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Oct 2024 09:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MDXr6KXlttRnSw/RCOOdHl8768ED+fq2M35+/BPj+kk=; b=iXzwcj4NfycLP5
	gwAtQtEmaKCOGKxyHzL6JE1PJHfG8nIpaznJ3YQTXMX5Xz8rBXqfWv3UZF834mGTzqeG7GtY3fkz5
	Tz28IJiLM+4p8AM+gliSsnnCWMxBozF8q9qIT/5R5jVMVRC9AtCW4VlBQxZ3YmAaxp3KALUFmP66j
	KrfjC7CDW8c4IhWdqBIpAZu9pk7ywDW+B6KmDramhKWCmqKYt6lkmzs6DTsfKfAwdeFiuNMiok7c3
	h4yyZSjTu+si+K2QBIUth4uR4iGn7dybpgKZZnIIuw2tJ0p92hBmZpk8VQGs2hn4ARkWRaPsg8gfu
	JATbq4wGUEzYWyn99d5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svvFH-00000005FTB-0qOI;
	Wed, 02 Oct 2024 09:02:07 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svvFD-00000005FRL-3yLk
	for linux-mtd@lists.infradead.org;
	Wed, 02 Oct 2024 09:02:05 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5399651d21aso2729040e87.3
        for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2024 02:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727859722; x=1728464522; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqCsg44tBpEIKTMwf8yZOmaXX9/g3lsiJW70OB7Ta3s=;
        b=EVw7JAVSvndQ+pOoSNCQHBdg48Q/ZshvILsmk8/pk8H7A7bmGQtAWa09MaRSnfz61P
         n7IfjpiusRVRFnmxF4EtXU6BozhuQUFC/fDrbz0vimGJvHQYve5sMlho19yZ3tsjX19w
         ZrH6hmpF6aIgF6rHRJoL8Wenmv4rNRU3+C2bHkJ2IvB7D84nYkhHLndT4AU1hhaHk5iH
         eyLgvtkp61xw4EDFw+VXNZS5YOzgxdVbZIRZqz3Kkb3CIFAPVK570JzmjgygVpGsDh1q
         zOSE9b+Ls9FvG3o/YMQetg94k7Qe8/6agKuy/jAokadwmABG/N0LnkCTI2HgsgfgcMBX
         85dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727859722; x=1728464522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqCsg44tBpEIKTMwf8yZOmaXX9/g3lsiJW70OB7Ta3s=;
        b=Fk8WtBeXewjmUW7OwCU7JUXcrYbDUFw4u6JIUiQNJ9nvqrNg+BOTkAJvDb0kBrcOoD
         Dv2KXRPdyeilHLAHZCCO6ATGFd8YBW7pRSBbqMg+I703L+jAho+HA7ujqMhCqRSwUPxs
         6R+Ywocan+CZTe3XgxzFLlliHCVOd3BuAcmzHQ6o7/2Nr9+bdGnYDJRZw8nPZpH7mgIu
         V1gg+sk1R0UYTnQm1LvtfiVbr8AtlPxs6cNEBkNYGYdUT2dZq36FINEnZbyoXHdz+SIk
         3MH90WrkvX1CPabg2Dz5D5PhsFihj5y41KVlX+CfTuhjPlnWK+WMpzl+cMzF4oe0N2cK
         tnHA==
X-Gm-Message-State: AOJu0YwJWzRsfXsvxiTw5f6U/asjGIFRxvllyvIvVWXdiNIwY3MAuzkp
	N76Y4Q9QNRef0MdQBybZE85bd4KoByp7DFDY2rvqwucHIBDuNkVE
X-Google-Smtp-Source: AGHT+IHjviN380Pp6qWXhdhusVCqvi5yTuTTpLcAiPqKXlHfeD3P5nLoR0Ak/54fJeBl2C3coR7BiA==
X-Received: by 2002:a05:6512:e9a:b0:539:958f:1b8b with SMTP id 2adb3069b0e04-539a07a8926mr1231265e87.50.1727859721623;
        Wed, 02 Oct 2024 02:02:01 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd5e35asm1846796e87.85.2024.10.02.02.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 02:02:00 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 02 Oct 2024 11:01:30 +0200
Subject: [PATCH v2 1/2] mtd: nand: davinci: add support for on-die ECC
 engine type
MIME-Version: 1.0
Message-Id: <20241002-ondie-v2-1-318156d8c7b4@gmail.com>
References: <20241002-ondie-v2-0-318156d8c7b4@gmail.com>
In-Reply-To: <20241002-ondie-v2-0-318156d8c7b4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=PDm1f5NEBuhwxeXGvwzqxiOMHTZXe7TWbR431qOgkS4=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBm/Qv43YX/2P3sukVbRasUZMx6dKxjhGPrFgfVf
 KUfT2lsozqJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZv0L+AAKCRCIgE5vWV1S
 MlLuEADUsGNiGCfepQjcAvRqERhoDTlGdHv+qa/i8b9LGFfJK/PsS7K4f8VBPWVSNtunoU5wYag
 zTz5i9C02Zfpsf9X0b+OLlTJrxfAQrksQYpLSYVwJQZi8R/ME5uQHYV6yxnEl6tG3iEd0mIb/S1
 yW5ddFkCioIHPGhuAdVOPmzfSg513NTA5prI4RsVE3yk5z41T6AoHqV1J5/p4XrVmfrxiDXYD+0
 xLoPlhssJudHqbv0aVd4kJsQG7zRkjhFL2qlQ0qcVEnRxXpnrlrhvClUO3TC7yeA2D7HUS60CnP
 +EmeIxOuKLQ6Z4MuYATPnq1a2S88sEb0U+bN/XyIhusLJK/ev1vBHa2AVVmmBliIhcQ8WBHv7W8
 eHQ/ogFs3Qm0S8gTAYwdva4hbCrHAxM+Sews9jZuJMr3iSUmELp3RCJq26zdqphyhXah/z5bDDU
 YzG3LW6LuKvlb1D4T72mkAI/yP25RZpDhfebZWqZcaL3THkDSjNcYWqqXFxBaAGU3mWM0qTdkSP
 vxa4fyNPSXVGjxn6qx0PZJ47lknAh9IDDaLJ9ncUmrzo9i02UT3RGhftt26D5C+K+evK7VyRplj
 Zl2M7Wi+JxDulRSNqwFjmbFJ2Gyaiuz7h8DpstMMpK2Y+ovs4EcUfReaXHD+ehhsofHyZ9SGXNW
 KfAygC7/840d1bw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_020203_993724_5AC609B5 
X-CRM114-Status: GOOD (  15.03  )
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
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
