Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C319C55182
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Aug 2026 08:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aEDZ7ngZgh7hEADs4yIAv5Y7bNtfDvTr/fmkl1KXkCM=; b=rq342Efk9QSpcX
	uKtoUxS15vJ3G4PPOm8lMRf575W4N1ZM1P9CLi/3yGk5+dZyJ5E1prZk5G5+bQqplLlhP/FITkVF/
	rgRFfYurkSXWaVMQTy7DtNv6/Tcf/TxTLiLgfQZvgnh6wGQuoxNULNsNkHk76xtX4AFYopaXXY/As
	zKD4YYRAnusYzHch2C8s7BeDEeYdD5CAeVF4b4Z7IvOcAwbq+/qFTwipuIPZR4IK7vQazKHBSvt2b
	vn1T+xf13okoAi199fCTPbZMuG6/MFFtkOzBHAP/X/2CL8+iq1M68fwOR1yux/nHWjYKtf2Klnkq7
	jrrSvqIauBH1/lkS6Bhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWb5-00000003THs-4BP6;
	Wed, 05 Aug 2026 08:03:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWb2-00000003TAo-0e1I
	for linux-mtd@bombadil.infradead.org;
	Wed, 05 Aug 2026 08:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IECokdCzBsVUak0E3TMA6f5ekz6V8zS7sl+yPDFgG5g=; b=AQ6yl27cyNQM/tTNjPO+xHebkG
	FxeVGG4UpiKkzFwemRjBQQCuAdoUYOquyup729AAZe+MtJezEfJ4osQs8BkUFWar7WVDmIUB0dag+
	YBESdP4PjvINhIKo4Qkzajn+ux9pRYfZETw2DACPLV8Gl6Mur6V1eYvvLU5jJjPwgx3r63oP0g+b0
	mWJqJMFB6/aA2Pj3w24V0zXgHv662bsRGDLl+p+JAPKhk581KsHqOrcU+OeYd8RuGIMNETCW7csjJ
	3Zfn6I05L9s73j8UXeOOdOG05leojEEUtWq12QDnGBBHUuOaiIiwsvnDCNGexWF7nMjNA3XPF+qqI
	WrXGB6Nw==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrWaw-0000000AYr0-27g3
	for linux-mtd@lists.infradead.org;
	Wed, 05 Aug 2026 08:03:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 53CCE1A1436;
	Wed,  5 Aug 2026 08:03:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 28964602AB;
	Wed,  5 Aug 2026 08:03:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4CA8711C3436A;
	Wed,  5 Aug 2026 10:03:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785917000; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IECokdCzBsVUak0E3TMA6f5ekz6V8zS7sl+yPDFgG5g=;
	b=CBkSP3MaOgqtSPeEhYawTqh4tzdcTgRtHPQ9GKIwWSHSzQtqnUFdYg/w3Wdeo2hNnawLqE
	33AhZqo1s3OAiyuXxdf8SFIWKIl/MhIPIk8Neqz2bL1qq3AgFfiuDzy1MTPXXH4qFWKQMc
	nBWv9wCLMBZkv+oirwVeiE00ZBfwbAlwknKav+RmuvQolrv7pdSFjwqgASJR+P99ZSY+sl
	wBIIjuAhseeqdXaEy+hg8ismkhdbzZsk7xKq3KIPOecIjlQN465nNIBxck5dvNJ3grcCYa
	hyfc4bDSk4b14rCcY7qEczY+0bjhYPA0pmrDi7dXrv2EDqSCvD2Yfmi5IfkpjQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 05 Aug 2026 10:02:44 +0200
Subject: [PATCH v5 19/28] mtd: spi-nor: winbond: W25Q128JV-Q/N: Fill
 locking information
MIME-Version: 1.0
Message-Id: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-19-87238e577794@bootlin.com>
References: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
In-Reply-To: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_090323_462685_3BD95A2F 
X-CRM114-Status: GOOD (  12.47  )
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

The SFDP table does not advertize the CMP locking capabilities of the
device, flag it.

The CMP capability was historically not supported by non-SFDP chips, so
a Winbond wide late hook already makes sure the bit remains disabled for
them, for backward compatibility reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 $ss $all_but_one # all but the first
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0003ffff | unlocked | 1
 00040000-00ffffff |   locked | 63
$ flash_lock -u /dev/mtd0 $ss $(($ss / $bs)) # all but the two first
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0007ffff | unlocked | 2
 00080000-00ffffff |   locked | 62
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 0 $all_but_one # same from the other side
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-00fbffff |   locked | 63
 00fc0000-00ffffff | unlocked | 1
$ flash_lock -u /dev/mtd0 $(($size - (2 * $ss))) $(($ss / $bs)) # all but two
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-00f7ffff |   locked | 62
 00f80000-00ffffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 8fab520627bf..5a80de959768 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -217,8 +217,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		/* Flavors w/ and w/o SFDP. */
 		.name = "w25q128",
 		.size = SZ_16M,
-		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 		.fixups = &w25q128_fixups,
 	}, {
 		/* W25Q256JV-Q/N */

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
