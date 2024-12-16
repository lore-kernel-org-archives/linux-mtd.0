Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AA8E7717F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2024 11:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l96UG7CRDInrbGzIFCqiS7h7woGfbHaktMdokGThzAU=; b=mfwRo3aVsF5RVP
	J4RrLRmiFseJ0bCAqErYCCYi/TkftV858X4K7yuAmpAu7sLEkWZkSBz9LGjokJuj9WcJrkEO1mj89
	HpCs9HzTlHt0mwfHOFx/+boh1WO7oGFp10r54BRuggq+/QUOqQ6Ni4KO3elwuAu0KzFSSigd0Fwqd
	cwoWvGU8/7q5lppGnYOkkipiUd6R3wueosKQ+2Ziy32kYIvTIHW++qsgnBx7SyXyxavQ66IN32awz
	ifKcelYM2stypTlTpsWRTUJgJ7xAJqcw4kMFRr+XwL3YTSAtqeVQ93EZpdFjMomCTpwwyLN28PlJ2
	rNyd5nQWNv81s0u5OnXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN9GK-00000009oya-1jkV;
	Mon, 16 Dec 2024 11:27:44 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN9Fb-00000009orb-3LJJ
	for linux-mtd@lists.infradead.org;
	Mon, 16 Dec 2024 11:27:01 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id B398F240103
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2024 12:26:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1734348414; bh=ryjdIUCrPB15htE/ztRB3huyeH3L3LKxpYt0VRX7c34=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:From;
	b=GEO5+EFVsU6ydDIwr4+ECOcbnZkNumYnt9axpaihm/9dj5PEMfL72TBHQOY+gOwbd
	 5B68VUANtHVTk1gMMSBMZO6BXMfo1BeiedDKlGtB5OC1VHHzg1eZ4ahkwuCqL6gttD
	 Q3ZsfWMymR6RQ9hMw2bWXp2VM8gzjmveyBgx7Jx2egGhWhqNhG2A+TRkRd8v+PJ8Ic
	 uAkiBAYwRNY1pzCoQmfG0BH2BHc6qfGsIHr+rdcHpLklHgUGIE1UV2VEgkuMQUssZt
	 SWnQQJNibkcdsHYU5swWNPV8GFqvCN/kGDfxkAl/OqgucG3g1ROaL6CHPXIrto+rzK
	 /cjxfBl5ZDe+A==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YBd2501ttz6twD;
	Mon, 16 Dec 2024 12:26:52 +0100 (CET)
Date: Mon, 16 Dec 2024 11:26:51 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: gcc-patches@gcc.gnu.org
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] mtd: spi-nor: winbond: add w25q01jv flash chip
Message-ID: <Z2AOeyPwYWaam_lX@monster.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_032659_978004_76273BAA 
X-CRM114-Status: UNSURE (   9.31  )
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

Add Winbond W25Q01JV 128 MiB SPI NOR flash chip, verified working on the
Zynq-7000 platform QSPI controller. The flash chip has quite high read
speeds (about 60+ MiB/s), but erasing is very slow. The slow erasing is
by design.

Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
---
 drivers/mtd/spi-nor/winbond.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 8d0a00d69e12..e2caf299d19a 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -146,6 +146,12 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q512jvq",
 		.size = SZ_64M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xef, 0x40, 0x21),
+		.name = "w25q01jv",
+		.size = SZ_128M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xef, 0x50, 0x12),
 		.name = "w25q20bw",
-- 
2.47.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
