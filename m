Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7D0CDE017
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 15:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F3asXofYPAn3PNMx2CVtkXVsV97e0sR7HdNK16ARpaw=; b=o50v/4BOxFsdA0
	7Rkpt6FvpqRQKCXchgwvmxEc0uQLJwt+CRsmwhackvU9bS+wX63E42cJ0s3+d8oi+KHzJlLH8zgs3
	LVAYoTIKg3kst2s7ZsA9bVuoyVOYmd2EPnFmVxWZtjdvx5aRGDkECmmETePlK4rPRY8JM25ElC6NH
	dVNcBI4YTCV8evegDyC0DmTx55tMN4wBWxENFb1C4sAYZzJjF+UrTKT5xI8rWRZy7yNLu5qOy+8Dx
	ynsSTzmHEMtjOw9K/QANTKI0i2dzh2yXkZ8jUeFwA3C8FzeBSTaPJCaCsjCGLauO7H7gwFEjAuiep
	bjg96B8TilQQ27LM+S+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stqmb-00000008nKC-0LdG;
	Thu, 26 Sep 2024 15:51:57 +0000
Received: from chessie.fmt1.pfcs.com ([2001:470:1:205::234] helo=chessie.everett.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stqmY-00000008nIr-0aRd
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 15:51:55 +0000
Received: from localhost.localdomain (ip-77-25-16-238.web.vodafone.de [77.25.16.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by chessie.everett.org (Postfix) with ESMTPSA id 4XDyl71svwzMQYm;
	Thu, 26 Sep 2024 15:51:47 +0000 (UTC)
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
	Esben Haabendal <esben@geanix.com>,
	Erez Geva <ErezGeva2@gmail.com>
Subject: [PATCH v6 0/3] Add support for SPI-NOR Macronix OTP
Date: Thu, 26 Sep 2024 17:51:24 +0200
Message-Id: <20240926155127.2450246-1-erezgeva@nwtime.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_085154_201303_EB8D77F6 
X-CRM114-Status: GOOD (  10.52  )
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

v2:
Improve description of mx25l12833f.
Add note about mx25l12833f using the same JEDEC ID as mx25l12805d.

v3:
Improve description.
Rename _nor_send_cmd() to spi_nor_send_cmd_internal().
Remove MX25L12833F specific changes.
Add reading SFDP to all Macronix chips.
Add support of reading OTP parameters from device tree.
Reorgenize patches to 2 SPI-NOR patches and 2 Macronix patches.
Testing with MX25L3233F using BeagleBone Black.
Test results are in "mtd: spi-nor: macronix: add manufacturer flags" patch.

v4:
Add DT bindings of new OTP parameters.
Test OTP with 'flash_otp_write' and 'flash_otp_lock'.
Fix macronix_nor_otp_lock() and macronix_nor_otp_is_locked(),
Macronix uses a single flag for all regions.

v5:
Fix DT binding errors.
Fix functions description of Macronix OTP functions.

v6:
Remove DT.
The patch contain the Macronix OTP functions.
But this patch seria do not contain any means to configure the OTP.
As a proper way to do it was not concluded!
I think we do need dynamic OTP for future use.

Erez Geva (3):
  mtd: spi-nor: core: make OTP configuration dynamic
  mtd: spi-nor: core: add generic functions
  mtd: spi-nor: macronix: add support for OTP

 drivers/mtd/spi-nor/core.c     | 134 +++++++++++++++++++-------
 drivers/mtd/spi-nor/core.h     |  29 +-----
 drivers/mtd/spi-nor/macronix.c | 167 +++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/otp.c      |   6 +-
 drivers/mtd/spi-nor/winbond.c  |   2 +-
 include/linux/mtd/spi-nor.h    |   9 ++
 6 files changed, 283 insertions(+), 64 deletions(-)

-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
