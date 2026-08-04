Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BB1C5518F
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2026 11:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aEDZ7ngZgh7hEADs4yIAv5Y7bNtfDvTr/fmkl1KXkCM=; b=HJ/vpQ80oxHp3s
	rg6Jabti5gVGW/W1ABtIR++Ep48eD2/B9Ft3A/ztBQDaunixGR4no4h6soUs4vuem0Jmk83y8u76c
	9Bnbq2QNEDhBCCZ73IScajPj5H3dibXBaFVaFNutUzCmHEDI5QKfxoJaazIdhHFPjD+lTXlsZ+hYS
	H238WHoWCurOIwLW91FpBom2c65cljda1v7sIpp0L/GIfTk15ohuv3k0ArUtaeha+Qqlda1kgQ/W0
	WXTQ9mon6YCXKlJqmSsYxGF6d3Ixo0C0qeoPFZ39LapHATmSndL1eCKNKokEM9P5K2fsVZ0qyBl1q
	NB632Idp/PaPgojbiM4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCsi-00000001cMU-0GLs;
	Tue, 04 Aug 2026 11:00:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCsg-00000001cI1-0wDk
	for linux-mtd@bombadil.infradead.org;
	Tue, 04 Aug 2026 11:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IECokdCzBsVUak0E3TMA6f5ekz6V8zS7sl+yPDFgG5g=; b=PAoEM77YQvgxKDBrhRZE3foNEw
	9Y0X7/G3In+aNe0GVmbTnKzEdpw56Vvyy1FZqArvBr6V7OwqnnvW9h2l5UiLyTrQXNm2R6sgXM0dM
	odckfejkufaCZrzSUyTIl5IJPnnFLs6NDFjcTioQSrSvLyJUzOmDCkgs/K1q6E6yC2MxKyjDEOj2d
	FIlUeZSNDRqKzOdNmBvHXBYlWG2djidIQ15VLPgh52sfxIlaF9yJqtCRd8b6IZM/qrkiNikwg1ovg
	WWsqe6/DTk3A+2npq/uEeATjTFPpYKARWLCDW5aIo078MNwmm0kMc5+ugT9gTIFFPcjlQdQqkiuBJ
	qGJJ6Hrw==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrCsc-00000009oZ1-0Qhl
	for linux-mtd@lists.infradead.org;
	Tue, 04 Aug 2026 11:00:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 674AF1A1409;
	Tue,  4 Aug 2026 11:00:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3719A6029E;
	Tue,  4 Aug 2026 11:00:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2086111C32B38;
	Tue,  4 Aug 2026 13:00:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785841216; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IECokdCzBsVUak0E3TMA6f5ekz6V8zS7sl+yPDFgG5g=;
	b=d4Un2Qf5CRHw3YXourY86zLTPO5FK0hhYWyj3vfS+CDDxpVOVTddsnenRvtW2gjcQR4f9n
	iq9fg5ZrP6XhHOFODk4xeX1+WqivEFsXPdPJ0yMGy45TGfMjQndWmvAdUSx0cesKtgERgf
	tdgyXIW0eeB0XoTWg6X7YGrtFwO9C2I99rW/6Rc+UtPbLBgigDFh36CH7kCweYn6OnSoCI
	t5uzAFpP7z93h0fTRVBL7+tbzR/6/jd7dCxazJk/KE7CoaISxd+e0lkpuKMonY2h9ztqEV
	l67BEfzfEPtcuP600eRZ+5hXSxjP9GpjmO6iv6N9kugVFnzbWZhJjdncqxT8Ow==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 04 Aug 2026 12:59:16 +0200
Subject: [PATCH v3 18/27] mtd: spi-nor: winbond: W25Q128JV-Q/N: Fill
 locking information
MIME-Version: 1.0
Message-Id: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-18-542ce107bc92@bootlin.com>
References: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-0-542ce107bc92@bootlin.com>
In-Reply-To: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-0-542ce107bc92@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_120019_167238_5B87B539 
X-CRM114-Status: GOOD (  12.44  )
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
