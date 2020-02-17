Return-Path: <SRS0=B4Yk=4F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4BBC761A6
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 13:32:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DCF02070B
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 13:32:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NFECd0Ia"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DCF02070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8lzU8xVwF1M31lmoMbU1eM7D+WwXwLcRVjkB5A7XEEM=; b=NFECd0IaDKnvVh
	KQSqIQKoQcFQ7h9y3fVzsEVbzj0StteM4hB8FvZe/SgG/uhqVe5b8JK5cPR/Nin7/rvPtT77XyepK
	YxtoHJARsm447uUb5eNb3Dc0HDVafo+0BnQkF8prUxVYIr+8br4xASno4TGojWycQ5amoXFHjcYUQ
	Iv6NVpW5nQEALULkxiN1lYG8p4tiLJrR7uNbD1agyMrUFeIlnqMNVgxEzY1O8izrMxjM2XD6mZf7T
	It7kmUI8oE/87hHuC4LNZE58LGjc/gXdybNi/0ZVdecKQwozQMMFP/4rFKOk4csbuDevE7Y0ef1W3
	tSuopvB1Rm4/6QGOhSBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3gVC-0008F6-OC; Mon, 17 Feb 2020 13:31:58 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3gUz-00085L-V8; Mon, 17 Feb 2020 13:31:47 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9AE5528DFCF;
 Mon, 17 Feb 2020 13:31:43 +0000 (GMT)
Date: Mon, 17 Feb 2020 14:31:40 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Emil Lenngren <emil.lenngren@gmail.com>
Subject: Re: [PATCH v3 37/40] mtd: spinand: Propagate ECC information to the
 MTD structure
Message-ID: <20200217143140.6c5fa0ba@collabora.com>
In-Reply-To: <CAO1O6sdVqNFG+2O1AY1qN2Q4dUFhtAMk5Qr+Np3s_poSqFp+Og@mail.gmail.com>
References: <20190919193141.7865-1-miquel.raynal@bootlin.com>
 <20190919193141.7865-38-miquel.raynal@bootlin.com>
 <CAO1O6sdVqNFG+2O1AY1qN2Q4dUFhtAMk5Qr+Np3s_poSqFp+Og@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_053146_134182_919AB838 
X-CRM114-Status: GOOD (  26.22  )
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
Cc: Mason Yang <masonccyang@mxic.com.tw>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 17 Feb 2020 14:27:13 +0100
Emil Lenngren <emil.lenngren@gmail.com> wrote:

> Hi,
> 
> Den tors 19 sep. 2019 kl 21:56 skrev Miquel Raynal <miquel.raynal@bootlin.com>:
> >
> > This is done by default in the raw NAND core (nand_base.c) but was
> > missing in the SPI-NAND core. Without these two lines the ecc_strength
> > and ecc_step_size values are not exported to the user through sysfs.
> >
> > This fix depends on recent changes and should not be backported as-is.
> >
> > Fixes: 7529df465248 ("mtd: nand: Add core infrastructure to support SPI NANDs")
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  drivers/mtd/nand/spi/core.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> > index a521eeb0d351..36b99f68da81 100644
> > --- a/drivers/mtd/nand/spi/core.c
> > +++ b/drivers/mtd/nand/spi/core.c
> > @@ -1135,6 +1135,10 @@ static int spinand_init(struct spinand_device *spinand)
> >
> >         mtd->oobavail = ret;
> >
> > +       /* Propagate ECC information to mtd_info */
> > +       mtd->ecc_strength = nand->ecc.ctx.conf.strength;
> > +       mtd->ecc_step_size = nand->ecc.ctx.conf.step_size;
> > +
> >         return 0;
> >
> >  err_cleanup_ecc_engine:
> > --  
> 
> If I follow the code flow correctly, it seems this is more important
> than just exposing the value to the user through sysfs. The
> mtd_read_oob function uses the ecc_strength and bitflip_threshold
> values to decide if it should return -EUCLEAN or 0 for a read with
> correctable bitflips:
> 
> if (mtd->ecc_strength == 0)
>         return 0; /* device lacks ecc */
> return ret_code >= mtd->bitflip_threshold ? -EUCLEAN : 0;
> 
> The -EUCLEAN error code is then used in UBI for the wear level logic,
> so it would be nice if this could be fixed.
> Now both ecc_strength and bitflip_threshold is 0 for me with my SPI
> NAND flash, as exposed through sysfs, so I assume the wear level logic
> doesn't work right now.

Indeed. We should probably send this fix separately and add a Cc:stable
tag.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
