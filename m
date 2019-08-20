Return-Path: <SRS0=j2Kw=WQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2378C3A589
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 08:28:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74A9D23A45
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 08:28:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HUbox31W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74A9D23A45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cmBYntrnGWk+HUv5P0BW3AXAvVylBpx8RGoH04skFjg=; b=HUbox31WwMqi1U
	WZWzPl/cZbsMz0iM5lG22Kc5Ec8nnb5xyKkJgfNroyyWzQelEXTi3x+8jJxw8n6bs3AiFNlN6WNKa
	KvDou46s84KwKls0lb0ISw4CjpZzpIC6skGxjjRFK3TIY7BGIcOctECDUOnJ9pM6yR/1ru3+txpNh
	3d795LrZgUyVveDuFebPZyvMPqTQvj6t0su00hj6IVgvb5F0bWrr+hu8uyj7JsJhYPpU54565U8+P
	mPpXrRhsX6SJilCz2GA3KG2WQSvd6ACtEujmOFkTnBRUWtFrOoyxSZ8jLFMvqRau4O/q2ME0p/ehJ
	mVK85ckY4nNBVEGVK3VQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzzVV-0005zv-Mj; Tue, 20 Aug 2019 08:28:45 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzzVT-0005yt-5E
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2019 08:28:44 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1hzzVP-0002Il-Qf; Tue, 20 Aug 2019 10:28:39 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1hzzVO-0006AN-0f; Tue, 20 Aug 2019 10:28:38 +0200
Date: Tue, 20 Aug 2019 10:28:37 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: spinand: micron: add support for MT29F1G01AAADD
Message-ID: <20190820082837.rvk2itycnka4vo6a@pengutronix.de>
References: <20190814082232.2119-1-m.felsch@pengutronix.de>
 <20190819101718.39b3a5ca@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190819101718.39b3a5ca@xps13>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_012843_210189_EE1D5A09 
X-CRM114-Status: GOOD (  11.98  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: bbrezillon@kernel.org, richard@nod.at,
 Marco Felsch <m.felsch@pengutronix.de>, frieder.schrempf@kontron.de,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Peter Pan <peterpandong@micron.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Miqu=E8l,

On Mon, Aug 19, 2019 at 10:17:18AM +0200, Miquel Raynal wrote:
> Marco Felsch <m.felsch@pengutronix.de> wrote on Wed, 14 Aug 2019
> 10:22:32 +0200:
> > +static int mt29f1g01aaadd_ooblayout_ecc(struct mtd_info *mtd, int sect=
ion,
> > +					struct mtd_oob_region *region)
> > +{
> > +	if (section > 3)
> > +		return -ERANGE;
> > +
> > +	region->offset =3D (section * 0x10) + 8;
> =

> Any reason to use hex here?         ^
> =

> If not I would prefer decimal numbers.

IMHO it is quite common to use hexadecimal also for register offsets,
not only for register values.

I checked a few drivers (drivers/mtd/nand/raw/mxc_nand.c,
drivers/clk/meson/g12a.c, drivers/gpio/gpio-sch.c) and they all use hex
also for the offsets, so it seems to be at least usual. Also as offsets
for repeating registers are usually powers of two, hexadecimal constants
are more suitable IMHO.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
