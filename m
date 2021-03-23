Return-Path: <SRS0=GnEg=IV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3183CC433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 23:09:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2475619B2
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 23:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2475619B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oEbKNkWTPOJY9qpAbch8BErTpvYEnG844+c/QdAUey0=; b=YfllZYFCzhWigkSCH+0RtwvgR
	CeXKLBHpg1JLjihcbZT+7SMtOFXoFXVLSSbD+PXI1J3uqQbZuMMBrz4QWI9XODVyJruMGonIjeK7C
	NfhVlXHkb3BN5jyQr/JpttglOH/WuwwMYW1QUkaUbpO2NEs/kR4+uFXGiNWHDhU1izSeeelWOMLVj
	XlMFcjScGu6/qC6WczD9yiH99eR2GAvWZjTM/edxfCkJUxVLBgFq1L+pgk/hgSI70MHdAyraTMRwX
	EuIAj4NmbmnsLqMxvwPogj7GFFJBkPVPtAqNCITEkUaFe4jU6LLF0lKovpM1czzQwtPuM8Ss/Pfpt
	fmE5xrAww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOq83-00Fxmz-0u; Tue, 23 Mar 2021 23:08:03 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOq7p-00FxmN-2W; Tue, 23 Mar 2021 23:07:52 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 4A03B22260;
 Wed, 24 Mar 2021 00:07:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1616540866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C8nXM32KMkKRWhGgs0N1HKDFZiCWuwPI3z2aCDDXFbk=;
 b=oALP9ZD3prSS6SGNrjoUUBoDtku9bM8urrR9UjVpLpWMvYdYzQlrQxw+rpSp18OjIZHxiD
 Hc3kdGvzwuhcgZPwbr6iSiFFO3vm1ggyge8oePN6iR+odWSc0ZPJ3YeXzVvmd26GfhJlsp
 QnMuE/U8E6c8gkN1dT5vk7EA9evzk0Q=
MIME-Version: 1.0
Date: Wed, 24 Mar 2021 00:07:46 +0100
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
In-Reply-To: <20210311191216.7363-2-p.yadav@ti.com>
References: <20210311191216.7363-1-p.yadav@ti.com>
 <20210311191216.7363-2-p.yadav@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <934c8c6f7bb71729bfdaefd39c63a262@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_230749_325181_35901D1A 
X-CRM114-Status: GOOD (  28.44  )
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

Am 2021-03-11 20:12, schrieb Pratyush Yadav:
> Some controllers like the Cadence OSPI controller need to perform a
> calibration sequence to operate at high clock speeds. This calibration
> should happen after the flash is fully initialized otherwise the
> calibration might happen in a different SPI mode from the one the flash
> is finally set to. Add a hook that can be used to tell the controller
> when the flash is ready for calibration. Whether calibration is needed
> depends on the controller.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/spi/spi-mem.c       | 12 ++++++++++++
>  include/linux/spi/spi-mem.h |  8 ++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index dc713b0c3c4d..e2f05ad3f4dc 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -464,6 +464,18 @@ int spi_mem_adjust_op_size(struct spi_mem *mem,
> struct spi_mem_op *op)
>  }
>  EXPORT_SYMBOL_GPL(spi_mem_adjust_op_size);
> 
> +int spi_mem_do_calibration(struct spi_mem *mem, struct spi_mem_op *op)
> +{
> +	struct spi_controller *ctlr = mem->spi->controller;
> +
> +	if (!ctlr->mem_ops || !ctlr->mem_ops->do_calibration)
> +		return -EOPNOTSUPP;
> +
> +	ctlr->mem_ops->do_calibration(mem, op);

Can't a calibration fail?

> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(spi_mem_do_calibration);
> +
>  static ssize_t spi_mem_no_dirmap_read(struct spi_mem_dirmap_desc 
> *desc,
>  				      u64 offs, size_t len, void *buf)
>  {
> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> index 2b65c9edc34e..97a2d280f2d0 100644
> --- a/include/linux/spi/spi-mem.h
> +++ b/include/linux/spi/spi-mem.h
> @@ -250,6 +250,12 @@ static inline void *spi_mem_get_drvdata(struct
> spi_mem *mem)
>   *		  the currently mapped area), and the caller of
>   *		  spi_mem_dirmap_write() is responsible for calling it again in
>   *		  this case.
> + * @do_calibration: perform calibration needed for high SPI clock 
> speed
> + *		    operation. Should be called after the SPI memory device has
> + *		    been completely initialized. The op passed should contain
> + *		    a template for the read operation used for the device so
> + *		    the controller can decide what type of calibration is
> + *		    required for this type of read.
>   *
>   * This interface should be implemented by SPI controllers providing 
> an
>   * high-level interface to execute SPI memory operation, which is 
> usually the
> @@ -274,6 +280,7 @@ struct spi_controller_mem_ops {
>  			       u64 offs, size_t len, void *buf);
>  	ssize_t (*dirmap_write)(struct spi_mem_dirmap_desc *desc,
>  				u64 offs, size_t len, const void *buf);
> +	void (*do_calibration)(struct spi_mem *mem, struct spi_mem_op *op);
>  };
> 
>  /**
> @@ -346,6 +353,7 @@ bool spi_mem_dtr_supports_op(struct spi_mem *mem,
>  #endif /* CONFIG_SPI_MEM */
> 
>  int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op 
> *op);
> +int spi_mem_do_calibration(struct spi_mem *mem, struct spi_mem_op 
> *op);
> 
>  bool spi_mem_supports_op(struct spi_mem *mem,
>  			 const struct spi_mem_op *op);

-- 
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
