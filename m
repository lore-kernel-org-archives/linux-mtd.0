Return-Path: <SRS0=GnEg=IV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37CAC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 23:18:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 265A6600CD
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 23:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 265A6600CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e+75LmSoOoTHbx5rQmYXqSXobk4FgqRNElJ7C1WON70=; b=hPQgUtKJPEcvUmO8NQVvhN/2o
	ZL+fGsI04fOjXrreWLqRw37Bj75K2w0r6Uln364R8575TV19I77Tuj31VWAjju+YbgMILd1HhhY4/
	lDOJuma9ulM3xGIRVPUbFUbI5pijYGvnsOaPJwrVecyyzDnEHyfJz64FOuG27XZNtWntEYUGeyOc6
	amFWvHtpW/UGuFg5puR/ketcibsqsQsl431MKUvI9rL4AecQKuIGCcnr+oR1Z84QyPTw4DZEto77m
	ZYg/UOouRE7y1JfODAdPfPmqe1Y80bNuLsFrLvzeqek9urQThTPkRtj8+1ko6T73BqNZWc5Gtj+0M
	QRYZyt0kg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOqHf-00FyO7-Em; Tue, 23 Mar 2021 23:18:01 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOqHL-00FyN8-Ft; Tue, 23 Mar 2021 23:17:43 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id BDD7422235;
 Wed, 24 Mar 2021 00:17:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1616541456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Ec/9X4nt6FyfqtrErVyYH+TwTzheb3cKb1BNoUs13I=;
 b=JoZfAk7VjK47eMqmTbMeO7pmCvZZUqa/q0nTpo+VhGuhOqpEGkurGVc2IZz4JpRnqR+x22
 D3x67jhVq6hzODUEwwOvhetS2wnXMNkpWpFb5kO2wh/mUkqGRaGb8fQe7ELoUa74d2B3SJ
 fFmq/b2bPnXs4kNfH0x0iMp9Ywggjpg=
MIME-Version: 1.0
Date: Wed, 24 Mar 2021 00:17:36 +0100
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [RFC PATCH 2/6] mtd: spi-nor: core: consolidate read op creation
In-Reply-To: <20210311191216.7363-3-p.yadav@ti.com>
References: <20210311191216.7363-1-p.yadav@ti.com>
 <20210311191216.7363-3-p.yadav@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <77a4d73b65bd371e93538886038f1acb@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_231741_703687_98384AA7 
X-CRM114-Status: GOOD (  27.03  )
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

Am 2021-03-11 20:12, schrieb Pratyush Yadav:
> Currently the spi_mem_op to read from the flash is used in two places:
> spi_nor_create_read_dirmap() and spi_nor_spimem_read_data(). In a later
> commit this number will increase to three. Instead of repeating the 
> same
> code thrice, add a function that returns a template of the read op. The
> callers can then fill in the details like address, data length, data
> buffer location.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/spi-nor/core.c | 62 ++++++++++++++++++++------------------
>  1 file changed, 32 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 4a315cb1c4db..88888df009f0 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -183,6 +183,33 @@ static int spi_nor_controller_ops_erase(struct
> spi_nor *nor, loff_t offs)
>  	return nor->controller_ops->erase(nor, offs);
>  }
> 
> +/**
> + * spi_nor_spimem_get_read_op() - return a template for the spi_mem_op 
> used for
> + *                                reading data from the flash via 
> spi-mem.
> + * @nor:        pointer to 'struct spi_nor'
> + *
> + * Return: A template of the 'struct spi_mem_op' for used for reading 
> data from
> + * the flash. The caller is expected to fill in the address, data 
> length, and
> + * the data buffer.
> + */
> +static struct spi_mem_op spi_nor_spimem_get_read_op(struct spi_nor 
> *nor)
> +{
> +	struct spi_mem_op op =
> +		SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 0),
> +			   SPI_MEM_OP_ADDR(nor->addr_width, 0, 0),
> +			   SPI_MEM_OP_DUMMY(nor->read_dummy, 0),
> +			   SPI_MEM_OP_DATA_IN(1, NULL, 0));
> +
> +	spi_nor_spimem_setup_op(nor, &op, nor->read_proto);
> +
> +	/* convert the dummy cycles to the number of bytes */
> +	op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
> +	if (spi_nor_protocol_is_dtr(nor->read_proto))
> +		op.dummy.nbytes *= 2;
> +
> +	return op;
> +}
> +
>  /**
>   * spi_nor_spimem_read_data() - read data from flash's memory region 
> via
>   *                              spi-mem
> @@ -196,21 +223,14 @@ static int spi_nor_controller_ops_erase(struct
> spi_nor *nor, loff_t offs)
>  static ssize_t spi_nor_spimem_read_data(struct spi_nor *nor, loff_t 
> from,
>  					size_t len, u8 *buf)
>  {
> -	struct spi_mem_op op =
> -		SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 0),
> -			   SPI_MEM_OP_ADDR(nor->addr_width, from, 0),
> -			   SPI_MEM_OP_DUMMY(nor->read_dummy, 0),
> -			   SPI_MEM_OP_DATA_IN(len, buf, 0));
> +	struct spi_mem_op op = spi_nor_spimem_get_read_op(nor);
>  	bool usebouncebuf;
>  	ssize_t nbytes;
>  	int error;
> 
> -	spi_nor_spimem_setup_op(nor, &op, nor->read_proto);
> -
> -	/* convert the dummy cycles to the number of bytes */
> -	op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
> -	if (spi_nor_protocol_is_dtr(nor->read_proto))
> -		op.dummy.nbytes *= 2;
> +	op.addr.val = from;
> +	op.data.nbytes = len;
> +	op.data.buf.in = buf;
> 
>  	usebouncebuf = spi_nor_spimem_bounce(nor, &op);
> 
> @@ -3581,28 +3601,10 @@ EXPORT_SYMBOL_GPL(spi_nor_scan);
>  static int spi_nor_create_read_dirmap(struct spi_nor *nor)
>  {
>  	struct spi_mem_dirmap_info info = {
> -		.op_tmpl = SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 0),
> -				      SPI_MEM_OP_ADDR(nor->addr_width, 0, 0),
> -				      SPI_MEM_OP_DUMMY(nor->read_dummy, 0),
> -				      SPI_MEM_OP_DATA_IN(0, NULL, 0)),
> +		.op_tmpl = spi_nor_spimem_get_read_op(nor),
>  		.offset = 0,
>  		.length = nor->mtd.size,
>  	};
> -	struct spi_mem_op *op = &info.op_tmpl;
> -
> -	spi_nor_spimem_setup_op(nor, op, nor->read_proto);
> -
> -	/* convert the dummy cycles to the number of bytes */
> -	op->dummy.nbytes = (nor->read_dummy * op->dummy.buswidth) / 8;
> -	if (spi_nor_protocol_is_dtr(nor->read_proto))
> -		op->dummy.nbytes *= 2;
> -
> -	/*
> -	 * Since spi_nor_spimem_setup_op() only sets buswidth when the number
> -	 * of data bytes is non-zero, the data buswidth won't be set here. 
> So,
> -	 * do it explicitly.
> -	 */
> -	op->data.buswidth = spi_nor_get_protocol_data_nbits(nor->read_proto);

I guess this isn't needed anymore because spi_nor_spimem_get_read_op() 
uses a
data length of 1, right?

> 
>  	nor->dirmap.rdesc = devm_spi_mem_dirmap_create(nor->dev, nor->spimem,
>  						       &info);

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
