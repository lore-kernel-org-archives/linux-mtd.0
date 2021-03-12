Return-Path: <SRS0=p7xI=IK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 036EFC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 09:41:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89AEA64FEA
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 09:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89AEA64FEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LJfEtTUKdZ96eD4kcQBhH2+wSH+q6ezT5mSJExcWGlU=; b=YBXJIg1VtJWH9mDW9XWVAZDmSF
	DVsIsQRWCNsgHYcaTwmGwRIrh7aBVz9GlQ177N6mFBrHraeCk0G4Lccu4gLb9hq96Eh1w2jaCq63n
	Acvn990B9WsCxMNF6/Mlzu2F62nqXq4shq/+Xjzc1g9DubBXX+T+R3+gRgXKoZ9zJQfrB/v3Vx4ZF
	Yez0i1YHHEo0sPSVTYEbE2IhZNW/iyfoOTsfXJy98jfpXu33MzxzpRN0iBC/Vdkz3qbzTVRHcwtNG
	qY6M41DbO007yf0aEE2rIomLHLIlBR31YF5iPV86LZGkw9V47aIDaqhU5rzdZVSybWmq+nraLnOZA
	JfZ50lvQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKeHa-00B38d-Qi; Fri, 12 Mar 2021 09:40:34 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKeHU-00B37x-JA
 for linux-mtd@lists.infradead.org; Fri, 12 Mar 2021 09:40:30 +0000
Received: by mail-pl1-x632.google.com with SMTP id e2so6407202pld.9
 for <linux-mtd@lists.infradead.org>; Fri, 12 Mar 2021 01:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3IF9I8z/trLe+87qiriycv6UhRHmi+UIHRTJb1cOrC8=;
 b=iO2reh8plbuZAj8k5ABBqyWZvGj/Z5cFK4Ckoef0daJEQBQ3cse4TtctpMDSS3DgJS
 luaWpjQDhSChpcUfHaACQvQWBo+HK9enliQadc1WsLXbfKTYHctUH38wgXczkDwTriym
 bnwwqGy9P6rY2JPE8UHTKb7CV0XKxkppZ34EI6hUG+JnBoBsH8af3HhL1tc67jmXboRz
 Nq1Prv7D0VgltGM/6253j15Zn8Hyh3U2s2kDHJuUbTSs7GnpZ68cpBStj6XEkzPiDl54
 EMIYfR0WSVvFg01UPR1KZ/K0gKgrNG4DDk04tNAXTnr4E5h3RKRUOJW8lsCkKUfQIaP3
 vbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3IF9I8z/trLe+87qiriycv6UhRHmi+UIHRTJb1cOrC8=;
 b=FWRhZMWryRiiU1vpycnJGTIjndp4Hcce0UuntZ1ZZgpjBlznfujVoSGe46IyMMP1ze
 edSr9nyyOinKbyZtqGp76NZ+UxAmJl177QWSz555nrkOicTyp8Boto+T9YHdcwyP5vky
 RKI61q3PLPksygReIBCXyhb02MCvkBBxdI+AEUGLT/NjDjjg46Pe5VkKv0i5fT3QNKZ7
 TFo3YNpevwofR3YJ/VPegr2D+Im7ezW8+Lwchq5minFh9MH3wRUlHJdCAnRLVbDM+Z41
 AQ57l3RGdoJRs38ApTlXAoyaiYV/V9Vc7XHOaEhMEXEQhm1w35QqPNfS/pLxIViPone8
 y46g==
X-Gm-Message-State: AOAM533C4qiXrkVKyEzMkWf/+e4BT8J18xBhe+hhwocuIaYST9An7waK
 OR/JFBIOkRG5MCSvh2j3r8TzC/W7z5ek1Q==
X-Google-Smtp-Source: ABdhPJy+gaT1AIJUrRIhBmqtUyzQ9/v4xUe0IIJV+WokrceGVc/1TEDtxZ3u6Hu/LnWZ1BYuCLgKsg==
X-Received: by 2002:a17:902:e549:b029:e6:6b3a:49f7 with SMTP id
 n9-20020a170902e549b02900e66b3a49f7mr7214673plf.52.1615542026295; 
 Fri, 12 Mar 2021 01:40:26 -0800 (PST)
Received: from ISCNPF1JZGWX.tyo.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id a19sm4902542pfn.181.2021.03.12.01.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 01:40:25 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v3 0/6] mtd: spi-nor: Add support for Cypress s25hl-t/s25hs-t
Date: Fri, 12 Mar 2021 18:40:04 +0900
Message-Id: <cover.1615523176.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_094028_734711_234B9852 
X-CRM114-Status: UNSURE (   9.87  )
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

 drivers/mtd/spi-nor/core.c     |   5 +-
 drivers/mtd/spi-nor/core.h     |   3 +
 drivers/mtd/spi-nor/spansion.c | 325 +++++++++++++++++++++++++++++++++
 3 files changed, 331 insertions(+), 2 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
