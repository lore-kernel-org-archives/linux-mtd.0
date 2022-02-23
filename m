Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A5CC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 13:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=laldMB8hBoYWK947wi/LYVwBrtzDDhKHYB42hd2d6L4=; b=xzRow4gncGoIMM
	osLk1lS9nqDFZPlqafZEh68Ki0VbniSqvdIePHkxfJ/ietGqDxtQP/OX17II35s+4azfN7dmuH72G
	0plF0oUeHOm0LB3Os4Phwd1ay+nGCoh0GBOLzP3EJDWFrIREWq3RTht4N94TMRZrWZoTHS2xnJnXq
	MOUCw7bcvbqqkWCyJfaUeibcB/wb9B3o9kvEUgt4srYW3KIyPoS3B+iKBibrR+x5RHpoHnE1JY7kA
	847vOMqcrxwrKZtIBpsrHX12Qc0IiZn9FsSn9vlNapl5ox1CK5LOT+rMtSMhBeCUVJjjSwMsSmvcI
	tBNmXe4nr440XEFW4VmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMrwx-00EZo7-0g; Wed, 23 Feb 2022 13:44:59 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrwA-00EZPT-UH
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 13:44:13 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 767B122247;
 Wed, 23 Feb 2022 14:44:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645623844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=W0qxykFGPAH6Szni0i/hDYoTp01bzgBqRmB6BvFam8M=;
 b=e44TfZXJa3W5HfkfygM6mEybUIzz41bnc5I7IScQmO8XfQ6Y27lYBOrUXIBqEtdy4bXQYb
 k7f5Us3OEVTzNqZRpluwWLkl/WnEohOY2IKMflNA5zQ9r81hWS702/vZKSeJqQLC7oIav8
 asOqK/pMWn9szN880nPwa3JXssoQToU=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v5 00/32] mtd: spi-nor: move vendor specific code into vendor
 modules
Date: Wed, 23 Feb 2022 14:43:26 +0100
Message-Id: <20220223134358.1914798-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_054411_331887_351B476E 
X-CRM114-Status: GOOD (  14.85  )
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

It turns out that most of the special status register handling is
specific for a particular vendor. I.e. Xilinx has some different
opcodes for the status register read, Micron has an additional FSR
register and Spansion has these flags integrated into the SR.

Create a callback to ready() where a flash chip can register its
own function. This will let us move all the vendor specific stuff
out of the core into the vendor modules.

As a preparation step, unify all function and object names in the
vendor modules. For the sake of consistency and better readability
of the code flow, I also converted the setup() callback to be
optional.

Please note that this is only compile-time tested.

Changes since v4:
 - corrected doc strings of spi_nor_sr_ready_and_clear/
   spansion_nor_sr_ready_and_clear and spi_nor_fsr_ready/
   micron_st_nor_ready
 - renamed micron_st_nor_fsr_ready() to micron_st_nor_ready()

Changes since v3:
 - fix spansion.c compilation, messed up the patch export. Sorry
   for the noise

Changes since v2:
 - use family_nor_ instead of just family_ prefix
 - fix function doc

Changes since v1:
 - rename/unify function names inside the vendor modules.
 - make local functions static
 - fix function doc typo
 - use late_init hook to set fsr_ready op
 - Use uppercase and period in comments
 - Add comments for the vendor flags
 - move coding style change in spi_nor_sr_ready() into own patch
 - new patch to add missing parenthesis in S3AN_INFO()
 - add missing function prefix rename patch for the spansion module

Michael Walle (32):
  mtd: spi-nor: atmel: unify function names
  mtd: spi-nor: catalyst: unify function names
  mtd: spi-nor: eon: unify function names
  mtd: spi-nor: esmt: unify function names
  mtd: spi-nor: everspin: unify function names
  mtd: spi-nor: fujitsu: unify function names
  mtd: spi-nor: gigadevice: unify function names
  mtd: spi-nor: intel: unify function names
  mtd: spi-nor: issi: unify function names
  mtd: spi-nor: macronix: unify function names
  mtd: spi-nor: micron-st: unify function names
  mtd: spi-nor: spansion: unify function names
  mtd: spi-nor: sst: unify function names
  mtd: spi-nor: winbond: unify function names
  mtd: spi-nor: xilinx: unify function names
  mtd: spi-nor: xmc: unify function names
  mtd: spi-nor: slightly refactor the spi_nor_setup()
  mtd: spi-nor: allow a flash to define its own ready() function
  mtd: spi-nor: export more function to be used in vendor modules
  mtd: spi-nor: guard _page_size parameter in S3AN_INFO()
  mtd: spi-nor: move all xilinx specifics into xilinx.c
  mtd: spi-nor: xilinx: rename vendor specific functions and defines
  mtd: spi-nor: xilinx: correct the debug message
  mtd: spi-nor: move all micron-st specifics into micron-st.c
  mtd: spi-nor: micron-st: convert USE_FSR to a manufacturer flag
  mtd: spi-nor: micron-st: rename vendor specific functions and defines
  mtd: spi-nor: spansion: slightly rework control flow in late_init()
  mtd: spi-nor: move all spansion specifics into spansion.c
  mtd: spi-nor: spansion: convert USE_CLSR to a manufacturer flag
  mtd: spi-nor: spansion: rename vendor specific functions and defines
  mtd: spi-nor: slightly change code style in spi_nor_sr_ready()
  mtd: spi-nor: renumber flags

 drivers/mtd/spi-nor/atmel.c      |  81 +++++-----
 drivers/mtd/spi-nor/catalyst.c   |   6 +-
 drivers/mtd/spi-nor/core.c       | 265 ++-----------------------------
 drivers/mtd/spi-nor/core.h       |  70 ++++----
 drivers/mtd/spi-nor/eon.c        |   6 +-
 drivers/mtd/spi-nor/esmt.c       |   6 +-
 drivers/mtd/spi-nor/everspin.c   |   6 +-
 drivers/mtd/spi-nor/fujitsu.c    |   6 +-
 drivers/mtd/spi-nor/gigadevice.c |   6 +-
 drivers/mtd/spi-nor/intel.c      |   6 +-
 drivers/mtd/spi-nor/issi.c       |  10 +-
 drivers/mtd/spi-nor/macronix.c   |  14 +-
 drivers/mtd/spi-nor/micron-st.c  | 259 ++++++++++++++++++++++++------
 drivers/mtd/spi-nor/spansion.c   | 168 +++++++++++++++-----
 drivers/mtd/spi-nor/sst.c        |  44 ++---
 drivers/mtd/spi-nor/winbond.c    |  29 ++--
 drivers/mtd/spi-nor/xilinx.c     |  97 +++++++++--
 drivers/mtd/spi-nor/xmc.c        |   6 +-
 include/linux/mtd/spi-nor.h      |  18 ---
 19 files changed, 579 insertions(+), 524 deletions(-)

-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
