Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA03CDB47E
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Oct 2023 07:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OFmKT6p4uzgeP4dcc3nWjdyt2UKad4C3m9RE22Z/qDE=; b=Gj2jebt03y/TwR
	22o1Mim6ctKGBtIssuyQ7mOsHF3zoLjHV3Y1iaElKwrVeYlW2WrQk3IBcOcD1jq5iKlBQaaQs5uon
	Ibmjt5HkY+oTzZieOW5OufDpqYJvUsRjMUp9dki76fiSOo+MJxr4jfiNfWn711KbLUXT8BcQfRqcz
	N50QT6eXZ8Xg89bTPfiH0w26HZsMt30npZ8+TSRdz4jBCDmfhXGS0/dP7PuOx3XBXIyYiSGiwOn+7
	B0TBEK4pjxrit4AIaiqmCFeQ8V2TSkXJVOD7399BMUuT2ZZQrItpbO0XarC3w+opFDpIm4P0lj1Bf
	S+fwLjCKs+LUAhgVMALg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt0wk-00E3JC-1q;
	Wed, 18 Oct 2023 07:26:26 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt0wh-00E3IY-0v
	for linux-mtd@lists.infradead.org;
	Wed, 18 Oct 2023 07:26:25 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c50cd16f3bso65004831fa.2
        for <linux-mtd@lists.infradead.org>; Wed, 18 Oct 2023 00:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697613979; x=1698218779; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:content-language:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EB9jdn4tT/wcFGztQkIrIaBfw4z2USDLF7ueCHHXvow=;
        b=BZ1z1VasdDS56PcjzOPK4I0cE9/J+dbUfo9EleOuolZLLRRVN58UZS1Zb/Ya6+jHIp
         +i8w9pfCnibwMg5h4/uIFJKtBpJ+jok6jvzxY2j1Cq6Aa1tNFqvEAHDAV0GkNLpwqhS7
         /Cf0s4pvwfBsEMEruAlnJ6EbNM4EgBj1Q//Z8IRIVGPWW9z6F2Jm8LZFWnDHJwMzl+Ho
         iiHFHFNX3rhKHBTHf9vRe63EBY4GcpV6uRrU65Exi0/rNmNatcvJ4/6F3xmP4TNBoZUE
         kuGTAE5gWHft4wXA2sJc2sLmm5hTeMuyOOq+pFQ8buuqLbTH+8w9Dj/o+eyHdve1kaVl
         TUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697613979; x=1698218779;
        h=content-transfer-encoding:cc:to:subject:content-language:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EB9jdn4tT/wcFGztQkIrIaBfw4z2USDLF7ueCHHXvow=;
        b=isjyMHG4NjqR+/ziIuNd7Oz8UyzLcd/OQxFDlb7XNn9lpExeXblSMXUnFh+ZvzB5tE
         z420ggkjfzHp6bX52tzxoBZmv9v1Lu23G9Nfj3+og1Uc5F92ZAsyp0AA13DHJUyc8Z2U
         W3ToXs6PbPTXqrL6P8XuOOxMXmxEKPJLazbw5g2Y4pQJSirV0CGgS2MmBZ+yzfbX/+e2
         xg5aekjNYM5SeC6ng6wmaC2KkdkepdFl1sZ60Ywhn0GMIJhui89z6/jlpSWqaxsS9mZz
         HhkWxmCsD4WDxgXg1XVQ69rt4ZgXTWEOSmTFvKIk0Htde3rG9OV4i18/K3h6j4Kwb/mi
         zI0w==
X-Gm-Message-State: AOJu0Yyfr4cfdY0zfzTar273DK+vsr7gO9DopCkYVlJ6U1dWwGFViagf
	Kqjzplqk7AGZccnUurmjounlPA==
X-Google-Smtp-Source: AGHT+IFGbq1oSJE/wsJ9qh2+KWPYS0Hpqp0kH7NXEMuNne9YAxBz6iJiUh/qcmrvhKEdwdP8NPoN5w==
X-Received: by 2002:a2e:be03:0:b0:2c4:feef:84d with SMTP id z3-20020a2ebe03000000b002c4feef084dmr3727930ljq.43.1697613979322;
        Wed, 18 Oct 2023 00:26:19 -0700 (PDT)
Received: from [172.20.10.8] ([46.97.171.46])
        by smtp.gmail.com with ESMTPSA id 19-20020a05600c231300b003fef5e76f2csm1561833wmo.0.2023.10.18.00.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 00:26:18 -0700 (PDT)
Message-ID: <60bc9593-445d-47c9-ac47-0b2e2b11756e@linaro.org>
Date: Wed, 18 Oct 2023 10:26:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
Subject: [GIT PULL] mtd: spi-nor: changes for v6.7-rc1
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Cc: Michael Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>,
 "open list:SPI NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_002623_333810_626D807D 
X-CRM114-Status: GOOD (  15.02  )
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

Hello!

Please find the SPI NOR PR for v6.7-rc1 below.
Cheers,
ta

The following changes since commit ce9ecca0238b140b88f43859b211c9fdfd8e5b70:

  Linux 6.6-rc2 (2023-09-17 14:40:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
tags/spi-nor/for-6.7

for you to fetch changes up to 6823a8383420263bc061865027836755615a275f:

  mtd: spi-nor: micron-st: use SFDP table for mt25qu512a (2023-10-18
07:47:22 +0300)

----------------------------------------------------------------
For SPI NOR we cleaned the flash info entries in order to have
them slimmer and self explanatory. In order to make the entries
as slim as possible, we introduced sane default values so that
the actual flash entries don't need to specify them. We now use
a flexible macro to specify the flash ID instead of the previous
INFOx() macros that had hardcoded ID lengths.

Instead of:
-       { "w25q512nwm", INFO(0xef8020, 0, 64 * 1024, 0)
-               OTP_INFO(256, 3, 0x1000, 0x1000) },

We now use:
+               .id = SNOR_ID(0xef, 0x80, 0x20),
+               .name = "w25q512nwm",
+               .otp = SNOR_OTP(256, 3, 0x1000, 0x1000),

We also removed some flash entries: the very old Catalyst
SPI EEPROMs that were introduced once with the SPI-NOR subsystem,
and a Fujitsu MRAM. Both should use the at25 EEPROM driver.
The latter even has device tree bindings for the at25 driver.

We made sure that the conversion didn't introduce any unwanted
changes by comparing the .rodata segment before and after the
conversion. The patches landed in linux-next immediately after
v6.6-rc2, we haven't seen any regressions yet.

Apart of the autumn cleaning we introduced a new flash entry,
at25ff321a, and added block protection support for mt25qu512a.

----------------------------------------------------------------
Mamta Shukla (2):
      mtd: spi-nor: micron-st: enable lock/unlock for mt25qu512a
      mtd: spi-nor: micron-st: use SFDP table for mt25qu512a

Michael Walle (41):
      mtd: spi-nor: remove catalyst 'flashes'
      mtd: spi-nor: remove Fujitsu MB85RS1MT support
      mtd: spi-nor: xilinx: use SPI_NOR_ID() in S3AN_INFO()
      mtd: spi-nor: xilinx: remove addr_nbytes from S3AN_INFO()
      mtd: spi-nor: convert .n_sectors to .size
      mtd: spi-nor: default page_size to 256 bytes
      mtd: spi-nor: store .n_banks in struct spi_nor_flash_parameter
      mtd: spi-nor: default .n_banks to 1
      mtd: spi-nor: push 4k SE handling into spi_nor_select_uniform_erase()
      mtd: spi-nor: make sector_size optional
      mtd: spi-nor: drop .parse_sfdp
      mtd: spi-nor: introduce (temporary) INFO0()
      mtd: spi-nor: move the .id and .id_len into an own structure
      mtd: spi-nor: rename .otp_org to .otp and make it a pointer
      mtd: spi-nor: add SNOR_ID() and SNOR_OTP()
      mtd: spi-nor: remove or move flash_info comments
      mtd: spi-nor: atmel: convert flash_info to new format
      mtd: spi-nor: eon: convert flash_info to new format
      mtd: spi-nor: esmt: convert flash_info to new format
      mtd: spi-nor: everspin: convert flash_info to new format
      mtd: spi-nor: gigadevice: convert flash_info to new format
      mtd: spi-nor: intel: convert flash_info to new format
      mtd: spi-nor: issi: convert flash_info to new format
      mtd: spi-nor: macronix: convert flash_info to new format
      mtd: spi-nor: micron-st: convert flash_info to new format
      mtd: spi-nor: spansion: convert flash_info to new format
      mtd: spi-nor: sst: convert flash_info to new format
      mtd: spi-nor: winbond: convert flash_info to new format
      mtd: spi-nor: xilinx: use new macros in S3AN_INFO()
      mtd: spi-nor: xmc: convert flash_info to new format
      mtd: spi-nor: atmel: sort flash_info database
      mtd: spi-nor: eon: sort flash_info database
      mtd: spi-nor: gigadevice: sort flash_info database
      mtd: spi-nor: issi: sort flash_info database
      mtd: spi-nor: macronix: sort flash_info database
      mtd: spi-nor: micron-st: sort flash_info database
      mtd: spi-nor: spansion: sort flash_info database
      mtd: spi-nor: sst: sort flash_info database
      mtd: spi-nor: winbond: sort flash_info entries
      mtd: spi-nor: atmel: drop duplicate entry
      mtd: spi-nor: core: get rid of the INFOx() macros

Nicolas Ferre (1):
      mtd: spi-nor: atmel: add at25ff321a entry

 drivers/mtd/spi-nor/Makefile     |   2 -
 drivers/mtd/spi-nor/atmel.c      | 121 ++++++++++++-------
 drivers/mtd/spi-nor/catalyst.c   |  24 ----
 drivers/mtd/spi-nor/core.c       |  63 ++++------
 drivers/mtd/spi-nor/core.h       | 138 ++++++++++-----------
 drivers/mtd/spi-nor/eon.c        |  74 ++++++++----
 drivers/mtd/spi-nor/esmt.c       |  29 +++--
 drivers/mtd/spi-nor/everspin.c   |  28 ++++-
 drivers/mtd/spi-nor/fujitsu.c    |  21 ----
 drivers/mtd/spi-nor/gigadevice.c |  82 ++++++++-----
 drivers/mtd/spi-nor/intel.c      |  23 ++--
 drivers/mtd/spi-nor/issi.c       | 118 +++++++++++-------
 drivers/mtd/spi-nor/macronix.c   | 220 +++++++++++++++++++++++-----------
 drivers/mtd/spi-nor/micron-st.c  | 423
+++++++++++++++++++++++++++++++++++++++++++----------------------
 drivers/mtd/spi-nor/spansion.c   | 392
+++++++++++++++++++++++++++++++++++++-----------------------
 drivers/mtd/spi-nor/sst.c        | 164 +++++++++++++++----------
 drivers/mtd/spi-nor/swp.c        |  13 +-
 drivers/mtd/spi-nor/sysfs.c      |   6 +-
 drivers/mtd/spi-nor/winbond.c    | 288
++++++++++++++++++++++++++++----------------
 drivers/mtd/spi-nor/xilinx.c     |  32 ++---
 drivers/mtd/spi-nor/xmc.c        |  19 +--
 21 files changed, 1407 insertions(+), 873 deletions(-)
 delete mode 100644 drivers/mtd/spi-nor/catalyst.c
 delete mode 100644 drivers/mtd/spi-nor/fujitsu.c

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
