Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2C4C05027
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Feb 2023 09:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bzlU+HaooOxsYYTsBQnjom+VPcR+vcztOGKOCvYlDQQ=; b=0AR2HURyZJB0rI
	MMPoIvYUPnbNliDYWw6kUovgY8CePN1pNEeIMnjSGtZy8ajPTKae9bnDlnzm5BP4rFAzTPbBtNVsw
	cOpcprJg45sbisBdvTSqu2HTwq+xSYFLmUtwtE+4xyhsxZimJ9t763dbgkYdU35P7rG328gCI6Izg
	NwoKmpzJT7ppk16dCicN92N3WLvEzSh1lZ/g4W8L2Uot3Sz/Gswi1aexdsQ+N6mElPvPqZUMNoWpT
	DoIxSXHkrrNdC35PgA/ptLiPlBleejfTc18mREPUVnWbRJuOH+6E8V/Wzq2gUMB7j03Ny4IpDqtdX
	/SG90A+FPhIPxBr6jn2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOxlt-007rWR-P5; Mon, 06 Feb 2023 09:26:45 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOxlh-007rSK-NE
	for linux-mtd@lists.infradead.org; Mon, 06 Feb 2023 09:26:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so8230493wms.1
        for <linux-mtd@lists.infradead.org>; Mon, 06 Feb 2023 01:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zGhCvFoTy0X36TbIluhE7gVD7vDKBMWtC9eNAwAf9ZU=;
        b=s82aRZY6NB5/PGChQ03T+YvIWJIDRXw7Y5GR5ixDk0TMQ7AKnUFAnfwDg9LGTHgd8y
         W5vxxg5JQk54PkyijgAfnXNwZBje8UCXhcJeUfFvEAsCfJjGgEK+SUmc0VzDXANs4Uej
         zpnZg/5INLkmCT/PPW8W1rXdAsAKB1Bj5B8u3ROpc3aH6401vBaXGrvs3xMEChoPIoYg
         7uoLhSSnQTv2gxfEGDo7Cg6LhNsTrdRYqlhaHJYdAn/ebvB7+uvfZzYEkH/Q+hFKThh+
         NqIBE+2XZ6u+bsVORZ9zgSWxGwFPPgpk2Po3U+lo1nGgKwWrXtPsFfmy5o+WI41Tflk4
         ApgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGhCvFoTy0X36TbIluhE7gVD7vDKBMWtC9eNAwAf9ZU=;
        b=nBNseViDSBTR4QPu+c3eExTNaIxESmBQQ5nudzyVYZqz585nQyKaV6s0nESdqVQapA
         FWkSfpQtepRnvFmsMyk/19NHAjuYtd1FW9W63+KTa/tlXXwyiX2TblJubLr3yqjsEBZ+
         qNChFGG8AyN4nd71+hUoYTgEU3tNJ1PxY34doUaIL8BvPOui+wud/Tvqe2cXDPqkRHC+
         QEE0QBCmaGIIdNbvEQIFOZASnOjYivdCbKCfbEwejK82dxOpmK7F/Ax/TcPwfS4++Xib
         nkTRqfNp89/dq0jlX+qLi6QKqfrpVRY9/IULdSUxU1sKssxILyRM5dF8fBKY+wQYu/v5
         ABSg==
X-Gm-Message-State: AO0yUKU6wvTTo8DC6bUYs7snF/Ua4RyQRLFBzYVozPRYcSJgZ3xQ8nG3
	1WIQ2Tg188i+bZyUFYG5ReWpsA==
X-Google-Smtp-Source: AK7set+37JMLJnS4PPNFcpsshhqiHoi7Y6DOKHumWXTgNxkbG6T5RGuIwyDWGe2QTnGqcm8d7QeoEA==
X-Received: by 2002:a05:600c:1d05:b0:3e0:185:e935 with SMTP id l5-20020a05600c1d0500b003e00185e935mr2358414wms.36.1675675589656;
        Mon, 06 Feb 2023 01:26:29 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m5-20020a7bcb85000000b003de8a1b06c0sm15722568wmi.7.2023.02.06.01.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 01:26:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	Krzysztof Halasa <khalasa@piap.pl>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Marek Vasut <marex@denx.de>,
	Lubomir Rintel <lkundrak@v3.sk>,
	- <devicetree@vger.kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 0/3] dt-bindings: serial/mtd/mc/ata: use MC peripheral props
Date: Mon,  6 Feb 2023 10:26:21 +0100
Message-Id: <20230206092624.22922-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_012633_780361_C19BCA65 
X-CRM114-Status: GOOD (  10.41  )
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

Hi,

Dependencies
============
I think entire patchset should go via one tree (Rob's). Patch #2 depends on
patch #1.  Patch #3 could go separate tree as long as others are in the
linux-next.  However for simplicity let's push everything through Rob's DT
tree?

Changelog
=========
Changes since v2:
1. Add tags.
2. Move intel,ixp4xx-expansion-bus-controller.yaml to memory-controllers (Rob).
3. Drop | in intel,ixp4xx-expansion-peripheral-props.yaml (Rob).

Changes since v1:
1. Add patches 1 and 2 to fix dt_binding_check and few dtbs_check warnings
v1: https://lore.kernel.org/linux-devicetree/20230123151302.368277-11-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  dt-bindings: intel,ixp4xx-expansion-bus: split out peripheral
    properties
  dt-bindings: reference MC peripheral properties in relevant devices
  dt-bindings: serial: restrict possible child node names

 .../ata/intel,ixp4xx-compact-flash.yaml       |  1 +
 ...intel,ixp4xx-expansion-bus-controller.yaml | 66 +--------------
 ...tel,ixp4xx-expansion-peripheral-props.yaml | 80 +++++++++++++++++++
 .../mc-peripheral-props.yaml                  |  1 +
 .../devicetree/bindings/mtd/mtd-physmap.yaml  |  1 +
 .../devicetree/bindings/serial/8250.yaml      |  1 +
 .../devicetree/bindings/serial/serial.yaml    |  2 +-
 .../bindings/watchdog/maxim,max63xx.yaml      |  1 +
 MAINTAINERS                                   |  2 +-
 9 files changed, 89 insertions(+), 66 deletions(-)
 rename Documentation/devicetree/bindings/{bus => memory-controllers}/intel,ixp4xx-expansion-bus-controller.yaml (57%)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
