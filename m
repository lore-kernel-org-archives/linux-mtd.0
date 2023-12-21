Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01738C35274
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Dec 2023 06:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=alpFp2pZrTi7MG/aaFGBVLiwbwazCpcWcq8QQz1lORE=; b=rbxyi73dCFZomr
	QH2SwGsLHvbLyL60dWn4qzL235tambq0m6mZiQ2v/xuxDY00jFinEZZnHwg7jdO6j/o6GEdRZRKCy
	xvHWs0rlW0USVDcOLooUZr4q75QTmTwMoXBBnbHghQoHukpMqnJIAPF9aA7kWKEydrMYb3xbeCqjS
	ltFzrW6kNH8fZmi7UmDm8Af4NNwlju9/YLM5yqEUoYQlcgtBRVbBf0kQw5OEXIuwSJIiOb743mgVb
	LtHAT1slErmKBc8CEf9Tg61k5wJ1dDGNbYr/fmiDMbnVtihf7KiUXXBLu3fAqxb9A5HUpMSgDOR8c
	3PKKV78y55ZffhAzrFEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGCj8-001q9z-1d;
	Thu, 21 Dec 2023 06:40:14 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGCj5-001q9O-35
	for linux-mtd@lists.infradead.org;
	Thu, 21 Dec 2023 06:40:13 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3368b9bbeb4so35664f8f.2
        for <linux-mtd@lists.infradead.org>; Wed, 20 Dec 2023 22:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703140810; x=1703745610; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:cc:to:content-language:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kr/qB+NJ5BITNiKRRP9doHBpjZ3MkBVYprqfAVhnDsY=;
        b=lN4l5w6iGXS/ptvR65vRsXbj8WEtHvMVE8H3ed1rNbKOp/hLWWIATmdR3IE/dJZE3W
         k/O9YK4gNI/u42gXOT/bzHh4VrYHDJ4W3HOEavfti+iTFwIYhRpODumgrXZsjMu+knQj
         cwiwTCEqDaLoFv7NjHQM7x1EnvsIAsjre/V7BckBdLp45TVAOMaevVNbpZXYqOSvsgxQ
         LS3fWwcgvM43EDDOi1O4lHNCQ3Le5TryT5W0RdVLirJasPdv0OiTQuN9sf79ifaAOwSs
         0IfZKh09OEdqgXWAQD71OOpXCxi6T2z0j0YyLQW6KY/4e6KGR9HpbCX385ilhxbst1Y7
         SGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703140810; x=1703745610;
        h=content-transfer-encoding:subject:cc:to:content-language:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kr/qB+NJ5BITNiKRRP9doHBpjZ3MkBVYprqfAVhnDsY=;
        b=bA7UJKX69DGq13HCwlqmlP1h3WgES+H4wEJsOrIqCyKhmUyC7TsB/5zi5Gwv3RQKSd
         rbR16WOWdjm42OJRILompHXf2g6iTnpzsMlG1SyR7oak+U7zngD5Zc/ql3zu6xNXx++A
         RWGcgaOTWgjBOf5KVPpaekzh1LriniLNY44+3sxmijshw8OqtwMP+bNb28ZTsiG0nc3X
         XQuFxwUq2881aIUhftz2gKGSSTzj3rQPFL0bqYa4PJ4fXep99abpjSzXrD5g2R71eB5p
         Ct78fzVp8vKlGwMmaNYqD+A0sp1awKDsAWxhv52pqfBPgjtZ2wSVTCgP7dfZ9GeaJ/xZ
         WiBw==
X-Gm-Message-State: AOJu0Yx0xptv6nsYf0rLXQy6zdKCQ7E4XiTfDx32aWvGM6gJzthM9c+c
	TV57NaOjk7lsWD/53r3zqvhepQ==
X-Google-Smtp-Source: AGHT+IHuxh3AfSLLTbGxhmLF5cjLZpX4EVM5QtzXESSDkxfxisdiGsLJdzWhz10Hjt2VCeMXLwrYJA==
X-Received: by 2002:a05:6000:1c9:b0:336:37d0:ebb1 with SMTP id t9-20020a05600001c900b0033637d0ebb1mr237594wrx.5.1703140809729;
        Wed, 20 Dec 2023 22:40:09 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id n8-20020a5d4008000000b003366cc543casm1204719wrp.102.2023.12.20.22.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Dec 2023 22:40:09 -0800 (PST)
Message-ID: <b80247b7-ce6c-4c87-8fc0-60af45148632@linaro.org>
Date: Thu, 21 Dec 2023 08:40:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
To: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 "open list:SPI NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>
Subject: [GIT PULL] mtd: spi-nor: changes for v6.8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_224012_003072_7579E40E 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message.
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

Hi!

Here is the SPI NOR PR for v6.8.

Thanks,
ta

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
tags/spi-nor/for-6.8

for you to fetch changes up to 3c0e1dfa703cd2a16fbfb1290b0970b61add3cde:

  MAINTAINERS: change my mail to the kernel.org one (2023-12-20 10:49:20
+0200)

----------------------------------------------------------------
SPI NOR comes with die erase support for multi die flashes, with new
octal protocols (1-1-8 and 1-8-8) parsed from SFDP and with an updated
documentation about what the contributors shall consider when proposing
flash additions or updates. Michael Walle stepped out from the reviewer
role to maintainer.

----------------------------------------------------------------
Fabio Estevam (1):
      mtd: spi-nor: micron-st: Add support for mt25qu01g

JaimeLiao (2):
      mtd: spi-nor: sysfs: hide the flash name if not set
      mtd: spi-nor: sfdp: get the 1-1-8 and 1-8-8 protocol from SFDP

Michael Walle (2):
      MAINTAINERS: spi-nor: add myself as maintainer
      MAINTAINERS: change my mail to the kernel.org one

Tudor Ambarus (10):
      mtd: spi-nor: use kernel sized types instead of c99 types
      docs: mtd: spi-nor: add sections about flash additions and testing
      docs: mtd: spi-nor: drop obsolete info
      mtd: spi-nor: add erase die (chip) capability
      mtd: spi-nor: spansion: enable die erase for multi die flashes
      mtd: spi-nor: micron-st: enable die erase for multi die flashes
      mtd: spi-nor: remove NO_CHIP_ERASE flag
      mtd: spi-nor: print flash ID instead of name
      mtd: spi-nor: mark the flash name as obsolete
      mtd: spi-nor: drop superfluous debug prints

 Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor |   3 +
 Documentation/driver-api/mtd/spi-nor.rst                | 262
++++++++++++++++++++++++-------
 MAINTAINERS                                             |   8 +-
 drivers/mtd/spi-nor/atmel.c                             |  16 +-
 drivers/mtd/spi-nor/core.c                              | 172
+++++++++++---------
 drivers/mtd/spi-nor/core.h                              |  24 +--
 drivers/mtd/spi-nor/debugfs.c                           |   2 +-
 drivers/mtd/spi-nor/micron-st.c                         |  59 ++++++-
 drivers/mtd/spi-nor/sfdp.c                              |  29 ++++
 drivers/mtd/spi-nor/sfdp.h                              |   7 +
 drivers/mtd/spi-nor/spansion.c                          |   4 +-
 drivers/mtd/spi-nor/sst.c                               |   6 +-
 drivers/mtd/spi-nor/swp.c                               |  25 ++-
 drivers/mtd/spi-nor/sysfs.c                             |   2 +
 14 files changed, 435 insertions(+), 184 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
