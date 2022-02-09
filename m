Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5952DC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 13:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2XUZU/aIvj47Vgkkk0vbOWiGLN80/xS9nf9CnU3eOPc=; b=T+kBcN0ksWDfic
	9oc6TXbzMHUzTiZ01wQ9qQHhk4xeLDOhcVXTwVQres1K1ryKi1Ah/uCLhKz/zR6MYN1aRz0A4U9ew
	IVxe+bYHJj9S31uB1KksZ71I5dxtDay/MgePhH2l1wiazx6UUndZ/bjiC7wZfppDutsJbgto9d6mi
	9yCYgp5h1sqwo43rR2ravkXXSsIZ/Qu4tDu9JxsljkYRQ2jmsyJPFlKb6D1DfziVHUNxxXR58qWUz
	jRmMcf94Z8F2fbaQ/fU3QkwEeteldgPh33xLKDF4b8ToRSzE0KHYONzotqkKngYtidux4/low7i+0
	Hm94+n55CiQB+mdN549g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHn9g-000Azn-7D; Wed, 09 Feb 2022 13:37:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHn9c-000AzV-Nn
 for linux-mtd@lists.infradead.org; Wed, 09 Feb 2022 13:37:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644413824; x=1675949824;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O9b8JHkYj+KtYod5bk+/rj8l+qCSYgtxEN28/BKbsXw=;
 b=lKeHUfqi8rFngpgIquWmqLKQVuRnNM78rjTTzHJKi1RMW17FzFQXm01W
 qqH6bJrbiEbCElp8jC/nC8bxrw0msOg/RWcOlHwcgNlBWRhtF6RmHcotq
 Og0Isod73dOg9ab0+iZnSMJSMKnP2tcZVIx1NbkIziRkWgb/AjQEFxDle
 aDcLiQc696GE93BLzS6GIKY9XyejAuQ5i1cjM605PkqBhSHZvTdb5DJdf
 DFxGDGa1Rlbb0KW92+8osrgzMxs90V9JElxajbgg0gKad1rKPnpqjRWbh
 EeDIi3Ot4OS1sD06hA6TArElxNXZhehr86JZX2773OeMmVbiKl74hRyLz g==;
IronPort-SDR: XH8mXKbysT/5q1qveQ850+9rxuZ9yh6lwOOVuOezhwfItBYY85zNaHbIQR+mO25nILeEMHpyav
 bo3suScZxbho0s2egzoI1wxgvzxgX5j2phSa5i+N0XginVq1VJdd+hNgBpmMlW4OQOO/azZ6pW
 687vX2TfGho1mtDBVuvPaNv/eMFG2LPl2k/8guI8w/AxENBH8rrKr6Mq3UZIQbeJLw+C1bRUoe
 fnnR9++/NG8ybb9coXm/zqXkkTwb49BtCsMzS+iI/FY/Xhbmk+drJfH+MHm6P13Cq0XykowDiA
 vdY0LrOLNXfDnAJ/cSbZZ1Gl
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="161629928"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Feb 2022 06:37:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Feb 2022 06:37:02 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 9 Feb 2022 06:36:57 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v6 0/7] mtd: spi-nor: Prepare core and add support for
 mx66lm1g45g
Date: Wed, 9 Feb 2022 15:36:49 +0200
Message-ID: <20220209133656.374903-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_053704_832102_DF8D8BED 
X-CRM114-Status: UNSURE (   7.83  )
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

Hi,

I've made some core work as a prerequisite for mx66lm1g45g addition.
I've cleaned the RDID op and the flash detection. I introduced
SPI_NOR_READID_OP to ease the spi_mem_op filling. I would like to
follow the idea and introduce macros for all the SPI NOR ops, but
after we'll integrate Michael's SR patches.

Cheers,
ta

v6: complete rework

Tudor Ambarus (7):
  mtd: spi-nor: Rename method, s/spi_nor_match_id/spi_nor_match_name
  mtd: spi-nor: Introduce spi_nor_match_id()
  mtd: spi-nor: core: Use auto-detection only once
  mtd: spi-nor: core: Introduce method for RDID op
  mtd: spi-nor: manufacturers: Use spi_nor_read_id() core method
  mtd: spi-nor: core: Introduce SPI_NOR_SOFT_RESET flash_info fixup_flag
  mtd: spi-nor: macronix: Add support for mx66lm1g45g

 drivers/mtd/spi-nor/core.c      | 115 +++++++++++++++++-----------
 drivers/mtd/spi-nor/core.h      |  14 ++++
 drivers/mtd/spi-nor/macronix.c  | 131 ++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/micron-st.c |  13 +---
 drivers/mtd/spi-nor/spansion.c  |  13 +---
 5 files changed, 221 insertions(+), 65 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
