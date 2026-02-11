Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9558EB2700
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Feb 2026 10:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GQKwwbbCuiBV6rQxEKfTWb90ODxeN/x0AfvYzUSRXp8=; b=CAPrR5F8UexVKA
	k7y/W2j0z8Y/nsGo4fIibJZkwwJiRvJrXN9qoXNOT7976hMXylv9p00rTuLvRE2Ncb94MmapNDT/+
	UnQuXmHQVIuYRTdb/Ak18ducUpL7MD5dfHad98cHJWW2cxwISeM5jkiGYLCMgVBEC/yjMm+z0WADI
	xDPhJD6sAeZpQtiM/KR9z2iydqcHMNjRrbDZt2LHxI8g5ex+G+ej0irXbw1vEdWJCRIh6yzMIK+lg
	VupRrcLYKFxW+CU11EFY0ofYxgXlZGxE4riRE27SWuVoLPD+lKJ9qFV5CL0C2as1GcN0+I2Dhhwci
	K/hbyLq8pl5y45GsJAhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq780-00000000Tae-48LF;
	Wed, 11 Feb 2026 10:07:24 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq77w-00000000TZ8-2EOZ
	for linux-mtd@lists.infradead.org;
	Wed, 11 Feb 2026 10:07:22 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a962230847so14058065ad.3
        for <linux-mtd@lists.infradead.org>; Wed, 11 Feb 2026 02:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770804439; x=1771409239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KciIN1xTZfLpfJqvrrNWWVt3Y9r9TXbxsa4mxWX9G/c=;
        b=b0iACSzdqItYXXcGqrIT2hdrNKKjp20gmD1T/w/8bRbDLKEePw4O9mYXaNYV37nSZ+
         omuH8T19Dw6rUype3DEsSpNBsWcOWkxVI3n3TUf7sAkwMzJC4wz2jvUsYN7xKnBsrRpf
         S+dKnNb1CbKHjob3RT5V7I0lvfLojURtE7EC2fq9yCCgZI4fXBprYHQlm5O9rCvMWobS
         yAUIFPVMK3A92441iEQ2H6tYpuh2K8+3zOkA54mgWO85FtIQfIHk5hm6jiBzcShoAQCP
         mBbPMKoSdCnBpiNYOaAtDnOccxnSsQXA4AYHNOLB7GBOFp5TMIsOaRdimxHd1ftixhOi
         kX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770804439; x=1771409239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KciIN1xTZfLpfJqvrrNWWVt3Y9r9TXbxsa4mxWX9G/c=;
        b=WVqEQIneuveclt8EDoHOEyhBI6TJhCbVOROnHv/COWgNNoWVFmrdND0881ttTGiKo3
         kfz5Cj9ls3P9C9KMkUKizS68EKS9xLHMd7R/27Sfp6KtfmRaCzR2xaDulB3MCpnFU+nq
         xctnJWhFseok0IDm26ZH3S79V4yd60MkjxIaJowKj79t31Emkl2Fbi6FF8SMrPY9RDzh
         gCKqdREk6Eioc0iWumHz+1tR2Tm3lNeJ2LiWiS6B3FrF7/zsjnk1GCt072KDNBfz6lfl
         dVqqvO4KBU9i+5YZEjnW+XzgT7QhjVP1chI11dMJBoKY1Zic43R5aruWcIU0R/5PZguq
         wL+g==
X-Forwarded-Encrypted: i=1; AJvYcCVFaH/AUKBTSmtMThiakufE+orsxoiFuPBaxFvbeCfu5fewyaiqORpOL0OqJhFRuSEAfTijdKEHJf0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyvhQcSPSU1BaLZnesnk5eOYERGros6YQ6Q+Sprt/ZPQoaaZnEB
	2o3NFep88zaoOy4bCoQoyHeDm8/Suy5IE8ctKc0QEfbUf23UVDtliYpN
X-Gm-Gg: AZuq6aITuzpjaau481YGwgQHIIGvtj01rXXFkAkSByj7Zx8qdWlx+lkHWCEvcIot5hC
	I4x43o8W0ErzJfQjNsQYtdczAwT06uCwgOdg3ZJ0CYpNYpxbDQpQ5Mb6zdr5UyC9WL3T5c63TSn
	7A7Tj6ipR8vQ3ges+BRX7njrKzpOmq2MxwcpXxtE4flk0Oryh+Ca5B5mhuGa+SfgiKKaJAAD7b8
	ya0TkERIn3x7b7SbqXlAItCnlNj78D6gk86nKQYvG7wQ4ida4fBdcZ1efhs9gn7Ot+JZfKq+NHX
	aJTM8APJfHZDoJl/vmDqX1UJArfkEhiFj5158NooTPUFRLyuw46V1aGB3IeeZATuo7k2PpkMABt
	k3+xgQ6AiWn21M53wGTogIPib7xZyybzA+GWtDOAzhP32bwto17eLcsjvopaKxaEn5YKcbVsShf
	23bF2ntFMxydaYlaEkGmmnMd2TT5bBS3EZNctgozsAGIAGPg==
X-Received: by 2002:a17:902:d588:b0:295:96bc:8699 with SMTP id d9443c01a7336-2a9516c84b4mr160482535ad.20.1770804439178;
        Wed, 11 Feb 2026 02:07:19 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2997bc2fsm18729385ad.76.2026.02.11.02.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 02:07:18 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id E128A4136071;
	Wed, 11 Feb 2026 18:07:16 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Pablo Martin-Gomez <pmartin-gomez@freebox.fr>,
	Tianling Shen <cnsztl@gmail.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v5 0/3] mtd: spi-nand: Add support for randomizer feature
Date: Wed, 11 Feb 2026 18:05:50 +0800
Message-Id: <20260211100553.907585-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_020720_579812_D5471F30 
X-CRM114-Status: GOOD (  13.05  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

This patch series introduces randomizer support for SPI NAND devices.

- Patch 1: add the nand-randomizer-enable and nand-randomizer-disable
           boolean properties to the generic nand-chip.yaml bindings.
- Patch 2: add the initialization logic and the set_randomizer callback
           to the core framework. The core will now parse the device tree
           properties and enable or disable the randomizer accordingly
           during spinand_init.
- Patch 3: implement the set_randomizer callback specifically for Macronix
           chips (MX35LF/UF series) to handle the vendor-specific register
           operations.

v5:
* Promoted the randomizer configuration to use generic NAND properties
  (nand-randomizer-enable and nand-randomizer-disable) instead of
  vendor-specific bindings.
* Refactored the initialization architecture in core.c. The core framework
  is now responsible for parsing the device tree properties and deciding
  whether to enable or disable the randomizer.

v4:
* Fix a build error in spinand_randomizer_init() where a value was
  returned from a void function. (Reported by kernel test robot)
* Update the return type to int.

v3:
* Revert the device tree property to the vendor-specific
  "mxic,randomizer-enable" to strictly follow vendor-specific bindings.

* Update the 'set_randomizer' callback signature to accept a boolean
  'enable' argument, allowing the feature to be explicitly enabled or
  disabled.

* Switch the implementation to use the standard SET_FEATURE command
  to modify the Configuration Register (0x10), replacing the previous
  special program command method.

v2:
* Create a global NAND DT property
Cheng Ming Lin (3):
  dt-bindings: mtd: spinand: Add randomizer enable/disable properties
  mtd: spi-nand: Add support for randomizer
  mtd: spi-nand: macronix: Enable randomizer support

 .../devicetree/bindings/mtd/nand-chip.yaml    |  8 ++++
 drivers/mtd/nand/spi/core.c                   | 27 +++++++++++
 drivers/mtd/nand/spi/macronix.c               | 46 ++++++++++++++-----
 include/linux/mtd/spinand.h                   |  9 ++++
 4 files changed, 79 insertions(+), 11 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
