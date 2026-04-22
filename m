Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF82DF94CDC
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2026 07:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5kpfH9A9LQVKn5oQjpvIYmJzQKV1peHviZUKBFwLIgo=; b=yliDpWBwUelvXG
	ySrhAPLkmxkJYHWx9M05LRCO13vQFCieZozFsoOZovzyTE7Uexs+HDUJpyKa+zS4PhtXXG0UPJgkD
	IL4AORrYWGB+sfPJt9U5mupwAjGXXciZGXyp243QCVPp4B2d2dMOU0P84FNfoGqJwuNjObB31++lF
	9K1qEs36Ft59v1wIb2XFMFnL0rnSHJdKfCEbRY/CFXyWWiUg5EDuHIfDYr3IA2VYjxHEMsSdoG8y5
	FBZwezH7oJq/JD2HerFRb1b85TrSw2GLiRRXcgVadprywPyQcyKJFzByE55SyJdLDVSrSXv5mktG2
	/lwVnPvJVWeJeq3hHnSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRcX-00000009hDy-2bWx;
	Wed, 22 Apr 2026 07:03:37 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRcV-00000009hCa-0fxT
	for linux-mtd@lists.infradead.org;
	Wed, 22 Apr 2026 07:03:36 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-35d9f68d011so3347185a91.2
        for <linux-mtd@lists.infradead.org>; Wed, 22 Apr 2026 00:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776841414; x=1777446214; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jc8hj/fYyFv6f/gblFlvOohyiQz/DHY7gT0SmMXTVYo=;
        b=qh762JtuSsGtfBERj86mh2gBsOF9sTEeEpEbJLy+LR+XpzvO0IJYyck+dEQWQwmyIB
         QV+cxTXn5pBmgID7YWqZVg8AMVklFQkBKvKnhflLwU5cBRrO9WBl+O5LX+Ptu9hNTM5I
         xoyTLkBa27BdMFD05U3tt679RJulQMfdEjobkH9JTw9rNyTfQ8oAQJ9r+GqtZX2SnCDg
         laHNgam5tNIHfav2fP/EtLrz+G7IdtQTlKBthTYy4lxq0JVINgshdKZWvTfa1+p53LTI
         aykJfw/PO0U8kyTd1epuxKHRpMPPH/Wc5yX9fkRIRKjRVxreT9bg3xeH86G6vAUdqH1f
         7OrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776841414; x=1777446214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jc8hj/fYyFv6f/gblFlvOohyiQz/DHY7gT0SmMXTVYo=;
        b=T0gZMh5KLc5A/xywruGskTGwOxXlI/I/LCv+FRYQo73kmNa+FN4CY/rFBQXsnLjkiE
         zh/CbieHI9YJPQH6SSGkrdObC/1VgBEpX1nRJO60IGpJLzigrGece8osf44Tdwn97s+x
         NGV24X5FJsx4MdU4iuoPFqz5VlHGLkaoMcuuCItGkahcl1+W/IvgLNlVeenehXNLlD6t
         CRADatceZvpzxoWVVjGGPpQeAkj6d/KfL3kuR2PRlofZ9HrfTqAWaHtCb/NCAbNl+6ZK
         iWOw8C3vBi9RembNK4l9Hz5Q6n+in01/83hJ9uuQtkwTapxYA1AgJ6IsimdWhwn+TuOi
         eQ5Q==
X-Gm-Message-State: AOJu0Yx6uQFtdfcacL0Q/N7tAVVSK/klz+6s15JQrsf3mXv30gjN3yVZ
	HRt9hkO7OTddMPPsssKIO0k3ce0aNFweH6Amv0PIS4i+7XgMLeBZeZ5z
X-Gm-Gg: AeBDieuZ6D19c0NAfPYTo3ts3d2fRlsBQWcMA8yYCN4Fy+halvSghj/cyrFq60giz1G
	nJWfNCZLfAvtIux5ezj5oW03CsX7ylDvIdeFhtA+G0pTW4ERUfvFOf0gP5g1NvPN6kpCO9Gx6Uc
	jF/FBfDKvqiPCGxhkuscJYh6mT/E+iRQmLcqjFtU5cZmh82ipBJ+IsVDes6djFIPXjaudW2OjS8
	hI5A/PkNtMHUm+mCS7MoMuxBcve6wkOWQMF7fHKaLpPR4siQ/ysYcix3C96C15QSWy0fAuuY7Z4
	kTzfawTKcrVjozVcnYfnA6D7KxPSp1XZ7ZBFuCzkA/T6UyXccbVuHbrSCeXUmOQTt6LLBzmmcYP
	+mHyS1QeHtigR5CPXf/xw1sRQSpxUKXv7bTjw7D2VInmuH9Gg6yuRPcW99eZJo0TDXTj1UHB2Uh
	pq8r3PuPGzelqyIRDMQJCbTsRuk07BKaM5evXwJV1lcwcdeprzurkAG1fY
X-Received: by 2002:a17:90b:5383:b0:35f:b7c1:faad with SMTP id 98e67ed59e1d1-361404a727fmr20892356a91.25.1776841413968;
        Wed, 22 Apr 2026 00:03:33 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-362b9b6f5b5sm2241209a91.1.2026.04.22.00.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 00:03:30 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 157144163B69;
	Wed, 22 Apr 2026 15:03:28 +0800 (CST)
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
Subject: [PATCH v9 0/3] mtd: spi-nand: Add support for randomizer feature
Date: Wed, 22 Apr 2026 15:02:00 +0800
Message-Id: <20260422070203.698716-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_000335_225799_25BDDCED 
X-CRM114-Status: GOOD (  14.69  )
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
