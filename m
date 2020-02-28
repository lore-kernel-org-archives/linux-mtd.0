Return-Path: <SRS0=boQ/=4Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 532FAC3F2D0
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 09:42:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25DF8246A0
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 09:42:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gvKLobyD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="E6gd4vSR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25DF8246A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A48BpSdi0VoLbjETFJUOO0mgXNTyXgBFbTDd7rAuNXI=; b=gvKLobyD6Xd/Aq
	ADgbwmqKWdLkwRLkTeGGAjSdHhpb0vw8zJEGdeC+e8jDvOrp8/J3h0kZ5A8YkzF5tsL53b561fqsk
	+SCxtcWb3yMl4tetdhRxR5ZWFtTNSy5K4LyzbwwbHrq07aUID5nCGjXotL3SEM7Qt50+nUaTR+7h4
	wdMc6t6ly7TJse2fW+L+nRsWbIBW5ayipPYKBauMl8cpRxd9d/4Oe+Gvh7LEoo3YoNKhz8Vrr+/Y5
	nsFA7ghk7liiazeu/kPxt+3GhcQXD5vhI/254XAginOGaKuKxxMtKJ4c2BmJcSS1HQy9a2ANyzqxK
	jxdpGLSOQPkhJXXps04g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7c9c-0003GN-1G; Fri, 28 Feb 2020 09:41:56 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7c9X-0003Fo-U2
 for linux-mtd@lists.infradead.org; Fri, 28 Feb 2020 09:41:53 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01S9fhu5008401;
 Fri, 28 Feb 2020 03:41:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582882904;
 bh=8orCeNVUYKEqvaE5+0ekeRoeQdHfMuNLd4upouXDyDs=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=E6gd4vSRRVlBj9qVdEpyLi3/qGtGaM5U1ji7hbKWXeyBRJxF7TRk+NPWDt7xzNtpN
 mdcnrLe7cvshhXHmSSM/X6ziHs7kP6cHFs2mjsStRVkuPyrpAqVEGiNfkOGIhmLai1
 oiqx6XQAWLH520YXgglyxZ/YcUZApTtmRuCV4Noc=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01S9fhlG127045
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 28 Feb 2020 03:41:43 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 28
 Feb 2020 03:41:43 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 28 Feb 2020 03:41:43 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01S9fgZB102283;
 Fri, 28 Feb 2020 03:41:43 -0600
Date: Fri, 28 Feb 2020 15:11:42 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 04/11] spi: spi-mem: allow specifying a command's
 extension
Message-ID: <20200228094142.436fjee5fb7w6pd2@ti.com>
References: <20200226093703.19765-1-p.yadav@ti.com>
 <20200226093703.19765-5-p.yadav@ti.com>
 <20200227174406.66bf6f84@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227174406.66bf6f84@collabora.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_014152_053228_2F2D3413 
X-CRM114-Status: GOOD (  25.10  )
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

On 27/02/20 05:44PM, Boris Brezillon wrote:
> On Wed, 26 Feb 2020 15:06:56 +0530
> Pratyush Yadav <p.yadav@ti.com> wrote:
> 
> > In xSPI mode, flashes expect 2-byte opcodes. The second byte is called
> > the "command extension". There can be 3 types of extensions in xSPI:
> > repeat, invert, and hex. When the extension type is "repeat", the same
> > opcode is sent twice. When it is "invert", the second byte is the
> > inverse of the opcode. When it is "hex" an additional opcode byte based
> > is sent with the command whose value can be anything.
> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > ---
> >  drivers/spi/spi-mem.c       | 23 +++++++++++++++++++++++
> >  include/linux/spi/spi-mem.h | 24 ++++++++++++++++++++++++
> >  2 files changed, 47 insertions(+)
> > 
> > diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> > index cb13e0878b95..3838ddc9aeec 100644
> > --- a/drivers/spi/spi-mem.c
> > +++ b/drivers/spi/spi-mem.c
> > @@ -462,6 +462,29 @@ int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
> >  }
> >  EXPORT_SYMBOL_GPL(spi_mem_adjust_op_size);
> >  
> > +int spi_mem_get_cmd_ext(const struct spi_mem_op *op, u8 *ext)
> > +{
> > +	switch (op->cmd.ext_type) {
> > +	case SPI_MEM_EXT_INVERT:
> > +		*ext = ~op->cmd.opcode;
> > +		break;
> > +
> > +	case SPI_MEM_EXT_REPEAT:
> > +		*ext = op->cmd.opcode;
> > +		break;
> > +
> > +	case SPI_MEM_EXT_HEX:
> > +		*ext = op->cmd.ext;
> > +		break;
> > +
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(spi_mem_get_cmd_ext);
> > +
> >  static ssize_t spi_mem_no_dirmap_read(struct spi_mem_dirmap_desc *desc,
> >  				      u64 offs, size_t len, void *buf)
> >  {
> > diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> > index 4669082b4e3b..06ccab17e4d0 100644
> > --- a/include/linux/spi/spi-mem.h
> > +++ b/include/linux/spi/spi-mem.h
> > @@ -67,11 +67,31 @@ enum spi_mem_data_dir {
> >  	SPI_MEM_DATA_OUT,
> >  };
> >  
> > +/**
> > + * enum spi_mem_cmd_ext - describes the command opcode extension in DTR mode
> > + * @SPI_MEM_EXT_NONE: no extension. This is the default, and is used in Legacy
> > + *		      SPI mode
> > + * @SPI_MEM_EXT_REPEAT: the extension is same as the opcode
> > + * @SPI_MEM_EXT_INVERT: the extension is the bitwise inverse of the opcode
> > + * @SPI_MEM_EXT_HEX: the extension is any hex value. The command and opcode
> > + *		     combine to form a 16-bit opcode.
> > + */
> > +enum spi_mem_cmd_ext {
> > +	SPI_MEM_EXT_NONE = 0,
> > +	SPI_MEM_EXT_REPEAT,
> > +	SPI_MEM_EXT_INVERT,
> > +	SPI_MEM_EXT_HEX,
> > +};
> > +
> >  /**
> >   * struct spi_mem_op - describes a SPI memory operation
> >   * @cmd.buswidth: number of IO lines used to transmit the command
> >   * @cmd.opcode: operation opcode
> >   * @cmd.is_dtr: whether the command opcode should be sent in DTR mode or not
> > + * @cmd.ext_type: type of the command opcode extension in DTR mode
> > + * @cmd.ext: value of the command opcode extension in DTR mode. It is
> > + *	     only set when 'ext_type' is 'SPI_MEM_EXT_HEX'. In all other
> > + *	     cases, the extension can be directly derived from the opcode.
> >   * @addr.nbytes: number of address bytes to send. Can be zero if the operation
> >   *		 does not need to send an address
> >   * @addr.buswidth: number of IO lines used to transmit the address cycles
> > @@ -97,6 +117,8 @@ struct spi_mem_op {
> >  		u8 buswidth;
> >  		u8 opcode;
> >  		bool is_dtr;
> > +		enum spi_mem_cmd_ext ext_type;
> > +		u8 ext;
> 
> Could we instead make opcode an u16 (or u8[2]) and pass the number of
> bytes, as done for the other addr? Mode can be extracted from the
> opcode/nbytes values if really needed, and the caller would be
> responsible for filling those fields properly (which shouldn't be too
> hard)

Ok. Will do.
 
> >  	} cmd;
> >  
> >  	struct {
> > @@ -361,6 +383,8 @@ int spi_mem_driver_register_with_owner(struct spi_mem_driver *drv,
> >  
> >  void spi_mem_driver_unregister(struct spi_mem_driver *drv);
> >  
> > +int spi_mem_get_cmd_ext(const struct spi_mem_op *op, u8 *ext);
> > +
> >  #define spi_mem_driver_register(__drv)                                  \
> >  	spi_mem_driver_register_with_owner(__drv, THIS_MODULE)
> >  
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
