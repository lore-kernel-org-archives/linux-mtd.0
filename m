Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C03C4321E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Dec 2022 21:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wr03Mze9+iEV+BCWQWihOWy3HzeXkkJ4hHgqodepTxI=; b=QDAQzzo8FdCMNs
	EzmXtBP5jsKCHJ6jIOUDMlY/Yz46fOdM0O2ilw7VsKO7czbtVun7dMBU4Z3JX55YAMdpV79HpWWwp
	Ojv2P+0F0ZTINiijmlRh8PvmjDNE57ul0rSGrFCGgGfYM6CZAsLdMorNM2981tKlfyTp01uh30FOt
	nRfRexLi32EqkiZ8MCIUNejcXyAgBzmw6X1qAX9VSs8B8pbcpHgV+Yrp9pgMOL2fRE+G4jkgzq6tg
	wQF9LTXFBPqR95NfbAhGNJT6jCkxcSmD9EX9jU4v7OUMvGiM83MtcKV6xMr5rAUDDa3TbIBLgOfWB
	6A0m4VCwPyXn3nh4lX2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0r9F-00B99R-10; Thu, 01 Dec 2022 21:31:13 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0r62-00B8gD-O2
	for linux-mtd@lists.infradead.org; Thu, 01 Dec 2022 21:27:56 +0000
Received: by mail-qt1-x834.google.com with SMTP id fz10so2674643qtb.3
        for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2022 13:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7EfQP5c4Tp15RvKyJNK3BoLF6L+XplDDM23u5kp4g0=;
        b=71+lGGNZhYeneb21fGOTHJ+8CFElHHEHz0o4clpPLBalxLbUYKKwQPpAPVLi8ufX2t
         AxVgczUCgm9hK6L5Mt7R3acGsYaHKwErKYKPJDqSG47Vnr0Iz/ixpMXiwbyP1umjOBNV
         WYwGSKWijoStMkEqUuorEn+iI23tPTfM7HgRWpIKQh/mlXWEdjv19J4/dOC7Bwrt7/xJ
         dtacUsmg/mABojRS3/Bnn0rnC6ZA+iy3e2ZYX3IE7CbOO0CyN9U1pN5C78tltgnI5MCI
         pFMd/4T0FbvB/qHvCab+nDuQUHyioBrxK+2T6Q91jnHTK53nDe+kmvtAFpk89mng+NGM
         IwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y7EfQP5c4Tp15RvKyJNK3BoLF6L+XplDDM23u5kp4g0=;
        b=f0wtvR2knoj0/E5NDCcFJkjOElfugazXA0d8J05NqjNSf57NR47o+xfM8D+kuBhDQB
         PaxcDFcCPIvUqxoQlGFcJK4zu+3t+tUIJmO5LOqtcEKqQahSbDXqQmTmHxawXG3+JOXS
         NIdM1N0/2lDqjGBhj4EOI2j/nBaPrDaTxiAgu+bL4U9fcXjbWlnH0zOsC4qK9NM1hZ7A
         DTHMhx6Hb9ao4YyZCCYcNQ1XwUkY8hOkfrPTl4XVb7zkdytBDcCU/AzWlQAAW2mjIjI+
         oHgXpdLdRRsW6/P9IDJjB0nymxxHs93XgU8ACduk30p+YeUVMSgbNU/MdciezLLk7PWU
         rTBQ==
X-Gm-Message-State: ANoB5pkJX6WhuPEdCjkIqfXYOTBtghEkrm65rKv/B7yliJJW28WDYqS2
	xbkHpNyiJM9ceMEFB61MF2Kc+g==
X-Google-Smtp-Source: AA0mqf75PHhBw3iWbz9uAP/z0xnYmQkvcE0cxiSj329MzHDOvgMt9OzNhDI9vMUqr6SIBChmV4Kp1g==
X-Received: by 2002:a05:620a:46a2:b0:6fa:d9c:3a61 with SMTP id bq34-20020a05620a46a200b006fa0d9c3a61mr44222688qkb.26.1669930073374;
        Thu, 01 Dec 2022 13:27:53 -0800 (PST)
Received: from nathan-ideapad.. (d-75-76-18-234.oh.cpe.breezeline.net. [75.76.18.234])
        by smtp.gmail.com with ESMTPSA id l15-20020a37f90f000000b006fc447eebe5sm4071321qkj.27.2022.12.01.13.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 13:27:52 -0800 (PST)
From: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
To: 
Cc: nathan.morrison@timesys.com,
	greg.malysa@timesys.com,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org (open list:SPI NOR SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 0/3] mtd: spi-nor: Extend SFDP to support additional octal modes as per latest JEDEC standard
Date: Thu,  1 Dec 2022 16:27:47 -0500
Message-Id: <20221201212750.267721-1-nathan.morrison@timesys.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_132755_022264_B1D77581 
X-CRM114-Status: GOOD (  11.11  )
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

In the latest JEDEC standard (JESD216F), there are now bitfields in the
4 byte address instruction table for 1S-1S-8S and 1S-8S-8S modes

This patchset adds support for checking the 4BAIT for these modes,
along with additional NO_SFDP_FLAGS to support enabling these new modes

v2: Move page program commands into sfdp.c instead of core.c,
as this appears to conform more closely with spi-nor paradigm.
Page program buswidth appears to be automatically determined, so let's
follow suit and do the same.

v3:
 - Added missing SPI_NOR_OCTAL_READ_1_8_8 to spi_nor_sfdp check in
   spi_nor_init_params_deprecated()
 - Convert IS25LX256 to 1S-8S-8S instead of 1S-1S-8S
 - Tested and confirmed both 1S-1S-8S and 1S-8S-8S work on IS25LX256

Nathan Barrett-Morrison (3):
  mtd: spi-nor: Extend SFDP 4byte address instruction lookup table with
    new octal modes as per JEDEC JESD216F
  mtd: spi-nor: Add additional octal-mode flags to be checked during
    SFDP
  mtd: spi-nor: Add support for IS25LX256 operating in 1S-8S-8S octal
    read mode

 drivers/mtd/spi-nor/core.c |  8 ++++++++
 drivers/mtd/spi-nor/core.h |  5 +++--
 drivers/mtd/spi-nor/issi.c |  3 +++
 drivers/mtd/spi-nor/sfdp.c | 13 +++++++++++++
 4 files changed, 27 insertions(+), 2 deletions(-)

-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
