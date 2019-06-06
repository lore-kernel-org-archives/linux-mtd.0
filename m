Return-Path: <SRS0=ASOq=UF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CC1C04AB5
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2019 08:40:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 136AB207E0
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2019 08:40:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UOIdOiY6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 136AB207E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sqDRyUtCS+p2qnGHldOPJyp9EGGVK6fWa7Kkv8NHgqA=; b=UOIdOiY6QB1zBh
	CuSDwrxLZt1L12NZp65dLiQr5HYAaGEoSNNaWzodVNJlJZyNGp1asJbftlCBiJrS9gm70xONy3lxJ
	fNrnGIj6aT6Uyjt1rNZ58xqoCN9FDc4hap/kRXo8j4ER0evbEws/Xvxr6JYmuaF0vq0Sc6mCKjkJW
	OoJpqdnIwlmYA4UejiUNwpKGzlm+dYyyGiKs4TPjVnRwSbCGbDxcEFVfrFzFATI2pVlTaDADoz4tR
	rj02TCMPtOt5y1aT6s1K9jhOuBls1UdyeCsQBS/b3/fqo2Nm6g8OmbLSL8KONBZXN80eYQl/7hGtb
	rG0+ckIQYl+B4e75YUjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYnwR-0001LL-2b; Thu, 06 Jun 2019 08:40:11 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYnwE-0000TH-D7; Thu, 06 Jun 2019 08:39:59 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 47AFD2603D4;
 Thu,  6 Jun 2019 09:39:54 +0100 (BST)
Date: Thu, 6 Jun 2019 10:39:51 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v2 01/15] mtd: nand: Add max_bad_eraseblocks_per_lun
 info to memorg
Message-ID: <20190606103951.1d774b9a@collabora.com>
In-Reply-To: <5e5d473b-2f08-4230-0920-247c2c463c55@kontron.de>
References: <20190304201522.11323-1-miquel.raynal@bootlin.com>
 <20190304201522.11323-2-miquel.raynal@bootlin.com>
 <CAO1O6se5=FDf2YTEEzmFJ4K6HQp_2ayU=WubxGAQJdMA4V4m-Q@mail.gmail.com>
 <5e5d473b-2f08-4230-0920-247c2c463c55@kontron.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_013958_577483_4FADAF73 
X-CRM114-Status: GOOD (  16.93  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mason Yang <masonccyang@mxic.com.tw>, Vignesh R <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, Emil Lenngren <emil.lenngren@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 6 Jun 2019 08:27:11 +0000
Schrempf Frieder <frieder.schrempf@kontron.de> wrote:

> Hi Emil,
> 
> On 04.06.19 10:01, Emil Lenngren wrote:
> > Hi Miquel,
> >   
> >>   static const struct spinand_info macronix_spinand_table[] = {
> >>          SPINAND_INFO("MX35LF1GE4AB", 0x12,
> >> -                    NAND_MEMORG(1, 2048, 64, 64, 1024, 1, 1, 1),
> >> +                    NAND_MEMORG(1, 2048, 64, 64, 1024, 40, 1, 1, 1),
> >>                       NAND_ECCREQ(4, 512),
> >>                       SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> >>                                                &write_cache_variants,
> >> @@ -103,7 +103,7 @@ static const struct spinand_info macronix_spinand_table[] = {
> >>                       SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
> >>                                       mx35lf1ge4ab_ecc_get_status)),
> >>          SPINAND_INFO("MX35LF2GE4AB", 0x22,
> >> -                    NAND_MEMORG(1, 2048, 64, 64, 2048, 2, 1, 1),
> >> +                    NAND_MEMORG(1, 2048, 64, 64, 2048, 20, 2, 1, 1),
> >>                       NAND_ECCREQ(4, 512),  
> > 
> > Maybe a bit late to the discussion, but shouldn't 20 and 40 be swapped
> > here, i.e. isn't it the larger flash that has more max bad blocks than
> > the smaller one?  
> 
> I think Miquel is out of office for some days, so I just checked and you 
> are right, the maximum number of bad blocks should be swapped.
> 
> Actually there is also a wrong value in the GigaDevice driver: For the 
> GD5F4GQ4xA it should be 80 instead of 40.

Haven't checked the datasheet, but keep in mind that this is the max
number of eraseblock per LUN.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
