Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678CDCED275
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 07:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MDXr6KXlttRnSw/RCOOdHl8768ED+fq2M35+/BPj+kk=; b=3aG3+XT1gIL9we
	VkpwhsG7nzAinBzaNQiHp62dfqqt5RjO1H/FpI6b8jyXnmd6HJf5D1aeaj0EiHm70avitBRDAwen5
	iHz5wg9II/G4oWRYfHN6eEfzmjSUlpjfZEAVmL9TXuKzrK0+5hbtabyg2gCo9UXAkbfXcXvrmr/1M
	szS0sjDvGMzd3RoJZiqCKAKeJ004cZa/ipxxq5NtA6xBHjePV/r6tLCdacTxb99DO7E2xW8FWdCh5
	QEJOKTrSUHoUTNokjauekMo6e55BtwWCDZcbUFTi3pvyfm5O5M8TwtJHYzKe1MoxpCUEeCVazWTUc
	ZjJTsTZLbn0JK/Ksl8RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4H7-00000004k4A-37aj;
	Tue, 08 Oct 2024 07:04:53 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4Fc-00000004jmF-0hME
	for linux-mtd@lists.infradead.org;
	Tue, 08 Oct 2024 07:03:21 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2facf40737eso57115091fa.0
        for <linux-mtd@lists.infradead.org>; Tue, 08 Oct 2024 00:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728370998; x=1728975798; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqCsg44tBpEIKTMwf8yZOmaXX9/g3lsiJW70OB7Ta3s=;
        b=b3iEcxd1Mp7JRN3xz3uxPlSDvC244oGrQtYAYgChZ5VEwGEU3LLO1ozmp+x7AMoeRX
         wc6GWJwjxpMREhFRIoYoBwYPqfc0Jf4m3ndRKURYzKPjfvM5NlUe7y53NBb4R9kG3XvO
         bWMDJLemrP50PtJFybyFVlvbaSssJ4o14LmXQ/8msBdM0rHJbtgVciPfPdJ79sso2YEc
         FlXLXwcXeE1EdQPXQoFSwa8tvb9MNOkNXXgan9DnJ/tkt7JjG9myeoDHPqWCEGnhE6+q
         0W2ttdLPqKAqG3uHsxB48WgWcfYKEWZQwy8nnvhyftOFHQJiXbZ7yVgAyj/vaI6K+3Aa
         MGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728370998; x=1728975798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqCsg44tBpEIKTMwf8yZOmaXX9/g3lsiJW70OB7Ta3s=;
        b=p4ZOo+aYSrA9AchDqBiabby/H3qe92lj8dZl4qm8zR10+oFHaA3eFj08Wpl6QegLpm
         /+2XpXaXVSK4znFT+5asoFRU7d3Mx4zDBarYCJvbkO807kyiLb+w7MY6y/hAjEZvrZnu
         aDZbZODqteWsNcnIPq0AFikgPbLb4KNSOIo11Iy/hICF5Qe3jk935tdeqWwdq7RxTtsG
         iPKU8hnGZh2jqJbO7x08bSAxD/umSKgi7vTbBXuwl5NIafrSdd/wIaKjUm3x2Xs6+cTS
         cWCc3Vfr3yLM+QCdNlN9xbgtJqws8bM+zm5ngrXQOG8dGSbEpm8oc2TauDFugKT15uho
         z5fg==
X-Gm-Message-State: AOJu0YwU3DOEMWsRWklqd2uYM5Fo6EecwLXeHOFRzFu/IFVBc7ZP63pL
	01zKpvUtKX20p0ryOfl5s0XiiMav9Do7eH74Ei3+/9twpi07AE+j
X-Google-Smtp-Source: AGHT+IEpK42WxgBmDByl49S3Rv1fsmpO7eFqdwZwlDNyECMz3g/TSdU1T92CRunXSrS2pbGvJRiLGA==
X-Received: by 2002:a2e:a546:0:b0:2ef:1b1f:4b4f with SMTP id 38308e7fff4ca-2faf3d98cb5mr68031481fa.34.1728370997499;
        Tue, 08 Oct 2024 00:03:17 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9ab1564sm10972441fa.7.2024.10.08.00.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 00:03:15 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 08 Oct 2024 09:02:44 +0200
Subject: [PATCH v5 1/2] mtd: nand: davinci: add support for on-die ECC
 engine type
MIME-Version: 1.0
Message-Id: <20241008-ondie-v5-1-041ca4ccc5ee@gmail.com>
References: <20241008-ondie-v5-0-041ca4ccc5ee@gmail.com>
In-Reply-To: <20241008-ondie-v5-0-041ca4ccc5ee@gmail.com>
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
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnBNkebjGmYRrtlhenm+K3h8wiuFZxvVSZrNvwD
 ArtFpwR3SGJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZwTZHgAKCRCIgE5vWV1S
 MruBEADehX3XFOMU22oAj4rCjhuoOpjY1i8KZ7VJFHpHztpYdurG8OpZNw2ZPWw3LN1gCGZiUqa
 pytKoyHppOK/HFoTv48/GQ64kAUWoyYFpYEKu0gyxBXy65U0zllfn9ER51Ed4BTCbPGn15V0ylo
 OUhYxCU5HIin7sEu7QyaO61mO27Kx08i+f27qS35/ROp3vge4MP15olSsF5JaJMjAHTf7w1nTAR
 JRAxQ+dJ3ldSSB2gDEeAQ13Tvq03ZWF3hq4g88vAhUZnH04hgdhtyN+0CuIKIy+lp3fg0YqR2Cr
 LB3YkbVRh77cjXJppZEZdQEUsvEyz3Z9vqrNsIvJJNXgPTPnQAXBQ8m+WyES/7LNWbo2NI5+lNR
 6sGBUfAe9xnJkameaw81NOlIAptgje6on4YAm9vDURoGWyphM6oKvQlrQuDVkkr7BUmR8IKWv9Y
 PqSpv6tvRjEuVuzHlS/PAsyazqm1OEP6gx6hM61Kbx3oXz9dLwpfa4S0ZTVxUK2VHO220IyxQZN
 W/Nci58Ixja/SEbtZaBAicrKouGf6rn7gR7rk6NLXQrOBaFbFICkebMYPngaj+ZeGEGOD7yhxe1
 tZ141OsiJOrrEMOwqgGhUtMsLWFN+g4r6WuzcJ12YY1dX2HABJLO7MUHvzCB6ea9yZQTgzKw0nD
 YouXThlSAhTsRvw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_000320_214697_2A286241 
X-CRM114-Status: GOOD (  14.87  )
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
