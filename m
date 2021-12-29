Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AAEC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Dec 2021 08:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vRxcwMczgU+CWA9XPXhKQj67tkUCTevz2ruvQ7ySHQ=; b=nekON1JwmvkWvx
	cxji/bzzGhmhjU3KkTJF2NMsDJY9595a7Dmal6cxAAGS0RafPSiI6Te+2dI7fwxz6yNsn2/doGVH6
	I1Uld4y7d6ENvOX/8sv0zFLl8HCuzCTtKxlsjaI/EYlEnyAlMrTRQ1UL0/TfvY6a1M3Esz0M7T+Qn
	C7lngIMfMeGArVPDYMZQkutgD5unZnBgAR8GkbgbvNwNCzVK8hjXMEWkgm1XLlyG0+Jss3+EnLEQF
	PrYjCXaFu6+KtKbDKeg9hYP7FjNf2pr8JQ+zQq40qo9zShEc/dVkD2FSIb7/Afg8apROE5h8M9cmL
	egawxz/FI3y/XIizOTjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2UJG-002SxY-S3; Wed, 29 Dec 2021 08:27:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2UJA-002Swk-7i
 for linux-mtd@lists.infradead.org; Wed, 29 Dec 2021 08:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1640766460; x=1672302460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dk65/TNZb+6FwOTLi3tG/ia/WxkE3ieWpYa+bJxvILk=;
 b=wvTIaN+baefes40pc5iS0EdVBjz1zTp5sR/X7E3e3lGXQYxiylhKa5BJ
 Uop8f7nV7ZaY9s/qYCH3cvIZ39+W3c1KlvCZvrss7boZwHeSBvUCazW7+
 z4mBbRa1itnaqbisfAejoI70/6h6nTp1FKbRMoSVVqxlkLm1Sa8JY4G7X
 MlweV6pn8jGaPiNJRlgeuIBhCwO5rRoKjPdSf6tRFJhuxkXkjjDhAn/tl
 IS6YVufM6QIWFwHvZRqx8nyUXg6NbF4eGoaX6AHjWQEjm+I/4l8PpGmIg
 he4FvO4PCs6aK794w/HKr5ojav7B0vtZHMIr4yPRBVLAxBghIFpr8Y/FQ w==;
IronPort-SDR: LXWq6CAI2IOvWTkQXpJMKWP1KJeD/SNEnbVRwuG/QSRD4CsIBeagQlpjP5hMQDoqqHa4devtVe
 uPTu2y3Q5SPFLrjsa+6s7oQI6C63Xbragmlz6iJzC1K/OT+N82eOjZNsIdDbHC5Z5ThhbMdOOj
 PetKMb8YWV/jWFw5br0B3GTJ8byLxHE62n9mNLOP6VcLv3vfSLaeLPuO26pRGN2Rqk/5GGUl32
 ACxiaV2zhoT421FIGDugNoO/vdlFc/vKXEF3PBn2q2xy4UQK/Hj54Y5/brqJVH4iuo8C9VUhe8
 WNULk2bLgaoccMjc7wnww0Fg
X-IronPort-AV: E=Sophos;i="5.88,244,1635231600"; d="scan'208";a="143787647"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Dec 2021 01:27:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 29 Dec 2021 01:27:37 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 29 Dec 2021 01:27:33 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, <zhuohao@chromium.org>,
 <richard@nod.at>, <miquel.raynal@bootlin.com>, <p.yadav@ti.com>,
 <vigneshr@ti.com>, <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH 0/2] mtd: core: Remove partid and partname
 debugfs files
Date: Wed, 29 Dec 2021 10:27:31 +0200
Message-ID: <164076623215.10805.7001463971424800594.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211217122636.474976-1-tudor.ambarus@microchip.com>
References: <20211217122636.474976-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_002740_407312_19116037 
X-CRM114-Status: UNSURE (   9.17  )
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

On Fri, 17 Dec 2021 14:26:34 +0200, Tudor Ambarus wrote:
> SPI NOR has equivalent sysfs device attributes, thus let's remove the
> duplicated debugfs entries. There's no one else using partid and partname
> debugfs files, thus remove them from the mtd core as well.
> 
> If you find the idea acceptable, I would like to queue these through
> spi-nor/next, I'll have some other patches that will depend on these.
> 
> [...]

Applied to spi-nor/next, thanks!

[1/2] mtd: spi-nor: Remove debugfs entries that duplicate sysfs entries
      https://git.kernel.org/mtd/c/5f340402bbfc

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
