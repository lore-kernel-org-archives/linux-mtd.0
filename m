Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839D7E98DED
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Feb 2026 06:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qA1SGuyF7gDi9pyYdVPloELChhA6TdzPiLLnWww4DOM=; b=03QV86eqFyYNZh
	LIwxUVhw3A1pZM4h1DJ2I2r/uEFHwApmwvZYsDIb/hEvTRvr0Wu23rM6GsUQGj/qB0OAvX5TJf2b4
	hcf1ArCQFjnbLCmtb4V6jY+UyatXg6IdazLxlyfTGzfnwyVj8vPg6iwmosv4mXOHm9wydlYzczaI1
	uNsOSCigMsuCE1LL9D7GCAeVexGY/+SfwBB8uw+4dgAb45xnHeyropp94CMbFGFSi3OCMdsbRWioA
	EsvQgUPQf3cHSZUOZsGfNq3HHBJ2g+PmdyJxw/auGqKyRvlGxqY6eJtLCsJMTULiuCZCEUhhtEHxH
	7FquLN49VE4fRX62+kOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPIH-0000000HHyX-2LBH;
	Mon, 23 Feb 2026 06:19:45 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPIC-0000000HHtF-0tnz
	for linux-mtd@lists.infradead.org;
	Mon, 23 Feb 2026 06:19:43 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3549bba5302so2420241a91.1
        for <linux-mtd@lists.infradead.org>; Sun, 22 Feb 2026 22:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771827579; x=1772432379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tUDuyjYYyo0et9UR9kj7eT6N1xShJC+WOFmEXeoTNp4=;
        b=Os2j5rsAenWC9grHXhZfsCPQCNfo/x6mrq0bheukhXVMBEVaGAzrxT/Hfkc4pxMFx1
         gTglA8BVlS7F4x93pEB63mqzYD++3kpv6dZFcQjxEtrmBjSalVI+9akOqs1JGhwnAODA
         m4JSVOjvSQtAP/k22vC6sHYcj1yBv+WjYv3Ja9sptjY21y8N9ZHqWLLbSq1O12DjZzQK
         jC0ZA28tuGQwZqQK+DopTkBFsQlLGqTq5L+egcRiUpaB5Q8YvFTzMZlaXn6Ve+7d0WI2
         8BpBabVkSllLvmnHhM5U8XatbuahEQatb346AlM6B1KdAhBfZ2LKnPMUattbLjXhkMMn
         abWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771827579; x=1772432379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUDuyjYYyo0et9UR9kj7eT6N1xShJC+WOFmEXeoTNp4=;
        b=k9FD7xmS+amIFzx165NNBUIk9wNZzHLuunrLVvF/UKIwVcGwAmcrYj6Ij5XK5TJV5w
         8Uy5XEqQkk2oRnDk6NIvliJKEcTM+dDROQh/EDQZGhLS33uFco3MmmDJGKs92R3MbWWR
         98e6SRoVOzQrcsqXx7Pjf2k9hRIwWfapxtFGqoSUqjOIGnI7oENaVxXzjv3rkqUxBvWS
         2YTc6nLMekMYOE+ulAx+MVtv+TLzmzSeS7DxhLwgJ1GuK+f4lP2koX0cEjEXhFl34IWR
         aspeDzgKflXyk3bphVn0NLGQyCxtT+xeGlk/Ha38a3eCKlSkeS7SofxINjYTyA3ei14l
         eb8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXx16Y61xDFkm/B2XsNbr23dw+myJf02OGrK72xr8EWQUlFi4o0RX7i6f+jBb07lrzY24dcT9fgYJk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo/stfB3roiDHuWj3kByBFmYEGNVohndt4RuqPLkZ3D722B7mh
	8dD66kANelsKGO0w1MNqVxT8GVwWrgqNo0PIvnxCX3wYd+Q/bvK6wLfu
X-Gm-Gg: ATEYQzwLZZiBlShMxZQTaJaOs37sDNMhcgQaj6vF42IIE+7qmsdTA5R2ijkebcwvkAk
	+5BI30MhjEtdygPjBiQjA80cj1VbyzIwsujqE0LI7F+h+dE61LPG/6RYUnY4vpL3POjfVZLoUsa
	DQ50Jr5nC1u8mspoeYrhc7ZkDBNyY/j7ySDOTZ6ZbjfDl4pgKAdOim2Bx3sZoJql2/Dl0jC/qiw
	JItZoLZTdYF/PJLqizakZLeFsGZ09n3esj0/UA9fNsk3EVvrAfh2OMpDIK39njAtwItfVwlVNY+
	PvYQlpHYc533Wvl+u/cIICKmS8+ti0L1wet9OpICpT4di6hzaoV2NOQ1KPR5cBffbVUATbaklfY
	Y3Ba1XFIX/Tn50nDAAvv89vEGFSg+g/M4tjzW1ig38gwnXC5A4w3aMzKf/GxKYUs/NcY2LUd9Wp
	FMLHbJwDNRnGShLPMYhwYSqf9Sr+rJCq+/lLZ5wOTNwxEEGg==
X-Received: by 2002:a17:90b:37ce:b0:34a:47d0:9a82 with SMTP id 98e67ed59e1d1-358ae8c12b7mr6448583a91.23.1771827579357;
        Sun, 22 Feb 2026 22:19:39 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358a2af412bsm5694769a91.6.2026.02.22.22.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:19:38 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id C0F0F4136071;
	Mon, 23 Feb 2026 14:19:36 +0800 (CST)
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
Subject: [PATCH v6 0/3] mtd: spi-nand: Add support for randomizer feature
Date: Mon, 23 Feb 2026 14:17:03 +0800
Message-Id: <20260223061706.1027986-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_221940_286765_F2226358 
X-CRM114-Status: GOOD (  12.71  )
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

 .../devicetree/bindings/mtd/nand-chip.yaml    | 18 ++++++++
 drivers/mtd/nand/spi/core.c                   | 27 ++++++++++++
 drivers/mtd/nand/spi/macronix.c               | 42 ++++++++++++++-----
 include/linux/mtd/spinand.h                   |  9 ++++
 4 files changed, 86 insertions(+), 10 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
