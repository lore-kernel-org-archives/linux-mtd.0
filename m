Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD07EC0015E
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jul 2023 10:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+gHnusTolfH8z0eoSWgTo2VONprQracJqfK3F9YrDMo=; b=ZtMVmiaEmwuXmF
	lslamD2mtC2hzE69vCBFmWzQxfiZ0/AJdW/orJ4UvKurzBV1ZMmfKHAog/mTAoU1sKFhSpfFFF/Vw
	EjXEi9MyImacLZI0Aj4tWMEV5TmzdUOJx2bUnEhq3mGfgPfqpLtomD8h7pd9tcvuhWR3qNZBSnrpN
	JstLwGpmlS2YXuucstM4tgiOQvwdr42BXXkr+N7V9s6lnPAPY4R1iwDuwPldtU9SVK0mBMF7ZhN3a
	Bnal7JiBPcOh8NnEmCjjZaCzOxHk12bZIDRYE149K/Iu5U+1BTfP9S0Fsj+khDhf1UCtrlEpKG5fV
	jvLGoifxk6521irQbhBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGza6-00FTGF-0V;
	Wed, 05 Jul 2023 10:17:54 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGza3-00FTFB-38
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jul 2023 10:17:53 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fb7dc16ff0so10128924e87.2
        for <linux-mtd@lists.infradead.org>; Wed, 05 Jul 2023 03:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688552270; x=1691144270;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5eLOAiii4EOxtxvIyXSfQW5YOuns9j70s4RUapPLtAI=;
        b=uSaFzHtN59RZDeePDZL0PRMGxKWScwW4i28fWgNlbnBDEgMKpfIuEWLsvh326frFpf
         fij4+UjNIY8kXbdLP5IjhT3ng5GTZkLk0PTCGIAWc7VBNTWfTCIjT4Zmt2lgDxJhZH2S
         CGNSOqPGAU0O2ufEW88IoaAKATABjLOIDCMsveg9zdD4zRqlUNu2Mzi8dc1duHgNCfzx
         5Xx7opHzrY05MgkV5twIgxTTzirB+gSrO0Li7uRGUi+umYCkV4QO+X0p3i+BTikuUS+n
         TTvxff9F4nwRXomzLjBSqX3b5ZNN7Rd0e+aMbHARvLnhOk1NyyU39WGpqg58uVhnWH6D
         AXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688552270; x=1691144270;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5eLOAiii4EOxtxvIyXSfQW5YOuns9j70s4RUapPLtAI=;
        b=iYh3H6nXxInennAypdE/zlbWBVzENnp9P1aPBWaGxpXOcPq6fuifOAmw8UviN6sulo
         QixVTDQwPfHnvbl806fGHflkdI98YqQtgppzU5C4DZMox5S9RAzFbolhEpZq2xB7KTsw
         dUNl8c9+0lkBT8HyDI2UcLhLfCa+SQRp7G8iOL7+FahXueeZRbOmAxXPOu+JFsWRIcry
         ThlndKFXVVSp8mZi5CtVcyB2LSESk4bpqQJE1hRGBBBPIeQvA+tjGqPGjUyOOCskt32w
         cVECvOY0PBFU8wzDLpKkwhvhDRtfU1QQbCycStstr58iCtHEPHAyCl46XDgEJ3wnbZLQ
         8xUQ==
X-Gm-Message-State: ABy/qLbi+nUaXcd8mVk+VIOR7opyCMTYGE+VShkem3I++Qr2Xuskihn5
	zaSA71hH9IH0LSMkU79YOQ2INA==
X-Google-Smtp-Source: APBJJlHyHUfBE5hWiRyGorzbw+EXcdgInM7frWQ6ipuxeNnw3SbsvM/KcM+QOtbOC/WxA1HtwCKPCg==
X-Received: by 2002:a05:6512:3e26:b0:4fb:780c:fce9 with SMTP id i38-20020a0565123e2600b004fb780cfce9mr13868458lfv.58.1688552270234;
        Wed, 05 Jul 2023 03:17:50 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id l27-20020ac2555b000000b004fb75943ab3sm4774418lfk.258.2023.07.05.03.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 03:17:49 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/2] Add SEAMA partition types
Date: Wed, 05 Jul 2023 12:17:45 +0200
Message-Id: <20230705-seama-partitions-v2-0-9d349f0d5ab7@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAElDpWQC/32Nyw6CMBBFf4XM2pq2ynPlfxgWUxxgEm3JlBAN4
 d8tbNy5PPeRs0IkYYrQZCsILRw5+AT2lEE3oh9I8SMxWG0vOteFioQvVBPKzHPaRuUKq40pXV1
 XOaSbw0jKCfpu3I+//V5OQj2/D9+9TTxynIN8Dv1i9vSPaTFKq7zSBfaGrtiVtyd7lHAOMkC7b
 dsXj+Dwi84AAAA=
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_031752_025542_1231AC59 
X-CRM114-Status: GOOD (  10.62  )
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

This type of firmware partition appear in some devices in
NAND flash, so we need to be able to tag the partitions
with the appropriate type.

The origin of the "SEAttle iMAge" is unknown.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Make the binding clearly childless
- Link to v1: https://lore.kernel.org/r/20230506-seama-partitions-v1-0-5806af1e4ac7@linaro.org

---
Linus Walleij (2):
      dt-bindings: mtd: Add SEAMA partition bindings
      ARM: dts: bcm5301x: Add SEAMA compatibles

 .../bindings/mtd/partitions/partitions.yaml        |  1 +
 .../devicetree/bindings/mtd/partitions/seama.yaml  | 50 ++++++++++++++++++++++
 arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts      |  1 +
 arch/arm/boot/dts/bcm47094-dlink-dir-890l.dts      |  1 +
 4 files changed, 53 insertions(+)
---
base-commit: 035cd1416934ef7ae5374272d3c9e378c3d7049c
change-id: 20230506-seama-partitions-b620117b9985

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
