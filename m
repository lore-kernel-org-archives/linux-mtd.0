Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218A6C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Dec 2021 09:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BCj98CPTGuWLyJAeKnkCS1jRffVwBh2w0pRHdxsvr+g=; b=y1QSNYDmddyNEd
	V+Qt66DuiFemy4f/IQX4ljPxyHhnWaH7WtuKCtqZATVEh1I1Plvc4R/ud3dIoYSFGBnZPmK+911kb
	OMshhm6dy/dksI8kPiEwcP1LPsdrE3VM6em4VTqCG4Fb2omtjyBwabC4+1kw3SRHgqjsV+Fbus2HE
	xAMTAQAJcy/qBgT5ZzID5J6pkAyPRBQEw/lumbu/FUu6n0Ay0xrZMRmxPEtU0yjxtYxj72vTNtzKw
	eiAAzyR73Y1ruA9fwVSY059FMzmWuWxY4OZnvGj3Maym5Dl3HIh6xyfV20e5Go19hey4+wL7pFbpM
	51GNfQqYq4Vgp2V0x5GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1m7z-00GQdx-PU; Mon, 27 Dec 2021 09:17:11 +0000
Received: from mail1.systemli.org ([212.103.72.247])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1m7o-00GQcz-AW
 for linux-mtd@lists.infradead.org; Mon, 27 Dec 2021 09:17:01 +0000
From: vincent@systemli.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=systemli.org;
 s=default; t=1640596615;
 bh=thkgycR64j46D/n+/gL6RN5zA5XG9Ot6RF27vKZ8uEM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FvPk0wtQKM8wxsgMi5MN57UMWhAvOruqoiGYN1OXvhV8XExPnOyPVJ3ifSyeoYgH7
 bKlo77wCbD0exzyE4iF2hdyZecFq9fpDrjFbc1t57Fr4eah5l7hm1u/gMPzLXbhKUM
 Fvl4T2+MF8PWA8KTPaH5j11iwatPsv2BdQT1N9JoF65Kp+TF2upw0OG8kA6QkVEP/+
 KC6eNQG0dXIybMw+CvJt206l04rJNbXQLhUQRVt8skxgXXOwzY9i4Q8stTLZuOY6F+
 LEhvtxI31Z4H7ZUs3IGYapsjqVAxeDwiJu+gdESq2mn3uNZr1p99O4vnUxTHveFito
 KJ71IQ8/wqR5A==
To: linux-mtd@lists.infradead.org
Cc: Nick Hainke <vincent@systemli.org>,
	David Bauer <mail@david-bauer.net>
Subject: [PATCH 2/2] mtd: spi-nor: disable 16-bit-sr for macronix
Date: Mon, 27 Dec 2021 10:16:38 +0100
Message-Id: <20211227091638.177917-2-vincent@systemli.org>
In-Reply-To: <20211227091638.177917-1-vincent@systemli.org>
References: <20211227091638.177917-1-vincent@systemli.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_011700_540110_DFEB5A02 
X-CRM114-Status: UNSURE (   7.39  )
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

From: Nick Hainke <vincent@systemli.org>

Macronix flash chips seem to consist of only one status register.
These chips will not work with the "16-bit Write Status (01h) Command".
Disable SNOR_F_HAS_16BIT_SR for all Macronix chips.

Tested with MX25L6405D.

Fixes: 39d1e3340c73 ("mtd: spi-nor: Fix clearing of QE bit on
lock()/unlock()")

Signed-off-by: David Bauer <mail@david-bauer.net>
Signed-off-by: Nick Hainke <vincent@systemli.org>
---
 drivers/mtd/spi-nor/macronix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index f07b59a4120a..d530ab0b3b13 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -94,6 +94,7 @@ static void macronix_default_init(struct spi_nor *nor)
 {
 	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
 	nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode;
+	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
 }
 
 static const struct spi_nor_fixups macronix_fixups = {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
