Return-Path: <SRS0=4Kqf=ZB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F388C43331
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Nov 2019 19:36:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8F0221882
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Nov 2019 19:36:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UtXVucSu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8F0221882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eLZl82HoasT1sYIkY4o31Po47D7CWgF1CywqGS0uYQY=; b=UtXVucSuyKA2pn
	Ro7pOHvpW9kmMr9+odb96eld7VwlHwNR6+bD1mV1RRHXZddC5cw6X6oIQbyVfJihkWOuHnzzgZJl/
	GE8rUn0MfwH+XdYrmYOXHBpfbPnC1R7D6fkbx2Y0AlCazRqIH/N7EAAvP4uupn8nERj/8eI+DUgkG
	jGLSVBV13e2oSSCcmw46j7RSVNQ43njhgBDMFJ8FrAsknOiWjJDkwOtSOHbqy2OQc5dK+BfUTAl45
	42lfHnDTBg4d9z6juTQZFnY2aJ8+/xKfz02bhdSAraUoaQlaEq69UtBz4GBTtZqH+aKdd7U/H2klV
	4MSm3WMKWOcpPzjh+q4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iTWWk-0002oE-HH; Sat, 09 Nov 2019 19:36:06 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iTWWh-0002ne-Dp
 for linux-mtd@lists.infradead.org; Sat, 09 Nov 2019 19:36:05 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id ACF9728533C;
 Sat,  9 Nov 2019 19:36:01 +0000 (GMT)
Date: Sat, 9 Nov 2019 20:35:58 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2] mtd: spi-nor: use spi-mem dirmap API
Message-ID: <20191109203558.4a03c398@collabora.com>
In-Reply-To: <ef173d36-c918-4636-ace6-f6ba82dac672@cogentembedded.com>
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
 <ef173d36-c918-4636-ace6-f6ba82dac672@cogentembedded.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191109_113603_729032_F18C0A94 
X-CRM114-Status: GOOD (  16.55  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 7 Nov 2019 23:49:12 +0300
Sergei Shtylyov <sergei.shtylyov@cogentembedded.com> wrote:

> Make use of the spi-mem direct mapping API to let advanced controllers
> optimize read/write operations when they support direct mapping.
> 
> Based on the original patch by Boris Brezillon <boris.brezillon@bootlin.com>.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> Changes in version 2:
> - moved the spi_mem_dirmap_{read|write}() calls from spi_nor_{read|write}() to
>   spi_nor_spimem_{read|write}_data().
> 
>  drivers/mtd/spi-nor/spi-nor.c |  125 +++++++++++++++++++++++++++++++++---------
>  include/linux/mtd/spi-nor.h   |    5 +
>  2 files changed, 104 insertions(+), 26 deletions(-)
> 
> Index: linux/drivers/mtd/spi-nor/spi-nor.c
> ===================================================================
> --- linux.orig/drivers/mtd/spi-nor/spi-nor.c
> +++ linux/drivers/mtd/spi-nor/spi-nor.c
> @@ -305,22 +305,28 @@ static ssize_t spi_nor_spimem_xfer_data(
>  static ssize_t spi_nor_spimem_read_data(struct spi_nor *nor, loff_t from,
>  					size_t len, u8 *buf)
>  {
> -	struct spi_mem_op op =
> -		SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 1),
> -			   SPI_MEM_OP_ADDR(nor->addr_width, from, 1),
> -			   SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
> -			   SPI_MEM_OP_DATA_IN(len, buf, 1));
> -
> -	/* get transfer protocols. */
> -	op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->read_proto);
> -	op.addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->read_proto);
> -	op.dummy.buswidth = op.addr.buswidth;
> -	op.data.buswidth = spi_nor_get_protocol_data_nbits(nor->read_proto);
> +	if (!nor->dirmap.rdesc) {
> +		struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 1),
> +				   SPI_MEM_OP_ADDR(nor->addr_width, from, 1),
> +				   SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
> +				   SPI_MEM_OP_DATA_IN(len, buf, 1));
> +
> +		/* get transfer protocols. */
> +		op.cmd.buswidth =
> +			spi_nor_get_protocol_inst_nbits(nor->read_proto);
> +		op.addr.buswidth =
> +			spi_nor_get_protocol_addr_nbits(nor->read_proto);
> +		op.dummy.buswidth = op.addr.buswidth;
> +		op.data.buswidth =
> +			spi_nor_get_protocol_data_nbits(nor->read_proto);
>  
> -	/* convert the dummy cycles to the number of bytes */
> -	op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
> +		/* convert the dummy cycles to the number of bytes */
> +		op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
>  
> -	return spi_nor_spimem_xfer_data(nor, &op);
> +		return spi_nor_spimem_xfer_data(nor, &op);
> +	}
> +	return spi_mem_dirmap_read(nor->dirmap.rdesc, from, len, buf);

Can we put the spi_mem_dirmap_read() in the if() branch instead of
having an extra level of indentation for the most complex block.

	if (nor->dirmap.rdesc)
		return spi_mem_dirmap_read(nor->dirmap.rdesc, from,
					   len, buf);

	...

(same comment applies to the write path BTW).

With this addressed, you can add

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Thanks,

Boris


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
