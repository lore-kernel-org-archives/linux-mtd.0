Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D376C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jul 2022 09:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JP04cnVO6l3E3XEmbBeqT8OfG84uZKM1Jan6WxDnpxo=; b=InX8E49gabIBWc
	HJPkXbuVvbILp6exmcEZrdMuBQsb8x2Ra8xvpVjqnHzpWHCPxx0TdL1LMeWr1Y5zxtPMe3PeYdfkF
	2dRCtRSsNBjAQw/YPm6VWz8KrnpcC37G32RxoAMJrGP9VALu2ig3PwWNoD4NO9lwlpgIHwdOeuV7D
	e3yZvkHVDjS+WODQHZCDlz3hzMgt9kYHDOhlUTB0Sjv25A+B3eQR2/NZIZEvFY+WMtPcnjbfquCng
	72iYzJzW2Eoj6b2Qx8M4NIR7aXhfUIfu0ihnPySBzvY6p8bUAJjtVukZWnQP2cCtB94vpsgdSQoI6
	CcjtFFqUHC7RgeWjhaVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDjWA-007MKF-05; Tue, 19 Jul 2022 09:27:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDjW7-007MHO-6u
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2022 09:27:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658222867; x=1689758867;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=18dzz8j653+mCjnOgW0HLOzsYFodKXYroQICwo3bToY=;
  b=iLC/TYeLCPAuUxaIf9PROysy58OAFM+UKdlx0KkQbSThvzXE946TKoAZ
   6VOOqa+3qDkYPIc5Wa9N6CAsRtAOqcDg0rpLblcCP++AI/T3JbbQsXMRf
   QHGIO+YtiIDNJXQywyAup1yDVqAvR4ZNfdBdCdoHTGvHN7Q4ZGtCo4LPw
   yldwv1q84lsRJF1NYSa7sQpJ7FG+c6vgiAUdIGSYBb9bFxpsaBFEUFezU
   FExvh6QBEqSBc3nQPwHIFDi+yRrYpcux0k2l94AR9jMALedt7UhQDmO74
   O+tXqQYPPg0rAP7sVUob/BL0cboNwpxb1L1b+o0h4ycWkmTt6kYaAVl8U
   g==;
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="182789236"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jul 2022 02:27:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 19 Jul 2022 02:27:44 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 19 Jul 2022 02:27:42 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <mika.westerberg@linux.intel.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, <michael@walle.cc>,
	<richard@nod.at>, <miquel.raynal@bootlin.com>,
	<linux-mtd@lists.infradead.org>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Skip FSR reading if SPI controller does not support it
Date: Tue, 19 Jul 2022 12:27:39 +0300
Message-ID: <165822280254.54276.15501031299133900909.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506105158.43613-1-mika.westerberg@linux.intel.com>
References: <20220506105158.43613-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_022747_314018_AF59D54C 
X-CRM114-Status: UNSURE (   9.32  )
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

On Fri, 6 May 2022 13:51:58 +0300, Mika Westerberg wrote:
> The Intel SPI controller does not support low level operations, like
> reading the flag status register (FSR). It only exposes a set of high
> level operations for software to use. For this reason check the return
> value of micron_st_nor_read_fsr() and if the operation was not
> supported, use the status register value only. This allows the chip to
> work even when attached to Intel SPI controller (there are such systems
> out there).
> 
> [...]

Applied to spi-nor/next, thanks!

[1/1] mtd: spi-nor: micron-st: Skip FSR reading if SPI controller does not support it
      https://git.kernel.org/mtd/c/90c517f435a9

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
