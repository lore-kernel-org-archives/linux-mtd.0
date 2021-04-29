Return-Path: <SRS0=3Xy9=J2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23794C433ED
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 16:25:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6681461407
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 16:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6681461407
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rP5pzhyASbbnDMUvUwPvc9EI3EuFYaqnVGDBRCwWzuo=; b=ge5o6do0Izq5URFCoJaqEjn2I
	4Eo6isKu2Vyl2R4o+pxPyPenq4e5Y5CGG5F9BUwQZMtOwmx0/XQ1Vmk+77vb/2DQK3tXiA0koedea
	usBAyxLmiaUqZjBDd3F6ieBZHZWQ1WZvaLOwH9dW5gPZnBAf5uSjGZ12H7WYs0027Oxbo4kmUxz5M
	zCNgen1GsTIutroSywTLo+6DQY/+K8s4k1Dwphbg5b5Mn908IAc4ySMz35G3EtqA96hvyDnZeuRMf
	ZsvG8wZhOh9tA64VbTEa3+kbzmeeo8rgj9xJiycXwzLdddmCYW0qNLjAyVQxyXaidwoFbb2Z3q24R
	xricubIvQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc9SV-0062em-Gc; Thu, 29 Apr 2021 16:24:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc9SG-0062do-Ch; Thu, 29 Apr 2021 16:23:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=bWL3CNDjMb7nz1cZKkLAw3O1cGMY+QoFR9KqySt0db8=; b=C6KfelM+XkhP+/Rz/Ms/GKo3zS
 UvmfeY5YVmXL4TNm4iiLLlPR8zIR2YzDwSUTH2W3KUsb66t+WF0IMwKFpjSv2LTatjVpLoEsahUkB
 cHfKpoiypTDZawtdQ26FeZPAG97xkGOnwRZgkw54tPUv5mSMmH2mTrNIwWoVFVg31leIdduUtTJyb
 xVQVRb2MsqfkOAf3le6qo+B2POWIhdKH9TWmCYX/gzL616MKuThoMjyN7mZIVSqVUMTh4Z4Ypj6Cg
 o+Q2J7q7nayvBxtNNkImLAGlf4u5hdWxxq/ofev2rGgvgWLKCDgYEjO6xZrCZOeV22msGoxs1WyrB
 Q0Y0Ow7w==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc9SD-000lDt-DB; Thu, 29 Apr 2021 16:23:55 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6767C22173;
 Thu, 29 Apr 2021 18:23:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1619713430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bWL3CNDjMb7nz1cZKkLAw3O1cGMY+QoFR9KqySt0db8=;
 b=ZD1lH0+lsVqZBevm1a4HCNgWdi/+b3VWuzjXso1qeVDK1xIiSBdD19MS6uDfMSYXcJHkBn
 ZUkrBkmAaZwUY8TmZD6hD4jq+CBOpuh/Jeorn853kpal/Ubsu6U6yj3GK0TY7B/8A+dHZQ
 EVXT/eZ/PGxjCQe2WgU26b0pKqzjQA0=
MIME-Version: 1.0
Date: Thu, 29 Apr 2021 18:23:50 +0200
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [RFC PATCH 1/6] spi: spi-mem: Tell controller when device is
 ready for calibration
In-Reply-To: <20210324080804.x7oemmpt2khi72mp@ti.com>
References: <20210311191216.7363-1-p.yadav@ti.com>
 <20210311191216.7363-2-p.yadav@ti.com>
 <934c8c6f7bb71729bfdaefd39c63a262@walle.cc>
 <20210324080804.x7oemmpt2khi72mp@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <6dfbb3e4107887dc9ee3e19e4940e87c@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_092353_797387_4C366052 
X-CRM114-Status: GOOD (  35.87  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Pratyush,

I've had a look at the LS1028A FlexSPI calibration feature. The
reference manual is very sparse on details, though. What you need to
do there is to program a special read command sequence (the whole
controller is made of these lookup table entries, where you can
have a short sequence of operations for read/write/program and so
on). Therefore, for data learning you'll take the read operation
and insert a LEARN op in between and read a specific data pattern.
Then the hardware will automatically figure out the correct sample
phase for the read data pins.

Unfortunately, it does not mention how often you have to do it. It
might be the case that is has to be calibrated more than once.

I'm just mentioning this so it won't be lost. If needed, it can
be added later.

Am 2021-03-24 09:08, schrieb Pratyush Yadav:
> On 24/03/21 12:07AM, Michael Walle wrote:
>> Am 2021-03-11 20:12, schrieb Pratyush Yadav:
>> > Some controllers like the Cadence OSPI controller need to perform a
>> > calibration sequence to operate at high clock speeds. This calibration
>> > should happen after the flash is fully initialized otherwise the
>> > calibration might happen in a different SPI mode from the one the flash
>> > is finally set to. Add a hook that can be used to tell the controller
>> > when the flash is ready for calibration. Whether calibration is needed
>> > depends on the controller.
>> >
>> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
>> > ---
>> >  drivers/spi/spi-mem.c       | 12 ++++++++++++
>> >  include/linux/spi/spi-mem.h |  8 ++++++++
>> >  2 files changed, 20 insertions(+)
>> >
>> > diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
>> > index dc713b0c3c4d..e2f05ad3f4dc 100644
>> > --- a/drivers/spi/spi-mem.c
>> > +++ b/drivers/spi/spi-mem.c
>> > @@ -464,6 +464,18 @@ int spi_mem_adjust_op_size(struct spi_mem *mem,
>> > struct spi_mem_op *op)
>> >  }
>> >  EXPORT_SYMBOL_GPL(spi_mem_adjust_op_size);
>> >
>> > +int spi_mem_do_calibration(struct spi_mem *mem, struct spi_mem_op *op)
>> > +{
>> > +	struct spi_controller *ctlr = mem->spi->controller;
>> > +
>> > +	if (!ctlr->mem_ops || !ctlr->mem_ops->do_calibration)
>> > +		return -EOPNOTSUPP;
>> > +
>> > +	ctlr->mem_ops->do_calibration(mem, op);
>> 
>> Can't a calibration fail?
> 
> It can. If it does, the controller falls back to lower speed transfers.
> There is not much the upper layer can do about this. That's why it is
> not informed whether it succeeded or not.

Ok, if needed, that should be an easy change.

op is there to decide if we need a calibration at all, correct?
What if there are different factors, like frequency? For example
on the LS1028A its just a matter of the SCK frequency. It seems
that this parameter is tailored to the OPHY.

-michael

>> > +	return 0;
>> > +}
>> > +EXPORT_SYMBOL_GPL(spi_mem_do_calibration);
>> > +
>> >  static ssize_t spi_mem_no_dirmap_read(struct spi_mem_dirmap_desc *desc,
>> >  				      u64 offs, size_t len, void *buf)
>> >  {
>> > diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
>> > index 2b65c9edc34e..97a2d280f2d0 100644
>> > --- a/include/linux/spi/spi-mem.h
>> > +++ b/include/linux/spi/spi-mem.h
>> > @@ -250,6 +250,12 @@ static inline void *spi_mem_get_drvdata(struct
>> > spi_mem *mem)
>> >   *		  the currently mapped area), and the caller of
>> >   *		  spi_mem_dirmap_write() is responsible for calling it again in
>> >   *		  this case.
>> > + * @do_calibration: perform calibration needed for high SPI clock speed
>> > + *		    operation. Should be called after the SPI memory device has
>> > + *		    been completely initialized. The op passed should contain
>> > + *		    a template for the read operation used for the device so
>> > + *		    the controller can decide what type of calibration is
>> > + *		    required for this type of read.
>> >   *
>> >   * This interface should be implemented by SPI controllers providing an
>> >   * high-level interface to execute SPI memory operation, which is
>> > usually the
>> > @@ -274,6 +280,7 @@ struct spi_controller_mem_ops {
>> >  			       u64 offs, size_t len, void *buf);
>> >  	ssize_t (*dirmap_write)(struct spi_mem_dirmap_desc *desc,
>> >  				u64 offs, size_t len, const void *buf);
>> > +	void (*do_calibration)(struct spi_mem *mem, struct spi_mem_op *op);
>> >  };
>> >
>> >  /**
>> > @@ -346,6 +353,7 @@ bool spi_mem_dtr_supports_op(struct spi_mem *mem,
>> >  #endif /* CONFIG_SPI_MEM */
>> >
>> >  int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op);
>> > +int spi_mem_do_calibration(struct spi_mem *mem, struct spi_mem_op *op);
>> >
>> >  bool spi_mem_supports_op(struct spi_mem *mem,
>> >  			 const struct spi_mem_op *op);
>> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
