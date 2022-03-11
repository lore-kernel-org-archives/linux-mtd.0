Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257B7C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Mar 2022 08:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SIUrPWURp3eNs0EK8ID/o67bwCtUGb5ST7HPlq7cNHk=; b=0EWpnNTSFt6wJO
	p2mrWDhDW42NxQWQP27keWOQw8cD06YZKGqLwLthUbv+pIbpJLt5J5Tgno6KIuL+tA1vh1HGPVHNo
	5sdth8vYOK+deT4dEzz1Va3hY/agpy8Z5Wc/0h5CFD5VHK9OqPrcbvuApwPK9f2CaV/qJMt2yAIYn
	m5tOsbBFO1VX3cAXzLm/QydXogwSWcHPdlOyLXzuAca+Q/jItfmbVEeAl8f0t+YDSnA0k8YSVddl+
	hKjRpVY75ThigDzdK3r1/e1X8cC/UplS3L0QOyQ7nNLY/BG8dly4t2Ip4NjvLzdiQRufnpSVVhTEf
	x0LbZhd5KxzlpSdq5HDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSaDo-00FRNV-1i; Fri, 11 Mar 2022 08:02:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSaDk-00FRLN-9l
 for linux-mtd@lists.infradead.org; Fri, 11 Mar 2022 08:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646985716; x=1678521716;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AzZqXsvGH16lWupXaADkIIwRJDwU6rAZUXxnYSi/l0A=;
 b=w66vlynnQA0v0YrLF44tza9IZkVB9k1okAJ6PXHSFrvmC8MdKhVq5S7J
 wLoq7Tw58TRDpwwI4XpdGbWoPWExrmS6x7U5iv2R/x8nv0U6YipJVNDLJ
 w5lvHn7NwrPsTtlx/URztSmNh/NqvBYleEB1uifk+rNIvEUCMPqanzsb5
 dJaE4iF8FUPsdyuXpvOms0zEkwc7Y8mUQUxwUOgru1lel1Yx64IH/2eCV
 3dLq7UrluUO75Vo9vkfc1HNFAfkjtZOF4VvF1slqfs3lVEIbFdpgJypf8
 DU/N02WqSIbvS40SZPXsfWa1ZIEXjpAHWj33E2zYcBHMZ837SheEWMtZd Q==;
X-IronPort-AV: E=Sophos;i="5.90,173,1643698800"; d="scan'208";a="148864908"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Mar 2022 01:01:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 11 Mar 2022 01:01:53 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 11 Mar 2022 01:01:50 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <broonie@kernel.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <nicolas.ferre@microchip.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: [PATCH v2 0/6] spi-mem: Allow specifying the byte order in DTR mode
Date: Fri, 11 Mar 2022 10:01:41 +0200
Message-ID: <20220311080147.453483-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_000156_489455_F715491F 
X-CRM114-Status: GOOD (  13.67  )
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

There are NOR flashes (Macronix) that swap the bytes on a 16-bit boundary
when configured in Octal DTR mode. The byte order of 16-bit words is
swapped when read or written in Octal Double Transfer Rate (DTR) mode
compared to Single Transfer Rate (STR) modes. If one writes D0 D1 D2 D3
bytes using 1-1-1 mode, and uses 8D-8D-8D SPI mode for reading, it will
read back D1 D0 D3 D2. Swapping the bytes is a bad design decision because
it may introduce some endianness problems. It can affect the boot sequence
if the entire boot sequence is not handled in either 8D-8D-8D mode or 1-1-1
mode. So we must swap the bytes back to have the same byte order as in STR
modes. Fortunately there are controllers that can swap the bytes back at
runtime, addressing the flash's endiannesses requirements.
If the controllers are not capable of swapping the bytes, the protocol is
downgraded via spi_nor_spimem_adjust_hwcaps(). When available, the swapping
of the bytes is always done regardless if it's a data or register access,
so that we comply with the JESD216 requirements: "Byte order of 16-bit
words is swapped when read in 8D-8D-8D mode compared to 1-1-1".

Tested with atmel-quadspi driver, both in 8D-8D-8D mode and 1-1-1 mode
(via the protocol downgrade).

This patch set depends on the SPI MEM changes from linux-mtd/mtd/next and
also on some SPI NOR patches that are waiting for R-b tags. You can find
a branch if you want to test it at:

To github.com:ambarus/linux-0day.git
 * [new branch]                spi-nor/next-mx-byte-swap-v2 -> spi-nor/next-mx-byte-swap-v2

v2:
- all: s/bswap16/swab16 to comply with linux naming scheme
- SPI MEM: add dtr_swab16 cap to spi_controller_mem_caps and update
  spi_mem_default_supports_op() to check for it.
- SPI NOR: do not encode swab16 info in the SPI NOR protocol, use a helper
  instead
- SPI NOR: downgrade the SPI NOR protocol in case the SPI Controller does
  not support swab16
- add SPI_NOR_SOFT_RESET and support for mx66lm1g45g

Tudor Ambarus (6):
  spi: spi-mem: Allow specifying the byte order in DTR mode
  mtd: spi-nor: core: Allow specifying the byte order in DTR mode
  mtd: spi-nor: sfdp: Get the 8D-8D-8D byte order from BFPT
  mtd: spi-nor: core: Introduce SPI_NOR_DTR_BSWAP16 no_sfdp_flag
  mtd: spi-nor: core: Introduce SPI_NOR_SOFT_RESET flash_info fixup_flag
  mtd: spi-nor: macronix: Add support for mx66lm1g45g

 drivers/mtd/spi-nor/core.c     |  16 +++-
 drivers/mtd/spi-nor/core.h     |  10 ++-
 drivers/mtd/spi-nor/macronix.c | 130 +++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/sfdp.c     |   4 +
 drivers/spi/spi-mem.c          |   4 +
 include/linux/spi/spi-mem.h    |   6 ++
 6 files changed, 168 insertions(+), 2 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
