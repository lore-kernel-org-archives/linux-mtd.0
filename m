Return-Path: <SRS0=rMW0=J7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68399C433B4
	for <linux-mtd@archiver.kernel.org>; Tue,  4 May 2021 07:47:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D98F7610A2
	for <linux-mtd@archiver.kernel.org>; Tue,  4 May 2021 07:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D98F7610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oVkJmYX0una1XCMGDn2kUbFpQ6T1X/5EuGztZXChQy0=; b=SudlazfAh1JDKVwGqw6UWmRtj
	Q8C5Ky7WTps5lPa1/YfRQeR0poVsLg9Yrjh8H0xUTzO/jnXyadDRswEDxT9i/csTazswXtb0iz6bb
	VEJSr8OG1iRz8Gh+4KQSZQoOjSOLYun89io+kGSsgZfW1JXm6w16CGFvN2oawc+CE68JUnN5elNnr
	avlW1Np5GZdmNffVQVQl+yXqFQ9J+/3OOhGdj39NN5a2fOvfesaKRwUj55rwxnDMKOv5yykLrW7Bv
	fQIkhaUxINkiIm9pP6vpIWCoWtNs5c7tSvPMo1M2B1ZqwTXNpjV9+IdcOceS4EbaxRnIW5h3YU2QE
	rWJD+o6Bw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldplq-00Fe1s-CV; Tue, 04 May 2021 07:47:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldplZ-00Fdz3-FW; Tue, 04 May 2021 07:46:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=v2LfDUuprhoq0w30u8SSUbTGXDg1q/hXpwfngCE33fs=; b=CNluumsRek51VQEaXqdfbY0oCU
 RT8Lw6iqgsgHhCv3WFfQ+eLcaNlFt6BUzwkyglnlfW1DpAmGTzUVInLw59zlYVkBcgMpAfcVfFMtw
 5+HR4+Qn7XklH05z/hQ7gMlJAYwQEBcDAdkPfkybhYVpdvEpTL53zGKd/kILxFIXHIlEPnSDAiulV
 87otFPfH/mhes+NzikGQZvnF7mor9zN1PLLrwtzSu9GFGPhx50o9m4C/5B6cKGDCJxVCC+11xsrX/
 CAWFXEMARUhlhsztlkrU4GlPpfHUnszP1uoByjVgmwk6LZbf3SnfO8yXN6m4cNg5qA4EX5s47hnPh
 2TOcDQeA==;
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldplW-003mIC-DH; Tue, 04 May 2021 07:46:48 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1447kbxR091366;
 Tue, 4 May 2021 02:46:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1620114397;
 bh=v2LfDUuprhoq0w30u8SSUbTGXDg1q/hXpwfngCE33fs=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=vKPWLQKmPA7co+CoTH0fyq0d5Ln0DbKdxPpUM6H8U42uAUzVPy+mHEif6M175yYM0
 E8Wyh1891bYM/tINgL5rdRou25mtWOY9DzcQNYOcRnxYOG3Noo04INWhmRb6bpm46D
 KuMhdY8T0HEbPIJZyBaSnKMIidYXIT86yhcySTI4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1447kbFW105160
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 4 May 2021 02:46:37 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 4 May
 2021 02:46:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 4 May 2021 02:46:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1447ka5F067328;
 Tue, 4 May 2021 02:46:36 -0500
Date: Tue, 4 May 2021 13:16:35 +0530
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
Message-ID: <20210504074633.kwwccp2m2je3yx6n@ti.com>
References: <20210426143934.25275-1-patrice.chotard@foss.st.com>
 <20210426143934.25275-2-patrice.chotard@foss.st.com>
 <20210430185104.377d1bc6@collabora.com>
 <20210503084742.7cp77snyohkdwwvv@ti.com>
 <20210503111114.26b64e25@collabora.com>
 <20210503092935.vjitc7mc47wttn77@ti.com>
 <20210503115252.08af412c@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210503115252.08af412c@collabora.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_004646_561558_B0A66A06 
X-CRM114-Status: GOOD (  61.50  )
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

On 03/05/21 11:52AM, Boris Brezillon wrote:
> On Mon, 3 May 2021 14:59:37 +0530
> Pratyush Yadav <p.yadav@ti.com> wrote:
> 
> > On 03/05/21 11:11AM, Boris Brezillon wrote:
> > > On Mon, 3 May 2021 14:17:44 +0530
> > > Pratyush Yadav <p.yadav@ti.com> wrote:
> > >   
> > > > On 30/04/21 06:51PM, Boris Brezillon wrote:  
> > > > > On Mon, 26 Apr 2021 16:39:32 +0200
> > > > > <patrice.chotard@foss.st.com> wrote:
> > > > >     
> > > > > > From: Christophe Kerello <christophe.kerello@foss.st.com>
> > > > > > 
> > > > > > With STM32 QSPI, it is possible to poll the status register of the device.
> > > > > > This could be done to offload the CPU during an operation (erase or
> > > > > > program a SPI NAND for example).
> > > > > > 
> > > > > > spi_mem_poll_status API has been added to handle this feature.
> > > > > > 
> > > > > > Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> > > > > > Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> > > > > > ---
> > > > > >  drivers/spi/spi-mem.c       | 34 ++++++++++++++++++++++++++++++++++
> > > > > >  include/linux/spi/spi-mem.h |  8 ++++++++
> > > > > >  2 files changed, 42 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> > > > > > index 1513553e4080..43dce4b0efa4 100644
> > > > > > --- a/drivers/spi/spi-mem.c
> > > > > > +++ b/drivers/spi/spi-mem.c
> > > > > > @@ -743,6 +743,40 @@ static inline struct spi_mem_driver *to_spi_mem_drv(struct device_driver *drv)
> > > > > >  	return container_of(drv, struct spi_mem_driver, spidrv.driver);
> > > > > >  }
> > > > > >  
> > > > > > +/**
> > > > > > + * spi_mem_poll_status() - Poll memory device status
> > > > > > + * @mem: SPI memory device
> > > > > > + * @op: the memory operation to execute
> > > > > > + * @mask: status bitmask to ckeck
> > > > > > + * @match: status expected value
> > > > > > + * @timeout: timeout
> > > > > > + *
> > > > > > + * This function send a polling status request to the controller driver
> > > > > > + *
> > > > > > + * Return: 0 in case of success, -ETIMEDOUT in case of error,
> > > > > > + *         -EOPNOTSUPP if not supported.
> > > > > > + */
> > > > > > +int spi_mem_poll_status(struct spi_mem *mem,
> > > > > > +			const struct spi_mem_op *op,
> > > > > > +			u8 mask, u8 match, u16 timeout)
> > > > > > +{
> > > > > > +	struct spi_controller *ctlr = mem->spi->controller;
> > > > > > +	int ret = -EOPNOTSUPP;
> > > > > > +
> > > > > > +	if (ctlr->mem_ops && ctlr->mem_ops->poll_status) {
> > > > > > +		ret = spi_mem_access_start(mem);    
> > > > > 
> > > > > You should probably check that op is a single byte read before
> > > > > accepting the command.    
> > > > 
> > > > Please do not discriminate against 8D-8D-8D flashes ;-).  
> > > 
> > > Then mask and match should probably be u16 :P. And the check as it is
> > > seems a bit lax to me. Drivers will of course be able to reject the op
> > > when there's more than one byte (or 16bit word in case of 8D) to read,
> > > but it feels like the core could automate that a bit.  
> > 
> > The two 8D flashes that are currently supported in SPI NOR both have a 
> > 1-byte status register. But to read it, the read op should be 2-byte 
> > long to avoid partial cycles at the end. The second byte is simply 
> > discarded.
> > 
> > 2-byte wide registers might show up in the future, but for now at least 
> > we don't have to worry about them.
> 
> Well, I guess it doesn't hurt to take it into account now. I mean,
> what's happening on the bus in that case is a 2byte transfer, with the
> second byte being ignored, which you can describe with a 16bit mask
> of 0xMM00 (assuming big endian transfers here, as done for other ops).

Makes sense.

> 
> > 
> > >   
> > > >   
> > > > >     
> > > > > > +		if (ret)
> > > > > > +			return ret;
> > > > > > +
> > > > > > +		ret = ctlr->mem_ops->poll_status(mem, op, mask, match, timeout);    
> > > > > 
> > > > > You also need some sort of ->poll_status_is_supported() to validate
> > > > > that the controller supports the status polling for this specific op (I    
> > > > 
> > > > I don't think a separate function is needed for checking if the poll 
> > > > status op is supported. Return value of -EOPNOTSUPP should be able to 
> > > > signal that. This can also be used to check if Octal DDR capable 
> > > > controllers are able to poll using 2-byte reads.  
> > > 
> > > Yeah, I had something more complex in mind to avoid doing this 'try
> > > native mode and fall back on sw-based more if not supported' dance
> > > every time a status poll is requested (something similar to what we do
> > > for dirmaps, with a status poll desc), but I guess that's a bit
> > > premature (and probably uneeded).  
> > 
> > I think Mark also suggested something similar. Make the CPU/non-CPU case 
> > transparent to the caller. I agree with with this direction. Makes the 
> > caller simpler.
> 
> It's kind of orthogonal to what I was suggesting, but yes, that's
> definitely a good idea. We certainly don't want the spi-nor layer to
> open code the same logic if the spi-mem layer can do it for us.
> 
> > 
> > I also mentioned in a reply to this patch that supports_op() should be 
> > called before the op is executed. That should take care of "base" 
> > support for the op. The poll-specific checks can go in the poll_status() 
> > function itself. If either of those say the op is not supported, it 
> > should fall back to CPU based polling. That's the design that makes the 
> > most sense to me.
> 
> What I had in mind was more:
> 
> 1/ create a poll desc with spi_mem_create_poll_status_desc(). The
>    "operation supported" check is done here. The controller can store
>    all its HW-specific state in there. If the operation is not natively
>    supported, a SW-based poll descriptor (similar to the SW-based
>    dirmap) is created
> 2/ poll the status with spi_mem_poll_status(). This function is passed
>    a poll descriptor which helps select the path that should be taken
>    without having to check every time whether the hardware supports a
>    specific status polling op. I can also imagine some preparation
>    being done during the desc creation if that makes sense (preparing
>    reg values to be written when a status poll request is issued for
>    instance)
> 
> Anyway, as I said, this sort of optimization might be a bit premature.

Indeed, this sounds a bit premature to me too.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
