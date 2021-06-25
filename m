Return-Path: <SRS0=mYMn=LT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B1AC2B9F4
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jun 2021 06:48:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC0CB6140E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jun 2021 06:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC0CB6140E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:CC:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sPOI8iW6jZMFf3p423AaQDGjuHhdkga5HiTZuiUMLLs=; b=Mcw5SdPN6Rqu0w
	bvdfXN+YXxFO83c2vYxuaEHXOvv+qH9FiUC45o7KD8gOBetVTmOddEZwTr3cjONfHNN4sEh9a3ka/
	fJ34/sFDtawImA6qJgioFZ5mAkn3IZrUmLor5CBzoytq5LHwWhJbNH0GbdMXO3KLFeoD0WVmKDIas
	ULtbtJHq2+UDaJzMnkXiZeE25QMHU/u2nYbC52X0tJgtNPVoUtNV4A0TikP7HhFVl69rbYMRDZBR7
	rEE/57kI8IdH9x83HDkpfwfMqY/fk/bbvmh6Nvor2TQBiaaqK5vC1yELEwhx4jKneIY9RjgAXpTuK
	9kTQFv/g2rQK/35sv2aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwfcw-00HTpG-SV; Fri, 25 Jun 2021 06:47:46 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwfcu-00HToi-EC
 for linux-mtd@lists.infradead.org; Fri, 25 Jun 2021 06:47:45 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15P6leYo105986;
 Fri, 25 Jun 2021 01:47:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1624603660;
 bh=1y23YIm3wOf7MPu3P0fxTeFgLzN5msh+3LacTOz4vmg=;
 h=To:CC:From:Subject:Date;
 b=F1wU+Zp1QvIge/Ij6XNM8nE0ayK5mjHEhXbM6t3xn1xPKrUATaAI+U0UuokqXcjU4
 iOz2uNuGew8MVvzn3Rf8x+vjETGdsy61eVTQWDPrGSFOARCwXoswb0iJbUmBG0HFgV
 isrvb9mi6JqCzoROhRWaypdoD6wn8tSTQ30UxBcc=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15P6le9H058036
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 25 Jun 2021 01:47:40 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 25
 Jun 2021 01:47:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 25 Jun 2021 01:47:40 -0500
Received: from [10.250.234.148] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15P6lbFl005696;
 Fri, 25 Jun 2021 01:47:38 -0500
To: Richard Weinberger <richard@nod.at>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Yadav,
 Pratyush" <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: mtd: spi-nor: Changes for v5.14
Message-ID: <56e24b3e-57a2-50a0-8dee-c6b7ec62193f@ti.com>
Date: Fri, 25 Jun 2021 12:17:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_234744_616365_96F4C466 
X-CRM114-Status: GOOD (  13.56  )
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

Hi Richard,

This is the SPI NOR PR for v5.14.

Regards
Vignesh


The following changes since commit c4681547bcce777daf576925a966ffa824edd09d:

  Linux 5.13-rc3 (2021-05-23 11:42:48 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/spi-nor/for-5.14

for you to fetch changes up to c17e5c85b32f8809135f3211ba2525fb98b5c09f:

  mtd: spi-nor: remove redundant continue statement (2021-06-21 11:17:10 +0530)

----------------------------------------------------------------
SPI NOR core changes:
- Ability to dump SFDP tables via sysfs
- Support for erasing OTP regions on Winbond and similar flashes
- Few API doc updates and fixes
- Locking support for MX25L12805D

SPI NOR controller drivers changes:
- Use SPI_MODE_X_MASK in nxp-spifi
- Intel Alder Lake-M SPI serial flash support

----------------------------------------------------------------
Andy Shevchenko (1):
      mtd: spi-nor: nxp-spifi: Use SPI_MODE_X_MASK

Colin Ian King (1):
      mtd: spi-nor: remove redundant continue statement

David Bauer (1):
      mtd: spi-nor: enable locking support for MX25L12805D

Michael Walle (7):
      mtd: spi-nor: otp: fix kerneldoc typos
      mtd: spi-nor: otp: fix access to security registers in 4 byte mode
      mtd: spi-nor: otp: use more consistent wording
      mtd: spi-nor: otp: return -EROFS if region is read-only
      mtd: spi-nor: otp: implement erase for Winbond and similar flashes
      mtd: spi-nor: sfdp: save a copy of the SFDP data
      mtd: spi-nor: add initial sysfs support

Mika Westerberg (1):
      mtd: spi-nor: intel-spi: Add support for Intel Alder Lake-M SPI serial flash

Pratyush Yadav (1):
      mtd: spi-nor: Add documentation for spi_nor_soft_reset()

Tudor Ambarus (1):
      mtd: spi-nor: macronix: Fix name for mx66l51235f

 Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor |  31 ++
 drivers/mtd/spi-nor/Makefile                            |   2 +-
 drivers/mtd/spi-nor/controllers/intel-spi-pci.c         |   1 +
 drivers/mtd/spi-nor/controllers/nxp-spifi.c             |   2 +-
 drivers/mtd/spi-nor/core.c                              |  22 +-
 drivers/mtd/spi-nor/core.h                              |  16 +
 drivers/mtd/spi-nor/macronix.c                          |   5 +-
 drivers/mtd/spi-nor/otp.c                               | 160 +++++++++-
 drivers/mtd/spi-nor/sfdp.c                              |  58 ++++
 drivers/mtd/spi-nor/sysfs.c                             |  93 ++++++
 drivers/mtd/spi-nor/winbond.c                           |   1 +
 include/linux/mtd/spi-nor.h                             |   2 +
 12 files changed, 370 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
 create mode 100644 drivers/mtd/spi-nor/sysfs.c

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
