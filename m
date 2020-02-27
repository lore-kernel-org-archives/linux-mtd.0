Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0289C11D3D
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 16:26:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C45EF246B1
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 16:26:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h9MwHFVQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C45EF246B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YveL7mEnFJolAezKvCZPo20ceRua2a2LOPRSeDLhSRg=; b=h9MwHFVQnDB8VZ
	SiD+pXusbQdOERPi8n9N10rvNogjaBYl8hdA6GHRSbkOmkBqw5hbkw+oPcA9O3W6ENNW6eOXjlbya
	eYwrkkvJFSf+zsai6oqW3m0jrvIKdlbdoppAGpMkMbYURGEjpp8dK4c9qwuIRw28r083G+H96GO0U
	0D8QNBz+ainNEc4NPyVL2bds5Y+4OQajCL1lDiQxhxN3wSJLAdHwJlKjzwcwLai3O+gdS4qKQDUKQ
	p9jhk/bYyYjIFOA8XTY08peYUe10dyG1Aq7BeVwYDymf8kf+GWvteSMVR+nw7d/rXR2XnTud3KcXN
	XD6rO4WBC3G6bc4701ng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7LzB-0005Kg-Fi; Thu, 27 Feb 2020 16:26:05 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7LwL-00026G-7X
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 16:23:11 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 524F12963D9;
 Thu, 27 Feb 2020 16:23:07 +0000 (GMT)
Date: Thu, 27 Feb 2020 17:23:04 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v2 02/11] spi: set mode bits for "spi-rx-dtr" and
 "spi-tx-dtr"
Message-ID: <20200227172247.0e8ec459@collabora.com>
In-Reply-To: <20200226093703.19765-3-p.yadav@ti.com>
References: <20200226093703.19765-1-p.yadav@ti.com>
 <20200226093703.19765-3-p.yadav@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_082309_494395_E870F6E9 
X-CRM114-Status: GOOD (  20.41  )
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

On Wed, 26 Feb 2020 15:06:54 +0530
Pratyush Yadav <p.yadav@ti.com> wrote:

> These two DT properties express DTR receive and transmit capabilities of
> a SPI flash and controller. Introduce two new mode bits: SPI_RX_DTR and
> SPI_TX_DTR which correspond to the new DT properties. Set these bits
> when the two corresponding properties are present in the device tree.
> Also update the detection of unsupported mode bits to include the new
> bits.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/spi/spi.c       | 10 +++++++++-
>  include/linux/spi/spi.h |  2 ++
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 38b4c78df506..25c8ed9343f9 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -1927,6 +1927,13 @@ static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
>  		}
>  	}
>  
> +	/* Device DTR mode. */
> +	if (of_property_read_bool(nc, "spi-tx-dtr"))
> +		spi->mode |= SPI_TX_DTR;
> +
> +	if (of_property_read_bool(nc, "spi-rx-dtr"))
> +		spi->mode |= SPI_RX_DTR;
> +

If this DTR mode is only used in spi-mem, maybe we shouldn't add those
flags. SPI mem devices are usually smart enough to advertise what they
support, and the subsystem in charge of those devices (in this specific
case, spi-nor) will check what the controller supports
using spi_mem_supports_op(). The only case we might have to deal with
at some point is board level limitations (disabling DTR because the
routing prevents using this mode).

>  	if (spi_controller_is_slave(ctlr)) {
>  		if (!of_node_name_eq(nc, "slave")) {
>  			dev_err(&ctlr->dev, "%pOF is not called 'slave'\n",
> @@ -3252,7 +3259,8 @@ int spi_setup(struct spi_device *spi)
>  		bad_bits &= ~SPI_CS_HIGH;
>  	ugly_bits = bad_bits &
>  		    (SPI_TX_DUAL | SPI_TX_QUAD | SPI_TX_OCTAL |
> -		     SPI_RX_DUAL | SPI_RX_QUAD | SPI_RX_OCTAL);
> +		     SPI_RX_DUAL | SPI_RX_QUAD | SPI_RX_OCTAL |
> +		     SPI_TX_DTR  | SPI_RX_DTR);
>  	if (ugly_bits) {
>  		dev_warn(&spi->dev,
>  			 "setup: ignoring unsupported mode bits %x\n",
> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> index 6d16ba01ff5a..bf1108318389 100644
> --- a/include/linux/spi/spi.h
> +++ b/include/linux/spi/spi.h
> @@ -183,6 +183,8 @@ struct spi_device {
>  #define	SPI_TX_OCTAL	0x2000			/* transmit with 8 wires */
>  #define	SPI_RX_OCTAL	0x4000			/* receive with 8 wires */
>  #define	SPI_3WIRE_HIZ	0x8000			/* high impedance turnaround */
> +#define SPI_RX_DTR	0x10000			/* receive in DTR mode */
> +#define SPI_TX_DTR	0x20000			/* transmit in DTR mode */
>  	int			irq;
>  	void			*controller_state;
>  	void			*controller_data;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
