Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C450AFD7074
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 10:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CxntSUJr6lp/ANy4lAx6DR8tdnGEOW2woJlqos0mDIk=; b=eavJivKJBcHBOg
	wXYPTow37FEzJMFyxlC6hioCf+ScwBXgJPLLEFtWrW3FvaCZ2ckGRCuXJWxTGrMK4EzJ/oVLA+SbH
	Nh5NnmdensXV05qUC7YESHhANeRUgEfKz4KpEdwuhAB8IzOiN7N/tVkU/zIq4DOhXYaTxjjYJrdTM
	JiVVu4uuBLbHheA+EwZ7iSLTSl2RQUChuZ7AlWMfBcklmPCN7c+tbqLzaDzVsyULToD1eqapbkc9f
	DRSYxv1/7n9L6CCAltbIFcpzi2qBDrAqq2ilsp8Cdm+USwcYQheJpoybrSnXHKumymIlCXiiWaKq/
	B+ubfjFUkg6ZxRjk3+Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Rbh-000000060F8-28m7;
	Tue, 17 Mar 2026 10:25:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Rbd-0000000607P-1JvC
	for linux-mtd@bombadil.infradead.org;
	Tue, 17 Mar 2026 10:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=3UTw9aN/2yCK3EvGO8QBuf8zar07N1b/IrNqKvh1CgE=; b=XHBJU2U28x/urSXEyFfqpQv6Bu
	b39/st1qAeb5fcuDEexEO2zI/hWoDcBqWvEGKWGMwkVZ3n4WaMJOWdDXV9enzfM7CDQwuPX1qP2os
	4PiCEnhW+yi7+5OkHofYichAob+EAFhWZ7CBw6DmLQ/D63ZxJCVJZXbO3rIY2pCCyWNkYP09bDFJV
	yNj11bOIjyqAZgBGd2x4+lVJWXmaFOloUC2CKaOSsQEP3WPFURvwbAIbbjr0g59j9D3hMg/LwgHce
	aCEOKVlAGsRTJjsAG6jmdiHLHH8G1leMtFd7dWrkCSopjxbj6WWqJNjCaejNhhhHZDSxw9a/1aa1m
	jXvzfbQg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RbY-00000002WKc-10xY
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 10:24:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 75CA3C55056;
	Tue, 17 Mar 2026 10:25:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A5175FC9A;
	Tue, 17 Mar 2026 10:24:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 73D8310450453;
	Tue, 17 Mar 2026 11:24:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773743090; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3UTw9aN/2yCK3EvGO8QBuf8zar07N1b/IrNqKvh1CgE=;
	b=2eDnJIsIIFtXSHEnNT0QdUMy/UeGSLx1odw1HIC8E3lP17E8zCWp40u53c4CdsSVYWkBKD
	ihz4qbr9oJWEGVLa07H+jOqmpl/qnLiCRGqyuQuHUJfFJGp9jq5BQvcnOOLtkjWvliKRpC
	cyClh4i1C9nyDPuzcQnuvy6ARasEWUUBzX9YpcZtGOM5TcjKHWU35TNxc7ccciQ+C5RWSd
	vbkbMIwH1fL2ba2vlry/b5GzNODZ/FXIenkEl9o7zIQ9N5U6Vc7gm6HH3E+LoI1fOPZF/Z
	b+d0ZXjVCC/QjjeafJGM7cx/25dyhYB6wNWP9nWFhTcT6xe36yLGREbou6l0sw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 17 Mar 2026 11:24:25 +0100
Subject: [PATCH v3 22/27] mtd: spi-nor: winbond: Add W25H512NWxxAM CMP
 locking support
MIME-Version: 1.0
Message-Id: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-22-2ca9ea4e7b9b@bootlin.com>
References: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-0-2ca9ea4e7b9b@bootlin.com>
In-Reply-To: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-0-2ca9ea4e7b9b@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_102452_348751_CE81761E 
X-CRM114-Status: GOOD (  11.00  )
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
Test run following the freshly written documentation:

$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 $bs $all_but_one # all but the first
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0000ffff | unlocked | 1
 00010000-03ffffff |   locked | 1023
$ flash_lock -u /dev/mtd0 $bs 1 # all but the two first
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0001ffff | unlocked | 2
 00020000-03ffffff |   locked | 1022
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 0 $all_but_one # same from the other side
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-03feffff |   locked | 1023
 03ff0000-03ffffff | unlocked | 1
$ flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # all but two
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-03fdffff |   locked | 1022
 03fe0000-03ffffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index fb855fe44733..7609dcc768f0 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -358,7 +358,8 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25H512NWxxAM */
 		.id = SNOR_ID(0xef, 0xa0, 0x20),
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25H01NWxxAM */
 		.id = SNOR_ID(0xef, 0xa0, 0x21),

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
