Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A2BCD3442
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2026 16:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nWeiZR/bfSLaC9ycmxxnFVeg9Hz+BW91e78r+JghEdk=; b=wnhsy7E2ParzjK
	UPSeb+xqXi3D86/fpswT7kXeU20HJ7Kr5AhH9BdrJS/ehmrj/iXguEh0IwXTLcXKZYEsiIdalAMDP
	BLoMizu2h/kUJr3kOaEDRN3qankyxKUexmFEWKaRQ60wHWVa6xGhwWgml5+8kFZTlQSvcIWAcC9+9
	9xW02/dBbwvZ/+cHumPqNah2JDC2+nQXRA/exAdkSfGWtABC0nnMvduSzzkSbqZm8EVj4kpYmPNho
	lb3DkAt1x4x93wIrdeUfJwwD4oHk3N23Q1Vcd3mxwYHTBi5LruEzY75OjHiEJ15nMvPX9pQwZbCdh
	F6TFIi0L5MciG12vItMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1t2-00000004NmV-0MRC;
	Thu, 07 May 2026 16:47:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1t0-00000004Nj5-0SgM
	for linux-mtd@bombadil.infradead.org;
	Thu, 07 May 2026 16:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=BoCPB/pz5WLAgqByx+8hBN7GKNEFydMpDcPo2Prr5BA=; b=ZIYvFLDl8nCb4p/XzcZKzcSknq
	XTuoMV6O8PoFXPdpMhJ8oDIbTZLAHgdLIyZxkcoJyp1x02MQ83hg/Xa2SIvhGsaQrPVoVTV08GWG0
	n41JabI3Td7JNp6e24tapsHfts+7WMfjXZHkIH2wgsvpxlUnsM2lWNozuesCDXVvHBTju/88qYvep
	N0cdno9JzlsOoV8i68XYDA1K/ROrpsFnPOABDaSMXrD27D0J5KHoN9qHxcTkMq8ob3iOJMk3lvKhw
	7kOk4a6loRHWr0zS50wdkIVhKqw9WSKREZ1AhwBrZI1ieXpYwnw/K2BXKQAaI1KJS1QzZZ0q1ZneJ
	asnxEWFw==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1sw-000000046K1-36xC
	for linux-mtd@lists.infradead.org;
	Thu, 07 May 2026 16:47:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2FA77C5DC60;
	Thu,  7 May 2026 16:48:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 65D14605CF;
	Thu,  7 May 2026 16:47:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 05EF7108194E2;
	Thu,  7 May 2026 18:47:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778172456; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BoCPB/pz5WLAgqByx+8hBN7GKNEFydMpDcPo2Prr5BA=;
	b=hU+zfN2ufovGkh8JdGM8ch5PVIf2EKeX4cBtgQDWnF2mSB6Ns1nO3TCXeHRhoY4ZRnDoyY
	9+zoqZufq8Gb6hyyYULJzn6npkA7tEY60D3lwZBllzgk13ghB4KOlA0uu8tvqdhqPQah4e
	J/KMDe0giyNDEnnErgHHbZMixfOgRfTcpXEZunhIPKBYcCdHOMy3pS8gdO7yXLDmALdQpv
	Hw0XS3BzOPGiQGaceR0QPGledUGIJxuEGpY3gT5FPNUZsK+fC2vUcp7Gj4hcFK1kOdNe94
	zmzCArmDMgk6C0R0rSpYadtAs87RD7SnY3jT+7QkJJ8q7KNqlEAa5evxeA0ItA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 07 May 2026 18:47:04 +0200
Subject: [PATCH v5 23/28] mtd: spi-nor: winbond: Add W25H512NWxxAM CMP
 locking support
MIME-Version: 1.0
Message-Id: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-23-93453e1a9597@bootlin.com>
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
In-Reply-To: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_174739_330488_2FE3620D 
X-CRM114-Status: GOOD (  10.30  )
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
index eaa547d36aad..ef73c855cedb 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -360,7 +360,8 @@ static const struct flash_info winbond_nor_parts[] = {
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
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
