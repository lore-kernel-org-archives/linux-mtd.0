Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC160C71136
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 10:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=isyftxC7upgKvgpdf2weoPCuL78DR2NtSSLH/PVoXNk=; b=2CI33CCjBDF58Q
	Oz4HJwt19mbvNgCN1r56oFYk904iPR/4Jr6ztK4PSecx5KwRjfnnpqAGKYA+48WU/RLeJTkY0aRt8
	KdkLQQQPrMQn6GCDtBGRKIyciWZBarF2WsxtvEG7hfOwuOXle2ag+trv9Fj3orz2D8MWt7x5cPKly
	AUKDu2K9tig/AV5MmrnLnAtSP07CiIgpRrpFAi1fU8wBwqhnXblnIN61MtBtWEOguTUZXM6sj3ZbB
	hLS75koeLPksbRjWrcLsSBtjC4BBu8cUvYHmtDqF6VQqGHyh4aP5kfZu8t9ZR1lAR15sC1VexvVH5
	xuZ3BeqDyRXKbRSth+2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWx85-008Oxf-1C;
	Fri, 18 Aug 2023 10:54:57 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWx82-008Otv-0w
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 10:54:55 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-317716a4622so705895f8f.1
        for <linux-mtd@lists.infradead.org>; Fri, 18 Aug 2023 03:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692356090; x=1692960890;
        h=content-transfer-encoding:subject:cc:to:content-language:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwyYBzvRuMnT/fqtQoFEMJRGJMRgxgxxTLHYusw2geM=;
        b=eaqze0CbeKApJUXIq49mqodEMRI4atB9uLoCA/r3tgm0f9MUXMt/53mwl14Zx11AGd
         xIQNg8m/PYohvncdDDIrplSRODUNXLy9KsvW8+KigfESZj4XWYdZ8Zchpm2QWRxK+xF8
         kFRahQcPMHQKhI6zRMwNNxDM/BalRVaWhmvNYvgvzXnxjlc2grNKJaBRdikAfA/p/Wmg
         EUpaamCWpvCp07SbfieRChvsdAWRlxsOATEPP7gCF+++giaYIQGUBonA2Sh2UJ56bZ44
         oImecYSiwXVwKE15Yz/DOuwHvEkhzmIvqpatWyCVThMPdb1itP286AjorPbkHD7jTKhn
         vJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692356090; x=1692960890;
        h=content-transfer-encoding:subject:cc:to:content-language:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IwyYBzvRuMnT/fqtQoFEMJRGJMRgxgxxTLHYusw2geM=;
        b=kO+tOjcaoO8AZQAYo96i2j32ggUB1eDu0C713rxFh9Yys4zSi3gLLoDbW5CvQ9IyzX
         pr9yffnT6WGzEKR7itW4Mp5e1adWHEEAGQJoy+AdWTgHe3ii1dDVlENuMaKGoG2lY4HU
         HRmX9dfyCM4QcQRxM420ADAd1C6quZsLKwo/VgnSt0sT0CSxkF5nugTEh2MAwrDrOQV6
         Fi0QgRwTDzoN94D4/ZP3ui69Ktmx/anFzbTXaeytxUYBx7g5et14CdzOTMLTiIO7FT69
         +NcPGT35yQ/IlZRnmnYy1lO/1pRqEGgUkeqQzRVm48hwMsUn/dodwH6yqQXDweJKiKvS
         F3iQ==
X-Gm-Message-State: AOJu0YzTelVH+b8b41p2XNVWSt+AH0KZs+0nrYZDFULTJ1OIrsmwX0hH
	ZLfXZemG5XmjpuFAeWOm1eIHuw==
X-Google-Smtp-Source: AGHT+IGKvg0hGSiAs/Ll1YXwQW480n3WueR3ik5FIP1TWHixboAFrTS7CDb5tcFK95QCebmH8UDm1w==
X-Received: by 2002:a5d:6a10:0:b0:317:cff4:7357 with SMTP id m16-20020a5d6a10000000b00317cff47357mr1549254wru.20.1692356090306;
        Fri, 18 Aug 2023 03:54:50 -0700 (PDT)
Received: from [192.168.0.173] ([79.115.63.195])
        by smtp.gmail.com with ESMTPSA id m15-20020adfe94f000000b0031971ab70c9sm2371165wrn.73.2023.08.18.03.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Aug 2023 03:54:49 -0700 (PDT)
Message-ID: <95ae3e7f-65ff-57bc-6a53-ec219f887959@linaro.org>
Date: Fri, 18 Aug 2023 13:53:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Cc: Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>,
 "open list:SPI NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>
Subject: [GIT PULL] mtd: spi-nor: changes for 6.6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_035454_359076_B90CA3DD 
X-CRM114-Status: GOOD (  11.93  )
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

Here's the SPI NOR PR for 6.6.

Cheers,
ta

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
tags/spi-nor/for-6.6

for you to fetch changes up to 69d50d0461a182872b7f7892702fa3a1ba95950d:

  mtd: spi-nor: nxp-spifi: Use helper function devm_clk_get_enabled()
(2023-08-18 13:14:56 +0300)

----------------------------------------------------------------
SPI NOR core changes:
* fix assumption on enabling quad mode in
  spi_nor_write_16bit_sr_and_check()
* avoid setting SRWD bit in SR if WP# signal not connected as it will
  configure the SR permanently as read only. Add "no-wp" dt property.
* clarify the need for spi-nor compatibles in dt-bindings

SPI NOR manufacturer drivers changes:
* spansion:
  - add support for S28HS02GT
  - switch methods to use vreg_offset from SFDP instead of hardcoding
    the register value
* microchip/sst:
  - add support for sst26vf032b flash
* winbond:
  - correct flags for Winbond w25q128

----------------------------------------------------------------
Amit Kumar Mahapatra (2):
      dt-bindings: mtd: jedec, spi-nor: Add DT property to avoid setting
SRWD bit in status register
      mtd: spi-nor: Avoid setting SRWD bit in SR if WP# signal not connected

Hsin-Yi Wang (1):
      mtd: spi-nor: Check bus width while setting QE bit

Li Zetao (1):
      mtd: spi-nor: nxp-spifi: Use helper function devm_clk_get_enabled()

Linus Walleij (1):
      mtd: spi-nor: Correct flags for Winbond w25q128

Miquel Raynal (2):
      dt-bindings: mtd: spi-nor: clarify the need for spi-nor compatibles
      mtd: spi-nor: Add support for sst26vf032b flash

Takahiro Kuwano (8):
      mtd: spi-nor: spansion: use CLPEF as an alternative to CLSR
      mtd: spi-nor: spansion: preserve CFR2V[7] when writing MEMLAT
      mtd: spi-nor: spansion: prepare octal dtr methods for multi chip
support
      mtd: spi-nor: spansion: switch set_octal_dtr method to use vreg_offset
      mtd: spi-nor: spansion: switch h28hx's ready() to use vreg_offset
      mtd: spi-nor: spansion: add MCP support in set_octal_dtr()
      mtd: spi-nor: spansion: add octal DTR support in RD_ANY_REG_OP
      mtd: spi-nor: spansion: add support for S28HS02GT

Tudor Ambarus (5):
      mtd: spi-nor: rename method for enabling or disabling octal DTR
      mtd: spi-nor: spansion: return method directly
      mtd: spi-nor: spansion: let SFDP determine the flash and sector size
      mtd: spi-nor: spansion: switch s25hx_t to use vreg_offset for
quad_enable()
      mtd: spi-nor: spansion: switch cypress_nor_get_page_size() to use
vreg_offset

 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml |  21 +-
 drivers/mtd/spi-nor/atmel.c                              |   8 +-
 drivers/mtd/spi-nor/controllers/nxp-spifi.c              |  33 +--
 drivers/mtd/spi-nor/core.c                               |  57 +++--
 drivers/mtd/spi-nor/core.h                               |   9 +-
 drivers/mtd/spi-nor/debugfs.c                            |   1 +
 drivers/mtd/spi-nor/issi.c                               |   4 +-
 drivers/mtd/spi-nor/macronix.c                           |   4 +-
 drivers/mtd/spi-nor/micron-st.c                          |   8 +-
 drivers/mtd/spi-nor/spansion.c                           | 318
++++++++++++++++---------
 drivers/mtd/spi-nor/sst.c                                |  12 +-
 drivers/mtd/spi-nor/swp.c                                |   9 +-
 drivers/mtd/spi-nor/winbond.c                            |   9 +-
 drivers/mtd/spi-nor/xilinx.c                             |   4 +-
 14 files changed, 312 insertions(+), 185 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
