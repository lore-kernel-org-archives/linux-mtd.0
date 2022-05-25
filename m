Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09234C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 25 May 2022 21:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A/BU877obv4ao7ImsNz6K4GpU6634lG0zfz9ye2tLFk=; b=Lrh/q8g5sjqXV4
	FimeBeSMQyYRKi0P2viF+YrqF30dNDCzVKmQY21fks/9jrRm3MNA5aGS04VTFy7ycsKp62FEbuDsb
	Wn/YhM16/VpYACPGLBSNFDfvPODveBC26CRulXewauadZV56YJdA4dYmphBXX6LD4cw2yN+Nf15af
	ISc4F6WSa1Id1UsdPnBW55n4S/YLk2f/5UCu6IH0cnHa/CQxpLRxyx0F1M+0bx+ScojOMbTALp7HM
	lES2IDspuwhNpQ4k+bJfaWjZ3UWRzOaXvReDzNdB5iHFmpI0+BzQExPaXcCxHNhbBG5GLR87m9Ze6
	jTpn+KBzrzO1GU/igquA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nty7U-00CiE7-VQ; Wed, 25 May 2022 21:00:41 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nty7T-00CiDN-5c
	for linux-mtd@lists.infradead.org; Wed, 25 May 2022 21:00:40 +0000
Received: by mail-ot1-f50.google.com with SMTP id e11-20020a9d6e0b000000b0060afcbafa80so9510512otr.3
        for <linux-mtd@lists.infradead.org>; Wed, 25 May 2022 14:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y7E4PnNWAdqM3wRc2kq28/BErN5cx9srK3ecxf9iFrE=;
        b=wZOlGjfGvYQO2IzZWYzOiAj6ebJmKFSMYhgFf5thqv5iLhnkl9CTEpzurLK+bAUraZ
         dGp0XlMhMjOWIGS6gPvJ0ykf2/5JbuIDZeoHRwonZCAEDkIB9/bTSJoNLf8O/o7QcNqM
         DecnwaZTHNTYTwi4ughJDSIzsLRvr4hPWIK3LLgmotKpkNZxnzZ4RhZnH2L9Lh9iCNvP
         McK3aXBC7romYNB45GP0uWqaBkX/ui5s1piM4kH6iTAo6l/WAL8bxPewnCW3b7rLYVOl
         2dnL1+ZMTUof44FjdnZmCHrs/Kdq/RtzGsOPpUFyFGwgqhTdGH7to5CRd8vNbvUMAat6
         +TVg==
X-Gm-Message-State: AOAM533B4ToOvfml3aGWrknv0J8VFOF8+5IF41D9Q3mL8qd4yApD+kN1
	1UJqxrrI+CGrc6UqrQJywQ==
X-Google-Smtp-Source: ABdhPJypUgU1tiTdohjUQ19YpnReQFW4zfRPRhZ0KMkfHQ8QCuhoVzAG2dPGJ1gJW36WD0HmKSvQWg==
X-Received: by 2002:a9d:61da:0:b0:60b:220f:950b with SMTP id h26-20020a9d61da000000b0060b220f950bmr4343320otk.316.1653512437079;
        Wed, 25 May 2022 14:00:37 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.googlemail.com with ESMTPSA id h18-20020a056830401200b0060603221278sm6453363ots.72.2022.05.25.14.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 14:00:36 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mtd: mxc-nand: Drop undocumented properties from example
Date: Wed, 25 May 2022 15:59:46 -0500
Message-Id: <20220525205947.2487165-1-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_140039_247090_12DE3A08 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

With unevaluatedProperties issues fixed, 'nand-bus-width' and
'nand-ecc-mode' are flagged as undocumented. Removing them from the example
is the easiest solution to silence the warnings.

Signed-off-by: Rob Herring <robh@kernel.org>
---
These properties may be deprecated, but they are still widely used in
bindings. They either need to be documented (and marked deprecated) or
removed from current users (i.e. dts files).
---
 Documentation/devicetree/bindings/mtd/mxc-nand.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/mxc-nand.yaml b/Documentation/devicetree/bindings/mtd/mxc-nand.yaml
index 73b86f2226c7..66da1b476ab7 100644
--- a/Documentation/devicetree/bindings/mtd/mxc-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/mxc-nand.yaml
@@ -37,6 +37,4 @@ examples:
         compatible = "fsl,imx27-nand";
         reg = <0xd8000000 0x1000>;
         interrupts = <29>;
-        nand-bus-width = <8>;
-        nand-ecc-mode = "hw";
     };
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
