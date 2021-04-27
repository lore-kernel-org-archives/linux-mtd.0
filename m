Return-Path: <SRS0=EgaJ=JY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0760C433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Apr 2021 07:10:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68C47613BD
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Apr 2021 07:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68C47613BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YJl/RDdsxdbgErG/IYw8HhBBlfDC8go15xCp37uNs2Q=; b=ZEyHH84SmDEIOUMy70jeSomDkB
	56RkRYnT86GMpVTZQwj9NCNgTynZfu+DFMyCeVqmW9oXRdY93rfdu4/xm+QG6blPLzY5vxqb3n3Ot
	91Ts/+/PzuqEr9wBzAHu+8FTrTZwdela3H/MKikAjv4XGRMnAcWDF11UzzH27p/QCEFfPDtNw42Yr
	hZp/nKxNuIBMHZQaMJtlZNB/VtDMydTuE3vJjNn97JlqrQXYIxEBOtGFlUXLeH1A4+iUzP9ATPK71
	CY/zveQ5Rk7njmUh9FUqgDeW43Ta1MSYiFidRDyq07dJ4+ERFzqH7Jl/FoXSy5yzyj61clupmsf6Y
	U6/+TJQw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbHqr-000vVL-Bw; Tue, 27 Apr 2021 07:09:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbHqV-000vRH-9e
 for linux-mtd@desiato.infradead.org; Tue, 27 Apr 2021 07:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=PE64ITKkAvqxqoHf35ZqafgpmcraOyXk8Ii59+v1hnk=; b=xi8jw4UG4Iq2nU8N69f6o+vaiR
 Xsu319Y7/eokgQBrz2TAmfVC1AKaNvJBThpg8KmmEZYATf+UImucwYFyJB7gghT1p/Wf6u2yKEB9e
 BV/7mdEYEc1kcGMdLh0+GXl2sl5mGi3+TilJnLORJzCg6r0ajB5AdHBjjyhnW0nPthc4G/ofJDk/7
 HPUO40LbJKCM1WvQlZsowC0smQnN/rQWomH2N8/zJNHa/n6iuixrFCJ422T42S+l37YctpVsS7QJk
 6aUOmLzQGi9umQRKQ6bqn1htN5h+4RflHtH73MX8w6ym3e/nMfR2Y/GnZrXxE5WCdarcMwuGr3O2y
 40Gc/x6A==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbHqR-00GUf9-9w
 for linux-mtd@lists.infradead.org; Tue, 27 Apr 2021 07:09:22 +0000
Received: by mail-pj1-x1036.google.com with SMTP id s14so23540738pjl.5
 for <linux-mtd@lists.infradead.org>; Tue, 27 Apr 2021 00:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PE64ITKkAvqxqoHf35ZqafgpmcraOyXk8Ii59+v1hnk=;
 b=eGfIh3BmXmuAeWg4nYrEt89ddPSSIUiPgav8Va25tMohmSL0rODet8DU9EKyISq61G
 vayCNZ1fhRQcujDKhBP4S5ZCMHEUYAl45yFRP7ll+NI22Af3+oi2hQUwCVS6iPKrXagM
 23MXbkLyF+D/OKtTs3taFPvHNoN4NTzk8hctut7LZeWOU2MKCbLhtjgVMAhjj6fO3m9x
 e27yRKSuhx/ZU/9Uwt6Lruzmb7h9XW2DKYtV3mnbUwE78U2AwncncobuHoy+QMG990v6
 zcL2VhtGyodlR/F9+5QQKlX/C6qyfOIE7eXz9n706Kn5j9+eN1VlFaZhab2f9zUm1Sgq
 NjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PE64ITKkAvqxqoHf35ZqafgpmcraOyXk8Ii59+v1hnk=;
 b=kIBjX/zXuv1MCcV80yE1LJf13TK6rdZVx++31X9Gq6Y153FJsLLBHuOJqtswq8bh7C
 a7Nif2To4XOavQ7gc0J0/4Y+h3tlWI49lAEx8w52iij+HyDOU+TSPtg1z4PuDc5Ou2VX
 d0ssXaz17XQItW7tmsTlD3cdkGay3tyR5T/5SRtEMTsXGP9JQLSqUb/n6MYSh+Z7I2eB
 Zg9vLk8qpO+K1kf+VSkTUpFTJfZ/khEHcDGluvnEwxbVXmE8QycCUY2UqJwVKPnBF5Mu
 byZB6wsD/yWZiKZPd9ooN8CTxNCOltIgItPElr4N1sXoCTHFWgBvvSLyxfxVMdkZlATw
 4rGg==
X-Gm-Message-State: AOAM533x+keci1gavFtnPg6henffI93j4FAhHEF+jWdh6XVxjEzdfgSI
 krk23vJDXm99YohUL7jD6svA+8M6gbc=
X-Google-Smtp-Source: ABdhPJyESEamX7OWq5vn9t6ZdGx+umTqEwKWuLifRH4HkjNmGrGQABEWV7ltLYD+SUx38AmHdA6mIA==
X-Received: by 2002:a17:90b:3746:: with SMTP id
 ne6mr26527406pjb.75.1619507357358; 
 Tue, 27 Apr 2021 00:09:17 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id u189sm1589803pfb.151.2021.04.27.00.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 00:09:16 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v5 0/6] mtd: spi-nor: Add support for Cypress s25hl-t/s25hs-t
Date: Tue, 27 Apr 2021 16:08:55 +0900
Message-Id: <cover.1619504535.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_000919_385289_1C451C63 
X-CRM114-Status: GOOD (  11.56  )
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

Takahiro Kuwano (6):
  mtd: spi-nor: core: Add the ->ready() hook
  mtd: spi-nor: core: Expose spi_nor_clear_sr() to manufacturer drivers
  mtd: spi-nor: spansion: Add support for Read/Write Any Register
  mtd: spi-nor: spansion: Add support for volatile QE bit
  mtd: spi-nor: spansion: Add status check for multi-die parts
  mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and fixups

 drivers/mtd/spi-nor/core.c     |  10 +-
 drivers/mtd/spi-nor/core.h     |   3 +
 drivers/mtd/spi-nor/spansion.c | 327 +++++++++++++++++++++++++++++++++
 3 files changed, 336 insertions(+), 4 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
