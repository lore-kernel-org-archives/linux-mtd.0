Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DB9C982DE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 09:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HtiAbCtJ1EPtgxUneblyCF+CsaH+fRJZt1teUV69P5o=; b=ScqKHjW6cl5CXJ
	J/SBAyHpPuYFyDE48bqI/RqjKhL+yStOvGSufwWuFMuGUggeBXllbm8BnnlaKefIxlPXQo9ZKDi5z
	gIk1rvQWhfjYlpNtY9DphYY3I+twu5unZVE9AH0YgYQ3lTGqLRPUrdwnLi9NYWWTCU6ij3y153/uN
	5mpkfg6pPDM2oon0yIwh0GFHizsOnKr9ahp+7QPRBDF9d7hs+lTtCa7MbTizFvszKzAqMy/ajoNKt
	tnXqBlQE3ySW3YTMtdxcmbLWSRI3+PvBlJtcPy2XhUdD7Zko0/wxnvKj6m1wVS4Xexbfy/IigHvas
	7iJ3cOg7X9O+JZ5KTgLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aU4-00000001Xny-1G3Q;
	Mon, 21 Sep 2026 09:38:48 +0000
Received: from spam01.horizon.auto ([42.62.85.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aTz-00000001Xid-2hR5
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 09:38:45 +0000
Received: from spam01.horizon.auto (exchange003.hobot.cc [10.69.1.10])
	by spam01.horizon.auto with ESMTPS id 68L9c0VA068799
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
	Mon, 21 Sep 2026 17:38:00 +0800 (+08)
	(envelope-from fei.xie@horizon.auto)
Received: from server227.horizon.auto (10.9.0.252) by exchange003.hobot.cc
 (10.69.1.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Mon, 21 Sep 2026
 17:37:59 +0800
From: Fei Xie <fei.xie@horizon.auto>
To: Mark Brown <broonie@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger
	<richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Parshuram Thombare <pthombar@cadence.com>, <linux-spi@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, "fei.xie"
	<fei.xie@horizon.auto>
Subject: [RFC PATCH 0/4] spi: cadence-xspi: add ACMD PIO support for NAND and NOR
Date: Mon, 21 Sep 2026 17:36:57 +0800
Message-ID: <20260921093701.1341766-1-fei.xie@horizon.auto>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.9.0.252]
X-ClientProxiedBy: exchange004.hobot.cc (10.9.15.112) To exchange003.hobot.cc
 (10.69.1.10)
X-DKIM-Results: exchange003.hobot.cc; dkim=none;
X-DNSRBL: 
X-MAIL: spam01.horizon.auto 68L9c0VA068799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horizon.auto;
	s=auto; t=1789983483;
	bh=39e/HaE+D1BgE7Sx1CzFyI167JKdJLF6ONVfYDIzyB0=;
	h=From:To:CC:Subject:Date;
	b=e0z544Mguqjn1CSH378BSFBllK//9QHBMTtJ6WjzgzaKF661dmxW055UnoS60SvvS
	 BBiCUW89R0U0z4FuwcbEtF/DKfEw4O6hTD6QqVlGJGzKvx/o8FuZNUTeMhq+EKM7G0
	 VhtAsjBwOwM1p2dxRvdtrBcQ2JpV/Ml6E7DM0u+mcytOqJJd+9P5c8ymuEvD71MLBq
	 yzN6uh0ehuZIth8wAcJIDeWEdmF35l8j/o3B/qmNJ5e8iJrixyf2JQVJJMkb/UEIVf
	 Amq8wFK4DurjPGOk98sENEIRAi2wVRINflENWFePzzYCp0SQrs+HP6WteKnxHplxq/
	 G571W9F855GzQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_023843_989237_85FBED4F 
X-CRM114-Status: GOOD (  17.50  )
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

From: "fei.xie" <fei.xie@horizon.auto>

The Cadence XSPI controller provides an automatic command (ACMD) engine.
It can execute complete flash transactions, including command sequences,
device-ready polling and master-DMA data transfers.  Software submits a PIO
command containing the flash address, DMA address and transfer length.

For SPI NAND, for example, a read transaction combines PAGE READ, status
polling and READ CACHE in hardware.  Program and erase transactions also
combine write enable, data or erase commands, and status polling.  This
avoids submitting each command separately through STIG mode.

This RFC contains a working controller-local implementation for both SPI
NAND and SPI NOR.  Unsupported operations continue to use STIG mode.

There is an important layering issue in this implementation.  In order to
program the hardware sequences, the controller driver obtains upper-layer
driver data and directly uses struct spinand_device or struct spi_nor.  It
also keeps state across individual spi_mem_exec_op() calls in order to
recognize a complete NAND transaction.  We do not consider either property
desirable for a final implementation.

The hardware nevertheless needs information which is not available in one
spi_mem_op.  A NAND read is represented by separate PAGE READ, status-poll
and READ CACHE operations, while the ACMD engine needs all three before the
transaction is started.  NAND geometry is also needed to translate row and
column addresses for the ACMD address space.

We would appreciate guidance on the preferred interface boundary:

  1. Is a controller-local implementation acceptable because these command
     sequences are specific to the Cadence ACMD engine?

  2. Should SPI mem instead provide an interface for submitting an ordered
     group of operations, including status-poll semantics, with SPI NAND
     and SPI NOR constructing the group and the controller translating it
     into hardware sequences?

  3. If the latter is preferred, should NAND geometry be supplied through
     the sequence interface, or should it be exposed to controllers
     separately?

We have prototyped the second approach locally by adding sequence callbacks
to drivers/spi/spi-mem.c and constructing the NAND transactions in
drivers/mtd/nand/spi/core.c.  It removes the controller dependency on MTD
private structures, but the initial version duplicated page/OOB preparation
and made the generic sequence interface carry NAND-specific geometry.  That
prototype is therefore not included here; we would first like agreement on
the interface.

Performance
===========

The SPI NAND path was tested on a Horizon Robotics J6B platform with a
GigaDevice GD5F4GM8RE device.  A vendor Linux 6.1 backport of the same ACMD
implementation was used for the hardware tests.

Under the same 80 MHz transfer configuration, the sequential-read results
are:

  STIG using readq:  8.24 MB/s (7.86 MiB/s)
  ACMD PIO + MDMA:  10.08 MB/s (9.61 MiB/s), about 22% higher
  STIG read CPU:    59.74% / 40.87%
  ACMD read CPU:    approximately 16%

Using the lower STIG CPU figure for a conservative comparison, ACMD reduced
read CPU usage by 24.87 percentage points, or approximately 61% relative.

The CPU reduction comes from moving device-ready polling and command
sequencing into the controller.  Software no longer needs to submit and
wait for each STIG command while a page is being transferred.

The ACMD program path averaged 2.94 MiB/s over ten 128 KiB writes,
excluding erase time.  A 128 KiB random-data erase/program/read test
produced identical SHA-256 hashes and byte-for-byte comparison.  Read,
program and erase were also traced to confirm that the ACMD path was used.

The mainline series has been compile-tested for arm64.  The SPI NAND
hardware tests were performed with the Linux 6.1 backport because the test
platform currently runs the vendor 6.1 kernel.  SPI NOR has been
compile-tested but has not yet been tested on hardware.

This series is intended to start the API and layering discussion rather
than to propose the current upper-layer coupling as the final design.

fei.xie (4):
  dt-bindings: spi: cdns,xspi: add SPI NAND compatible
  spi: cadence-xspi: add ACMD support for SPI NAND
  spi: cadence-xspi: factor out reusable ACMD helpers
  spi: cadence-xspi: add ACMD support for SPI NOR

 .../devicetree/bindings/spi/cdns,xspi.yaml    |    3 +-
 drivers/spi/spi-cadence-xspi.c                | 1259 ++++++++++++++++-
 2 files changed, 1260 insertions(+), 2 deletions(-)

-- 
2.34.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
