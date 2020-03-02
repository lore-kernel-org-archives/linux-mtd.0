Return-Path: <SRS0=I4i7=4T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A980AC3F2D1
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 09:49:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AF39246B4
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 09:49:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YbjB3J6K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="E5RZ1AVS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AF39246B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AIb4Tn6z1ivG9C98pCL4ACiB+3ET29uv3qLcxOXA7v4=; b=YbjB3J6K0wE66Q
	m0Yp1bh0yMfC3owDPXQSRjID8u6RExrRScaaLd6k9gJkz2ADCaeinLK9oW5tYO6Gs8FTE08HvbvjL
	DJ3P1JjdjKn7ubxdT8/JIXU9NKIy9FxmMvvYlR7Z8jaI0fiuMjHuwvNP1Ev1N7r2GxoMcOM7CyfeY
	XCOlMROBrKihGPYOwe/y5PW7fg1JPID9a5B+/r0NU38rjHxsrmo14taAGYgdWi9wd2vMiLrWMTNJk
	G3upZTiEVcESFpM73Amxlwd0pfwR3LAHndrECC3L7xauU5ZNowKKhHvQEQor+BGbUbD+lKwryICls
	euIr5fmOBkdydEYVkn7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8hgy-0008VY-A1; Mon, 02 Mar 2020 09:48:52 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8hgt-0008QC-4f
 for linux-mtd@lists.infradead.org; Mon, 02 Mar 2020 09:48:51 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0229mXWF024857;
 Mon, 2 Mar 2020 03:48:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1583142513;
 bh=8mylNuvbMkUyD9rWCtIxmMJyS7kJVNxinoSR3QWr/xU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=E5RZ1AVSpIt/g0rMSH1E6MehYBpDwLns1mbervza/PIeplJ/3i903D3JChyiflGUX
 udlfjay7F8V2/RogkH2QR8gpgPPUSDVAyV8VCx635HWvo4m+57IZG6HL1O5VrIkKb8
 Vc0e5C7HscoOC/jll4acVVh5spjQslWWCkjSgA/I=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0229mXHC032787
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 2 Mar 2020 03:48:33 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 2 Mar
 2020 03:48:33 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 2 Mar 2020 03:48:32 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0229mWaZ019765;
 Mon, 2 Mar 2020 03:48:32 -0600
Date: Mon, 2 Mar 2020 15:18:31 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 02/11] spi: set mode bits for "spi-rx-dtr" and
 "spi-tx-dtr"
Message-ID: <20200302094829.opazalwldrdn4s7y@ti.com>
References: <20200226093703.19765-1-p.yadav@ti.com>
 <20200226093703.19765-3-p.yadav@ti.com>
 <20200227172247.0e8ec459@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227172247.0e8ec459@collabora.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_014847_280617_08469878 
X-CRM114-Status: GOOD (  22.89  )
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

Hi Boris,

On 27/02/20 05:23PM, Boris Brezillon wrote:
> On Wed, 26 Feb 2020 15:06:54 +0530
> Pratyush Yadav <p.yadav@ti.com> wrote:
> 
> > These two DT properties express DTR receive and transmit capabilities of
> > a SPI flash and controller. Introduce two new mode bits: SPI_RX_DTR and
> > SPI_TX_DTR which correspond to the new DT properties. Set these bits
> > when the two corresponding properties are present in the device tree.
> > Also update the detection of unsupported mode bits to include the new
> > bits.
> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > ---
> >  drivers/spi/spi.c       | 10 +++++++++-
> >  include/linux/spi/spi.h |  2 ++
> >  2 files changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> > index 38b4c78df506..25c8ed9343f9 100644
> > --- a/drivers/spi/spi.c
> > +++ b/drivers/spi/spi.c
> > @@ -1927,6 +1927,13 @@ static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
> >  		}
> >  	}
> >  
> > +	/* Device DTR mode. */
> > +	if (of_property_read_bool(nc, "spi-tx-dtr"))
> > +		spi->mode |= SPI_TX_DTR;
> > +
> > +	if (of_property_read_bool(nc, "spi-rx-dtr"))
> > +		spi->mode |= SPI_RX_DTR;
> > +
> 
> If this DTR mode is only used in spi-mem, maybe we shouldn't add those
> flags. SPI mem devices are usually smart enough to advertise what they
> support, and the subsystem in charge of those devices (in this specific
> case, spi-nor) will check what the controller supports
> using spi_mem_supports_op(). The only case we might have to deal with
> at some point is board level limitations (disabling DTR because the
> routing prevents using this mode).
 
Yes, being able to handle board-level limitations is the main reason 
behind this change. There should be a way to over-ride the use of DTR 
for a given board. And IIUC, SPI allows doing the same for Rx and Tx 
buswidth. So I don't see why we should deviate from that model.

> >  	if (spi_controller_is_slave(ctlr)) {
> >  		if (!of_node_name_eq(nc, "slave")) {
> >  			dev_err(&ctlr->dev, "%pOF is not called 'slave'\n",
> > @@ -3252,7 +3259,8 @@ int spi_setup(struct spi_device *spi)
> >  		bad_bits &= ~SPI_CS_HIGH;
> >  	ugly_bits = bad_bits &
> >  		    (SPI_TX_DUAL | SPI_TX_QUAD | SPI_TX_OCTAL |
> > -		     SPI_RX_DUAL | SPI_RX_QUAD | SPI_RX_OCTAL);
> > +		     SPI_RX_DUAL | SPI_RX_QUAD | SPI_RX_OCTAL |
> > +		     SPI_TX_DTR  | SPI_RX_DTR);
> >  	if (ugly_bits) {
> >  		dev_warn(&spi->dev,
> >  			 "setup: ignoring unsupported mode bits %x\n",
> > diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> > index 6d16ba01ff5a..bf1108318389 100644
> > --- a/include/linux/spi/spi.h
> > +++ b/include/linux/spi/spi.h
> > @@ -183,6 +183,8 @@ struct spi_device {
> >  #define	SPI_TX_OCTAL	0x2000			/* transmit with 8 wires */
> >  #define	SPI_RX_OCTAL	0x4000			/* receive with 8 wires */
> >  #define	SPI_3WIRE_HIZ	0x8000			/* high impedance turnaround */
> > +#define SPI_RX_DTR	0x10000			/* receive in DTR mode */
> > +#define SPI_TX_DTR	0x20000			/* transmit in DTR mode */
> >  	int			irq;
> >  	void			*controller_state;
> >  	void			*controller_data;
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
