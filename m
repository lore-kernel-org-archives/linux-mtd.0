Return-Path: <SRS0=4SWJ=LK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A251BC48BE8
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 08:50:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 422556109D
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 08:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 422556109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y4KICLoStLql7KZ5K8T807oGGINUPGfHe//8xcxkWYU=; b=3tKmJjHk11FAve
	jbuovIoshYWJtlGmYyTNPiXV5H0ol58lN7Xy6Q9hOmAXM3Prpd+xLaa32QuwK6I4FUpbcl1rRBzGu
	qiHGNi3BriCagx69BtQ9tMkrndfohvbY2ApqLZlyoXrzM5DCXcScIPyKvPuLkzKJ4DK326dUSzddi
	tcUzIn/kOLMSghJkb0ZbLqlGAE71j676Fv/BWKuhbovmt8NRAOSkuorBqcVJjBpZaFkAmJhmhQ4PN
	XMpDJu46ZC0AzW1W4UQbDeRWmQJoR6w1uqEQLNWoUYbQBHQmuNkUgDORhbNahvCNk4eaeHewOC1RZ
	WCbLo0fmj5BKGKn9WN/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltRFF-005RGQ-RR; Wed, 16 Jun 2021 08:49:57 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltREw-005RDK-Mo
 for linux-mtd@lists.infradead.org; Wed, 16 Jun 2021 08:49:42 +0000
Received: by mail-ot1-x329.google.com with SMTP id
 102-20020a9d0eef0000b02903fccc5b733fso1773879otj.4
 for <linux-mtd@lists.infradead.org>; Wed, 16 Jun 2021 01:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VgU9Jm1elp0LKmzDHoxQsBH14JcQuUL9Dz3xjhZCOa0=;
 b=VXibfKggQPfQUxfZbh94SUW6kXu2iUQZRP+oE8vQo1wFLHK92Oe/s9shj7lipZPMvO
 oNBWs9B9vBoWKFAexB4OQnyibzOEBrQTw6cFJCscHAGrQBr4ONPRc4md57HW8oE+T5Xi
 9Lk6m1NQawtRJNAYwr4wy8zres7eJRJ6gUndwBA8yzFFNmSxF6g8EkKLUta6kI1WY3ez
 UJDACyMr9AYyype8npCYj6xMSnFICh50YEPvxRq4lIhxCy+dmlI8dMK1kiwqA6T7vMVM
 xe4gVx92bPj1rRWhRXyzFDvma+wNvlofR+M4jUCTRQq5cwuPqQHgf6C3wALo5qzgVLIr
 CMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VgU9Jm1elp0LKmzDHoxQsBH14JcQuUL9Dz3xjhZCOa0=;
 b=BVeEaXRevfnHU76s0qgyt5pTWxB0Tkia/Gj536rd2755S0aftn2iyhktj1t1rcvrgl
 +6hKViDLdovlKYFGZfMnDOxGbSIPRCgMYKfYoryX/sygr53fIEtGOosomQjKV1T7rGsM
 IYX9Gl9iqmEgTZTs8snCchSH1WaHsFht/CXByeHHxAuOIhttA30zYQhkw12L7JZN2YTa
 OIbydZQ729Jt80MTbK/3QZwgXYY+0B8O9QbAb7iP8ZYxqJ83sP5Ge1YzycWa1ClNJm6d
 /WTLNv3g5gIz5bVg4Y0tbT+45eUl8OyujTv5ib0U3SiJ1o0EjFv3HL0amjRgbdz6r+Ao
 7J8Q==
X-Gm-Message-State: AOAM530re5wyIL+y6KFi/qmSxI4Fm904rihoL3JFG9FfMJ6uHYIe1iN4
 l8dFpssAPLzFj9pmx0JI7DeuS9GDGvU=
X-Google-Smtp-Source: ABdhPJxVsKmqKWgqHS/wingYgja/Tw1MnisNfzagxC/eVW3U0/FJacbsL32B5mzPT5UfCHsuLosB7A==
X-Received: by 2002:a9d:1e4:: with SMTP id e91mr3023891ote.211.1623833376661; 
 Wed, 16 Jun 2021 01:49:36 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id e15sm325272oow.38.2021.06.16.01.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 01:49:36 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v6 0/3] mtd: spi-nor: Add support for Cypress s25hl-t/s25hs-t
Date: Wed, 16 Jun 2021 17:44:52 +0900
Message-Id: <cover.1623831222.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_014938_796778_37C6F151 
X-CRM114-Status: GOOD (  10.26  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

The S25HL-T/S25HS-T family is the Cypress Semper Flash with Quad SPI.

The summary datasheets can be found in the following links.
https://www.cypress.com/file/424146/download (256Mb/512Mb/1Gb, single die)

The full version can be found in the following links (registration
required).
https://community.cypress.com/t5/Semper-Flash-Access-Program/Datasheet-Semper-Flash-with-Quad-SPI/ta-p/260789?attachment-id=19522

Tested on Xilinx Zynq-7000 FPGA board.

Changes in v6:
  - Remove 2Gb dual die package parts and related changes to split mulit
    die package support into another series of patches  

Changes in v5:
  - Fix 'if (ret == 1)' to 'if (ret < 0)' in spansion_read_any_reg()
  - Add NO_CHIP_ERASE flag to S25HL02GT and S25HS02GT

Changes in v4:
  - Reword 'legacy' to 'default'
  - Rename spi_nor_read() to spi_nor_default_ready()
  - Fix dummy cycle calculation in spansion_read_any_reg()
  - Modify comment for spansion_write_any_reg()
  - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
  - Remove USE_CLSR flags from S25HL02GT and S25HS02GT

Changes in v3:
  - Split into multiple patches
  - Remove S25HL256T and S25HS256T
  - Add S25HL02GT and S25HS02GT 
  - Add support for multi-die package parts support
  - Cleanup Read/Write Any Register implementation
  - Remove erase_map fix for top/split sector layout
  - Set ECC data unit size (16B) to writesize 

Changes in v2:
  - Remove SPI_NOR_SKIP_SFDP flag and clean up related fixups
  - Check CFR3V[4] to determine page_size instead of force 512B
  - Depend on the patchset below to support non-uniform sector layout
    https://lore.kernel.org/linux-mtd/cover.1601612872.git.Takahiro.Kuwano@infineon.com/

Takahiro Kuwano (3):
  mtd: spi-nor: spansion: Add support for Read/Write Any Register
  mtd: spi-nor: spansion: Add support for volatile QE bit
  mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and fixups

 drivers/mtd/spi-nor/spansion.c | 278 +++++++++++++++++++++++++++++++++
 1 file changed, 278 insertions(+)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
