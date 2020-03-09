Return-Path: <SRS0=sdQx=42=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4346CC10F27
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 11:55:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5B812051A
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 11:55:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="POjvqxSs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECV2TITw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5B812051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=vBLHcJ81gmAazuBe3Lq05cfsjdjiEzsc4co8/egwFyk=; b=POj
	vqxSs4Ci9uAzbPF3VWQIbQp4Wwnu+FcHkgWVv7sMYS+QWA9mGi6oHIK/SpfEkQ785najt8E3Jbtvq
	6ZAHRyD9WY+A8zRRhQbDKQLIc4cX4UkxaA1Fab030lNZjPc2YibKQRZZ4T6ZjC7MLR+g6XUyTXxew
	uLNkJ37zpFUG8rNsDiYpBzOq6RztmaLnWOrFgW6vjYBr9GpPPPtNmTStkrJhvKR3B3GUiwSO3mkwm
	sPlKu0gUV5woq5hmJ53ddyT9m7EZsPSLDdVKXGXCHoblnvNlr+4UrkzBaRbr9WhQWg420WjGEHbU/
	E8+KJF9+Ukbu0E4Oc5TNVVBjmNLA/TA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBH0e-0007fN-N1; Mon, 09 Mar 2020 11:55:48 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBH0S-0007S1-Mz
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2020 11:55:38 +0000
Received: by mail-wr1-x435.google.com with SMTP id z15so10729865wrl.1
 for <linux-mtd@lists.infradead.org>; Mon, 09 Mar 2020 04:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=x3njD6+9rCh2R4ZtyRt9jkAQWO2ArwtXcsjyqU2Z3iM=;
 b=ECV2TITwkXMm4zdIP2BzU2I+37Ph6om2K6g/pWjT8D7iGL22STIRcf1Qu+YhmyiYBT
 LvPaIqyhIuL74OlMtJCFO8J70Ne7G3A9DwA0V/2W4/zb6GgWtTkINr4JnMfRzPRsXoYt
 3s9MXzvkDUC80Qzbt4oxIN194VzZ6k+hMP1HHqWlcw1p9QDx+RrO6szBd5HwZgpAudw9
 gcXMDOt1m6JRp3QAVLCD7536GdW6lyoC36fgLP9LhiIP07K4U1Zz0f+Pi+YZ5Gm9uiyF
 RgvsmavCQjgiTvxtyvUNknpps6s/w75TRhpg9N3I/y+7Hnfz10ixObBl9YiEkIpFpRKG
 a2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=x3njD6+9rCh2R4ZtyRt9jkAQWO2ArwtXcsjyqU2Z3iM=;
 b=mJWQMs1tdxq8yryjn+Z6Zjjd8dyCDO6vdKyFTJqClsE8DE6uBGtfKRzYLAH9Qto5s6
 26Q1gUUurms2lMUhN+n8qET36TgizBHJgzOFqpwbnwG8eL6H1yLFKCocuYcqjIL5QjpP
 QArrW6aWDfobbPeihMXffXW3VrsiqlfKHnjyKGqfpo32C+FjKJE551Yk/RP4RLCOxPVM
 BSJSGJe/bLxOBClRO0IfGm3Wfxw5sxNbJdnHFbNXvxOpbtLFI6JgdjhjlxvCqnx9xyLn
 RMA1L1vGlJV3DqMP1eBXF6qb4jSwAIKssGEWHlvpkVABsH2GtnRczhVqahHtGK4VC2pl
 2pgQ==
X-Gm-Message-State: ANhLgQ3xJy0j+DK0+03zoOqOEm0k+se9n2jSTrUPEdXeSU7iJ8Wk/1CV
 UAoNWgjqq9ildKbmbRnjEB8=
X-Google-Smtp-Source: ADFU+vtqAReD2EwH8fWWOIFACtOM1XV1H+C3VqllXEMUrnrrFkk9SUU8nXY5zaTNBoY3XQIYQuk73Q==
X-Received: by 2002:adf:94c2:: with SMTP id 60mr13568774wrr.396.1583754933357; 
 Mon, 09 Mar 2020 04:55:33 -0700 (PDT)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id m21sm25035226wmi.27.2020.03.09.04.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 04:55:32 -0700 (PDT)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/6] Add new series Micron SPI NAND devices
Date: Mon,  9 Mar 2020 12:52:24 +0100
Message-Id: <20200309115230.7207-1-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_045536_761469_FD1F1AB8 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Shivamurthy Shastri <sshivamurthy@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Shivamurthy Shastri <sshivamurthy@micron.com>

This patchset is for the new series of Micron SPI NAND devices, and the
following links are their datasheets.

M78A:
[1] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m78a_1gb_3v_nand_spi.pdf
[2] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m78a_1gb_1_8v_nand_spi.pdf

M79A:
[3] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m79a_2gb_1_8v_nand_spi.pdf
[4] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m79a_ddp_4gb_3v_nand_spi.pdf

M70A:
[5] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m70a_4gb_3v_nand_spi.pdf
[6] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m70a_4gb_1_8v_nand_spi.pdf
[7] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m70a_ddp_8gb_3v_nand_spi.pdf
[8] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m70a_ddp_8gb_1_8v_nand_spi.pdf

Changes since v5:
-----------------

1. Rebased series to v5.6-rc1.

Changes since v4:
-----------------

1. Patch 2 is separated into two as per the comment by Boris.
2. Renamed MICRON_CFG_CONTI_READ into MICRON_CFG_CR.
3. Reworked die selection function as per the comment by Boris.

Changes since v3:
-----------------

1. Patch 3 and 4 reworked as follows
   - Patch 3 introducing the Continuous read feature
   - Patch 4 adding devices with the feature

Changes since v2:
-----------------

1. Patch commit messages have been modified.
2. Handled devices with Continuous Read feature with vendor specific flag.
3. Reworked die selection function as per the comment.

Changes since v1:
-----------------

1. The patch split into multiple patches.
2. Added comments for selecting the die.

Shivamurthy Shastri (6):
  mtd: spinand: micron: Generalize the OOB layout structure and function
    names
  mtd: spinand: micron: Describe the SPI NAND device MT29F2G01ABAGD
  mtd: spinand: micron: Add new Micron SPI NAND devices
  mtd: spinand: micron: identify SPI NAND device with Continuous Read
    mode
  mtd: spinand: micron: Add M70A series Micron SPI NAND devices
  mtd: spinand: micron: Add new Micron SPI NAND devices with multiple
    dies

 drivers/mtd/nand/spi/micron.c | 150 ++++++++++++++++++++++++++++++----
 include/linux/mtd/spinand.h   |   1 +
 2 files changed, 137 insertions(+), 14 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
