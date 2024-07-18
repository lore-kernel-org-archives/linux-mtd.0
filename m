Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A76C3DA49
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2024 03:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JkAZr7F8VvYaC4+o0ihLOLYxR9x1fy1a6PqPX3b+A5k=; b=mGehZ2vP0PErig
	lr8J6twesovuIIMAFhasVQyr3fLkECbIcAMu1n0Wn+Z3mBKXKX2ImdUi15KvAvwimhP05CXmh/n2+
	kHHSxb6fbkPe3MRgMw4nqVLA8Pn1jQOWumaztNkpG8N8PEeMv/ku1ztL1k90kt/zI8uXmOGZgNXtt
	rt4Gx2yTwtClIawzoMJTGpxHxILbs7hNyQWkjGYm3dJj4TbN6J69p/vCqXFIutddArNXqb98iDmou
	IFaza8tIArfRcVSL/1lDpzEl4fJffcsrjfaUVvpQ4DvaKGJ+IYH6Mw0ekdWjCWVwko3dooFi5UwyT
	NBFw6cWROfGSCmHGoUcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUI7J-0000000FeOv-3Sh2;
	Thu, 18 Jul 2024 03:47:41 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUI7F-0000000FeOM-44Ms
	for linux-mtd@lists.infradead.org;
	Thu, 18 Jul 2024 03:47:39 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-396eb81a1cfso139215ab.2
        for <linux-mtd@lists.infradead.org>; Wed, 17 Jul 2024 20:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721274456; x=1721879256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VDh6Ql+TGdlrLagqD7b5t329MBkSs5xxrsa8OqakPWc=;
        b=At0YD8t8iTsT0SkhhxQjh664lrvKEtyEnf8KCCBwMcTAW6t1NCHw/VeHz2a+eAU7e0
         l75tV4znAASJyp314JXTLReROAx6kyxUXkBWvBPRqSajstTnoenc1A07rjYhLicbiGWh
         rK91wkG/+nky7vMFO7zNZXSVnIRbAiLWNsROZ6+jZlGfCvQGvKy+N31Xt/G+TRhTY5Cl
         tl377I4zgabkL71a27/YFMAu/352c+oQ18OmVPyCNQh/W4nH0Jd0YO7/5hC5LeY6fqY2
         xbmH7uNu1P3CpI59uWVNzSXeSbuh4BhHwg381Qx8VR6g6OhoSW/NT/8owlEhw1YxK5fT
         jYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721274456; x=1721879256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VDh6Ql+TGdlrLagqD7b5t329MBkSs5xxrsa8OqakPWc=;
        b=UxPHsgIs91l1v8Oppcd38v4pEis1ptOVVmMYmX5OAuzVp0nHU5Z9kDLGFSjmuaR8o/
         5iS3fkYZaUaLczAzhlzVb9jl3GlDA+TgpmRvD+N2crjmMrGA+YCsbBOBrPNzNBl5qAaM
         K00BqBSuBA2Q0aCHhPHKePjzEENYFifGO5i/vfVFojyMD20Uo1xXlR1vXyr0BXlskI3Q
         bSgUFzIMAmBgyjTSyVaH8e28EiUlAC+B8E2PpAGP78aVO5p6XjgeaM8xwrfJYoG08qZS
         PWaNmOdcBFe9NB9CEbBjo5FFJY2qRVC7A4hi2hRzUWxRiVICTB9xH+OhDFR1FGHOGVGh
         N94g==
X-Gm-Message-State: AOJu0YzTCJgJ7gUrq1wJx8ufbeFZU+VXdZjuuoq7ze64WV/mn+WtiBfY
	KHhPhm/dnmiv0evBOu5wVLjgnR1PtcP6b8ZeyahJjdYLY3klyOT+
X-Google-Smtp-Source: AGHT+IEslbSVdfarj8VF3abfpeoMwQof3aoz3IYeXUjuJa1oSpr3Ne+IxLanbUpayuHh8H8+p2mXdw==
X-Received: by 2002:a05:6e02:216d:b0:375:c9f0:5297 with SMTP id e9e14a558f8ab-39557425460mr45169865ab.26.1721274456490;
        Wed, 17 Jul 2024 20:47:36 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ebc384bsm8946018b3a.70.2024.07.17.20.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 20:47:35 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 94805800D3;
	Thu, 18 Jul 2024 11:56:47 +0800 (CST)
From: AlvinZhou <alvinzhou.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	broonie@kernel.org
Cc: chengminglin@mxic.com.tw,
	leoyu@mxic.com.tw,
	AlvinZhou <alvinzhou@mxic.com.tw>
Subject: [PATCH v9 0/6] Add octal DTR support for Macronix flash
Date: Thu, 18 Jul 2024 11:46:08 +0800
Message-Id: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_204738_038748_2CFE92F0 
X-CRM114-Status: GOOD (  10.71  )
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

From: AlvinZhou <alvinzhou@mxic.com.tw>

Add method for Macronix Octal DTR Eable/Disable.
Merge Tudor's patch "Allow specifying the byte order in DTR mode"

v9:
  Change the name of the configuration register 2 for Macronix Octal flash.
  Fix the bit value in __pad of struct spi_mem_op.
  Use the local variable proto instead of nor->read_proto.

v8:
  Supplement missing S-o-b
  Remove function spi_nor_is_octal_dtr_swab16
  Split IDs by MX25 & MX66
  Add dump of capability in debugfs
  Add dump of params in debugfs
  Add dump of reult for mtd-utils tests
  Add SNOR_ID(0xC2) in last of Macronix ID table

v7:
  Add dtr_swab16 judgement to enable/disable Macronix xSPI host
  controller swap byte feature.

v6:
  Add byte swap support for spi-mxic.c
  Remove flash name in ID table.

v5:
  Remove manufacturer read id function.
  For increased readability, separate Flash IDs based on whether
  it supports RWW feature.

v4:
  Add patch for adding manufacturer read id function.
  remove patch "hook manufacturer by checking first byte id" 

v3:
  Add patch for hook manufacturer by comparing ID 1st byte.
  Add patches for specifying the byte order in DTR mode by merging
  Tudor's patch.

v2:
  Following exsting rules to re-create Macronix specify Octal DTR method.
  change signature to jaimeliao@mxic.com.tw
  Clear sector size information in flash INFO.

AlvinZhou (6):
  mtd: spi-nor: add Octal DTR support for Macronix flash
  spi: spi-mem: Allow specifying the byte order in Octal DTR mode
  mtd: spi-nor: core: Allow specifying the byte order in Octal DTR mode
  mtd: spi-nor: sfdp: Get the 8D-8D-8D byte order from BFPT
  spi: mxic: Add support for swapping byte
  mtd: spi-nor: add support for Macronix Octal flash

 drivers/mtd/spi-nor/core.c     |  4 ++
 drivers/mtd/spi-nor/core.h     |  1 +
 drivers/mtd/spi-nor/macronix.c | 95 +++++++++++++++++++++++++++++++++-
 drivers/mtd/spi-nor/sfdp.c     |  4 ++
 drivers/mtd/spi-nor/sfdp.h     |  1 +
 drivers/spi/spi-mem.c          |  3 ++
 drivers/spi/spi-mxic.c         | 17 ++++--
 include/linux/spi/spi-mem.h    |  8 ++-
 8 files changed, 127 insertions(+), 6 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
