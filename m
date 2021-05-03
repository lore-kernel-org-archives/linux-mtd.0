Return-Path: <SRS0=b+Mj=J6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95925C433ED
	for <linux-mtd@archiver.kernel.org>; Mon,  3 May 2021 09:31:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4F8F61186
	for <linux-mtd@archiver.kernel.org>; Mon,  3 May 2021 09:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4F8F61186
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OiLiWAU7LkMlzQhOC4lhHiZTfmSU1reUQ6kyg5OFebs=; b=MBx5yHS9oAksMw4ChnLAthAyD
	v0hDIVEoTh2PZvmRMC1t+1Ivqsn1p+0bmz2gpOhRiU1GtYK/MkJPOURMMuldQRckDM+7lJ0v75tsF
	OBAlFRLmA+/wDpvidO5k7qAWt/JTm8IaPdzIpRp20jk7HUOM+a2p+7ib3jTWbJz5WefB7uWsHjak1
	cRtDUPj90Ux5BgSERC5C+giFYpUkry8V2N5dz+d6wXRjoB97mXI4jTF/AXH1ihK+tuvw5/T+8R5iG
	her0W14590tvgXP5mbwP3enAcnXi9OrNk7lM/mq+xclOUSXLo9vWMRpw5N16PAS62Th8xLQl499xR
	mBWsvwPgA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldUuC-00DXbc-7b; Mon, 03 May 2021 09:30:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldUtk-00DXYa-Bw; Mon, 03 May 2021 09:29:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ka/Jw/+ACUEaipnPHF0Sx4tlmxaAj0Bqa1brAIjS5Og=; b=0U+mTD1MyIIOPQnUPI1atgV4l7
 HJr+SNVg/Q+weatBx1yzluZuvTg4V2aYH/fyTh9Qe2ydCvknzTyZyIHWhuzLBaMvfCCOREN8Hmui8
 D4e/CA77ZRVJqQcICg4lbuAwxLriqtVpeCSpP/yRqCT67NrNVFmVPHcBneA0uqFuoBIWIVlef7rst
 cnzh3bKjDlYAwhenh37AFc+WmN/6oRyP1zF66WywVxwwYk3ID+dUSaxK1H49zwjfSsZla+fSPJxNZ
 Pr1tezG1r/tET+xan3lx9F+ApAjUe4WVjOvHUvE5Fv9AFquIgo14p2wHlrWNh01p25DKDug5jjH3B
 Y2oB301g==;
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldUth-002we8-8f; Mon, 03 May 2021 09:29:51 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1439Tdfr120755;
 Mon, 3 May 2021 04:29:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1620034179;
 bh=ka/Jw/+ACUEaipnPHF0Sx4tlmxaAj0Bqa1brAIjS5Og=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ZchYAz+uHo17+IKelaTJRMh5WS5QSWmPvlybAD4zXDtNxgQ30ofkAb/EqU0wwvmBt
 2oXPAlipa2Ne7gTBObsikxCcDQ59jXRCM/ha3hlPX6ul2Ye72GDjJVK/1bzdLVRpXG
 HqTZ9gbALCZJk7joawvc7ggmx95nF8T6xDxP5hjI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1439TdiB003667
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 3 May 2021 04:29:39 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 3 May
 2021 04:29:39 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 3 May 2021 04:29:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1439Tcgr047410;
 Mon, 3 May 2021 04:29:38 -0500
Date: Mon, 3 May 2021 14:59:37 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
CC: <patrice.chotard@foss.st.com>, Mark Brown <broonie@kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>
Subject: Re: [PATCH 1/3] spi: spi-mem: add automatic poll status functions
Message-ID: <20210503092935.vjitc7mc47wttn77@ti.com>
References: <20210426143934.25275-1-patrice.chotard@foss.st.com>
 <20210426143934.25275-2-patrice.chotard@foss.st.com>
 <20210430185104.377d1bc6@collabora.com>
 <20210503084742.7cp77snyohkdwwvv@ti.com>
 <20210503111114.26b64e25@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210503111114.26b64e25@collabora.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_022949_417941_E6D6DED3 
X-CRM114-Status: GOOD (  53.45  )
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

On 03/05/21 11:11AM, Boris Brezillon wrote:
> On Mon, 3 May 2021 14:17:44 +0530
> Pratyush Yadav <p.yadav@ti.com> wrote:
> 
> > On 30/04/21 06:51PM, Boris Brezillon wrote:
> > > On Mon, 26 Apr 2021 16:39:32 +0200
> > > <patrice.chotard@foss.st.com> wrote:
> > >   
> > > > From: Christophe Kerello <christophe.kerello@foss.st.com>
> > > > 
> > > > With STM32 QSPI, it is possible to poll the status register of the device.
> > > > This could be done to offload the CPU during an operation (erase or
> > > > program a SPI NAND for example).
> > > > 
> > > > spi_mem_poll_status API has been added to handle this feature.
> > > > 
> > > > Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> > > > Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> > > > ---
> > > >  drivers/spi/spi-mem.c       | 34 ++++++++++++++++++++++++++++++++++
> > > >  include/linux/spi/spi-mem.h |  8 ++++++++
> > > >  2 files changed, 42 insertions(+)
> > > > 
> > > > diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> > > > index 1513553e4080..43dce4b0efa4 100644
> > > > --- a/drivers/spi/spi-mem.c
> > > > +++ b/drivers/spi/spi-mem.c
> > > > @@ -743,6 +743,40 @@ static inline struct spi_mem_driver *to_spi_mem_drv(struct device_driver *drv)
> > > >  	return container_of(drv, struct spi_mem_driver, spidrv.driver);
> > > >  }
> > > >  
> > > > +/**
> > > > + * spi_mem_poll_status() - Poll memory device status
> > > > + * @mem: SPI memory device
> > > > + * @op: the memory operation to execute
> > > > + * @mask: status bitmask to ckeck
> > > > + * @match: status expected value
> > > > + * @timeout: timeout
> > > > + *
> > > > + * This function send a polling status request to the controller driver
> > > > + *
> > > > + * Return: 0 in case of success, -ETIMEDOUT in case of error,
> > > > + *         -EOPNOTSUPP if not supported.
> > > > + */
> > > > +int spi_mem_poll_status(struct spi_mem *mem,
> > > > +			const struct spi_mem_op *op,
> > > > +			u8 mask, u8 match, u16 timeout)
> > > > +{
> > > > +	struct spi_controller *ctlr = mem->spi->controller;
> > > > +	int ret = -EOPNOTSUPP;
> > > > +
> > > > +	if (ctlr->mem_ops && ctlr->mem_ops->poll_status) {
> > > > +		ret = spi_mem_access_start(mem);  
> > > 
> > > You should probably check that op is a single byte read before
> > > accepting the command.  
> > 
> > Please do not discriminate against 8D-8D-8D flashes ;-).
> 
> Then mask and match should probably be u16 :P. And the check as it is
> seems a bit lax to me. Drivers will of course be able to reject the op
> when there's more than one byte (or 16bit word in case of 8D) to read,
> but it feels like the core could automate that a bit.

The two 8D flashes that are currently supported in SPI NOR both have a 
1-byte status register. But to read it, the read op should be 2-byte 
long to avoid partial cycles at the end. The second byte is simply 
discarded.

2-byte wide registers might show up in the future, but for now at least 
we don't have to worry about them.

> 
> > 
> > >   
> > > > +		if (ret)
> > > > +			return ret;
> > > > +
> > > > +		ret = ctlr->mem_ops->poll_status(mem, op, mask, match, timeout);  
> > > 
> > > You also need some sort of ->poll_status_is_supported() to validate
> > > that the controller supports the status polling for this specific op (I  
> > 
> > I don't think a separate function is needed for checking if the poll 
> > status op is supported. Return value of -EOPNOTSUPP should be able to 
> > signal that. This can also be used to check if Octal DDR capable 
> > controllers are able to poll using 2-byte reads.
> 
> Yeah, I had something more complex in mind to avoid doing this 'try
> native mode and fall back on sw-based more if not supported' dance
> every time a status poll is requested (something similar to what we do
> for dirmaps, with a status poll desc), but I guess that's a bit
> premature (and probably uneeded).

I think Mark also suggested something similar. Make the CPU/non-CPU case 
transparent to the caller. I agree with with this direction. Makes the 
caller simpler.

I also mentioned in a reply to this patch that supports_op() should be 
called before the op is executed. That should take care of "base" 
support for the op. The poll-specific checks can go in the poll_status() 
function itself. If either of those say the op is not supported, it 
should fall back to CPU based polling. That's the design that makes the 
most sense to me.

> 
> > 
> > > can imagine some controllers having a limit on the number of dummy
> > > cycles/address bytes). I guess you could just fall back on SW-based
> > > status polling if ctlr->mem_ops->poll_status() returns -ENOTSUPP.
> > >   
> > > > +
> > > > +		spi_mem_access_end(mem);
> > > > +	}
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(spi_mem_poll_status);
> > > > +
> > > >  static int spi_mem_probe(struct spi_device *spi)
> > > >  {
> > > >  	struct spi_mem_driver *memdrv = to_spi_mem_drv(spi->dev.driver);
> > > > diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> > > > index 2b65c9edc34e..5f78917c0f68 100644
> > > > --- a/include/linux/spi/spi-mem.h
> > > > +++ b/include/linux/spi/spi-mem.h
> > > > @@ -250,6 +250,7 @@ static inline void *spi_mem_get_drvdata(struct spi_mem *mem)
> > > >   *		  the currently mapped area), and the caller of
> > > >   *		  spi_mem_dirmap_write() is responsible for calling it again in
> > > >   *		  this case.
> > > > + * @poll_status: poll memory device status
> > > >   *
> > > >   * This interface should be implemented by SPI controllers providing an
> > > >   * high-level interface to execute SPI memory operation, which is usually the
> > > > @@ -274,6 +275,9 @@ struct spi_controller_mem_ops {
> > > >  			       u64 offs, size_t len, void *buf);
> > > >  	ssize_t (*dirmap_write)(struct spi_mem_dirmap_desc *desc,
> > > >  				u64 offs, size_t len, const void *buf);
> > > > +	int (*poll_status)(struct spi_mem *mem,
> > > > +			   const struct spi_mem_op *op,
> > > > +			   u8 mask, u8 match, u16 timeout);
> > > >  };
> > > >  
> > > >  /**
> > > > @@ -369,6 +373,10 @@ devm_spi_mem_dirmap_create(struct device *dev, struct spi_mem *mem,
> > > >  void devm_spi_mem_dirmap_destroy(struct device *dev,
> > > >  				 struct spi_mem_dirmap_desc *desc);
> > > >  
> > > > +int spi_mem_poll_status(struct spi_mem *mem,
> > > > +			const struct spi_mem_op *op,
> > > > +			u8 mask, u8 match, u16 timeout);
> > > > +
> > > >  int spi_mem_driver_register_with_owner(struct spi_mem_driver *drv,
> > > >  				       struct module *owner);
> > > >    
> > 
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
