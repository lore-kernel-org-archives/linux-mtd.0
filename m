Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1A0C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 07:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VVTv5eiKI4czgqChLcTA3EygiPOVGoET6V3i3V13DaM=; b=IC0DO9+MEjGp1N
	CzcqAr9Y4GLM1PmxwyrPeHX3bl4gQJCsKIidkCCqYxJgKX2XFWBDfoR2rFiM053Ve7I2F07oRS4m4
	tgU8P2WBO8fc3lZwUWCGK3S8o+fSjrFXaBqYBruhKgh1BIDlQ164sZnBM6tZlxYhmRU4JiahDb6Ho
	BdybmWH98S0hIKHJF7xgzbXo//M0CueTZExvExQRshCrhfN35ggUdG4fG6Y3+Ob6iqgMC1h6yLLff
	6ORSsXkE9HR26kMLqPoFfgJ5E/LgL+BqK1loIIHK3M5mNaoxPPFv68qOju+eakix2vOgesOLYTDqQ
	X/7FnmoRQFx8KFRxaKGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhROU-00C4sU-7C; Thu, 21 Apr 2022 07:38:26 +0000
Received: from relay12.mail.gandi.net ([2001:4b98:dc4:8::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRMw-00C3kG-EY
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 07:36:53 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 500BA20000E;
 Thu, 21 Apr 2022 07:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650526608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dy7WT8PZ3JA/FpxT8HD3ygF63z8smknJYPm56QQUEzc=;
 b=lHZkAiZF2RMLkLYdquaYLqQPNah/j9lUcQPDpWoGj/fkjajIg51lRDwjiCRvyPILo0ekB6
 5c/AcBsVUpgdEWhCtAPOvIR0deQQDJCit7m0mInl8wLxOmXuD+PicxSLjszJYeMkiPIXaF
 TdM/7VQD8lyDCTDWmpd4Di1otmwsX0F9CKbYoWbq2XDI0bZAbYGXIEG7wozzba5WbaqDHP
 nr1/I+xZAqBaHJHc+/OfmDWYRVnT1jSKB1Y0Jkbazccc5ctlu60thsjoGW/n4bZyR8dEN6
 3GrPEXZQmctcE1OmF9pZdA0pXHj6Gz+NdVya7tRheIX2BYBGiTRhuHfpyLdpGQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Felix Matouschek <felix@matouschek.org>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v3] mtd: spinand: Add support for XTX XT26G0xA
Date: Thu, 21 Apr 2022 09:36:47 +0200
Message-Id: <20220421073647.72413-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220418132803.664103-1-felix@matouschek.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f4c5c7f9d2e5ab005d57826b740b694b042a737c'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_003650_679236_7593E50E 
X-CRM114-Status: UNSURE (   6.81  )
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

On Mon, 2022-04-18 at 13:28:03 UTC, Felix Matouschek wrote:
> Add support for XTX Technology XT26G01AXXXXX, XTX26G02AXXXXX and
> XTX26G04AXXXXX SPI NAND.
> 
> These are 3V, 1G/2G/4Gbit serial SLC NAND flash devices with on-die ECC
> (8bit strength per 512bytes).
> 
> Tested on Teltonika RUTX10 flashed with OpenWrt.
> 
> Links:
>   - http://www.xtxtech.com/download/?AId=225
>   - https://datasheet.lcsc.com/szlcsc/2005251034_XTX-XT26G01AWSEGA_C558841.pdf
> Signed-off-by: Felix Matouschek <felix@matouschek.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
