Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5CDCA5FCE
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2026 08:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wL+6H+j7aHpCaSXbb7Fy5BcWAurdQFbzu3Wa0lJgX5w=; b=blqPsledgOz7Wy
	6LkreCyMn3RlRSgZ7ZCX1769vkg1XHr2dxZeAidA1PJYWATBCx+n6pMK1poEFwVqR3/ItOnSFLL5P
	NgeWlVIVvnev5y3HwLnnojC8esFtaMq0XJmWS9SCz5kUBz1/jbym/nAQTxbW3OKYq0MwsAmYVTARL
	xIfJaDxZOqxCcEwhSNY7ccQrQhMP1SfeIdc+ZzehfKrgyj87kcLObZuzM6+7xZNTJbhPnk+5WlngR
	ZtUV2gxf8t1+rsT7zb9s+y0Bov46QL51nwkuY2IyxhUplqCE2LjWfCzklaLuu34osItmNTdQblrsg
	ax79hapYb0bPEPj9yw8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdoC-0000000Fqiy-0G48;
	Mon, 05 Oct 2026 08:12:28 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdo8-0000000FqhH-3Ylg
	for linux-mtd@lists.infradead.org;
	Mon, 05 Oct 2026 08:12:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B25674E4118F;
	Mon,  5 Oct 2026 08:12:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7DC5E604FE;
	Mon,  5 Oct 2026 08:12:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE85210330694;
	Mon,  5 Oct 2026 10:12:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791187938; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=1lIl1CV2ZHTfM8gjcxGCKMyj3T7DeZY+lFU2qxT7D70=;
	b=HzkTM+8a/ejutDPI5atGyTAjs9xLxfcv7W7uYHD9LQ7/EfelyTJVefvYJRa8tVKxSvP46Y
	e26SRYMuo1FIVJNc8JV0lEAKRsPn79tyBRqweBj0xQbA7PJJiGNOL37GHcEYWwhrl0m9pc
	EAVSH8tEimWsYgVmk5B2xC0d0/uXFZ565w8UGKxPZKi1FXMY0tXo5lbeL8If6QT6VpSMP7
	8OONZUjjAJrhZCpFhKPB8d34ssjQYb2C0BRwCmgerm+rn0o8Qwj2FBz1DdLfbukejguHuU
	63UZFbZxt930aKQkp2BCIb7sra6rJet8JnsEWa0kjhr6U5OfG0KRAVx+KReNMw==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mark Brown <broonie@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH 0/5] spi: Add support for panic mem writes
Date: Mon,  5 Oct 2026 10:11:35 +0200
Message-ID: <20261005081141.33688-1-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_011225_051412_CE4534B8 
X-CRM114-Status: GOOD (  11.09  )
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

Hi,

This patchset updates the MTD spi-nor code as well as the spi-mem code
to add support for panic mem writes to a memory partition configured as
pstore.

In the context of a kernel panic, preemption, SMP and IRQs are disabled.
Therefore the SPI driver must make sure that its code paths don't sleep,
or rely on interrupts.

A driver that will respect these conditions can say so by setting the
'panic_write' flag in its spi_controller_mem_caps. The MTD core won't
attempt a panic mem write without this flag set.

Only the .exec_op() path will be used for panic writes, given that the
fallback code relies on the generic SPI API, which explicitly states
that it mustn't be called from code that can't sleep.

In case of a kernel panic with a compatible SPI driver, and a mem write
is attempted, the 'spi_mem_op' struct will have its 'panic_write' flag
set, and the SPI driver can then handle it accordingly.

The spi-cadence-xspi driver gets updated in the process, adding support
for a irq-less mode where register polling is used, so that it can
support panic mem writes.

Cheers,
-Paul

Tanmay Jagdale (5):
  spi: spi-mem: Add support for panic mem writes
  mtd: spi-nor: Add support for panic writes
  spi: cadence-xspi: Add irq-less support
  spi: cadence-xspi: Don't use infinite timeout in register poll
  spi: cadence-xspi: Add support for panic writes

 drivers/mtd/spi-nor/core.c     |  67 ++++++++++++++++++++-
 drivers/spi/spi-cadence-xspi.c | 103 ++++++++++++++++++++-------------
 drivers/spi/spi-mem.c          |  25 ++++++++
 include/linux/spi/spi-mem.h    |   5 ++
 4 files changed, 156 insertions(+), 44 deletions(-)

-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
