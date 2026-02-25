Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93626F55438
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Feb 2026 01:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t6qRV5dh7gOnZcpGW0RzWe7xMC3JKQ67mi7yxrsgq1E=; b=nqUMdpj5oHEG+I
	mrQk5KH95fF+PNla7Wpvj0r7qMd58G5SdrHIUhEhUlzqezBJL25pabvNclDMDmerYvk8Q59WGWCRL
	KZVs2IK1fCGR3JGYunqMdwJ06u+g1+WEHscFuxm/yOSTKRCnycK7vuA5iFUF1q+11HqbN9t6XULTU
	lVxdn2mMhdk2txEhn0EplSSksSnXzvaQzOSeNFMETMSE6VJEDqcAI0x1yce4KCrh3ggiz5qo2GoO6
	dn1v+Kov74xb9RIludyhI+HaA4CXY+s+G6hWPubxi9Z8RAXY5PoTZF4mTWLF8XarD+Zmde7fTCg9L
	VgWrgL9briQUtw34KuiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv4BB-000000033o7-1Et5;
	Wed, 25 Feb 2026 01:59:09 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv4B7-000000033mG-2hUz
	for linux-mtd@lists.infradead.org;
	Wed, 25 Feb 2026 01:59:07 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ad21f437eeso3156975ad.0
        for <linux-mtd@lists.infradead.org>; Tue, 24 Feb 2026 17:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771984745; x=1772589545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sFSQgKMpbT4Jja0uO7WjQXE+RhpLS+aEelpO+yxQLtk=;
        b=IgXsMKcSEgsC4j8mtnat8sQ9UwjAcbus2FO2SXiWcFQ1vUqcMBpAHxWlT5vZr/jvKA
         DFOfIcxDfghLcoj/5Cy9UgCP8E6Me+P4lyDrsKZdf+A4ExQsuWkQ0L/0G7ZEx8C8XVKm
         IMXuHvnzzHF2Zqwzv8tRS8iiXeztSFro5olglXaOnZY0ATwSDyAXtyRl3ArQIAvuuj/+
         SOe0yrJ6AEPwqf1rerVRxFHbp32wJK8JLs+A6j5jkYwwy5svsB4xllYodHgaQ0WB/u2h
         kb3hW3oXttjyfQZ6txGihqACkzp1tVfDIUf71e0A34wz+RFhXboUjz36RcPdB9U3y/Rk
         GFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771984745; x=1772589545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFSQgKMpbT4Jja0uO7WjQXE+RhpLS+aEelpO+yxQLtk=;
        b=LCg2W8jh5u/IoJyBTCmQxgvdY4B+v1Wwl1C9hg/XsPRfTpLQARo3M9j+pdtj0fycvh
         X8FfPTMEIv1Pq+3LhpryGRvvHFE/f4qojqn8/Aww06JkGy4ddjp3vlprezs3Zql3rnLH
         e1mwD5ddo2lDGeRby0D0cBZfxk/OmNlVErkgciZmI0K4cHxU4NLJChyQ6mDxRcupjFMY
         eEWwhKfMs85WtCrshxaxCxRarz7NfLnKBPfzSgkcdqt7UKYH2JPsoBCDYfkL+O7mJo3h
         /fD6mG/K5KKUXarW16chMZS2xGnxKYCxn1Iz5AQ6lb9YE5JQpTOZvMB/4YczwcIrZzzY
         RTTg==
X-Forwarded-Encrypted: i=1; AJvYcCU5DGrUfHBscOxmzzlZWC576vejhva9blULOd9rzH3LblLFFyvby30CUK2ag6wRwzZfl0alAOLXUQI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxquVyL1Lo5lJ/Aq40r+J6NMhZ3CSJujeDpaMcKxLh0HuOX/oj8
	91qf5g2736VE66UqJhCBxgnwMRWbRSsVY6QfxOG0T703LvFOSEicocQ9
X-Gm-Gg: ATEYQzzcOmUCDeStxKVPElnzJHe+PGSFnigCHSp3Osml909PT7vOFLUaFRa+AszkVY8
	btDfEgynQhQZEBlt8Gh3TWt8cfghfr9/5ZapX3V84zdRYkawWZQes2yRG608A9C59gnsHvyVjCA
	OB49JY1v8zLqsoMxXXRlAoD0Kr3wsemvX/2kYaosVAjuocpkO6Yv3CM/44X9AhRojsh2iYcBhQJ
	E9Rq2mVkivPN7OFPOEtn6PdQAKQ+bMm9PfLm6Q8ldpNQBI7zod9xTJv+P2btySezKU38DNqJNIx
	DhGDOfCaIAhPKYaVcUQrlRJFjRC3M0L64/wcFAw/n59d7suBlxfsCMpuSC0U6MDHlG/BiT26Nvo
	O61iLypvUwueAA2s995bSLZASfois91JLX1BsLsai60IyiHU32AOqgKS952bBQC1EP9WuY9Z3uM
	Z8We8rjCWHznDyxDAAOHeABHjztGx968gcc5LZbLlM/XXs9Q==
X-Received: by 2002:a17:903:46c6:b0:2aa:e9f0:146c with SMTP id d9443c01a7336-2adbde10d4amr18311745ad.29.1771984744657;
        Tue, 24 Feb 2026 17:59:04 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad75027affsm114744415ad.66.2026.02.24.17.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 17:59:04 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 7B0A84136071;
	Wed, 25 Feb 2026 09:59:02 +0800 (CST)
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
Subject: [PATCH v7 0/3] mtd: spi-nand: Add support for randomizer feature
Date: Wed, 25 Feb 2026 09:57:02 +0800
Message-Id: <20260225015705.1113199-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_175905_685237_ECC55A1F 
X-CRM114-Status: GOOD (  13.58  )
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
