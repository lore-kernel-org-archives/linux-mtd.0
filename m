Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEAB1C4320E
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 07:58:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7818A6135A
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 07:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7818A6135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AQ8Q1Jzt0jL1v9VsD8yfeJ0HGW89yQGtxL3IXqbC6es=; b=ldYULouczz4Div
	eZK5Fr9qUvbSkbqgvJpbN4GoAN8rdp+iNfB5NMbyK0Y3YS90JqVOSwBVQ5eRnMq/d7DHQEuzGuBC9
	Jcsr2DXOhI5VqfAddY4+bacvGzn/MPkFxQ6vwS9ZPRfety5iJWBa164tc3lg+FX7sc3B0JDQ0S67n
	nQEtNiHb/zqaoIJYBFFqQBqORajOm9Zy3OsGB9pwzGFa/CzMjQaUChkyuoW6Ses3vF6aGZh7Owcyl
	FJI0uUIDAHucWgLACwwc6EIksonVnmSBd7uwipXOSX8RxphGUudcoQYsjjlNaMFkcz6Ejlco8/NMM
	0/c4ydteY0mtaCitG6Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI4q2-00FpZv-8n; Mon, 23 Aug 2021 07:57:46 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI4pz-00FpZO-Ei
 for linux-mtd@lists.infradead.org; Mon, 23 Aug 2021 07:57:44 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CAB921F424B6;
 Mon, 23 Aug 2021 08:57:41 +0100 (BST)
Date: Mon, 23 Aug 2021 09:57:38 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH 01/13] spi: spi-mem: Add DTR templates for cmd, address,
 dummy and data phase
Message-ID: <20210823095738.297d33e9@collabora.com>
In-Reply-To: <20210713130538.646-2-a-nandan@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-2-a-nandan@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_005743_683141_382B9190 
X-CRM114-Status: GOOD (  19.86  )
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

On Tue, 13 Jul 2021 13:05:26 +0000
Apurva Nandan <a-nandan@ti.com> wrote:

> Setting dtr field of spi_mem_op is useful when creating templates
> for DTR ops in spinand.h. Also, 2 bytes cmd phases are required when
> operating in Octal DTR SPI mode.
> 
> Create new templates for dtr mode cmd, address, dummy and data phase
> in spi_mem_op, which set the dtr field to 1 and also allow passing
> the nbytes for the cmd phase.
> 
> Signed-off-by: Apurva Nandan <a-nandan@ti.com>
> ---
>  include/linux/spi/spi-mem.h | 87 ++++++++++++++++++++++++++-----------
>  1 file changed, 61 insertions(+), 26 deletions(-)
> 
> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> index 85e2ff7b840d..73e52a3ecf66 100644
> --- a/include/linux/spi/spi-mem.h
> +++ b/include/linux/spi/spi-mem.h
> @@ -13,46 +13,81 @@
>  
>  #include <linux/spi/spi.h>
>  
> -#define SPI_MEM_OP_CMD(__opcode, __buswidth)			\
> -	{							\
> -		.buswidth = __buswidth,				\
> -		.opcode = __opcode,				\
> -		.nbytes = 1,					\
> +#define SPI_MEM_OP_CMD_ALL_ARGS(__nbytes, __opcode, __buswidth, __dtr)	\
> +	{								\
> +		.buswidth = __buswidth,					\
> +		.opcode = __opcode,					\
> +		.nbytes = __nbytes,					\
> +		.dtr = __dtr,						\
>  	}
>  
> -#define SPI_MEM_OP_ADDR(__nbytes, __val, __buswidth)		\
> -	{							\
> -		.nbytes = __nbytes,				\
> -		.val = __val,					\
> -		.buswidth = __buswidth,				\
> +#define SPI_MEM_OP_CMD(__opcode, __buswidth)				\
> +	SPI_MEM_OP_CMD_ALL_ARGS(1, __opcode, __buswidth, 0)
> +
> +#define SPI_MEM_OP_CMD_DTR(__nbytes, __opcode, __buswidth)		\
> +	SPI_MEM_OP_CMD_ALL_ARGS(__nbytes, __opcode, __buswidth, 1)

I don't see the benefit of those ALL_ARGS() macros compared to the
definition of the _DTR() variants using raw struct initializers, but if
you think we will add more optional args and really care about saving a
few lines of code, maybe it'd be better to have something like:

#define SPI_MEM_OP_DTR .dtr = true
#define SPI_MEM_OP_CMD_BYTES(val) .nbytes = val

#define SPI_MEM_OP_EXT_CMD(__opcode, __buswidth, ...) \
	{ \
		.buswidth = __buswidth, \
		.opcode = __opcode, \
		__VA_ARGS__, \
	}

#define SPI_MEM_OP_CMD(__opcode, __buswidth) \
	SPI_MEM_OP_EXT_CMD(__opcode, __buswidth, \
			   SPI_MEM_OP_CMD_BYTES(1))

#define SPI_MEM_OP_CMD_DTR(__nbytes, __opcode, __buswidth) \
	SPI_MEM_OP_EXT_CMD(__opcode, __buswidth, \
			   SPI_MEM_OP_CMD_BYTES(__nbytes), \
			   SPI_MEM_OP_DTR)

so you don't have to patch all users every time you add an argument.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
