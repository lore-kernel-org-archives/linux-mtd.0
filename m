Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8951AC4345F
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2024 14:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VLJKEya8keK40y00O5aMxSNMBJH0+LzRYail7wlRDIM=; b=VdhkrBAHcpjtob
	T3pUiVKusJRTFOy3h8wGF813kV942KRqVCI++mpLK/xCtPGaybPFzACdrWuW2yNYXJREC5CNwx1gR
	3CRrLZS8ngD38k9Wp9MIG9Y03onOBSTYf7nonPKnoYm599QPQCfROE47J6KJrMeVtw1q206RfAR/j
	GISwom84jLR6fbNSFPW93q3+TbIjis5jko/lL8OJb893efp35DbTY+3rMoF0G7bcPFFV/s3nX+aZw
	X1GLl3txhAh55Rohxr6fLgXeIX9yg3M5mEfNAqNzXRFF9b7BBk/jHWm4+ZvRItjHkuYlfl1zzXarM
	8iN52K7PmN+wKnKVX1cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxp0G-00000005vMS-43SF;
	Fri, 19 Apr 2024 14:14:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxp0D-00000005vKN-316s
	for linux-mtd@lists.infradead.org;
	Fri, 19 Apr 2024 14:14:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5D436CE1AE1;
	Fri, 19 Apr 2024 14:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A721C072AA;
	Fri, 19 Apr 2024 14:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713536046;
	bh=M+lJ0VdAf2ZefRXeZ/D49skD9XSYKgj9KYPgzdBpWgc=;
	h=From:To:Cc:Subject:Date:From;
	b=My8WQcq0uC3ZYNtLepMk8+NCns5Bru5mbIgVr1uw2m9SC2epkBYBam6ObJicWkJs7
	 dCVvmFhey3xsQUDFBSCptkxloKmZK/hMa8YRkw/dpAZ3zVx6+pNygENE3liHj+bLhn
	 JxZdMelnVoh39Vvb4snrC8nQaET4XxtSHuhmPxEy74Ud86BMSuknhsTxD1OFvvfTYj
	 yLQG7u+m7pOo/uJt8Y3d6KQDWZyyWhrHE+irm+h044civ5jGa7ycRl2RX5ZUrOan8U
	 z2wTsk26LGoal4D0ivd0zeDp1p/WsA3LrTafhiMDpdeOT9wNpybUkWW4A83STIoj+S
	 jMvtrmSUEpwRg==
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v2 0/6] mtd: spi-nor: spring cleaning
Date: Fri, 19 Apr 2024 16:12:43 +0200
Message-Id: <20240419141249.609534-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_071409_966076_CA0D0818 
X-CRM114-Status: GOOD (  13.08  )
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

It's time for some spring cleaning. Remove the oddball xilinx
flashes with non-power-of-2 page sizes.
Remove the .setup() callback, only the default callback is ever
used and it is unlikely there is need for a custom setup.

Finally, the last patch is a proposal how to deprecate flashes,
which are just detected by their id. We cannot really find out if
there are boards out there which are using a particular flash. Thus,
as a first step, we can print a warning during kernel startup. As a
second step we might introduce a kernel config option to actually
disable the flashes which has the deprecated flag.

v2:
 - remove convert_addr, I've left page_size in the info, that might
   still come in handy for future flashes as they are getting
   bigger, although let's hope they have SFDP support..
 - simplify the fast read flag handling
 - reword the commit message of the .setup() callback removal patch
 - introduce .deprecation_version and simplify the checking

Michael Walle (6):
  mtd: spi-nor: Remove support for Xilinx S3AN flashes
  mtd: spi-nor: get rid of non-power-of-2 page size handling
  mtd: spi-nor: remove .setup() callback
  mtd: spi-nor: get rid of SPI_NOR_NO_FR
  mtd: spi-nor: simplify spi_nor_get_flash_info()
  mtd: spi-nor: introduce support for displaying deprecation message

 drivers/mtd/spi-nor/Makefile   |   1 -
 drivers/mtd/spi-nor/core.c     | 208 ++++++++++++++-------------------
 drivers/mtd/spi-nor/core.h     |  15 +--
 drivers/mtd/spi-nor/everspin.c |  19 ++-
 drivers/mtd/spi-nor/xilinx.c   | 169 ---------------------------
 5 files changed, 105 insertions(+), 307 deletions(-)
 delete mode 100644 drivers/mtd/spi-nor/xilinx.c

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
