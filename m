Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F658C52D7D
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Aug 2024 12:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d/feYct95Fz+xvbH/hpCw+Yd+g7uYy+2CyE3jjvM6I4=; b=sLmfBFDVGQUInE
	LBYyWKCmyAS/u1O0SU2sY626DmUj+5imyMjn/sNYpoIoQxwuYDE/zXqJ3j7rKnJ/Fq/7ei6JFGpIi
	Cb/57JAISemJGDM+yjyco7s48rxHYzysgxPgjLWKvYi1cRsF86m7XTpOV42j55ZBardgb0JYbQ2tS
	v3zNzFz3QtpzahZDJ2sFvdHYBuMl4ediVIDJ10UhjBhotlBTwRZovx95Cxhov2PGlEM083rbSIcrz
	TlZrOTkEpACkKLV6F+/xQ7MixaT2qVUfubTyPBz7gKlZgG4N9THoh7+uVSFa3wh2DvMGTxaSzIo/a
	ZeYuvMOwz+KuNqBJtdnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfIlD-0000000FCrG-0Pdu;
	Sat, 17 Aug 2024 12:42:23 +0000
Received: from chessie.fmt1.pfcs.com ([66.220.13.234] helo=chessie.everett.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfIl7-0000000FCpU-2K9P
	for linux-mtd@lists.infradead.org;
	Sat, 17 Aug 2024 12:42:20 +0000
Received: from localhost.localdomain (ip1f10f85d.dynamic.kabel-deutschland.de [31.16.248.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by chessie.everett.org (Postfix) with ESMTPSA id 4WmJQn06kjzMQgm;
	Sat, 17 Aug 2024 12:42:08 +0000 (UTC)
From: Erez Geva <erezgeva@nwtime.org>
To: linux-mtd@lists.infradead.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Erez Geva <ErezGeva2@gmail.com>
Subject: [PATCH v3 0/4] Add support for SPI-NOR Macronix OTP
Date: Sat, 17 Aug 2024 14:41:36 +0200
Message-Id: <20240817124140.800637-1-erezgeva@nwtime.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240817_054217_614735_E69755CD 
X-CRM114-Status: UNSURE (   7.82  )
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

From: Erez Geva <ErezGeva2@gmail.com>

Add support for SPI-NOR Macronix OTP.
And add MX25L12833F with OTP.

TODO:
- Test OTP with 'flash_otp_write' and 'flash_otp_lock'
- Question: Do we need documentations on new DT OTP parameters?

v2:
Improve description of mx25l12833f.
Add note about mx25l12833f using the same JEDEC ID as mx25l12805d.

v3:
Improve description.
Rename _nor_send_cmd() to spi_nor_send_cmd_internal()
Remove MX25L12833F specific changes.
Add reading SFDP to all Macronix chips.
Add support of reading OTP parameters from device tree.
Reorgenize patches to 2 SPI-NOR patches and 2 Macronix patches
Testing with MX25L3233F using BeagleBone Black.
Test results are in "mtd: spi-nor: macronix: add manufacturer flags" patch

Erez Geva (4):
  mtd: spi-nor: core: add manufacturer flags
  mtd: spi-nor: core: add generic functions
  mtd: spi-nor: macronix: add support for OTP
  mtd: spi-nor: macronix: add manufacturer flags

 drivers/mtd/spi-nor/core.c     | 166 ++++++++++++++++++++++-------
 drivers/mtd/spi-nor/core.h     |  34 ++----
 drivers/mtd/spi-nor/macronix.c | 186 +++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/otp.c      |   6 +-
 drivers/mtd/spi-nor/winbond.c  |   2 +-
 include/linux/mtd/spi-nor.h    |  10 ++
 6 files changed, 336 insertions(+), 68 deletions(-)

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
