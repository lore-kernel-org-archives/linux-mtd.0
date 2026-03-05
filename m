Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74072EEF313
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2026 07:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x3kuQA1TLUROGzakyotLbIyMY8gJetHPHvI2P6TAg8w=; b=VV08oGJW58QjwU
	n/PjjgFRq2f4knk3eWndg4MwPxaJQj1RY+hcdL9Q0BTaORMRG7AMZRwjuCOVZjHzAWRefkYzDeKAm
	QnnibnEM6iJKDjRF1fukfFLPwzXw3EoJljiQPn3z6NNDWxoyy+piuEROcYwJNEvD4omc7/MM7xgBe
	bVV9+U9q8mJXrVrOm5keS1B5wBT6N+Tp1zn75XJ+yDQLxJUsUAvWpwH9V/Os8Pn4efIoF7I2AgVeX
	mokC2mGb7upX1QRbqMG0wnMAYzI3hQefueAtJgNpEXr6ctHQfbaSaBgQyCw9eD0v5KTkoL5j1f1kq
	madhS8o1L8MwPJz95a9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2tH-000000014KQ-0SsW;
	Thu, 05 Mar 2026 07:12:59 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2tD-000000014I8-0bBx
	for linux-mtd@lists.infradead.org;
	Thu, 05 Mar 2026 07:12:57 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3598e60a735so1896764a91.1
        for <linux-mtd@lists.infradead.org>; Wed, 04 Mar 2026 23:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772694774; x=1773299574; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N5f4RqYhIr8SlZiekPT6yrIR6+52GHg/ZPht85pzRuw=;
        b=TPPD0Ro4rPJi5K9vfmjernkb17ifRTPoDbQwNFN6/ivnajHb+X7wEfOUk8hDTNctfM
         XfdZq8V/tB62paSHYMPqY9yVAh8QfpIbibBvPwXNddM+7aLOn8ChTbWbu5okaM5PjcCU
         Ly0RuaPczPPnxEDxeHMXzxDBIWyLWn1eMgU6sTKBAz5AZfECgZI1Qafn0CFjOarWR4q/
         P6ygqkh9mNLvmlb9sTZWKOsCIT0gCOlsIOTJcNwAsArukpAW0WShQDJFbWiixCmmD9Uv
         WiIJcj5d8bJNDuXXKV8Ic0JkwUAuufabd2cjGjN9JSsXwFeYqO3eucZrF+wLMcBk5BdW
         oeAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772694774; x=1773299574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5f4RqYhIr8SlZiekPT6yrIR6+52GHg/ZPht85pzRuw=;
        b=C6Z51RMk9BtijRGd4tl3OJUZfCmemwLbGrJbuPJSXnx6KJORnBQwlirpAnPTqMZhGO
         mFl28L07LJKxnszcGbDm/q1/bfrcwgSIFkkaLS1ymy/Cx6YdJ1AzJcMf3YCTRfiTDQgw
         XqYOC9R7ST9yke4vvIozO9kA5BOZcE1I7SVisLOG3zzM0gvvzG/hVvUNb684MRcslHqg
         1+OoRrVmeYDdc2aMxQkUSWFLqDJGUpoVAJYnLEWsxcRKy4CSSmqYXAx1x35suOC2pqA3
         gCUxSfWr2du7I2ghOhMLGRrSuFVp/aBP6lC0ghhHAZoYVTRBrqGCAqbzdusYL0Hapo+j
         sBSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfz0mf2CSKJIl0ZqLj6YE6lQzKdmgD2uRrg0VdCvwrVObKeT4eyJAbeRQT6SM2nCvzoSMbF7u9c1Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YypU4a6Oy65q7DyL8uRTm4+WXpsCpBSgPw8g+Syed9c9pcLRsKL
	5MBw6uNkeFHcxLOc5PB9DzigAxBqf2GlBg2JKHUKvEjszornO4M1fzSQ
X-Gm-Gg: ATEYQzw99gw+TabFNRStuj3J3bvBvC4HgfK+yr0oTJ5NaKbvGd9etX2WdBZPWU+i/Vq
	8wi/yE6fttxC8EHqt8JL4ULFKBHEfuDIA8vcDWDJ94X3akQF0mS9XPcJz7niFSGmsTSFa2HH3Fh
	8bKLUGEMlB3RciA6u5a/SOhYIXIRMkPRYMBhG6Tht5Q9kk/AhvhpPp20oyRvO0LHbGxhPeFHrvS
	2hVa20nOyj2FqA/8KRZvCsaqV5OPksHu6dmN6E5NUdfUVlxdncd1LLnAoWj/mEpuoaRHmXx5m7O
	KIBGBDhDfXX70xkT9DgHM+scADX0tNgaNwYp8V23asN12z49PUFtrX0YRwexnVBYY9nsCbDh55p
	j9reWqiv+IjAv9aPOex92/r+Dgqn9B4vKlsUHulOWigY+wauuek4gqmLuJ6LkmRf2hoNgTECVci
	pYZL+Ps8F25FLAbmRga7Cw6tYe8/s1eqPlg62xcModWgKuzg==
X-Received: by 2002:a17:90b:2252:b0:354:999f:1b22 with SMTP id 98e67ed59e1d1-359a6a7cacamr4099055a91.32.1772694774083;
        Wed, 04 Mar 2026 23:12:54 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d6ee67sm992920a91.14.2026.03.04.23.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 23:12:53 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id B2CB14163B63;
	Thu,  5 Mar 2026 15:12:50 +0800 (CST)
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
Subject: [PATCH v8 0/3] mtd: spi-nand: Add support for randomizer feature
Date: Thu,  5 Mar 2026 15:10:39 +0800
Message-Id: <20260305071042.1193522-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_231255_184689_7B04AA7A 
X-CRM114-Status: GOOD (  14.41  )
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

v8:
* dt-bindings: spi-nand: macronix: Remove the chip-specific Application
  Note link from the commit message to keep the binding generic.
* mtd: spi-nand: macronix: Update the broken Application Note link and
  move it here from the dt-binding patch per Miquel's suggestion.

v7:
* Directly return the result in macronix_set_randomizer()

v6:
* Added mutual-exclusive constraints using not with required for
  nand-randomizer-enable and nand-randomizer-disable properties based
  on Krzysztof's feedback.
* Simplified the return path in macronix_set_randomizer() to directly
  return ret; and dropped unrelated formatting changes.

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

 .../devicetree/bindings/mtd/nand-chip.yaml    | 18 +++++++++
 drivers/mtd/nand/spi/core.c                   | 27 +++++++++++++
 drivers/mtd/nand/spi/macronix.c               | 38 ++++++++++++++-----
 include/linux/mtd/spinand.h                   |  9 +++++
 4 files changed, 82 insertions(+), 10 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
