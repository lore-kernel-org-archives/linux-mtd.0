Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E4CC4828D
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Feb 2024 15:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cud6YSzjvOyXcrwKsa3KvoItUsi+KY2jiMXe1r35BW8=; b=tGV2TTQbt4Hub+W5oI7I4lm+Ny
	85FLbbQi/GsHHzR4ugBUiIIayz2kTvDhF6T+53Pv9f2xaDes07/OsGLNa5j0lk0V+wHShV/rR0B8b
	4ZL9Qp3vZ+eVYGZhR13wSeLs/IkPA6yN4Rie+TR9xjdL4WzRfeG0u0mIU9NhYQ0C6fAnjrUAr7bM/
	FPHrCKrwBVB94Ldgp2OIikqM8NGjoBrDdyKzguDkpLDBxXHjmKjNR3gcs1LMCwT8R9y+KEqEDdrmx
	zmuSgbZO/h/DHMs4j5Z6UpdYIQ47goIsKXa5hFBPZVz7x6S62/ZkJvkPVfQx8r3OcWVUiheL1u0FQ
	VsbelowA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVYpY-00000008P6g-1Rjt;
	Thu, 01 Feb 2024 15:18:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVYpV-00000008P69-32YA
	for linux-mtd@lists.infradead.org;
	Thu, 01 Feb 2024 15:18:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 25F0B61D52;
	Thu,  1 Feb 2024 15:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E42C433C7;
	Thu,  1 Feb 2024 15:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706800696;
	bh=lmRhxmDHzvLoaCUgcDTCJ9u+TMkemcWwqNv6zznEFRo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UDPXnM+0stYxaKgDsbpESo+ULmedE82hmPD3dImT0zWmUXm1MhuWUbq0hvdRqibFw
	 /ZErnatBJoWBaf80pWPnUP2og+2/EIxy8vSxFLZZPSVH931ch578JXydBJFsQsA7gp
	 X4Bp2QbbS6aF32u8FC4c1baLoy/hqDynsBCSCqra7j8bm4WCq6D4QFZeSILKlTJq1q
	 UAgdSyeS/mNB/4ObtgVXTMhwn1yPCrA2UxLzjWOPuwrLV5bdG0x/Sx1QkKQIVZ508p
	 VvDrMtqCpmmnRK/gt0RnlvF2LAUxW/rzoIlcLvfPeam5Y8ogAjWWAQQ4gXypAgMLfu
	 dn9Z5ZaJTULfQ==
MIME-Version: 1.0
Date: Thu, 01 Feb 2024 16:18:12 +0100
From: Michael Walle <mwalle@kernel.org>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 tudor.ambarus@linaro.org, pratyush@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, broonie@kernel.org, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v8 2/9] spi: spi-mem: Allow specifying the byte order in
 Octal DTR mode
In-Reply-To: <20240201094353.33281-3-jaimeliao.tw@gmail.com>
References: <20240201094353.33281-1-jaimeliao.tw@gmail.com>
 <20240201094353.33281-3-jaimeliao.tw@gmail.com>
Message-ID: <e256a1842aeb911083021a2e25baa370@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_071817_891125_5483DEFD 
X-CRM114-Status: GOOD (  28.60  )
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

Hi,

> From: JaimeLiao <jaimeliao@mxic.com.tw>

I think Tudor told you to keep his name/mail here.

> There are NOR flashes (Macronix) that swap the bytes on a 16-bit
> boundary when configured in Octal DTR mode. The byte order of
> 16-bit words is swapped when read or written in Octal Double
> Transfer Rate (DTR) mode compared to Single Transfer Rate (STR)
> modes. If one writes D0 D1 D2 D3 bytes using 1-1-1 mode, and uses
> 8D-8D-8D SPI mode for reading, it will read back D1 D0 D3 D2.
> Swapping the bytes may introduce some endianness problems. It can
> affect the boot sequence if the entire boot sequence is not handled
> in either 8D-8D-8D mode or 1-1-1 mode. So we must swap the bytes
> back to have the same byte order as in STR modes. Fortunately there
> are controllers that could swap the bytes back at runtime,
> addressing the flash's endiannesses requirements. Provide a way for
> the upper layers to specify the byte order in Octal DTR mode.
> 
> Merge Tudor's patch and add modifications for suiting newer version
> of Linux kernel.
> 
> Suggested-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> ---
>  drivers/spi/spi-mem.c       | 4 ++++
>  include/linux/spi/spi-mem.h | 6 ++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index 2dc8ceb85374..f8120f6b288f 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -172,6 +172,10 @@ bool spi_mem_default_supports_op(struct spi_mem 
> *mem,
>  		if (!spi_mem_controller_is_capable(ctlr, dtr))
>  			return false;
> 
> +		if (op->data.swap16 &&
> +		    !spi_mem_controller_is_capable(ctlr, swap16))

Since you need to redo this anyway (see below):
This can now be one line. Please keep in mind that the 80char limit
was extended to 100 chars some time ago. And I think this reads
better if its just one line.

> +			return false;
> +
>  		if (op->cmd.nbytes != 2)
>  			return false;
>  	} else {
> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> index f866d5c8ed32..8df44fbc9d99 100644
> --- a/include/linux/spi/spi-mem.h
> +++ b/include/linux/spi/spi-mem.h
> @@ -89,6 +89,8 @@ enum spi_mem_data_dir {
>   * @dummy.dtr: whether the dummy bytes should be sent in DTR mode or 
> not
>   * @data.buswidth: number of IO lanes used to send/receive the data
>   * @data.dtr: whether the data should be sent in DTR mode or not
> + * @data.swap16: whether the byte order of 16-bit words is swapped 
> when read
> + *		 or written in Octal DTR mode compared to STR mode.

I think this was ordered alphabetically in the former patch, but since
you've renamed it to swap16 now the order would change. I don't have
any preference here, just wanted to point that out. I just noticed
because the new member "swap16" in spi_controller_mem_caps was added in
the middle, which looked odd.

>   * @data.ecc: whether error correction is required or not
>   * @data.dir: direction of the transfer
>   * @data.nbytes: number of data bytes to send/receive. Can be zero if 
> the
> @@ -123,6 +125,7 @@ struct spi_mem_op {
>  	struct {
>  		u8 buswidth;
>  		u8 dtr : 1;
> +		u8 swap16 : 1;
>  		u8 ecc : 1;
>  		u8 __pad : 6;

Still wrong, please go over all the previous remarks, to be clear you 
have
to use "__pad : 5" here.

Otherwise looks good. So with the above fixed:

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

>  		enum spi_mem_data_dir dir;
> @@ -296,10 +299,13 @@ struct spi_controller_mem_ops {
>  /**
>   * struct spi_controller_mem_caps - SPI memory controller capabilities
>   * @dtr: Supports DTR operations
> + * @swap16: Supports swapping bytes on a 16 bit boundary when 
> configured in
> + *	    Octal DTR
>   * @ecc: Supports operations with error correction
>   */
>  struct spi_controller_mem_caps {
>  	bool dtr;
> +	bool swap16;
>  	bool ecc;
>  };

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
