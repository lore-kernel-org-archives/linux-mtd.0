Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81186E8537A
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2026 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=47ZXpCf7/2hKjAupRAaKLbgmB7lzZS9NGhuLUWtJJnQ=; b=2yU7NTguh6Q5aU
	PgF6NSLq7GjilI5n6dxkSIA4Lu79tdnqzdfKDt/9zVuX47rT1vc62gDDTyAA49IyGnx4pC7ar3T69
	pcG0gVFLVjG6FLlRO/WmgyslexcM/WyEe5cnqA9Of/Dvuf1E501WCUc/LiUxwE1TIiQsT5qbBhzmD
	mSLTgNXiFAJuxCMYsOFo8/6UnhizFS2+iLUjCHn868wdy2Zx47tf1j6s8Fi7cau6B5O5VYwa71eRc
	xz3fAukh+JmeW3S2nN6RLifCOdkJRanWOYBFIMGqNhVLcSzfXz5T8lAZNtlesi2VaHz1lWFqZ7JaX
	oONG3dp7NebZI8RDdrLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h6Y-00000002Hw2-0UPo;
	Fri, 03 Apr 2026 16:10:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h6U-00000002Hq0-2okf
	for linux-mtd@bombadil.infradead.org;
	Fri, 03 Apr 2026 16:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=yhH+eLu6fxqdAQZiuioR7i/D/pMDWxpaQ3+CJS2/QWU=; b=OV7HG/cvHwPdwKgYDF9dbEjKIH
	xpCEOiV4p4Zn9/hLkzdAPUCsnt1L8ohv3R8NeTWkkiY2nbG9gLKJHGXjkUI+UVpv27vHOyvOa22tV
	FBiyIDYn7oe7Xj/2IG4Fqj3XANAujlfAfRGdM1mdaEcmJIaa+vGwLaM16/qS/tUh5K63B8VAYBGt+
	hVAG69BAyJT7Bp9RdLB51sP+s8BlOL5kWkwH2m8/FzBT+/IZ2k9yaCYb+bl0M+7AqLaHdYsNUf/wj
	JOTpZosEyPtiZ3JWFDX5irmcz7VDlhkYqAEVEdJO965kFKAYJFy2QQHLBg9jqFEW0/HmMS7d8LQMZ
	ua/qFxRA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h6O-0000000Egk1-3lyU
	for linux-mtd@lists.infradead.org;
	Fri, 03 Apr 2026 16:10:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 907C81A312D;
	Fri,  3 Apr 2026 16:10:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 65B30603C1;
	Fri,  3 Apr 2026 16:10:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E783B104500FB;
	Fri,  3 Apr 2026 18:10:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775232630; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yhH+eLu6fxqdAQZiuioR7i/D/pMDWxpaQ3+CJS2/QWU=;
	b=tbAxAZ/VAzy8IwFmhTTzqwRSl+g4GlfVzdSfv9xI4hU/wuFm+qnHf9r0c4JtQ6LGOI8PJ2
	ozPkom7cEawzaD6No7+oJIrw7qdZOKJW5jSPg9tAn0ayc/Ra/1M0JjFqPwTFlAfROKUkzD
	Ox2BeqJIbdqoJB1WBWvdxc5YwUxzYVIikyRLMvmi9D19ZeGlUM8KYad7yI7J3CZIf8xPfp
	2G+z0834XE4cu8O0fjPqcVkooIzEv/TjdzzkgE6Su4Ntfnf1O+DDB+mHq5agNT4gG+IqvI
	Gxe9XIWC/16RnoN+X+wYuWQy1eR8rg6P02229wTzjVofkrvUmi6CzK4ZqTpi3w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 03 Apr 2026 18:09:41 +0200
Subject: [PATCH v4 23/27] mtd: spi-nor: winbond: Add W25H01NWxxAM CMP
 locking support
MIME-Version: 1.0
Message-Id: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-23-833dab5e7288@bootlin.com>
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
In-Reply-To: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_171033_047390_6A2F4727 
X-CRM114-Status: GOOD (  10.87  )
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

This chip has support for the locking complement (CMP) feature. Add
the relevant bit to enable it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Test run with W25H01NWxxAM:
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 $bs $all_but_one # all but the first
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0000ffff | unlocked | 1
 00010000-07ffffff |   locked | 2047
$ flash_lock -u /dev/mtd0 $bs 1 # all but the two first
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0001ffff | unlocked | 2
 00020000-07ffffff |   locked | 2046
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 0 $all_but_one # same from the other side
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-07feffff |   locked | 2047
 07ff0000-07ffffff | unlocked | 1
$ flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # all but two
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-07fdffff |   locked | 2046
 07fe0000-07ffffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 7609dcc768f0..1b9b0e9598ef 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -363,7 +363,8 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25H01NWxxAM */
 		.id = SNOR_ID(0xef, 0xa0, 0x21),
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25H02NWxxAM */
 		.id = SNOR_ID(0xef, 0xa0, 0x22),

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
