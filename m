Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01629C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Feb 2022 18:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6rpExd5wNuVzJUFtZYZUdtflJPQRDzC8E2EvW389nPk=; b=FNx/psw4ik3PK0
	anIppWzIpkacEjHjM5wyVXfN6hmWlQHY8empp3VItJ0Jel2fMpRHYfGQE9BUXzkTNrsfju3jgs8bs
	zf8aeqV//9Vov8MEEEHQ6lkWZFdT4Ov79DYbMU+6bH32u7sh2D0CzHmCemXxV1zHkQuIPavFH9/W2
	mxiEYe1Xf9pS2liIjdgGlovIljF/T1aiRrFmC7NppZAnCrPt6iU5hHpKOR6etd+OjK2pEzOCGhSny
	c1Gi5oOQLDt9xH0/He3mn9lkEC4sJFGZbu+8c8jst7B+f5RhEd5zxOSVUWCgSphevxPd/7BCazk4e
	xFR97EOAUqvu3nZWcFOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK2hB-0046yI-6n; Tue, 15 Feb 2022 18:37:01 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK2h8-0046x0-0O
 for linux-mtd@lists.infradead.org; Tue, 15 Feb 2022 18:36:59 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21FIasTA043555;
 Tue, 15 Feb 2022 12:36:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1644950214;
 bh=ggLkBTTh/QZcYMoHa0drQ3r4e8GOr8CoOpONQ+shgLw=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=gZTGlcnLguKrMjtHXc/nY+/OsusMQMjZUxdmjtyXen9NU9HZFDF0y3E5Hi8dTpljE
 EObwKtPmQZlVJro0BY1Wc3eE+/X/fFrdA+/13fy7NVQ8QKD4yRWF+VNk53dHNzycsa
 8r9Kag1OZeljtXLM9wRgCKjn6164Z7L0mmIYvVyA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21FIasXX095019
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Feb 2022 12:36:54 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 15
 Feb 2022 12:36:54 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 15 Feb 2022 12:36:54 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21FIarsU026597;
 Tue, 15 Feb 2022 12:36:54 -0600
Date: Wed, 16 Feb 2022 00:06:53 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>
Subject: Re: [PATCH v1 03/14] mtd: spi-nor: allow a flash to define its own
 ready() function
Message-ID: <20220215183653.6dt3hvvdajp2gld3@ti.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-4-michael@walle.cc>
 <399c8ea5-e534-9da4-43c0-199e1b88bfae@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <399c8ea5-e534-9da4-43c0-199e1b88bfae@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_103658_176346_01BAD830 
X-CRM114-Status: GOOD (  22.35  )
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

On 10/02/22 03:05AM, Tudor.Ambarus@microchip.com wrote:
> On 2/2/22 16:58, Michael Walle wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Xilinx and Micron flashes have their own implementation of the
> > spi_nor_ready() function. At the moment, the core will figure out
> > which one to call according to some flags. Lay the foundation to
> > make it possible that a flash can register its own ready()
> > function.
> > 
> > Signed-off-by: Michael Walle <michael@walle.cc>
> > ---
> >  drivers/mtd/spi-nor/core.c | 4 ++++
> >  drivers/mtd/spi-nor/core.h | 4 ++++
> >  2 files changed, 8 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index c8cc906cf771..c181f2680df2 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -794,6 +794,10 @@ static int spi_nor_ready(struct spi_nor *nor)
> >  {
> >         int sr, fsr;
> > 
> > +       /* flashes might override our standard routine */
> 
> let's start comments with capital letter and put a dot at the end of
> the sentence. s/our/the

+1

> 
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

With that fixed,

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

> > +       if (nor->params->ready)
> > +               return nor->params->ready(nor);
> > +
> >         if (nor->flags & SNOR_F_READY_XSR_RDY)
> >                 sr = spi_nor_xsr_ready(nor);
> >         else
> > diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> > index 10f478547dc2..446218b0e017 100644
> > --- a/drivers/mtd/spi-nor/core.h
> > +++ b/drivers/mtd/spi-nor/core.h
> > @@ -261,6 +261,9 @@ struct spi_nor_otp {
> >   *                     SPI NOR flashes that have peculiarities to the SPI NOR
> >   *                     standard e.g. different opcodes, specific address
> >   *                     calculation, page size, etc.
> > + * @ready:             (optional) flashes might use a different mechanism
> > + *                     than reading the status register to indicate they
> > + *                     are ready for a new command
> >   * @locking_ops:       SPI NOR locking methods.
> >   */
> >  struct spi_nor_flash_parameter {
> > @@ -282,6 +285,7 @@ struct spi_nor_flash_parameter {
> >         int (*set_4byte_addr_mode)(struct spi_nor *nor, bool enable);
> >         u32 (*convert_addr)(struct spi_nor *nor, u32 addr);
> >         int (*setup)(struct spi_nor *nor, const struct spi_nor_hwcaps *hwcaps);
> > +       int (*ready)(struct spi_nor *nor);
> > 
> >         const struct spi_nor_locking_ops *locking_ops;
> >  };
> > --
> > 2.30.2
> > 
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
