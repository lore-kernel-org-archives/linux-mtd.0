Return-Path: <SRS0=bui3=O2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47349C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Oct 2021 12:33:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2EA261139
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Oct 2021 12:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2EA261139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pVAB7dA2NThE6sgGLzjwvnX6WmSglG4cgM4MXNJn8FI=; b=alt08YrB9ShB1z
	tGAX3FSUWCEea+qZamyBTxiO32+MONg4jYvocSCxTUnfgiY8kcY6MoLthGkGTHn6XmnbyZrLjD7Z1
	pNlcI6xfowhzF0OoGPDymdSAf3nPqRlVMw4q5AJVl5GbUVyMrvukExHZE5Ujn+osna7EHN66QGwua
	ndVORoynlsQaOhGPmeJnMA0/AXK3sOINQtr2gXFq7cDc/0tq3AFdSqusJ1DQBjY0ZZuVyr48Gt+9o
	z7L+LCwQrMf1tX7BVZ3hlFs0ljagmuXmd/yj+oMiEKjKHFhqFIadf+oddP0IU8MnFkFHxhqhY9Bqi
	7J60BfiY44n67dJn4AHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mY65w-00EDeN-58; Wed, 06 Oct 2021 12:32:24 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mY65q-00EDco-Nt
 for linux-mtd@lists.infradead.org; Wed, 06 Oct 2021 12:32:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633523538; x=1665059538;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l3bL8c8hCiOc7cnMVCVwNyzwWPa4uWGkw14PSqu6laY=;
 b=Dfe5Gvuomb6/82qQ5LcNrYhSm/ttYgafkBSM+icyZ3bViO2Jnjw5AEed
 7P7BmA337hhAlZm7twJl5QE6p1DGvl4B5m0YFqSpdSAv/Pi3dGKEUEqud
 VZ6LLWQ1E5MYSF2r6TE5l6E8C4qaHaYzdA4KYoOcm7tpNk/VuFg3NiL+k
 TLB5v98w0PbZQ6GAQKbRQ2DY9fSkYarIttQhTOdiD03u8eGyu1R6V611P
 knjy8ZLoEg7xWcYymHNJhhUsyzEyIp/Cu+/thXgZ7ho2opn9twNHKvjiJ
 MJ714P5nbX++1gvC76syBLY29z/AQAoCLs4oRqpA2s1RXhI/yXIJQ53BI g==;
X-IronPort-AV: E=Sophos;i="5.85,350,1624312800"; d="scan'208";a="19896386"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 06 Oct 2021 14:32:13 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 06 Oct 2021 14:32:13 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 06 Oct 2021 14:32:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633523533; x=1665059533;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l3bL8c8hCiOc7cnMVCVwNyzwWPa4uWGkw14PSqu6laY=;
 b=dIu9+vIWAM8Ygrh8tgApeOl+F/DD9WUrHLQ2eounypWQkWG+2hUh0L0E
 MbtHuvVCqtHyQT3V6NV00uKeMuNA1EQ6tbM5ncxS+vbkgOWGglzZJKpMy
 kuJTKHkJiPseV43gEFpNIWuZ63k0yxTgm15FWufJBqSHbNwJ4ht1vAZ+o
 kbzkJd+kSGm6p1wKkw/AB964b1PD0fVAQbxPgiciFBOVyFG8Pbwn2BdOW
 XioEJ/NJkwzOkC5BmweW+pZDJY7Z7H6hQNO9Fru2CwxVEhlgbH+SUmIaB
 ++KofxhS1FJHolF6drzLsYEmibGVeNz9SANeHnjBl+J07vufXT2FUjY6L w==;
X-IronPort-AV: E=Sophos;i="5.85,350,1624312800"; d="scan'208";a="19896385"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 06 Oct 2021 14:32:13 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.121.48.12])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id A7E61280065;
 Wed,  6 Oct 2021 14:32:13 +0200 (CEST)
Message-ID: <3258026683c916a3a42e98ba76628228cddacb23.camel@ew.tq-group.com>
Subject: Re: (EXT) Re: [PATCH 1/2] mtd: spi-nor: micron-st: sync flags of
 mt25ql02g and mt25qu02g with other mt25q
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>,  Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 06 Oct 2021 14:32:11 +0200
In-Reply-To: <f3dbab898e9f1946129e5733095bdf3c@walle.cc>
References: <c7b6c666aef9a8a2195acabe9954a417f04b6582.1627039534.git.matthias.schiffer@ew.tq-group.com>
 <f3dbab898e9f1946129e5733095bdf3c@walle.cc>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_053219_173872_F6ADB330 
X-CRM114-Status: GOOD (  28.65  )
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

On Tue, 2021-07-27 at 09:09 +0200, Michael Walle wrote:
> Am 2021-07-23 13:27, schrieb Matthias Schiffer:
> > All mt25q variants have the same features.
> > 
> > Unlike the smaller variants, no n25q with 2G exists, so we don't need 
> > to
> > match on the extended ID to distinguish n25q and mt25q series for these
> > models.
> 
> But why shouldn't we? What if there will be another flash with
> the same first three id bytes?

How do you suggest we proceed here? At the moment there are entries
matching on 0x20b[ab]22 (ignoring the extended ID) with the name
mt25q[lu]02g.

Should I change these entries to match on on the extended ID
0x20b[ab]22 / 0x104400 instead when I add the bits for the features
specific to the variant, removing support for other 0x20b[ab]22
variants that may or may not actually exist? Keeping both entries (with
and without extended ID match) would preserve compatiblity with such
variants, but this approach seems problematic to me as well, as I can't
even give a name to the more generic entries (and there is no natural
extension of the n25q naming scheme to a 2G variant).


> 
> > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > ---
> >  drivers/mtd/spi-nor/micron-st.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/micron-st.c 
> > b/drivers/mtd/spi-nor/micron-st.c
> > index c224e59820a1..d5baa8762c8d 100644
> > --- a/drivers/mtd/spi-nor/micron-st.c
> > +++ b/drivers/mtd/spi-nor/micron-st.c
> > @@ -181,11 +181,11 @@ static const struct flash_info st_parts[] = {
> >  			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
> >  			      NO_CHIP_ERASE) },
> >  	{ "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096,
> > -			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
> > -			      NO_CHIP_ERASE) },
> 
> This bothers me. I'm not sure how this will work. I see that
> chip erase is command 0xc7, but both the new and the old flash
> just supports 0xc3 (DIE ERASE). Did you test these changes?

I finally got my hands on hardware with this flash again (well, a
mt25qu01g, I don't think we have the 2G variants anywhere) and I can
confirm that the chip erase does not work with my patch. I will send an
updated version that keeps NO_CHIP_ERASE.


> 
> > +			      SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
> > +			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> >  	{ "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096,
> >  			      SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
> > -			      SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
> > +			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> > 
> >  	{ "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
> >  	{ "m25p10",  INFO(0x202011,  0,  32 * 1024,   4, 0) },
> 
> -michael


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
