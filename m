Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA67C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 09:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xaMGZ77fOYKlsPh+e29ebWtW6D8s/bKrl4krd2tkd/k=; b=rVF0/oq0D5qVyd
	m9G1Axe0kLbQeIZvRgKqW7IkYLMG0tSsJj2JMwHZvqF2EzkhTW8vPBccAb/hbAKdcf10FfTFoRBOu
	q+WZdIHi5xKhy9v3xfZFglpW4GqmAkIdZ4/uYXciFxRcRTuPi5Avjs6ETJ+1wJnt19CfjF7afvvhj
	oVjq1glgGMX26W4hcK5w7TUAWIfaduHVFM57XDEobLwQTFZ1gJFA2oLBXS9I0aWGvDgvBMQQ52Ze2
	vjwQNg0HNGGmSjeZNP0EHKnas9+Lll1yPlqdey/9GBXw8Qs80axBgO3DdtvTIz+SFw0BwEijUEXau
	C7Yz3vjUEjS8DgXMGDZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOzFR-00FweT-Ox; Tue, 01 Mar 2022 09:56:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOzFN-00FwdE-Q1; Tue, 01 Mar 2022 09:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646128605; x=1677664605;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xFfaj3jOfpPoOe3Mwj+OcLDLSUgrQ7zBgqcIXQvzsUY=;
 b=HKPdS/puEaSuaNOpTXPfh+pWA5n7pJbfO4QGLm1GjUGjeuKrtkPhRFgW
 RR3j1JnCguYt9Sv/X7fqlVa+sUsG5ePej/C3D/EkpUvcBX/O90dMcueFj
 9hjqVrSE7VMGzfdi6nMt+A+CQJG+/oFDw/b6vANzxzUAEgR/xzt1eB8sh
 25zntCPzsivG1FI74GqZIC7B6YX8AizOk67c9h2NR8AD76+RTI9fCS76d
 wFCbx70W1wPp4P0oMSMB9Prv4iW+ZuZvMeZ8pH56AELNswVbTHGKq028c
 l2bl6rmMZnwyaYYoVTfRQqBaKDVvWgPvZLdZ0CPnD3TbsSQPmrDmMBgIF w==;
X-IronPort-AV: E=Sophos;i="5.90,145,1643698800"; d="scan'208";a="87367825"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2022 02:56:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 1 Mar 2022 02:56:43 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 1 Mar 2022 02:56:41 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <heiko.thiery@gmail.com>, <p.yadav@ti.com>, <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <Nicolas.Ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 0/2] mtd: spi-nor: Fix Quad Enable method for MX25L12835F
Date: Tue, 1 Mar 2022 11:56:38 +0200
Message-ID: <20220301095640.313852-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_015645_945226_B8F6188E 
X-CRM114-Status: UNSURE (   6.04  )
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

Hi, Heiko,

Would you please apply this patch set on top of:
https://lore.kernel.org/linux-mtd/20220228134505.203270-1-tudor.ambarus@microchip.com/

Thanks!

Tudor Ambarus (2):
  mtd: spi-nor: macronix: Move set_4byte_addr_mode() to late_init()
  mtd: spi-nor: macronix: Use post_bfpt hook to fix quad_enable method
    for MX25L12835F

 drivers/mtd/spi-nor/macronix.c | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
