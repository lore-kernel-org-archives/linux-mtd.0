Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE1EC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Dec 2021 16:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3dIKOoV9ml8rB1p3X82BURLbGeLNr/DaUl+Q86KnjGc=; b=Oruo2Xneq+ck/F
	qT/bs3MQr+bGrxHrxXTAM10FmVD0f94dK2R1ewV1x08T2XG3nCNG1pzpF4HrCP/9rqRhJ3t6ntP34
	vaZ9sK6b+hh6VV/04B1DFYxdGlxNDa1qej+thgKTl+DXoMieX0BjbKPfIGbaO+82DVfAu4vfgVwCX
	IWWuktV5LUsTHUWxk5DDpxNWUvR7XL10485GUzztkYIK2Oz7u6kYRqXsvKi/+f0M1JEUrYgZyljk1
	bbtBG7JiDeLUbomE1lGn7Iuwft66/d0MiLEjZQKu7hHpt9x/XXiVXXeVh6QyAd0hbHG/IUYqEIUYa
	Ljm9CrZYsUzuT0GVcysA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvik4-002aoB-9O; Fri, 10 Dec 2021 16:27:28 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvik0-002al5-Bm
 for linux-mtd@lists.infradead.org; Fri, 10 Dec 2021 16:27:26 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A2CA51F479A8;
 Fri, 10 Dec 2021 16:27:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639153641; bh=3vuMB4Y8J/FvjYDl+7RNvy8Z9ZC7n+/MQ/PXXyJh/1Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V64OsVGPdq6yjPHyIxE5dstQArR9N98BCYUbwqdHbLX1R02s6d6/lWexAR1/w1VX9
 dXQUs0vssOFcZWdHmFuJ/8n1VKqjtXxqHMfvbZEnMmJHQ4fhLxEu3b0zY1ZPieWUGK
 2GLu6+6RLhYcDj2HWH9UTzhHx3tgt6RMY1qeEH90KK7l/tuy6D1vhAJUuHL1kb33/p
 FYia2tWYjjSoAfFjpsK2ide1/MTO27His2jE89gvB8WxoHcKLezuzo4J1gMSOpCwVy
 RORjxdGNtnaK68V9w5gtN6cqPDS35g0/cpn15iJqoh+UdtcGNm8LvFUxCWxbgf+o+1
 nVXJVSQgCwcPA==
Date: Fri, 10 Dec 2021 17:27:17 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, Julien Su <juliensu@mxic.com.tw>, Jaime Liao
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v4 05/12] spi: spi-mem: Export the
 spi_mem_generic_supports_op() helper
Message-ID: <20211210172717.01fabb05@collabora.com>
In-Reply-To: <20211209174046.535229-6-miquel.raynal@bootlin.com>
References: <20211209174046.535229-1-miquel.raynal@bootlin.com>
 <20211209174046.535229-6-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_082724_640424_1BCA238C 
X-CRM114-Status: GOOD (  25.69  )
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

On Thu,  9 Dec 2021 18:40:39 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> The combination of checks against the number of supported operations is
> going to increase exponentially each time we add a new parameter. So far
> we only had a dtr parameter. Now we are introducing an ECC parameter. We
> need to make this helper available for drivers with specific needs,
> instead of creating another set of helpers each time we want to check
> something new. In the future if we see that many different drivers use
> the same parameter values, we might be tempted to create a specific
> helper for that. But for now, let's just make the generic one available.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/spi/spi-mem.c       |  7 ++++---
>  include/linux/spi/spi-mem.h | 13 +++++++++++++
>  2 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index 9e06cd918273..48b55395178f 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -160,9 +160,9 @@ static bool spi_mem_check_buswidth(struct spi_mem *mem,
>  	return true;
>  }
>  
> -static bool spi_mem_generic_supports_op(struct spi_mem *mem,
> -					const struct spi_mem_op *op,
> -					bool dtr, bool ecc)
> +bool spi_mem_generic_supports_op(struct spi_mem *mem,
> +				 const struct spi_mem_op *op,
> +				 bool dtr, bool ecc)

Looks like you're replacing a maintenance burden by another. Every time
you'll add a new capability, you'll have to patch all the wrappers and
the drivers using this generic function to pass the extra parameter.
How about passing a

	struct spi_mem_controller_caps {
		bool dtr;
		bool ecc;
	};

or making the caps a bitmask, such that next time you add a new cap, you
can just assume all drivers have it set to 0 by default.

>  {
>  	if (!dtr) {
>  		if (op->cmd.dtr || op->addr.dtr ||
> @@ -183,6 +183,7 @@ static bool spi_mem_generic_supports_op(struct spi_mem *mem,
>  
>  	return spi_mem_check_buswidth(mem, op);
>  }
> +EXPORT_SYMBOL_GPL(spi_mem_generic_supports_op);
>  
>  bool spi_mem_dtr_supports_op(struct spi_mem *mem,
>  			     const struct spi_mem_op *op)
> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> index 3be594be24c0..07f637cbe77d 100644
> --- a/include/linux/spi/spi-mem.h
> +++ b/include/linux/spi/spi-mem.h
> @@ -320,6 +320,10 @@ void spi_controller_dma_unmap_mem_op_data(struct spi_controller *ctlr,
>  					  const struct spi_mem_op *op,
>  					  struct sg_table *sg);
>  
> +bool spi_mem_generic_supports_op(struct spi_mem *mem,
> +				 const struct spi_mem_op *op,
> +				 bool dtr, bool ecc);
> +
>  bool spi_mem_default_supports_op(struct spi_mem *mem,
>  				 const struct spi_mem_op *op);
>  
> @@ -327,6 +331,7 @@ bool spi_mem_dtr_supports_op(struct spi_mem *mem,
>  			     const struct spi_mem_op *op);
>  
>  #else
> +
>  static inline int
>  spi_controller_dma_map_mem_op_data(struct spi_controller *ctlr,
>  				   const struct spi_mem_op *op,
> @@ -342,6 +347,14 @@ spi_controller_dma_unmap_mem_op_data(struct spi_controller *ctlr,
>  {
>  }
>  
> +static inline
> +bool spi_mem_generic_supports_op(struct spi_mem *mem,
> +				 const struct spi_mem_op *op,
> +				 bool dtr, bool ecc)
> +{
> +	return false;
> +}
> +
>  static inline
>  bool spi_mem_default_supports_op(struct spi_mem *mem,
>  				 const struct spi_mem_op *op)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
