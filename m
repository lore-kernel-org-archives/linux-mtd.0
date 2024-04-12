Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF97C00A94
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2024 13:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/dd/xaJBhY/tMl/AXvQRFPICH10b4UuAT3o2TdB9lH0=; b=wBim1hU28J9Uyk
	r2yKhxc80Zj3DecmjCRDQOSIluzJ+RUyFhigpKbRsZDF9NdmWxxLFOhF0MJTDsuFPYW0xN0qSuApd
	Qc6QGSVrvTL9gN7ZZqWG0ln4lzPRcWCFP6wQ/ONRhayPPGjI/8La26G+eYOqHbeLs+Uhq5Mwa1l/G
	AAGRlRcufgisK/Va5k5x7/5kAeCR4y+SkhCvl4YoQAO/ycSGza9G3UYp5i73o8ioIE13W0zZHn4vl
	mj8bDhih4J3iBSqUXYYRyG42PnUIRjBfE1nqjm7iR98cVoPReZ1ER5oxcSBzeVmyfCGe2GpRfBWTU
	Cm1e+cMjh0xqHiBCr+fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHCY-0000000HOGd-43CP;
	Fri, 12 Apr 2024 13:44:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHCU-0000000HOFK-2Vm1
	for linux-mtd@lists.infradead.org;
	Fri, 12 Apr 2024 13:44:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E35D7CE2EF4;
	Fri, 12 Apr 2024 13:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2F9C113CC;
	Fri, 12 Apr 2024 13:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712929454;
	bh=dH6kXU4exatPA4peUu+lOUSnRh3/aQHQ5G1AbXpcFrc=;
	h=From:To:Cc:Subject:Date:From;
	b=MJ/P3h0p8+ZnVxiAh2aIei0Sd9ALNNQmHSRwaCNdZEe3+eOKT0l3VQo1NjeeMJnwK
	 Uhe86otqAywWgxchhW7oqJassj4d2X31Xyn/OnPtgg+8PU1p2UB6AyN8Wkjt5GfiNi
	 +6b5Et4XyqFuvSkCHPF1Z0/Pw/AFOvfV10ZjdKg8tbVmPT/Hf1pODYmF1QyBl7AWCt
	 iUTIvcHNzuI7gOT7t/oDg1o9vKyTgFhhCcZU0YFG/48lisYFUxnh40g5xHOuzGohpE
	 08rxj4b0LIRVN6Z7XkA0f/C3tgfYk66rZjlxJYDhnXyo+V/O+l8PnnJkASqCw/tCry
	 buFTMDGEF59XA==
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v1 0/6] mtd: spi-nor: spring cleaning
Date: Fri, 12 Apr 2024 15:43:59 +0200
Message-Id: <20240412134405.381832-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_064418_903250_196DD6D9 
X-CRM114-Status: GOOD (  10.87  )
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

Michael Walle (6):
  mtd: spi-nor: Remove support for Xilinx S3AN flashes
  mtd: spi-nor: get rid of non-power-of-2 page size handling
  mtd: spi-nor: get rid of SPI_NOR_NO_FR
  mtd: spi-nor: remove .setup() callback
  mtd: spi-nor: simplify spi_nor_get_flash_info()
  mtd: spi-nor: introduce support for displaying deprecation message

 drivers/mtd/spi-nor/Makefile   |   1 -
 drivers/mtd/spi-nor/core.c     | 202 +++++++++++++++------------------
 drivers/mtd/spi-nor/core.h     |   9 +-
 drivers/mtd/spi-nor/everspin.c |  19 +++-
 drivers/mtd/spi-nor/xilinx.c   | 169 ---------------------------
 5 files changed, 110 insertions(+), 290 deletions(-)
 delete mode 100644 drivers/mtd/spi-nor/xilinx.c

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
