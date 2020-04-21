Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF01C2BA19
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 06:40:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F3FE2071E
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 06:40:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MrBtyQOi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F3FE2071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=KWdXmxd4TxZmvoR+UyV/0Mf0qNnpxz9LQBaqJqM9iD0=; b=MrB
	tyQOiEt22Hhbyn5wKy0HPQbdHGK/tM6G+Mta5qgmHW9W4FYVTPnOG2f/jjB5wa6xLfC72lBtQsbfW
	DudWW3XB1Q19LmrpuIK5xcXnL5zUZhwmoX8YeB8ulWKkYwwJvXmqz3WMYkm8I4x1K7ox+ZRkWjC3f
	DmqxYIgMamd6lxusZhAywhZanbOzHELTCkCx2T3UvVl10R1Oz9dA21/11OyunTrcb4TZyMe45Ybzm
	QUTc8xQccEYKOlDvlDmQfxvn+3+7KgAnW7AFjk6oqGiFTTB1bfXGZryl0Qohh2iLcNp+h0sKS0Jyi
	mXzGo0LaEsGDKr29zeqVHcLQAB303+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQma7-0004ua-LD; Tue, 21 Apr 2020 06:40:31 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQmZt-0004gu-1u
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 06:40:18 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG3.macronix.com with ESMTP id 03L6dnMW045498;
 Tue, 21 Apr 2020 14:39:49 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: broonie@kernel.org, tudor.ambarus@microchip.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, boris.brezillon@collabora.com
Subject: [PATCH v2 0/5] mtd: spi-nor: Add support for Octal 8D-8D-8D mode
Date: Tue, 21 Apr 2020 14:39:42 +0800
Message-Id: <1587451187-6889-1-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
X-MAIL: TWHMLLG3.macronix.com 03L6dnMW045498
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_234017_373785_EA993CA7 
X-CRM114-Status: UNSURE (   9.65  )
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
Cc: juliensu@mxic.com.tw, Mason Yang <masonccyang@mxic.com.tw>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

This is repost of patchset from Boris Brezillon's
[RFC,00/18] mtd: spi-nor: Proposal for 8-8-8 mode support [1].

Background from cover letter for RFC[1].

The trend has been around Octal NOR Flash lately and the latest mainline
already supports 1-1-8 and 1-8-8 modes.

Boris opened a discussion on how we should support stateful modes (X-X-X
and XD-XD-XD, where X is the bus width and D means Double Transfer Rate).

JESD216C has defined specification for Octal 8S-8S-8S and 8D-8D-8D.
Based on JEDEC216C Basic Flash Parameter Table (BFPT) driver extract:
DWORD-18: command and command extension type.
DWORD-19: enable 8S-8S-8S/8D-8D-8D mode sequences by two instructions or
	  write CFG Reg 2.
DWORD-20: Maximum operation speed of device in Octal mode.

and xSPI profile 1.0 table:
DWORD-1: Read Fast command, the number of dummy cycles and address nbytes
	 for Read Status Register command.
DWORD-2: Read/Write volatile Register command for CFG Reg2.
DWORD-4 and DWORD-5: dummy cycles used for various frequencies.

The first set of patches is according to JESD216C adding Double Transfer
Rate(DTR) fields, extension command and command bytes number to the
spi_mem_op struct. This is from Boris patchset.

The second set of patches parse the xSPI profile 1.0 table for parameters
needed in Octal 8D-8D-8D mode. 

The third set of patches extract BFPT DWORD018,19,20 and define the 
relevant macros and enum in spi-nor layer for Octal 8S-8S-8S and 
8D-8D-8D mode operation. Parts of these are refer to Boris patchset but
we enable Octal 8D-8D-8D mode in spi_nor_late_init_params() rather than
Boris's adding a change_mode() call-back function.

The last set of patches in the series support Macronix mx25uw51245g
to tweak flash parameters a correct dummy cycles set for various frequency.

Also patched spi-mxic driver for testing on Macronix's Zynq PicoZed board
with Macronix's SPI controller (spi-mxic.c) and mx25uw51245g Octal flash.

[1] https://patchwork.ozlabs.org/cover/982926/


Summary of change log
---------------------
v2: 
Parse BFPT & xSPI table for Octal 8D-8D-8D mode parameters and enable Octal
mode in spi_nor_late_init_params().
Using Macros in spi_nor_spimem_read_data, spi_nor_spimem_write_data and
so on by Vignesh comments.

v1:
Without parsing BFPT & xSPI profile 1.0 table and enter Octal 8D-8D-8D
mode directly in spi_nor_fixups hooks.


thnaks for your time and review.
best regards,
Mason

Mason Yang (5):
  mtd: spi-nor: Add support for Octal 8D-8D-8D mode
  mtd: spi-nor: sfdp: Add support for xSPI profile 1.0 table
  mtd: spi-nor: Parse BFPT DWORD-18,19 and 20 for Octal 8D-8D-8D mode
  mtd: spi-nor: macronix: Add Octal 8D-8D-8D supports for Macronix
    mx25uw51245g
  spi: mxic: Patch for Octal 8D-8D-8D mode support

 drivers/mtd/spi-nor/core.c     | 220 ++++++++++++++++++++++++++++++++++++++--
 drivers/mtd/spi-nor/core.h     |  31 ++++++
 drivers/mtd/spi-nor/macronix.c |  41 ++++++++
 drivers/mtd/spi-nor/sfdp.c     | 222 ++++++++++++++++++++++++++++++++++++++++-
 drivers/mtd/spi-nor/sfdp.h     |  16 ++-
 drivers/spi/spi-mem.c          |   8 +-
 drivers/spi/spi-mxic.c         | 101 +++++++++++++------
 include/linux/mtd/spi-nor.h    |  51 +++++++++-
 include/linux/spi/spi-mem.h    |  13 +++
 9 files changed, 654 insertions(+), 49 deletions(-)

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
