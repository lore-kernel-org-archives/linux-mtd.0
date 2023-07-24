Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B45C001DE
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jul 2023 08:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q3aqyONM7V91zY39mfqjenP1wTV0efBqTyDtHTcItoI=; b=r2FD80VgpPEISJ
	zLpuFgonRwelBGYraLjFWvSBuX2W8ZY/Kazo+cXfkhX7oLPksOKYc/iv1ASLFLQfOPDJoOTKUool1
	uABPcGcQ6DX4oI120uqTFfJBuzTxm4i19C38dxMPextmUo6UHNQa//u+OOS7N/plhdQzG26SWjNed
	4KTQPTXAu300HPyPhUOitzmXxS4vCT2Pwd9UkkEz8ll0w1nLOHygIifudSulNGCe6726DcFjt5sx8
	zAcfDUuv7Sqh8xcXPKGujQgGUKwGV3hquflRMUh97n3o1CErV/D8KNhBhl7WHSeQTMZvC9ss59riY
	W2GbCrNRiigZxdiTKF3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqgd-003CJ7-0t;
	Mon, 24 Jul 2023 08:12:59 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqgZ-003CHs-2I
	for linux-mtd@lists.infradead.org;
	Mon, 24 Jul 2023 08:12:57 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5221ee899a0so2143351a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 01:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690186372; x=1690791172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uEs5Elkh8KpHX4dWi/5NcMKXtNIiPWiIvPxVVX95BAQ=;
        b=nOvmKLYP0kaVsyj8lS4lIY5vgn5bWtwbrF0QSJo4PRUNjx3YToIosKPNeq414bpgzr
         2kaCL8lnq81+KoSMs2hEx0Vja4utU20HtsCvNjeyNMbwpxHJ2cfQgvwi5L+UXM6kslnZ
         TQAWsOMeAcUU3vomfje/ZX53XA1I1hTb6FEoIhhC+94V+vjubTKRgmwUhmr5VnDcfWgk
         taFUXE3Kg8Nu6KdnmjGun3sbMeAEpUadroQR+/HCr8OdMOzLGSKzADz0EbDViiS5n4Ua
         pZj5I+/zVm8ipVylR8LXleDC5yyVyiik/JNBZy1NDgfhg9Qu+85S408bt5dS706BInbb
         MG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690186372; x=1690791172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uEs5Elkh8KpHX4dWi/5NcMKXtNIiPWiIvPxVVX95BAQ=;
        b=UQVzyIU+jVRB/5dwabMUo3a/bkidf1PzdssCyxKZ0pd3RtDUN9XeKXqcQDxk96N/8v
         Ji9HMBXs8Gs3/hlLWzXXzeX5zKD5mQLHtHmxLHdo+8A/QQ+5Z1HSmZ58To2DLv1GNiEt
         Vevoa+RloMDav9FFBmZDEGP7XwPpgB7pd8tBIAUNP+zaHxZrpnmE8DEZ6dE3gcsG5bbf
         UuiJIO9sReGAAukXwxOnQ5bdzQ3jDwBmtngbrgBrIWzRpyO6IQ6kN797g2sR9b3BXg4+
         /ZPzK8vudj7MblDypfuuCd+NrJaQla7dr/eWPjmomYIJqrKllZOgs/Dc87w8dQP42O/U
         jO+Q==
X-Gm-Message-State: ABy/qLaqX5hqOjpCGq24Cm3wN4D5/DF11ZLFun2gjVNRDsgJkZ8nNCed
	jhew9w26wHtagnsR1y3LElqnXg==
X-Google-Smtp-Source: APBJJlFZL+LwqhO7C1mU9zkXCbO4DjpMuSTtZXgNbxfXFy6h19T8Vc3fkWFVunZyrK+c/xqOtXmN4w==
X-Received: by 2002:a17:906:845a:b0:997:e8b8:8d6 with SMTP id e26-20020a170906845a00b00997e8b808d6mr8476075ejy.28.1690186372491;
        Mon, 24 Jul 2023 01:12:52 -0700 (PDT)
Received: from 1.. ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id a6-20020a1709065f8600b0098ec690e6d7sm6355395eju.73.2023.07.24.01.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 01:12:50 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com,
	takahiro.kuwano@infineon.com,
	michael@walle.cc
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [RESEND PATCH v3 00/11] mtd: spi-nor: spansion: Add support for Infineon S28HS02GT
Date: Mon, 24 Jul 2023 11:12:36 +0300
Message-Id: <20230724081247.4779-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2263; i=tudor.ambarus@linaro.org; h=from:subject; bh=r93ys5sJSroZh74RBaA09W0EcErJwZZs/A7P7LX6wWY=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkvjJ9qSJlLJTV3bAHOKJsncEtPW8d1GXsYPEym lWHLYQ43gOJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZL4yfQAKCRBLVU9HpY0U 6QlQCACD8isZbG9xaAN/jwvQ7ZFm2H4UzmUHONCMxReEBEF5fdyLxOgwq7dAyFHvQUrTG9ZyVsF /ldvxYieh4lE5zQLsscvvF+3oSGt41UBLlXj6Ht1CsQxmBKL0MRC8eHUoPF/J8vIaf3W/C3lkfF H6lsR/OVmjktcf6QhS1e4sg3yWrZzZtXxPM/pe6bITTVVnzQnAZvgvz3wequTkp8Lq1KvmoHZ79 JnMpvjsHedyOxR1CJ9GSh5e1AtvdRIfX6DI/wYysdSzNY2yhGcnTNuFEUCof868ahMb6RkjvxgV yDeioN9Zl2LCnjYDHDePZPOMxWxSTPQBWKv+Y4nIeEnxfjyj
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_011255_771136_D919F9F3 
X-CRM114-Status: GOOD (  14.22  )
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

Resending as patch 10/11 and 11/11 were not sent.

Takahiro, since you already have to test all these flashes, I took the
liberty and added some other changes that would be good to have. The
first one lets SFDP determine the flash size and sector size. Michael is
in the process of changing how INFO is handled, we'd like to get rid of
these params when SFDP tables are defined. The other 2 patches
consolidates a bit the spansion code with the idea that we should use
the same code paths for both single (SCP) and multi chip package (MCP)
flashes were possible. We avoid this way code duplication and have
better test coverage on the code. On your patches I modified how/where
"if (!params->n_dice || !params->vreg_offset)" is handled. Please review
all and if you agree with the changes, retest on all flashes. Everything
looks good to me, if the tests pass, I'll queue all.

Cheers,
ta


Takahiro Kuwano (8):
  mtd: spi-nor: spansion: use CLPEF as an alternative to CLSR
  mtd: spi-nor: spansion: preserve CFR2V[7] when writing MEMLAT
  mtd: spi-nor: spansion: prepare octal dtr methods for multi chip
    support
  mtd: spi-nor: spansion: switch set_octal_dtr method to use vreg_offset
  mtd: spi-nor: spansion: switch h28hx's ready() to use vreg_offset
  mtd: spi-nor: spansion: add MCP support in set_octal_dtr()
  mtd: spi-nor: spansion: add octal DTR support in RD_ANY_REG_OP
  mtd: spi-nor: spansion: add support for S28HS02GT

Tudor Ambarus (3):
  mtd: spi-nor: spansion: let SFDP determine the flash and sector size
  mtd: spi-nor: spansion: switch s25hx_t to use vreg_offset for
    quad_enable()
  mtd: spi-nor: spansion: switch cypress_nor_get_page_size() to use
    vreg_offset

 drivers/mtd/spi-nor/atmel.c     |   8 +-
 drivers/mtd/spi-nor/core.c      |  23 ++-
 drivers/mtd/spi-nor/core.h      |   4 +-
 drivers/mtd/spi-nor/issi.c      |   4 +-
 drivers/mtd/spi-nor/macronix.c  |   4 +-
 drivers/mtd/spi-nor/micron-st.c |   4 +-
 drivers/mtd/spi-nor/spansion.c  | 294 +++++++++++++++++++++-----------
 drivers/mtd/spi-nor/sst.c       |   8 +-
 drivers/mtd/spi-nor/winbond.c   |   4 +-
 drivers/mtd/spi-nor/xilinx.c    |   4 +-
 10 files changed, 239 insertions(+), 118 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
