Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8DBC4167D
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Nov 2023 14:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/oghK2VKXW6fuMP72L4yaBcwx2aIe7fa8JmSsdWFkIE=; b=FtSvC06d2b+oy7
	gUCWDHePn3xCkYupwh1lvaeNn6iYLrDkWNdsRMn/xjuMvf2dIcSpU9LCEj3yFdDnhwelwLd3YUeHv
	kSM1xl+zYy5aOx9BCJgreVTJqbDWICAD1ngUGKEAerJq8jzTwnrDyVWvlKHkrkuLKil6l6yThEzRc
	iAsGZLphfa4rY0sov5X0/wtpfbxiyHrDAY9J3AXxe0dGuZpuj1IxcqUwhirMd5OhYJJIzNQL3PQx2
	u4dm2agqHzY7M7I/03Gn7D22JnOfZw7ofbwNsNJQPRWZjh2BsTquHoFZNRnhpDci8lx/KrjjmwdrD
	RMydBASSIhiH8dmo5fXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyCgY-007ggt-2P;
	Wed, 01 Nov 2023 14:59:10 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyCgR-007gcf-2w
	for linux-mtd@lists.infradead.org;
	Wed, 01 Nov 2023 14:59:07 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9c773ac9b15so1027266366b.2
        for <linux-mtd@lists.infradead.org>; Wed, 01 Nov 2023 07:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698850738; x=1699455538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f3YeiMm5rjHxVc5hxbE5JdX0iH5LC4lBN+TS1NBzY74=;
        b=BzGHL+WFATzT1qoeQ8cDfP4p2ld/sAkU+wqK9VwOS7+83Xx9orp/x5Cguaer75D4t1
         ATXzVSS/E7YeUw8t0ufx+5Cq28sS+yALhT4On1hwzoJlmcdfDjc+TxstoOvpOSh3rtGx
         n741uEPEvdGt6BXWwKWy9wegH07GsmJgZgSZqmirtyIFpz9uvsUJUJqXkGnR9T/F3nFb
         +zOSWQ00G1NyNJRLm35mQI89A1jy5eAaqCbbHMCsbxdC2aeTdLxrl68jk6c3lZ1llqjn
         6evKQatfEACXoNzD14nSwsoV5HJ7G6i321oOF/2SUaVqmuPAd74Q7UVuWGEYcEDCQrtg
         qqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698850738; x=1699455538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3YeiMm5rjHxVc5hxbE5JdX0iH5LC4lBN+TS1NBzY74=;
        b=dWR+lszAgwE6wHSbAq7m8j9FzhTYREzQ8BUerGT1TzNGjMt/TFhLnVf4Pfr3U3WgI3
         sLCS4lEpxgizsMh2Htv5RuLa0v+gJKzp1Xmror9gHWwxiRJG9l23wUWKY3gcbOKxxReh
         aX4OWmiYP0fbJkQVMDRWP4smJl5uILaYx9wJPeSY9TgC9TUSUCimLLpVOcAP7scKORiR
         HYq9fHfYeEjCXUzuX75Di278PlaU+2QrVphitZKpejZVeEiwMosKjd8i7Xygyo2KEZJK
         zx+OnptCOzPHFG7/Ao8qt0lorQ25BOvz3ynk8QdZj7RuSOwvyRZsSljq1tHLa/KDCLCp
         vsQg==
X-Gm-Message-State: AOJu0YxhOiVWrZjH1O+WYk1ImDylTiheQvgpCJXRoi1b3s4zqugagF0Q
	c4Qeq2f+ACwWFd1hug5DTXT5hw==
X-Google-Smtp-Source: AGHT+IFDV/jqvxoKb04a6+4D6bN8lN3UawvZYUWxcmMtrUMNCsgU43ASGDECWoSxJIZanrnzLf2Z5Q==
X-Received: by 2002:a17:907:36c5:b0:9d3:f436:6804 with SMTP id bj5-20020a17090736c500b009d3f4366804mr1959927ejc.29.1698850737484;
        Wed, 01 Nov 2023 07:58:57 -0700 (PDT)
Received: from tudordana.roam.corp.google.com ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id i18-20020a170906115200b009ad8acac02asm20448eja.172.2023.11.01.07.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 07:58:56 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	festevam@denx.de,
	takahiro.kuwano@infineon.com
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 0/6] mtd: spi-nor: introduce die erase
Date: Wed,  1 Nov 2023 14:58:47 +0000
Message-ID: <20231101145853.524045-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_075903_969399_8649E7F1 
X-CRM114-Status: GOOD (  10.20  )
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

The patch set is just compiled tested as I don't have a multi die flash
at hand. Takahiro and Fabio, please test the series and let me know if
it works on your side.

This will be followed by the removal of SNOR_F_NO_OP_CHIP_ERASE and
implicitly of the old xilinx SPI NOR driver, but let's take it all in
small bites.

v2:
- iterate over all dices instead of erasing just one
- consider address of die erase command
- fix default value of nor->params->die_erase_opcode
- introduce spi_nor_erase_dice

Fabio Estevam (1):
  mtd: spi-nor: micron-st: Add support for mt25qu01g

Tudor Ambarus (5):
  mtd: spi-nor: use kernel sized types instead of c99 types
  mtd: spi-nor: add erase die (chip) capability
  mtd: spi-nor: spansion: enable die erase for multi die flashes
  mtd: spi-nor: micron-st: enable die erase for multi die flashes
  mtd: spi-nor: remove NO_CHIP_ERASE flag

 drivers/mtd/spi-nor/atmel.c     |  16 ++---
 drivers/mtd/spi-nor/core.c      | 112 +++++++++++++++++++++-----------
 drivers/mtd/spi-nor/core.h      |  22 +++----
 drivers/mtd/spi-nor/debugfs.c   |   2 +-
 drivers/mtd/spi-nor/micron-st.c |  47 ++++++++++++--
 drivers/mtd/spi-nor/spansion.c  |   4 +-
 drivers/mtd/spi-nor/sst.c       |   6 +-
 drivers/mtd/spi-nor/swp.c       |  25 ++++---
 8 files changed, 153 insertions(+), 81 deletions(-)

-- 
2.42.0.820.g83a721a137-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
