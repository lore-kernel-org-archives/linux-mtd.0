Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED32D1AD4B
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2024 11:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OOTcuTlZclriYPtXAvNe3GSLWHCuLOI4TxPEkyWb2H8=; b=O+Xv6HEg034k7V
	bikUI6lYi304ypj5VKws96X4wg02ZV7NbRnghfoxMnhJ1f/JU02iuMmVxYEhlZCbM1Yu8Wv/TQhll
	eXAy+8URcopxlMQ8Fp7u/qWgcdAU6YT2W0cOxYp1lMnZN3GPYuP4Y9b2sGw96VaswYUa2HLQnGpKg
	T5qFK870kCGZKQUKnHnQmP0QWCvx8xP/Yc0YhIVjW1MJA92n9RM8uHkoT8aJ66QDttNyGroGlB0md
	Slzoi43kTeLFh6v72b0HctZLorPXxppyrD5r85MEEjGKkVcGEhovLb+xOCNjwXQwwaUzoNS9CdzD+
	BlxhVl92KaVmi7fyxYHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t12ge-0000000BfgC-20Ay;
	Wed, 16 Oct 2024 11:59:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t12gb-0000000Bffo-0iAF
	for linux-mtd@lists.infradead.org;
	Wed, 16 Oct 2024 11:59:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8D755A43BEA;
	Wed, 16 Oct 2024 11:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A24A7C4CEC5;
	Wed, 16 Oct 2024 11:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729079967;
	bh=aWHuNN8uPm/sYGzW8ozY9x2N/AdHYDy5NzkjX5EzEEQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HSqszunxIbbNBKfebGMPxWVux0BF/YGp+9MaW8uqR9tEtCiBWkPgzh0aVc7Ub++s1
	 kUcp5eVzA7oG/nn/5pM3aBXbi+YWHDFh52n+3VJ0mmAfDj5Qf40eB7LTE/pFn87g/x
	 i2gzWGbf3ni5L9+JjWTruA9RVIzcuK5j2gaYeS3BFrSSAZh/wbLw2xICNAyGueJgzB
	 8yi7JpYr+yuNuxAE8atqX9vEalHVz3wieDlvzwzvn2SYCMplS5hx4T+99Dl9eHOOAF
	 5AxDTDJ9HI+AxqY2MpS3YgbhVL56+g0ZAqTtY/rwAOkbO7IRX1jBPIW3zrcoMxi7Rv
	 SXDdLNSZRhP0g==
From: Pratyush Yadav <pratyush@kernel.org>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org,  tudor.ambarus@linaro.org,
  pratyush@kernel.org,  mwalle@kernel.org,  miquel.raynal@bootlin.com,
  richard@nod.at,  vigneshr@ti.com,  Bacem.Daassi@infineon.com,  Takahiro
 Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH] mtd: spi-nor: spansion: Use nor->addr_nbytes in octal
 DTR mode in RD_ANY_REG_OP
In-Reply-To: <20241016000837.17951-1-Takahiro.Kuwano@infineon.com> (tkuw's
	message of "Wed, 16 Oct 2024 09:08:37 +0900")
References: <20241016000837.17951-1-Takahiro.Kuwano@infineon.com>
Date: Wed, 16 Oct 2024 13:59:24 +0200
Message-ID: <mafs0y12ocl7n.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_045929_292269_7A1799B5 
X-CRM114-Status: GOOD (  17.17  )
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

On Wed, Oct 16 2024, tkuw584924@gmail.com wrote:

> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>
> In octal DTR mode, RD_ANY_REG_OP needs to use 4-byte address regardless
> of flash's internal address mode. Use nor->addr_nbytes which is set to 4
> during setup.

If the flash is in Octal DTR mode, shouldn't addr_mode_nbytes also be 4?
IIUC addr_mode_nbytes is supposed to track the flash's internal address
mode. If the flash goes into Octal DTR mode then its internal address
mode switches to 4, and we should update params->addr_mode_nbytes as
well. We do that in spi_nor_set_4byte_addr_mode() for example.

I suppose the best place to do it for Octal DTR would be
spi_nor_set_octal_dtr().

Side note: honestly, this whole thing with params->addr_nbytes,
params->addr_mode_nbytes, and nor->addr_nbytes is quite confusing. I
hope to find some time to clean it up some day.

>
> Fixes: eff9604390d6 ("mtd: spi-nor: spansion: add octal DTR support in RD_ANY_REG_OP")
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/spi-nor/spansion.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index d6c92595f6bc..5a88a6096ca8 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -106,6 +106,7 @@ static int cypress_nor_sr_ready_and_clear_reg(struct spi_nor *nor, u64 addr)
>  	int ret;
>  
>  	if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
> +		op.addr.nbytes = nor->addr_nbytes;
>  		op.dummy.nbytes = params->rdsr_dummy;
>  		op.data.nbytes = 2;
>  	}

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
