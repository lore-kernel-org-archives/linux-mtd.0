Return-Path: <SRS0=vdk9=IR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B94FC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 06:52:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEE8764F69
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 06:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEE8764F69
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B4eTEkwoJgygEEpaQtl1CbORbQrpwMvvMjuHUnrUzVg=; b=V8qqe2qJ3C3d+0oo+laESKfqOE
	oagmLX7u1DoBL6OhW1XpzqAHXmqmBla2mbZLEmNC71dlZrfSeAiNJwxbAjJZSTW/u5KpgNl7wEepm
	mYxjB3bl8MoLk6mPsbk2bBkQBt22Vxz+DZD1PEBsI72MQPKgqTatM7Vc8FVSA0fZfcjNsJ80GrKHw
	oqgZSwz4jNoHOppGo0hDmswb2FxF/NaV7mEGXpX+3We3eUQvu1BlX0sr8MLkMcRI09tUPrbS2imME
	+C/HGxvBoAI/YNAyl2HKuTDq5h6veVdth6yW+Xqt6n6/r9hdyV7u/jxkNmMc+a8Mzuof82MLFxiYb
	l5cMryPg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN8zZ-006jOM-2q; Fri, 19 Mar 2021 06:52:17 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN8zN-006jNa-UK
 for linux-mtd@lists.infradead.org; Fri, 19 Mar 2021 06:52:08 +0000
Received: by mail-pg1-x533.google.com with SMTP id k24so3037557pgl.6
 for <linux-mtd@lists.infradead.org>; Thu, 18 Mar 2021 23:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iq172yZLYmkaCfe2U2bYmiD7nZBJ9NqiD1XVKN2K2hc=;
 b=PGILKpMwR0TXz5g91aRwtXJjg/YXp5E+UkRHJWcsGbELXwRzDdhcrmNn6yWeDLsaXX
 xtMOSzCd7nM6kRWwTBDQCPCWboanjn2KZR8VutuqVXq/0AbMlq+XDj9zVgNwJJ1WHGo+
 /uVWtzVyOcfcqT0bVxDQtG3ro8eeOuoRpex421X8/hUsF3jfD4sGK8cgz9e+IqyQJIn0
 PLYcqvAEEVCI245DcRtXjo0kzzuTJgj1MWTY5aNBTEewnaKg05h102r/yGMK46X9hlzj
 JnV136fVABjyLKZ6KIHyvyB1Xftcnn586X0/fUWXpxzHG2jbyYLF/C2WnNNyUIclsfdF
 1cVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iq172yZLYmkaCfe2U2bYmiD7nZBJ9NqiD1XVKN2K2hc=;
 b=QD0u6EFCI/hduAwrh52APwUTXxvGFK/kepLFn0AWHxLMbmjYec4hgj5rr0+74+2yy6
 BMBqhonj9qcvIHyeNKrXBfUX7ULO5RCpbBwL6OtVG2HhXvKOeQRbjCSgaSZsV9EFAQCI
 YjuaRbgdCLVzcXqlwJiDwlsbw2hpzi4XGUfQNO+Owkd8l97KZcyBKAp06gDpzT1d4D/i
 4i/HoqFehoYqnFrylucT7dytOJK81U5pBGgifP0J/QSs1Ri4QwnjbDX17SttgCb6coC5
 ypmh5EPZye8fcGv9IXjXb1FTJJeQusCUw/QNN+AKJJq7Tb/Fc35I5Yy0EqYpkYPblj0N
 KY0A==
X-Gm-Message-State: AOAM533mIFRJsFFAMwTOOoIrgLfHPzX8q4pynd2Fgkekj3bQhH5Fp9D2
 dD3YB9P0HrjbkhD7wSw5Kf+SFcHKUBFy/g==
X-Google-Smtp-Source: ABdhPJy0OvJKlnD8SzL9HKfo2/kRumTtr9JrYO4kIo6wBfwN+K++KiA5XEujFpSk77ZIYcEE6Dc31w==
X-Received: by 2002:a63:c90a:: with SMTP id o10mr10345246pgg.172.1616136723844; 
 Thu, 18 Mar 2021 23:52:03 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id o18sm4072618pji.10.2021.03.18.23.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 23:52:03 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v4 0/6] mtd: spi-nor: Add support for Cypress s25hl-t/s25hs-t
Date: Fri, 19 Mar 2021 15:51:41 +0900
Message-Id: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_065206_155826_C52B109F 
X-CRM114-Status: GOOD (  10.91  )
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
https://www.cypress.com/file/499246/download (2Gb/4Gb, dual/quad die)

The full version can be found in the following links (registration
required).
https://community.cypress.com/t5/Semper-Flash-Access-Program/Datasheet-Semper-Flash-with-Quad-SPI/ta-p/260789?attachment-id=19522
https://community.cypress.com/t5/Semper-Flash-Access-Program/Datasheet-2Gb-MCP-Semper-Flash-with-Quad-SPI/ta-p/260823?attachment-id=29503

Tested on Xilinx Zynq-7000 FPGA board.

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

Takahiro Kuwano (6):
  mtd: spi-nor: core: Add the ->ready() hook
  mtd: spi-nor: core: Expose spi_nor_clear_sr() to manufacturer drivers
  mtd: spi-nor: spansion: Add support for Read/Write Any  Register
  mtd: spi-nor: spansion: Add support for volatile QE bit
  mtd: spi-nor: spansion: Add status check for multi-die parts
  mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and fixups

 drivers/mtd/spi-nor/core.c     |  10 +-
 drivers/mtd/spi-nor/core.h     |   3 +
 drivers/mtd/spi-nor/spansion.c | 325 +++++++++++++++++++++++++++++++++
 3 files changed, 334 insertions(+), 4 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
