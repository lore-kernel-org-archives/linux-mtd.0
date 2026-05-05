Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD69DCD343B
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2026 01:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nLtJNHd2bcxKfdUyUIJyBELfukUQ+ngynCiL8nJARQM=; b=cprmY93ejB9sct
	Y3HmN3VeoHamiNKHJvaxd+4B3Ya4SgnbB8VWORcYjzncd9tKWUxzLrCj1ceiLVSo0QS9TUyVsIWMS
	x0+QXP6RvsSUySCeDKhsLH4C/Z5nasBEeKN9omd4J6GDOAx2JMoMYi319b0tqVdSguZPSpmj7eOSI
	uUvS0HSXSD87rUPcv+sa4+b/Psb9S34r0hLnzDEDpL6V1Pqu2wgFt/H50f3SFqi67BqrfCFoUm9dr
	syUUbF9sf0r6VeJar7T7rt+IGSuD7967vzV/1mi/JEV50cQOjXUijrv2OZRVKbC1xpb2cTBDxvYPf
	M82wHCTEX7I1qTjGNI5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK4jI-0000000EpF1-3NGW;
	Tue, 05 May 2026 01:37:44 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK4jD-0000000EpDG-1YHa
	for linux-mtd@lists.infradead.org;
	Tue, 05 May 2026 01:37:41 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c80148ae949so778742a12.2
        for <linux-mtd@lists.infradead.org>; Mon, 04 May 2026 18:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777945058; x=1778549858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q2ubLRqm6894E/xfqMy1P4qorSpO675XYrOno1l/mUk=;
        b=oTOzaRlzWmGPe7sJS8SwN/ukJELlOMtc+FtOc1p1GJKkN2VNKvVhP+Gtdnnk/I6IdA
         67tAK76c3xCZq+IPSV1S0m02jOJ5TthmOa3wi3QwgLF6i3614OtHkSBFgCA9fohwe69a
         ACcjb0JIXUStO3NC9LDDnqZ9hk2zGsLXzSGzWAxwJJX6HEGWHyXqPHwi3TZmc0q4sdp3
         bLej/IOZPHUg6qegmwt1JEGJiIdLIZ9brvFtK36ar1p9F9n+n9toe/vmyu/826nsLPmW
         iwnbyoINA9qNkPQfruARvOp7jknNqd5dgZo23dAwBZnJ+KLgEbY40TJlFGR+tB+6TxJS
         /nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777945058; x=1778549858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2ubLRqm6894E/xfqMy1P4qorSpO675XYrOno1l/mUk=;
        b=UhUDoCqpblEb2la2BNXQg7/3deSTC5jp3twKt7Ala4fZdRB5EqpDFIYn12TUzv45RW
         6SdPMTRzmUhzLEWANc38n/d1lqE1WTszIT7HN9i/hLFkqfcuOgiNGDnKZ+UIID7v3yRq
         X3CCY3G67oDaaFOz4xCWSKzhdHYY+lOeTKdw0vOwM8BnQwREwP3wkH9fvkHBZpZYz6Hk
         xoEl+Qlt5PXteD7Qlvkim5KodAHR6yyA1tYHw3ddeAVsZ9oAD1qNY4FpzL7H9QfmKaXe
         aikm9q9E/K/Korzfh8wWzyQBNNf/X2VN34GpvgZwOLm1Jsa4SCiNLmp8kePmx4Myhpn4
         EAbg==
X-Gm-Message-State: AOJu0Yz/dA59zlCYJGDFJc3B5iJpU3RHYYM3RVW1xbRAcj0SFamByMd+
	3X5/wJj3DGTsCa2rIOZ6Ip20UC0mz6/+1ZRtxVX8LMmLYu5Xeanzh1SC
X-Gm-Gg: AeBDiesTRp9qNuJuyE0edWskQhK43sLWo9a4GLjw0GpyuhJidQHGMw0yvNq4Ai+l6N5
	UJvDOszFUaKp4Jv2KZKTagJLSM4jx1mimZPnkwdFp1DOzG2yif9Hx8wEpkWBoGTfDsBV/eTvvex
	n13dbz7sGM5WOwkIXjM0g0UuQ3gbXJLOY7a7QIyV6qLT+UnYga1ASpa+p+dUVhZQQjB0e0CUJ+y
	FUpxeploLabEj5xn9zDVD4aq7c/4PyOdjN70H8y+cR+amVmZJiA4KV51C5PswzwQZMaBUUqclVg
	g9ktB3Y8PpLG8q6xjkxreTkFyoMedzFfUI0ek8mlNT4CDjS7qpawpqcEWNw4djpjDWt60B44yTm
	kiGGmir+iuRlrOYQiGWSU74PSPp2/6GRUSIFnjeU+g6OHTTuJyJb0wUSZ2Ib4B3PGUJ3iAfX4h2
	xOzu4sfJRiK3AUblf5hqiekBYuP9g7vpYgdgkTLojY+/BftfkZx0UewROz
X-Received: by 2002:a05:6a20:244f:b0:3a2:bd1d:d67d with SMTP id adf61e73a8af0-3aa3b6d8fbdmr1166764637.34.1777945058179;
        Mon, 04 May 2026 18:37:38 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbf7d2sm230054b3a.49.2026.05.04.18.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 18:37:37 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id B379C4163B75;
	Tue,  5 May 2026 09:37:34 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v10 0/3] mtd: spi-nand: Add support for randomizer feature
Date: Tue,  5 May 2026 09:34:50 +0800
Message-Id: <20260505013453.980249-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_183739_412761_4B796579 
X-CRM114-Status: GOOD (  15.66  )
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

- Patch 1: add the nand-randomizer property to the generic nand-chip.yaml
           bindings. Instead of using boolean properties, it introduces a
           uint32 enum (0 or 1). If the property is omitted, the driver
           will not interfere and will leave the randomizer in its current
           state.
- Patch 2: add the initialization logic and the set_randomizer callback
           to the core framework. The core will now parse the device tree
           properties and enable or disable the randomizer accordingly
           during spinand_init.
- Patch 3: implement the set_randomizer callback specifically for Macronix
           chips (MX35LF/UF series) to handle the vendor-specific register
           operations.

v10:
* mtd: spi-nand: Add support for randomizer: set_randomizer call
  now passes the rand_val directly.

v9:
* Replaced 'nand-enable-randomizer'/'nand-disable-randomizer'
  boolean properties with a single 'nand-randomizer' uint32 enum.	
* Switched to use of_property_read_u32() to align with the new
  binding.

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
  dt-bindings: mtd: nand: Add nand-randomizer property
  mtd: spi-nand: Add support for randomizer
  mtd: spi-nand: macronix: Enable randomizer support

 .../devicetree/bindings/mtd/nand-chip.yaml    |  9 +++++
 drivers/mtd/nand/spi/core.c                   | 20 ++++++++++
 drivers/mtd/nand/spi/macronix.c               | 38 ++++++++++++++-----
 include/linux/mtd/spinand.h                   |  9 +++++
 4 files changed, 66 insertions(+), 10 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
