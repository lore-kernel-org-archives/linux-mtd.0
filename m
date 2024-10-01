Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC471CE7D10
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Oct 2024 10:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tlYD6NF5PrD48NmrkE9QIbwNh+ViqVSxWGhMSesKp2w=; b=N4YN+VCZJB5tTa
	rtsTEI35FHtEUC31lYI8DEvRUnMa9dn7b+j/nuV4A7LN3/SzQLr/+gk6NsJzORGcASheu3B4wm6wd
	dLDv+JcYrLE2a3IUKcexqis+GAG6QL4b9NnMZWaRoZI3GFqufaQtnNUf/2Pae2W8OEanWLybmWSLE
	MDW52Lpy635v/9cqglPGXRbyECnq1Tf/V90oub1rMAhAaPeLtReFLmhf61RpoM0dQxx2Jqhv277VP
	PNzHFC3kY9/rTNDbp0ihVpge7CzpOHwkAZsR0c1Sw+dVJSX47FuGBcG9czMF4L9ukODPu2Kp2onDT
	2hUscLywLJYcEpApTzvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svaOu-00000002OhA-48ty;
	Tue, 01 Oct 2024 10:46:40 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svaLP-00000002NeF-1MzN
	for linux-mtd@lists.infradead.org;
	Tue, 01 Oct 2024 10:43:05 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-53991d05416so2820789e87.2
        for <linux-mtd@lists.infradead.org>; Tue, 01 Oct 2024 03:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727779382; x=1728384182; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gTlEHj9Q71TsTr8MnAWDk5krfAyH76L06aPqx8tAa8=;
        b=kCDX9GM8908nwi0yRuNm9glwV5jdDAUICr5vrdwAe9E4zAWC3swuvSQZgO4JUe0gaa
         9JcazcFrHC+A4KYQJG9uzZSFXfS4XVE7hEi26fp7x11un2p5spGfAwuKTtEnL9oXBUaY
         bBVX9TFeZk3ToGANxXUHYTN+TPimJG449qWTJjBlHXeMkFubF7jyn834S1N4bMeM28JQ
         uZX866V/RMdksixukGiCbZ8v/j/DMOGBzOopWcTMQj1X3qnSO/K9dGyYNVCKC23+Gg0y
         ltpGIPETOMliGlEKXOPp5aqdZwW5sQdx6AbUY5wmpofmS7ktAHljjo/hV6OULMyRr/sG
         Mr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727779382; x=1728384182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gTlEHj9Q71TsTr8MnAWDk5krfAyH76L06aPqx8tAa8=;
        b=fb9OBN41K32IU/MoiJyM+Be2wX8noQpbaDGvALNnhzCaYpqFeoTEKnCbJNrl9HhNPm
         EKkKuijJjyKvxXLQWaT9Klqavu0d5kH0IOwjXHi27bsCwl1rkrq1UXn3A3SseJrhm5rg
         wCWaGLzy11zWwDJIl+n+GAl8O6G56x/aNBboqs1Fg6GFqYO8rHj3acpFM6SxVlEk9LnR
         FIxn0NU49FEH+9bccGZBqO/uzg8PP/mdo6NI6qsmGkU5PHvob1Iyn86M/DhT040qea+T
         4pZWMycyHJ4Ee9/EQJcn9Rm5ro2BFxe/F/6Z1FN08wSAOZtelZVgm7BghbSSpAFa1ikQ
         IdGQ==
X-Gm-Message-State: AOJu0YwmY+Yk6wUhbe5fJ6/Kd0x13JvWtGWMUwpzZ97CtDxNbnfEzRce
	MMO2kMLEGj0AfEvb8co6rN17a1Be0DMnAJ6zGd1UIXxOcKCTjyzSN0Bhwrw4
X-Google-Smtp-Source: AGHT+IHX8+dV27BgFxvhe7PgklGbWFHUwtV8QZVgBSzLO1UxzH6RYRRuhcBk2foBeqx2XCgYXnpEPg==
X-Received: by 2002:a05:6512:220a:b0:539:9155:e8c1 with SMTP id 2adb3069b0e04-5399155ebcbmr5899268e87.8.1727779381471;
        Tue, 01 Oct 2024 03:43:01 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd53a02sm1549026e87.31.2024.10.01.03.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 03:43:00 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 01 Oct 2024 12:42:27 +0200
Subject: [PATCH 2/2] dt-bindings: mtd: davinci: add support for on-die ECC
 engine type
MIME-Version: 1.0
Message-Id: <20241001-ondie-v1-2-a3daae15c89d@gmail.com>
References: <20241001-ondie-v1-0-a3daae15c89d@gmail.com>
In-Reply-To: <20241001-ondie-v1-0-a3daae15c89d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=850;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=DIJd3A+pL3pwCvVpZYZHLv8qgZCCLKHcPaV5BNsBVZk=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBm+9InEINnOwjIHtlMxxzHGWORqR+nk3f8q/rL8
 0qVC7qXfzqJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZvvSJwAKCRCIgE5vWV1S
 MvuKD/0bJQJF5QZD7y7FYMLNQFq8G5Hv0kKNNl6Lcvtglhj638zTGcP+Gr0sSYK8vfY3aFZKt2G
 2OWmJW+3v7c2EscvBkvAASkpA5nr2lRmREjXZ3muAB9iSRLj6tohbH/Y9RvxDUuB9VkEpim4XaE
 hO0pYLGx+LdcuxAKRL6Ma/11wxHSylgMeReeWTElr+RK1dv/5B/PCV+a+EyA0THAGPEAC5gkZe2
 iqJ3u1H8+Q01v3hQ38ZOFcQChUS5EKdmI2BSnXWTGJ2Jb/siIWuqhgp9lvpxOuWZejqMyZdlnR/
 1r8KQPfZJdGdwBVF16YsKYP6d69jesXT3aB+hzBAJA1+k3P56JJEc+M2wT6Bz/MjWLsaOEGAoX9
 9EjYwNxE4qCuKxpQYcgJ4+ltx6Ptt1ZvM5WtYV2FuOX5yDHCTvHD5b82TM11fUHWyMT7BC9Z8PD
 HpXP22b18gYGOByVvEK17MtB4DHfOgPY5nJJmhAVZ/ddUnHjT0fpHkIRBqR1cE01uTx2UiAIaNh
 V+4ZYUg6LPjvmV78Ju/3SYBEsII9gfRuu2ge8RT2if8A3MSWjtSLbmu2ES14LtDDqirZb5x02SH
 YKBp4gB64ZQjkOcUmDkazt7IATGcRjImYM3Gxd1tWDt9oJ2+bPPf/rnjqendWs2IN/1STmgdLJl
 /jgofbW5aCEE1zQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_034303_407224_C18D3DCA 
X-CRM114-Status: GOOD (  10.36  )
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
 Documentation/devicetree/bindings/mtd/davinci-nand.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/davinci-nand.txt b/Documentation/devicetree/bindings/mtd/davinci-nand.txt
index eb8e2ff4dbd2901b3c396f2e66c1f590a32dcf67..9afda5cd956494c6b3171bdbaecaeb289acd64ea 100644
--- a/Documentation/devicetree/bindings/mtd/davinci-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/davinci-nand.txt
@@ -44,6 +44,7 @@ Recommended properties :
 				- "none"
 				- "soft"
 				- "hw"
+				- "on-die"
 
 - ti,davinci-ecc-bits:		used ECC bits, currently supported 1 or 4.
 

-- 
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
