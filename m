Return-Path: <SRS0=a/jC=IW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9110C433C1
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Mar 2021 08:09:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6793B619AE
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Mar 2021 08:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6793B619AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/8Fn7ei/IsUrqG4eAIkW65bmQawcwCwJ+SWOSC6w2wg=; b=kdcQo02+6N3IdVXZAXTgtdRcB
	w4/1tRc5tOh76X1xiO7dDMo4N5ygDhf1q38992lSFufURxwPEwavZOY9TRmpAeVEkllZqfxYe7szV
	12tVpaAV19+Eo0YY+Gy9FflXvzLqueHCHpP4lZvhUOkvWEQwi/gl7NW+IHvv0qI+GsK1F5f6VCjxe
	sUBTd4E4U5mqvC+tlpWP/NXh2GFxPUD+NE8cjdjckWc8IS+pd8btU8mhmklxw/P/xUDofvt1p90fD
	NNuSTGWw4hVz56QCR+MAJbXIWlQqp96z9LrFCeZnf2vXzwpaeD+73zbFrDH3R+NTTwN9w1GmxVy5a
	wQ9GDFl8w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOyYs-00GXly-QU; Wed, 24 Mar 2021 08:08:18 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOyYm-00GXks-DO; Wed, 24 Mar 2021 08:08:15 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12O887IQ106668;
 Wed, 24 Mar 2021 03:08:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1616573287;
 bh=2UJRiiRkSq8MKpjgyNb7yucZwpuFL+5TyST3xBlJn0g=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=U76S+qBVYdBCwWYliaYZKRPUOZreldpKVrDsFMdkOtRVUSLmaiJ4FWPmoBOduuTCm
 tiMcgu/DEQ+mhYRiBKYhdRstm8ACurCE6bDINbjbQEr+Y6+72NEop5eQjpoonGxhVa
 UpqiNQCPUfxs9Ao3knn80kYRb+CWHIRZhFQn74FU=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12O8870l021049
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 24 Mar 2021 03:08:07 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 24
 Mar 2021 03:08:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 24 Mar 2021 03:08:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12O886mM057538;
 Wed, 24 Mar 2021 03:08:07 -0500
Date: Wed, 24 Mar 2021 13:38:06 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [RFC PATCH 1/6] spi: spi-mem: Tell controller when device is
 ready for calibration
Message-ID: <20210324080804.x7oemmpt2khi72mp@ti.com>
References: <20210311191216.7363-1-p.yadav@ti.com>
 <20210311191216.7363-2-p.yadav@ti.com>
 <934c8c6f7bb71729bfdaefd39c63a262@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <934c8c6f7bb71729bfdaefd39c63a262@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_080812_837986_F51F98F2 
X-CRM114-Status: GOOD (  32.54  )
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

On 24/03/21 12:07AM, Michael Walle wrote:
> Hi Pratyush,
> 
> Am 2021-03-11 20:12, schrieb Pratyush Yadav:
> > Some controllers like the Cadence OSPI controller need to perform a
> > calibration sequence to operate at high clock speeds. This calibration
> > should happen after the flash is fully initialized otherwise the
> > calibration might happen in a different SPI mode from the one the flash
> > is finally set to. Add a hook that can be used to tell the controller
> > when the flash is ready for calibration. Whether calibration is needed
> > depends on the controller.
> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > ---
> >  drivers/spi/spi-mem.c       | 12 ++++++++++++
> >  include/linux/spi/spi-mem.h |  8 ++++++++
> >  2 files changed, 20 insertions(+)
> > 
> > diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> > index dc713b0c3c4d..e2f05ad3f4dc 100644
> > --- a/drivers/spi/spi-mem.c
> > +++ b/drivers/spi/spi-mem.c
> > @@ -464,6 +464,18 @@ int spi_mem_adjust_op_size(struct spi_mem *mem,
> > struct spi_mem_op *op)
> >  }
> >  EXPORT_SYMBOL_GPL(spi_mem_adjust_op_size);
> > 
> > +int spi_mem_do_calibration(struct spi_mem *mem, struct spi_mem_op *op)
> > +{
> > +	struct spi_controller *ctlr = mem->spi->controller;
> > +
> > +	if (!ctlr->mem_ops || !ctlr->mem_ops->do_calibration)
> > +		return -EOPNOTSUPP;
> > +
> > +	ctlr->mem_ops->do_calibration(mem, op);
> 
> Can't a calibration fail?

It can. If it does, the controller falls back to lower speed transfers. 
There is not much the upper layer can do about this. That's why it is 
not informed whether it succeeded or not.

> 
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(spi_mem_do_calibration);
> > +
> >  static ssize_t spi_mem_no_dirmap_read(struct spi_mem_dirmap_desc *desc,
> >  				      u64 offs, size_t len, void *buf)
> >  {
> > diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> > index 2b65c9edc34e..97a2d280f2d0 100644
> > --- a/include/linux/spi/spi-mem.h
> > +++ b/include/linux/spi/spi-mem.h
> > @@ -250,6 +250,12 @@ static inline void *spi_mem_get_drvdata(struct
> > spi_mem *mem)
> >   *		  the currently mapped area), and the caller of
> >   *		  spi_mem_dirmap_write() is responsible for calling it again in
> >   *		  this case.
> > + * @do_calibration: perform calibration needed for high SPI clock speed
> > + *		    operation. Should be called after the SPI memory device has
> > + *		    been completely initialized. The op passed should contain
> > + *		    a template for the read operation used for the device so
> > + *		    the controller can decide what type of calibration is
> > + *		    required for this type of read.
> >   *
> >   * This interface should be implemented by SPI controllers providing an
> >   * high-level interface to execute SPI memory operation, which is
> > usually the
> > @@ -274,6 +280,7 @@ struct spi_controller_mem_ops {
> >  			       u64 offs, size_t len, void *buf);
> >  	ssize_t (*dirmap_write)(struct spi_mem_dirmap_desc *desc,
> >  				u64 offs, size_t len, const void *buf);
> > +	void (*do_calibration)(struct spi_mem *mem, struct spi_mem_op *op);
> >  };
> > 
> >  /**
> > @@ -346,6 +353,7 @@ bool spi_mem_dtr_supports_op(struct spi_mem *mem,
> >  #endif /* CONFIG_SPI_MEM */
> > 
> >  int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op);
> > +int spi_mem_do_calibration(struct spi_mem *mem, struct spi_mem_op *op);
> > 
> >  bool spi_mem_supports_op(struct spi_mem *mem,
> >  			 const struct spi_mem_op *op);
> 
> -- 
> -michael

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
