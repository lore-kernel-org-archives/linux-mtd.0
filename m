Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080B8CA100F
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Sep 2025 15:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bdUykj4FqN3S/CdyHr+V+6iFNBXC5oVVyoEvA5OI/64=; b=VmWQep4fwJK/md
	k7oSDosU/M3sY2n/01ovPhyfBD1KwbN2cJGPPQkX5LLKu7Igt6lFHvcxSQrjkSX07BhljPoSjMsvK
	AEyo6qElQsDADj1XNZ27Nk/6YDGLJwrgF41ows+uL0k2shrkk3SlgDBLqYFs6K/l6XaYu4v8EIMQm
	MQJb1pQ8ZoiCIklo0t010sBPRCkzKByYYxvD0yKSBD6B+UM83VLFUihY/3U37BE+n2fp0LmwTqB8/
	GV0gfCkn+Hpn1KvqpDHpWxa/WWuFTWiz/BsHSBc/KbGD4Kbck14NVr0PjYnzpEbp0xjkOqS7aq5QG
	PLFf2u/b37OQz4wXaRpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iuP-0000000AuLv-1dqn;
	Mon, 22 Sep 2025 15:56:57 +0000
Received: from smtp15.bhosted.nl ([2a02:9e0:8000::26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iuM-0000000AuKO-1ZpG
	for linux-mtd@lists.infradead.org;
	Mon, 22 Sep 2025 15:56:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=zanders.be; s=202002;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=YTFtlHIfyxHbQdTRh7R7E9Uy1pABIFNYuUrtx6MizW0=;
	b=ScG05gWHzw04epzTp4OPDyhXbuQKMFOXQYADzYCtBjFrQyxdSaBuvfx8jJL1NnoNzJ1SolNzmAGOc
	 T1HkwQWynJo96BLGhYpPGSon4+YZ0RiTkQk3fhHwp0TV7kYWNPc5vNzeBmrGoDkS7VUGsr4bgdAbrZ
	 /cIEnA8P+/K5NgPALlLCo9AEZC49+hNioF7bHWNlvHz7cwue7tIlADNu9bARiaM2Tu2oB3cenCHC2s
	 LDOvxQud5CedUlRohxXC3V4sdc6Kez1ZPKbOqJSGxX7Y6DF0MKbkA+kg3VLfEBK93fkx8G9JtGT0t3
	 ccuCaX7krDf6yUTVJvQEpNk/+LoTAYQ==
X-MSG-ID: c01285bf-97cc-11f0-9d69-00505681446f
From: Maarten Zanders <maarten@zanders.be>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>
Cc: Maarten Zanders <maarten@zanders.be>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] handle RDCR opcode for Macronix
Date: Mon, 22 Sep 2025 17:56:31 +0200
Message-ID: <20250922155635.749975-1-maarten@zanders.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_085654_551058_EF5D0F8F 
X-CRM114-Status: UNSURE (   7.59  )
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

This series introduces a configurable RDCR (Read Configuration Register)
opcode for spi-nor flashes and applies a fix for Macronix devices.

Patch 1 adds a new flash parameter to hold the RDCR opcode, defaulting
to 0x35 (JEDEC standard).

Patch 2 applies a Macronix-specific fixup, setting the RDCR opcode to
0x15.

Signed-off-by: Maarten Zanders <maarten@zanders.be>

Maarten Zanders (2):
  mtd: spi-nor: add configurable RDCR opcode
  mtd: spi-nor: macronix: use RDCR opcode 0x15

 drivers/mtd/spi-nor/core.c     | 12 +++++++++---
 drivers/mtd/spi-nor/core.h     |  6 ++++--
 drivers/mtd/spi-nor/macronix.c |  1 +
 include/linux/mtd/spi-nor.h    |  3 +++
 4 files changed, 17 insertions(+), 5 deletions(-)


base-commit: 4550d33e18112a11a740424c4eec063cd58e918c
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
