Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F70C433FE
	for <linux-mtd@archiver.kernel.org>; Sun, 22 May 2022 05:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q69qeIym7q1NEhHx2ktq2dbjy/JJM54Bu73oxJoOHes=; b=hxD7ijyIm6fjrx
	6aLtoyekf5QartjsQMZ5hPkQec0EJ8cHCJH8UEJw1qegMUxX95FSsvkWOJERsubSsaETeFZ64LBjw
	I6IhzEH0xDpIoT4URK7XuduiD4Y9KF/9JU1Ho+zSf3I37VI6WXU3Oj8ur3rQ2xd3x4UsOxQPZIt+8
	eFBv+CqduBTBrI1L8wCcyanTx3GWfx3UA7Rek8hPWzIjlFu0Y2VAik3bH5C/fkSSCv2qD5JMD3e9o
	borAujbn2DJ4ryjhms2K+ivze2GDJtJ7ZPsab/msXpJSpBWDVSagxXYiTIci195Y/syrJ7Qkkrq1o
	7yTXoqfF00oxQrxTVkEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nseTj-000dbs-8e; Sun, 22 May 2022 05:50:11 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nseTf-000daR-Ox
 for linux-mtd@lists.infradead.org; Sun, 22 May 2022 05:50:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653198607; x=1684734607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lURrqWQ4Bp3TuV0mtrGGqW8+CVdAW7nh+lfYSkx6HmI=;
 b=dBS5L0PQNVJ1AfZdyZJ2FADsrZEUx0+WcefZLcffYv/xGCMzZ6XodOsO
 SjG5KOgZWR4d3Na8HRjQnz2z6cCnCWTQUZnBBLc/caUK4ijlazamjFgA4
 QooXyfdaKWeYuW9W1Tc+ruB7KPxiS8nJEmKo5jtqbLf8DUqKuaQDmGcmV
 aHXrnK5dNGq8TA8/2xIyQ2ROu/65JipNd+siF382HGKEjohRcSYIqMI7J
 GHtoTqwckFD5YKeu7rteirzJ2SqOEWkG1ffPNqS0CbUymlLfVKEru6d4+
 heVOX5z2C2jTK1Ji/RQUQ8tt6y3PlPWryIpqn8qwL34t3xgh9TVo0NYFK Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10354"; a="270528601"
X-IronPort-AV: E=Sophos;i="5.91,243,1647327600"; d="scan'208";a="270528601"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2022 22:50:01 -0700
X-IronPort-AV: E=Sophos;i="5.91,243,1647327600"; d="scan'208";a="600047771"
Received: from unknown (HELO jiaqingz-server.sh.intel.com) ([10.239.48.171])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2022 22:50:00 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>
Cc: linux-kernel@vger.kernel.org, Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [PATCH 2/2] mtd: spi-nor: micron: Add SPI_NOR_DUAL_READ flag on
 mt25ql02g
Date: Sun, 22 May 2022 13:48:02 +0800
Message-Id: <20220522054802.1719443-2-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220522054802.1719443-1-jiaqing.zhao@linux.intel.com>
References: <20220522054802.1719443-1-jiaqing.zhao@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220521_225007_849352_AEBEDC2F 
X-CRM114-Status: GOOD (  11.12  )
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

The Micron mt25ql02g supports x2 width dual mode operation. This patch
adds the SPI_NOR_DUAL_READ flag to its flash_info entry.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 drivers/mtd/spi-nor/micron-st.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 8a20475ce77a..da0251c1a263 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -233,7 +233,7 @@ static const struct flash_info st_nor_parts[] = {
 	},
 	{ "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096)
 		FLAGS(NO_CHIP_ERASE)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		MFR_FLAGS(USE_FSR)
 	},
 	{ "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
