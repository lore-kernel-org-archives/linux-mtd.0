Return-Path: <SRS0=h4jW=3R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2627CC33CB3
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 06:50:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED6AC22522
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 06:50:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tL2S9wCJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED6AC22522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=asrNfF/GyGR4hFFhnBfsA4qIdHUOzWW0PNKZJbT6bTc=; b=tL2S9wCJCzCTel
	XK85AE5qjnq1qFomoxTpycwHFdznEjswHw0UEYnd7tk/d/6JfO5mG7fyr7ecUT8ogLE156J3wLunq
	wZWfbycJ8J9wmLcvIjV5KO6tv1MbOGu4f9tPDBgzCUHHkKnaNimTR/Ksrg+3qy1poM6ryzSG36YpP
	ZvOejFlcslTH/7bXP/7n9xoa1Q+WUcvukoY3Iou/oIHLQC/2DwA3aZrII6RN8s0YROTP+ebQjp5bA
	LEsAfACEdjjdSHAMDnWgh/sZKlpsyDabmLZY0dqmE2xJ5wtErsqYCOcwrh+x1AlxdOV9MTCH/7yTU
	ujTc0UFucXoVDErOv/3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwKhi-0001nr-Hc; Tue, 28 Jan 2020 06:50:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwKhe-0001nJ-JW
 for linux-mtd@lists.infradead.org; Tue, 28 Jan 2020 06:50:28 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E7F342931AA;
 Tue, 28 Jan 2020 06:50:20 +0000 (GMT)
Date: Tue, 28 Jan 2020 07:50:17 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v4 1/2] mtd: spi-nor: split spi_nor_spimem_xfer_data()
Message-ID: <20200128075017.4014e1f5@collabora.com>
In-Reply-To: <002acfc3-39d7-68e7-aa00-fbb449c3bc71@cogentembedded.com>
References: <5143a90d-fede-7025-9eaf-142414c803c3@cogentembedded.com>
 <002acfc3-39d7-68e7-aa00-fbb449c3bc71@cogentembedded.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_225026_901747_B6741DB7 
X-CRM114-Status: GOOD (  24.05  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 27 Jan 2020 23:28:05 +0300
Sergei Shtylyov <sergei.shtylyov@cogentembedded.com> wrote:

> spi_nor_spimem_xfer_data() being a helper function for the data reads/
> writes contains 3 fragments that depend on the data direction; and I'm
> going to add another one to call the SPI dirmap API...
> I think this function should be split so that the common fragments are
> put into 2 functions, spi_nor_spimem_bounce() and spi_nor_spimem_exec_op()
> called from spi_nor_spimem_{read|write}_data(), and the data direction
> dependent bits moved back into those read/write functions -- that way we
> would be able to avoid *goto*s otherwise needed in the next patch adding
> the  SPI dirmap support...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> 
> ---
> Changes in version 4:
> - new patch.
> 
>  drivers/mtd/spi-nor/spi-nor.c |   91 +++++++++++++++++++++++-------------------
>  1 file changed, 51 insertions(+), 40 deletions(-)
> 
> Index: linux/drivers/mtd/spi-nor/spi-nor.c
> ===================================================================
> --- linux.orig/drivers/mtd/spi-nor/spi-nor.c
> +++ linux/drivers/mtd/spi-nor/spi-nor.c
> @@ -246,55 +246,45 @@ struct flash_info {
>  #define JEDEC_MFR(info)	((info)->id[0])
>  
>  /**
> - * spi_nor_spimem_xfer_data() - helper function to read/write data to
> - *                              flash's memory region
> + * spi_nor_spimem_bounce() - check if a bounce buffer is needed for the data
> + *                           transfer
>   * @nor:        pointer to 'struct spi_nor'
>   * @op:         pointer to 'struct spi_mem_op' template for transfer
>   *
> - * Return: number of bytes transferred on success, -errno otherwise
> + * If we have to use the bounce buffer, the data field in @op will be updated.
> + *
> + * Return: true if the bounce buffer is needed, false if not
>   */
> -static ssize_t spi_nor_spimem_xfer_data(struct spi_nor *nor,
> -					struct spi_mem_op *op)
> +static bool spi_nor_spimem_bounce(struct spi_nor *nor, struct spi_mem_op *op)
>  {
> -	bool usebouncebuf = false;
> -	void *rdbuf = NULL;
> -	const void *buf;
> -	int ret;
> -
> -	if (op->data.dir == SPI_MEM_DATA_IN)
> -		buf = op->data.buf.in;
> -	else
> -		buf = op->data.buf.out;
> -
> -	if (object_is_on_stack(buf) || !virt_addr_valid(buf))
> -		usebouncebuf = true;
> -
> -	if (usebouncebuf) {
> +	/* op->data.buf.in occupies the same memory as op->data.buf.out */
> +	if (object_is_on_stack(op->data.buf.in) ||
> +	    !virt_addr_valid(op->data.buf.in)) {
>  		if (op->data.nbytes > nor->bouncebuf_size)
>  			op->data.nbytes = nor->bouncebuf_size;
> -
> -		if (op->data.dir == SPI_MEM_DATA_IN) {
> -			rdbuf = op->data.buf.in;
> -			op->data.buf.in = nor->bouncebuf;
> -		} else {
> -			op->data.buf.out = nor->bouncebuf;
> -			memcpy(nor->bouncebuf, buf,
> -			       op->data.nbytes);
> -		}
> +		op->data.buf.in = nor->bouncebuf;
> +		return true;
>  	}
>  
> -	ret = spi_mem_adjust_op_size(nor->spimem, op);
> -	if (ret)
> -		return ret;
> -
> -	ret = spi_mem_exec_op(nor->spimem, op);
> -	if (ret)
> -		return ret;
> +	return false;
> +}
> +
> +/**
> + * spi_nor_spimem_exec_op() - execute a memory operation
> + * @nor:        pointer to 'struct spi_nor'
> + * @op:         pointer to 'struct spi_mem_op' template for transfer
> + *
> + * Return: 0 on success, -error otherwise.
> + */
> +static int spi_nor_spimem_exec_op(struct spi_nor *nor, struct spi_mem_op *op)
> +{
> +	int error;
>  
> -	if (usebouncebuf && op->data.dir == SPI_MEM_DATA_IN)
> -		memcpy(rdbuf, nor->bouncebuf, op->data.nbytes);
> +	error = spi_mem_adjust_op_size(nor->spimem, op);
> +	if (error)
> +		return error;
>  
> -	return op->data.nbytes;
> +	return spi_mem_exec_op(nor->spimem, op);
>  }
>  
>  /**
> @@ -315,6 +305,8 @@ static ssize_t spi_nor_spimem_read_data(
>  			   SPI_MEM_OP_ADDR(nor->addr_width, from, 1),
>  			   SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
>  			   SPI_MEM_OP_DATA_IN(len, buf, 1));
> +	bool usebouncebuf;
> +	int error;
>  
>  	/* get transfer protocols. */
>  	op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->read_proto);
> @@ -325,7 +317,16 @@ static ssize_t spi_nor_spimem_read_data(
>  	/* convert the dummy cycles to the number of bytes */
>  	op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
>  
> -	return spi_nor_spimem_xfer_data(nor, &op);
> +	usebouncebuf = spi_nor_spimem_bounce(nor, &op);
> +
> +	error = spi_nor_spimem_exec_op(nor, &op);
> +	if (error)
> +		return error;
> +
> +	if (usebouncebuf)
> +		memcpy(buf, op.data.buf.in, op.data.nbytes);
> +
> +	return op.data.nbytes;
>  }
>  
>  /**
> @@ -364,6 +365,8 @@ static ssize_t spi_nor_spimem_write_data
>  			   SPI_MEM_OP_ADDR(nor->addr_width, to, 1),
>  			   SPI_MEM_OP_NO_DUMMY,
>  			   SPI_MEM_OP_DATA_OUT(len, buf, 1));
> +	bool usebouncebuf;
> +	int error;
>  
>  	op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->write_proto);
>  	op.addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->write_proto);
> @@ -372,7 +375,15 @@ static ssize_t spi_nor_spimem_write_data
>  	if (nor->program_opcode == SPINOR_OP_AAI_WP && nor->sst_write_second)
>  		op.addr.nbytes = 0;
>  
> -	return spi_nor_spimem_xfer_data(nor, &op);
> +	usebouncebuf = spi_nor_spimem_bounce(nor, &op);
> +	if (usebouncebuf)
> +		memcpy(nor->bouncebuf, buf, op.data.nbytes);
> +
> +	error = spi_nor_spimem_exec_op(nor, &op);
> +	if (error)
> +		return error;
> +
> +	return op.data.nbytes;
>  }
>  
>  /**
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
