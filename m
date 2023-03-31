Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CACC77B60
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 07:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D+nRhpJTskcBN5XnARDw/SE3tdAM2Ds8yWjhZWyKRB8=; b=OElaYqXWB7gimW
	tX5PcZKI/cSGnfakYk3N24GkoENwGWl9f6CRZquyrSlkJEB5wVXRkresc25l0RGw9P+HPKgufy0TC
	KJu+GSodlazrVYRX4nszdOw5wustmzhETt0rfxr7IMAf5B+nZalzptkoCljeeUSWgEiQ8i5zxc8GW
	3W6F1KX9xwFJL15WyM7K65IOqPtg1nA/h/HfO8+Gzuf/nA7lGPdZeMipQ8hrgaS5ZyiLHCi+rijj1
	Z58G2Hfj/Mv0ZhQZEag8VTFoCdJQVq7T4R/my/NBXhoHbfaPo3E16S9d0l+CEsqniiKXfvXnysnym
	Hd10m0MJ+ZZruJ6XbNfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9So-006Cvy-1u;
	Fri, 31 Mar 2023 07:46:22 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9Sh-006Cro-1y
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 07:46:19 +0000
Received: by mail-lj1-x230.google.com with SMTP id a44so3486969ljr.10
        for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2023 00:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680248773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J6XgOZTowFcGahu4EGU1yeiRvS3r5TbCq21y2qrH2tY=;
        b=ShxO/adjRbHt3ZcSXKAHCOZfKZxIjIZpjHoLvdSa0NraKb1dT6g/nG0gzs+zmU3wHq
         BLaTic7PYrsGjtBIC69bKi+1R/TLwJNZ9MSqIjEG99GikJsOYyjQlfXVhUJsDLUjOBS5
         c161O2gPvAguXU6BPN8sNUSvEN3TkwApx1PX1AJyMq0u0FFHFmI3XEeeb847Pbpvj9uD
         gAfa+jdVjK377DQtIPl5xu1CALt/xcbJzxElaHIJY2lSakDtYbbtczIJPSJFVXC2lLdI
         v+mUQ9mwBlUf2l41OdHgEqXdui08YtLLZBTPUrIy/5JlJKZdnkYoR3SmX/adhVnnU7I9
         MTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680248773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J6XgOZTowFcGahu4EGU1yeiRvS3r5TbCq21y2qrH2tY=;
        b=zKs+CTFSz5atpSARVycdYXt1dH1Ny21+57NMHaD2p+0BcVxxHlsR8v1fY1YSGow4l7
         9gKwj8ErA7uGy84RcnPj4WXDyOgYCryrKcVNxVBJ0stkuxDzufFD47NTzJal5YVkFA52
         K6fBtzwVWSeOYRX3Onajl6FFpp7FiMx40ajghXeM8efP2jgDbdbpCIE9/WrUQVcxzJKG
         eKBj+L/HNykO5Deq8CIOHdDiKq+cMYZuMsZhdldKJ70d1zRyp7rgeWVsZpq96Td/LT4g
         ai/uW4641hT0IS1OH/At7dOtpT9eSkfjG9rOLLRRCop3QBW5YCnrKCryAmJ8V+9kfBzv
         N5Ow==
X-Gm-Message-State: AAQBX9eA62O2SFUPtr5MLL7hnECrCR+f7T2BrhfImEyiUa333LhWSXVA
	1mSIio7ncZYnGVAqASus3yZq7A==
X-Google-Smtp-Source: AKy350bx5mHxBC2VUVKvuqYfJeg6LkdraEWnX/2Xo3NZExar9axfEwGSn+2TaDOSIq9yzESDyYgWOA==
X-Received: by 2002:a2e:8091:0:b0:298:9ea9:fd9e with SMTP id i17-20020a2e8091000000b002989ea9fd9emr8199264ljg.24.1680248772753;
        Fri, 31 Mar 2023 00:46:12 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id n20-20020a2e8794000000b0029573844d03sm241201lji.109.2023.03.31.00.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 00:46:12 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	pratyush@kernel.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	Takahiro.Kuwano@infineon.com,
	bacem.daassi@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v5 00/10]  mtd: spi-nor: Address mode discovery (BFPT method & current address mode)
Date: Fri, 31 Mar 2023 07:45:56 +0000
Message-Id: <20230331074606.3559258-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_004615_678960_D70C7BAF 
X-CRM114-Status: UNSURE (   9.57  )
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

This is a new version of the following patch sets:
https://lore.kernel.org/linux-mtd/20220411125346.118274-1-tudor.ambarus@microchip.com/
https://lore.kernel.org/linux-mtd/20230315034004.5535-1-Takahiro.Kuwano@infineon.com/

Changes in v5:
- squash 6/11 and 7/11 to have a single point of failure in case
  regressions are determnined by bisecting. Update commit message.
- get rif of the now empty winbond_nor_default_init()
- s/sfdp_bits_set/SFDP_MASK_CHECK
- set micron-st's static spi_nor_set_4byte_addr_mode_wren_en4b_ex4 only
  when the 4byte addr mode method is not determined at BFPT parsing time
- reverse xmas tree for local variables in
  cypress_nor_set_addr_mode_nbytes.

Changes in v4:
- consider the BFPT retrieved address mode as an enumeration,
  manufacturers could support different methods at the same time
- split renaming of set_4byte_addr_mode methods in several patches for
  better clarity
- have initializations in a single line, even if bypasses the 80 chars
  limit, as they are < 100 chars anyway
- new patches that introduce spi_nor_set_4byte_addr_mode() and handle
  spi_nor_restore()
- clean Takahiro's patch

Takahiro Kuwano (1):
  mtd: spi-nor: spansion: Determine current address mode

Tudor Ambarus (9):
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
  mtd: spi-nor: core: Update flash's current address mode when changing
    address mode
  mtd: spi-nor: core: Introduce spi_nor_set_4byte_addr_mode()

 Documentation/driver-api/mtd/spi-nor.rst |   3 -
 drivers/mtd/spi-nor/core.c               |  85 +++++++++++++--
 drivers/mtd/spi-nor/core.h               |   4 +
 drivers/mtd/spi-nor/macronix.c           |   8 +-
 drivers/mtd/spi-nor/micron-st.c          |  32 ++----
 drivers/mtd/spi-nor/sfdp.c               |  11 ++
 drivers/mtd/spi-nor/sfdp.h               |  27 +++++
 drivers/mtd/spi-nor/spansion.c           | 131 ++++++++++++++++++++++-
 drivers/mtd/spi-nor/winbond.c            |  24 +++--
 include/linux/mtd/spi-nor.h              |   6 --
 10 files changed, 272 insertions(+), 59 deletions(-)

-- 
2.40.0.348.gf938b09366-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
