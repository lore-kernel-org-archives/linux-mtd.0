Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E652CF9C60
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Sep 2024 18:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4LfODXg3xV8AfHp6BXMjyKG3772uwLnnhFE1gV7eqMw=; b=smXAFVEYMguQyJ
	4mPtYFtiG0TvcdCykdZ4F/0F/DoN2JHewQwPxS7UYZND40Rd8V+A/1hXFr+NvK+nM3X99eSzHBzNw
	sCQcDX4HsDLcY0yauCGTqadPlO36pOIfBUocOpI0JL5PJDk03gA4yQyoDmNnSccDRbud+jnzpqHK3
	gI7VUV6rB/+GHn95kGuATF9oYRmiSBP7HX+kB89j2UXhiBP0hGQToB5aYMtDMIl8DFvtfuol87eWi
	Lc5e0DfSH9rFiWNpZVdgbaMEyfRHy+av66Kl7UvoJt2Id8J3OjChbixvtas0N7gvGo8mOEqaKrcq4
	ScC+S5jSkHch/zZycTdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sriGc-0000000CnN8-30J5;
	Fri, 20 Sep 2024 18:22:06 +0000
Received: from chessie.fmt1.pfcs.com ([2001:470:1:205::234] helo=chessie.everett.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sriGa-0000000CnMS-2tHU
	for linux-mtd@lists.infradead.org;
	Fri, 20 Sep 2024 18:22:05 +0000
Received: from localhost.localdomain (ip-77-25-16-238.web.vodafone.de [77.25.16.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by chessie.everett.org (Postfix) with ESMTPSA id 4X9L8t2yByzMR1r;
	Fri, 20 Sep 2024 18:13:02 +0000 (UTC)
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
Subject: [PATCH v5 0/5] Add support for SPI-NOR Macronix OTP
Date: Fri, 20 Sep 2024 20:12:26 +0200
Message-Id: <20240920181231.20542-1-erezgeva@nwtime.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_112204_730700_9FC7289E 
X-CRM114-Status: UNSURE (   8.38  )
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

Erez Geva (5):
  mtd: spi-nor: core: add manufacturer flags
  mtd: spi-nor: core: add generic functions
  dt-bindings: mtd: spi-nor: add OTP parameters
  mtd: spi-nor: macronix: add support for OTP
  mtd: spi-nor: macronix: add manufacturer flags

 .../bindings/mtd/jedec,spi-nor.yaml           |  39 ++++
 drivers/mtd/spi-nor/core.c                    | 166 +++++++++++++----
 drivers/mtd/spi-nor/core.h                    |  34 +---
 drivers/mtd/spi-nor/macronix.c                | 168 ++++++++++++++++++
 drivers/mtd/spi-nor/otp.c                     |   6 +-
 drivers/mtd/spi-nor/winbond.c                 |   2 +-
 include/linux/mtd/spi-nor.h                   |   9 +
 7 files changed, 356 insertions(+), 68 deletions(-)

-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
