Return-Path: <SRS0=I4i7=4T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11F7C3F2D1
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 10:20:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70812208C3
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 10:20:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TYrI/Dwb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70812208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5XkIlQei9TPoWihCGOMGLsgHmnSMdjispEsTeB7N4g=; b=TYrI/Dwb5GHqLA
	8SRyyDoVtOu4f8vxnumrw5akQfK7G4r/4CJO003ydFT2eQR0tdQbJ+Z8wyLbHmq0OBXvnm/Tj3j2i
	+9KfIOdTRgmENEDhvCFK3+1YsFbaLSP8bYd212wSTpkywRwNyLuvx2tV0bVr+TFXYI8mLlLM+FkIS
	xJ+2vO2JlXieMJfn4rGLc56SgfT1EMCurBfwgdz7yd0IordAomg9jm+viNK7mwyEfF4YVhoNHqfsd
	LOvkwUqwAmHJkSR51PaANaq9uCFl7/1qWeuLoySr7PEsPvghFqZY3JP3Q0thZg0VVyozCYGfBTaX9
	fKTMBKmNYjSl+TGJ+BDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8iBL-0006UF-3s; Mon, 02 Mar 2020 10:20:15 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8iBI-0006HQ-6y
 for linux-mtd@lists.infradead.org; Mon, 02 Mar 2020 10:20:13 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F239229480B;
 Mon,  2 Mar 2020 10:20:07 +0000 (GMT)
Date: Mon, 2 Mar 2020 11:20:02 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v2 02/11] spi: set mode bits for "spi-rx-dtr" and
 "spi-tx-dtr"
Message-ID: <20200302112002.4e3aaffd@collabora.com>
In-Reply-To: <20200302094829.opazalwldrdn4s7y@ti.com>
References: <20200226093703.19765-1-p.yadav@ti.com>
 <20200226093703.19765-3-p.yadav@ti.com>
 <20200227172247.0e8ec459@collabora.com>
 <20200302094829.opazalwldrdn4s7y@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_022012_386291_50C30287 
X-CRM114-Status: GOOD (  20.70  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sekhar Nori <nsekhar@ti.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2 Mar 2020 15:18:31 +0530
Pratyush Yadav <p.yadav@ti.com> wrote:

> > > diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> > > index 38b4c78df506..25c8ed9343f9 100644
> > > --- a/drivers/spi/spi.c
> > > +++ b/drivers/spi/spi.c
> > > @@ -1927,6 +1927,13 @@ static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
> > >  		}
> > >  	}
> > >  
> > > +	/* Device DTR mode. */
> > > +	if (of_property_read_bool(nc, "spi-tx-dtr"))
> > > +		spi->mode |= SPI_TX_DTR;
> > > +
> > > +	if (of_property_read_bool(nc, "spi-rx-dtr"))
> > > +		spi->mode |= SPI_RX_DTR;
> > > +  
> > 
> > If this DTR mode is only used in spi-mem, maybe we shouldn't add those
> > flags. SPI mem devices are usually smart enough to advertise what they
> > support, and the subsystem in charge of those devices (in this specific
> > case, spi-nor) will check what the controller supports
> > using spi_mem_supports_op(). The only case we might have to deal with
> > at some point is board level limitations (disabling DTR because the
> > routing prevents using this mode).  
>  
> Yes, being able to handle board-level limitations is the main reason 
> behind this change. There should be a way to over-ride the use of DTR 
> for a given board. And IIUC, SPI allows doing the same for Rx and Tx 
> buswidth. So I don't see why we should deviate from that model.

My point is, maybe it should be expressed as a limitation, rather than
made mandatory for the non-limited case (default to supported, unless
stated otherwise). I think we already had this discussion with Rob and
Mark regarding the QUAD/DUAL flags, which made conversion from spi-nor
to spi-mem non-backward compatible for some controllers (some spi-nor
controller drivers were considering the absence of spi-{tx,rx}-width as
'use the max supported by the controller if the device supports it'
while the spi subsystem goes for the more conservative 'use single SPI
if spi-{tx,rx}-width is missing'). If we introduce a new property, maybe
it'd be a good thing to think twice before taking this decision. FWIW,
I'd vote for a 'spi-no-dtr' property to express board-level
limitations.

Orthogonal to this is the question of where we should put those flags,
and I'm still not convinced we need that at the spi level (at least not
yet).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
