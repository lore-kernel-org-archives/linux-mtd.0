Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C8CC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 11:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JannUxTNoNWyIk/5QFB8N8Oa5FC1xk5h6ZYyJrLA2Ws=; b=wAru9mCZ4xuKMU
	uT42EkutO81PKcFMIxjUJno2q/hrfW6CU+23LL8ObK1yMKMmpDWcZrz8BTe4PZ1ajhQ/niIJPWMOe
	WQc3A3OijqoMjvqMtgdXIIlzLkAQdtgvx04Ge6ltsElyYIUzS0IYpGn5paey+nBQN+OYEWD2xcBzJ
	FyF7tLpOGIenZqR1/zPNdxBEyFG3CA26XNUAD5oYJcNNTtbrZf1fw8xB6cQVZ3blCfvKuJXXmuQOG
	2ngtdBbvkT576eWqpVfOTIuuCSONmbCasERmxq4HIXmDSNdn7mvchTkbJiGNlJjMi68/xsZZEBz1m
	zdt01ieYxR24i3Qi7cfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL1ZG-00E1e6-FM; Fri, 18 Feb 2022 11:36:54 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL1Yi-00E1Jc-Jq
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 11:36:22 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 5AD9A22239;
 Fri, 18 Feb 2022 12:36:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645184174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=9TlnQxnR88dBx+W0DgIZNYVu/Pyuax2FALjMy5Y26hA=;
 b=fKlNwt/jYJrztVEeI5/UTMOCNQbgUyqv6daQaEtdYPHx7VJXfnkPUjmtfDEEhvcK92uoXK
 w5m0T1mOTNqiLV+veF9sllwGLfl9Us35dcM++Y4Uhoj/J67fZRSDIIyIk8ReubJ2vAyR5a
 uSCYNgWgOl7DrcfNp3AsAwZwz6mXcsg=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v2 00/32] mtd: spi-nor: move vendor specific code into vendor
 modules
Date: Fri, 18 Feb 2022 12:35:35 +0100
Message-Id: <20220218113607.1360020-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_033620_917353_5FC6D80E 
X-CRM114-Status: GOOD (  13.96  )
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
 drivers/mtd/spi-nor/micron-st.c  | 258 ++++++++++++++++++++++++------
 drivers/mtd/spi-nor/spansion.c   | 154 +++++++++++++-----
 drivers/mtd/spi-nor/sst.c        |  20 +--
 drivers/mtd/spi-nor/winbond.c    |  26 +--
 drivers/mtd/spi-nor/xilinx.c     |  93 +++++++++--
 drivers/mtd/spi-nor/xmc.c        |   6 +-
 include/linux/mtd/spi-nor.h      |  18 ---
 19 files changed, 555 insertions(+), 502 deletions(-)

-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
