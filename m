Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC8AC3DA6E
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jan 2024 12:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DqDc76xTopiJn+hYZRLL0afpNolDgkhtYJ81OGCFk8k=; b=04GE8+ttFjeKWviQviHLP+dVgz
	s8YnDaJFw08lvQ63iPa6AGHvPL4lvV6bxwAyoQ7C2NTQiC8Q3hn101M72XLFLpipQ8ReaNW045CQq
	iYyCmMVMgCuTGCWo6BDpELRnRIFihTl9HNvrYKEZb+2RMS3YWlRDbBBKrJ5LTc8WUG5D5cvUZWvOX
	dqgDOTZseVprkHjLknQoUybVcRkfs7ek1c3IBLkVuhk2WeEk9v0SC5F/3m2pBanV/8r5kI0ngjtd8
	tcji4pzpjIkge4T5DwXoBGW7MgpvjEj/BJpXIBxg/JUm8QE2lgakRI7eV6gD+d7pA/JCwWPvirpBn
	7mnrZ5Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLjck-00Gs0Y-22;
	Fri, 05 Jan 2024 12:48:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLjch-00Gs0A-28
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jan 2024 12:48:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 19CB661A02;
	Fri,  5 Jan 2024 12:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E36C433C8;
	Fri,  5 Jan 2024 12:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704458905;
	bh=XJmiGk8sptCWVizDyVzKcxV5Q2XCfVQuIsFaxvOedVM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iyx1kQ6zIJu71r4Wn86J4ce1+qBmIDKi9nSxeNhigwWMIPA3ShMZ3x2AskQwp/irf
	 vGvsRLxwo6iiauwiJ1/V/b3+XmOxH1DuWnKf1MiZvauFoEHgF01CjIPeZM74aWT4c4
	 X/RnUr9oGf2UBUpmnBuEFt0A6gis6m0ZpRmmFQvq8EcS1wWmrdfX6NtegmqmZfejeJ
	 AClIzlGpjwfk7CNdQwXzdMv+ZkN/4fwIHFq7/wlyShjC79k0cWPQaZsNswm+FAPlNu
	 xH7ZBsxHlJoX8eWnVC94lDyB4UD7cJT91LQegA3R7ji15FLf7HeAoAJEawdISjVH64
	 ITMDMtSn2AIew==
MIME-Version: 1.0
Date: Fri, 05 Jan 2024 13:48:21 +0100
From: Michael Walle <mwalle@kernel.org>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v7 2/7] spi: spi-mem: Allow specifying the byte order in
 DTR mode
In-Reply-To: <20231221090702.103027-3-jaimeliao.tw@gmail.com>
References: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
 <20231221090702.103027-3-jaimeliao.tw@gmail.com>
Message-ID: <efe82e9c57edd12714e67215bb71d286@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_044827_808988_A199862D 
X-CRM114-Status: GOOD (  26.99  )
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
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> ---
>  drivers/spi/spi-mem.c       | 4 ++++
>  include/linux/spi/spi-mem.h | 6 ++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index edd7430d4c05..9c03b5617fff 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -172,6 +172,10 @@ bool spi_mem_default_supports_op(struct spi_mem 
> *mem,
>  		if (!spi_mem_controller_is_capable(ctlr, dtr))
>  			return false;
> 
> +		if (op->data.dtr_swab16 &&
> +		    !(spi_mem_controller_is_capable(ctlr, dtr_swab16)))

unnecessary parentheses.

> +			return false;
> +
>  		if (op->cmd.nbytes != 2)
>  			return false;
>  	} else {
> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> index 6b0a7dc48a4b..d4935c5c3c7a 100644
> --- a/include/linux/spi/spi-mem.h
> +++ b/include/linux/spi/spi-mem.h
> @@ -89,6 +89,8 @@ enum spi_mem_data_dir {
>   * @dummy.dtr: whether the dummy bytes should be sent in DTR mode or 
> not
>   * @data.buswidth: number of IO lanes used to send/receive the data
>   * @data.dtr: whether the data should be sent in DTR mode or not
> + * @data.dtr_swab16: whether the byte order of 16-bit words is swapped 
> when read
> + *		     or written in Octal DTR mode compared to STR mode.

maybe just swap16? I'm not sure. Doesn't really apply to DTR, because
it is not a thing for 4bit DTR for example. Just for 8d8d8d and "faster"
because there you transmit more than one byte in one clock cycle.

"whether bytes within a 16-bit word should be swapped. Some flashes will
swap the data in 8D mode. In that case, this should be set to true
to instruct the controller to swap the data back on the fly.

>   * @data.ecc: whether error correction is required or not
>   * @data.dir: direction of the transfer
>   * @data.nbytes: number of data bytes to send/receive. Can be zero if 
> the
> @@ -123,6 +125,7 @@ struct spi_mem_op {
>  	struct {
>  		u8 buswidth;
>  		u8 dtr : 1;
> +		u8 dtr_swab16 : 1;
>  		u8 ecc : 1;
>  		u8 __pad : 6;

__pad : 5;

Does anyone know if this is really necessary?

>  		enum spi_mem_data_dir dir;
> @@ -294,10 +297,13 @@ struct spi_controller_mem_ops {
>  /**
>   * struct spi_controller_mem_caps - SPI memory controller capabilities
>   * @dtr: Supports DTR operations
> + * @dtr_swab16: Supports swapping bytes on a 16 bit boundary when 
> configured in
> + *		Octal DTR

I guess the same comment as above applies, doesn't really have something
to do with dtr, but only 8d.

-michael

>   * @ecc: Supports operations with error correction
>   */
>  struct spi_controller_mem_caps {
>  	bool dtr;
> +	bool dtr_swab16;
>  	bool ecc;
>  };

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
