Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB02C77B6E
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Apr 2023 14:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hJUtWsSVePRWFUUkedS+BIYx9zulwRP8vdlb9ui8hJw=; b=e2awITx6kMDdip
	OILiOhn5xd40RjKo9dkv/ev0O+/2CYRJZowu6MaEQ+mXVKGbWkmJTLzn+mSJ6bVo6GdmmtyXwY73O
	c6YbPRNYzOVkKTtchOalozHK9EGDK+h/GVRvqgcy0qgVsU4ofjcpHiaeD7FP1DGT+leqGl+qhWZBg
	4SLtKUHq5PAtraDoF08+kRjc0jE0gr2qu116alJx+wHNTQyf+W/PNK4HGnQ0l7IXeL5gWuPU+D4GC
	ZfEY3cuNeh/WY+pPx45A943JQasscTisEZZTMeAeQN6IcA/cNzTV9r4nqZB5vzpKyD2+zO8pKlY0z
	t/st18YeP2+G9+IUdEFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnKrN-009tGJ-2Z;
	Fri, 14 Apr 2023 14:57:09 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnKrJ-009tFV-16
	for linux-mtd@lists.infradead.org;
	Fri, 14 Apr 2023 14:57:06 +0000
Received: by mail-ej1-x629.google.com with SMTP id gc14so1143999ejc.5
        for <linux-mtd@lists.infradead.org>; Fri, 14 Apr 2023 07:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681484221; x=1684076221;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZ4HieBFKjhdRzMzhLO1ii3SoQyXphIf82V8c6jN+uQ=;
        b=ee43yfChg6G58w5WQQmQEvoPPsKAcHm/rfSu+p2Ak3S8Mqjmun7zb0YcD5N/exxBUS
         aobxxPjtZ82+1C1MVD6a6Aky4NS9KB4oeBD7ZIySyY3ibWCB8n4cNeLmfwiAzNdib0bn
         EipB6jR5Vq5qMwkrT80msfVaUzbRHg8+PsnGhtPhc/0yXaAE3TAOcLoqVvTXZWqROwqX
         oXG5jBAUzD7uUQctxxnOpTpxrBKl86TPYLAMBTTCbt0f/ODTLj62cuvDTI9WTOFoq7de
         ovQAj8LIjqeZnPZ9vDoKi3I1X/03/ZXw85kQYP5mnfosDFkgH5JFxlEHX46YOleh8jms
         PMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681484221; x=1684076221;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rZ4HieBFKjhdRzMzhLO1ii3SoQyXphIf82V8c6jN+uQ=;
        b=M40P5sfF+OzcTBxgos5NKr8q/aoTM2X5bFkoWsWKEQsQS5ljWCRwgwXNa3tKRYPAPM
         vo9a1tH3J2mZt2cxAxtgZ2sS2tE6uLVNZU729AcPyLkYFWRKHcIh2ncPaUKsri1IFPQ2
         k4+9ETd72H51sqGIicgBZ6lqFt7ETpdjDuSMblr7aQSO3VrNRgLck9zddaSWhNU+J6VD
         7Zw1ZrGer3OVTwK32wsX7vLPvXqSWRf6nZzRQ7TSZdI3Zge0MF8w1zQh2dA7VYzygrLp
         zXBCDYhwfTrCJg4Ki3kEj3JDNRe99aJSGP2D85xqki6iuYUZc3jX4mgZeRj08VltaS5h
         H+4g==
X-Gm-Message-State: AAQBX9dBOtQNWWNTE6KF6AbUCKZcykuCir2nsLsU9W6XpGR66Gq/H4ug
	54i5Gh/Su/8657araNZf4xxFZCCy2T7H8iZygjM=
X-Google-Smtp-Source: AKy350aahf9OuHVcTbCzrBp3H8I3qCzElfwJmERKwy6bQDqXhCNon0xSRFgWl4NeKDaQ20fJgYQmfg==
X-Received: by 2002:a17:906:e82:b0:94e:68a5:b7b8 with SMTP id p2-20020a1709060e8200b0094e68a5b7b8mr6228358ejf.76.1681484220906;
        Fri, 14 Apr 2023 07:57:00 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.230])
        by smtp.gmail.com with ESMTPSA id q16-20020a1709060f9000b0094e954fd015sm2585381ejj.175.2023.04.14.07.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 07:57:00 -0700 (PDT)
Message-ID: <294afd6f-9e3b-0bbb-dda0-ad8d8c02c3b1@linaro.org>
Date: Fri, 14 Apr 2023 15:56:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Cc: Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [GIT PULL] mtd: spi-nor: Changes for 6.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_075705_393022_BAC9A6EF 
X-CRM114-Status: GOOD (  12.73  )
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

Hello,

This is the SPI NOR PR for 6.4.

Cheers,
ta

The following changes since commit eeac8ede17557680855031c6f305ece2378af326:

  Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
tags/spi-nor/for-6.4

for you to fetch changes up to df6def86b9dcbc3e8ed4964c7b79b70c9b0c3040:

  mtd: spi-nor: spansion: Add support for s25hl02gt and s25hs02gt
(2023-04-08 09:41:13 +0300)

----------------------------------------------------------------
SPI NOR core changes:
* introduce Read While Write support for flashes featuring several banks
* set the 4-Byte Address Mode method based on SFDP data
* allow post_sfdp hook to return errors
* parse SCCR MC table and introduce support for multi-chip devices

SPI NOR manufacturer drivers changes:
* macronix: add support for mx25uw51245g with RWW
* spansion:
  - determine current address mode at runtime as it can be changed in a
    non-volatile way and differ from factory defaults or from what SFDP
    advertises.
  - enable JFFS2 write buffer mode for few ECC'd NOR flashes: S25FS256T,
    s25hx and s28hx
  - add support for s25hl02gt and s25hs02gt

----------------------------------------------------------------
Miquel Raynal (10):
      mtd: spi-nor: Introduce the concept of bank
      mtd: spi-nor: Add a macro to define more banks
      mtd: spi-nor: Reorder the preparation vs. locking steps
      mtd: spi-nor: Separate preparation and locking
      mtd: spi-nor: Prepare the introduction of a new locking mechanism
      mtd: spi-nor: Add a RWW flag
      mtd: spi-nor: Enhance locking to support reads while writes
      mtd: spi-nor: Fix a trivial typo
      mtd: spi-nor: Delay the initialization of bank_size
      mtd: spi-nor: macronix: Add support for mx25uw51245g with RWW

Takahiro Kuwano (12):
      mtd: spi-nor: spansion: Make RD_ANY_REG_OP macro take number of
dummy bytes
      mtd: spi-nor: spansion: Add support for Infineon S25FS256T
      mtd: spi-nor: spansion: Determine current address mode
      mtd: spi-nor: spansion: Enable JFFS2 write buffer for Infineon
s28hx SEMPER flash
      mtd: spi-nor: spansion: Enable JFFS2 write buffer for Infineon
s25hx SEMPER flash
      mtd: spi-nor: spansion: Enable JFFS2 write buffer for S25FS256T
      mtd: spi-nor: Extract volatile register offset from SCCR map
      mtd: spi-nor: sfdp: Add support for SCCR map for multi-chip device
      mtd: spi-nor: spansion: Rework cypress_nor_get_page_size() for
multi-chip device support
      mtd: spi-nor: spansion: Rework cypress_nor_quad_enable_volatile()
for multi-chip device support
      mtd: spi-nor: spansion: Add a new ->ready() hook for multi-chip device
      mtd: spi-nor: spansion: Add support for s25hl02gt and s25hs02gt

Tudor Ambarus (11):
      mtd: spi-nor: core: Move generic method to core -
micron_st_nor_set_4byte_addr_mode
      mtd: spi-nor: core: Update name and description of
micron_st_nor_set_4byte_addr_mode
      mtd: spi-nor: core: Update name and description of
spansion_set_4byte_addr_mode
      mtd: spi-nor: core: Update name and description of
spi_nor_set_4byte_addr_mode
      mtd: spi-nor: core: Make spi_nor_set_4byte_addr_mode_brwr public
      mtd: spi-nor: Set the 4-Byte Address Mode method based on SFDP data
      mtd: spi-nor: Stop exporting spi_nor_restore()
      mtd: spi-nor: core: Update flash's current address mode when
changing address mode
      mtd: spi-nor: core: Introduce spi_nor_set_4byte_addr_mode()
      mtd: spi-nor: spansion: Rename method to cypress_nor_get_page_size
      mtd: spi-nor: Allow post_sfdp hook to return errors

 Documentation/driver-api/mtd/spi-nor.rst |   3 -
 drivers/mtd/spi-nor/core.c               | 502
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 drivers/mtd/spi-nor/core.h               |  36 ++++--
 drivers/mtd/spi-nor/debugfs.c            |   2 +
 drivers/mtd/spi-nor/macronix.c           |  11 +-
 drivers/mtd/spi-nor/micron-st.c          |  36 ++----
 drivers/mtd/spi-nor/otp.c                |   8 +-
 drivers/mtd/spi-nor/sfdp.c               | 107 +++++++++++++++-
 drivers/mtd/spi-nor/sfdp.h               |  27 ++++
 drivers/mtd/spi-nor/spansion.c           | 460
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 drivers/mtd/spi-nor/sst.c                |   2 +-
 drivers/mtd/spi-nor/swp.c                |   6 +-
 drivers/mtd/spi-nor/winbond.c            |  24 ++--
 drivers/mtd/spi-nor/xilinx.c             |   1 +
 include/linux/mtd/spi-nor.h              |  19 ++-
 15 files changed, 1081 insertions(+), 163 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
