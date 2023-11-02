Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3712C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Nov 2023 21:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJ5DSvyDw1HqFGdX0XFymtwl2k6MI+lDhaOvXzKrdSE=; b=O1wSTrvr1ZYKn8+ZCRaY8YAqZ2
	sC84+MZl1Y1VvuBaM6WLoARCb+TEdCCygT/z7o2UH76iXTBFjdHLKyMcXyA/nBjSPgLfQmJnDB2iq
	Y0YAvo33PE99pZJu+O3ngxqHZ86AnC0ai5MnCvgU/Ou1My6OtYkILTrH2SQJFmPC+gxP7+1J4emk/
	JP4uiMti4QonzCLFCIEJ2+SwmUl4rjrGSqiEn1t6KglqVnbvG2MjID/Yfvq6HCf76uxIYGTnNDf5J
	eB++plwt2Y9RJBQnZ0s++S3IoPrK8nvvR44YXmgldzoFBCohjwFLKclADBkMmgFUHNOXjj3jvju9/
	q+IEHGNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyfT2-00AKUB-10;
	Thu, 02 Nov 2023 21:43:08 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyfSw-00AKSS-0M;
	Thu, 02 Nov 2023 21:43:06 +0000
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0575F870AC;
	Thu,  2 Nov 2023 22:42:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1698961378;
	bh=q+Tbai9YO0Sr8+CE3PM7FvYN61mrc/i9cERa25SrijI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rkN3QqsHVujJvN6E0uvcTUeWE5eZ/fZnA9Pcxxqp94ovwC6crBv8bgrweTZkGxDu/
	 n5zJtwJ9QY6mHJhywBfZPE47UFIMiQT15mTStW2y5Gwn8fZ8a3Q7Vn6X7TXaU+Ppnc
	 YjhwbytadPyTga6GXYN0Q4fCrwrMOON75+G1lRvzNuK+dPAkVEsEGO3yy4QB8ZvaLV
	 LqHt2e/IXU8w+3lf8ZALH7kv9k7w/70hY1HaaMfyyMUV8aTy4+CYaEC2TvqLRZgYh0
	 HCZZWbB9QdUJsw0oS3hfPnqE4L/LO7uzoX4o1xoIEbRqALavNUzUsn1oSLw9re2Q0u
	 6V/mlmvmHvBGg==
MIME-Version: 1.0
Date: Thu, 02 Nov 2023 18:42:57 -0300
From: Fabio Estevam <festevam@denx.de>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, michael@walle.cc,
 pratyush@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, bacem.daassi@infineon.com,
 miquel.raynal@bootlin.com, richard@nod.at
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
In-Reply-To: <c3f2b8a6-8b23-4a33-948e-62ff64db9a2f@linaro.org>
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
 <20231101145853.524045-3-tudor.ambarus@linaro.org>
 <7fc95ddf-c860-49b9-93de-ef32b9383e42@linaro.org>
 <216d99d671caa2465519fcc3360c5001@denx.de>
 <e3901646-c918-426f-b219-e1670dc1e854@linaro.org>
 <5c48f93a9dd9b2bdc1874dd4eebbf5bb@denx.de>
 <a7bee4f0-8591-411a-a105-0284df22c464@linaro.org>
 <632457ed6b022856496537bdf8a738ba@denx.de>
 <aa123456-7ec9-4bdc-a521-66c9582d5d45@linaro.org>
 <c26f6623-2d58-43ed-95bb-957870890a02@linaro.org>
 <6f1aa670-b3f7-4ea3-bc80-773a57e46c36@linaro.org>
 <968ba4c249926e986b02440ad0421e98@denx.de>
 <f2141a88-13d4-47b8-8382-5df8cc1bc42b@linaro.org>
 <cf0e4284f2e3193ddd57b715196ca202@denx.de>
 <25ca1a4c-683c-4b6d-938b-07323b211815@linaro.org>
 <c3f2b8a6-8b23-4a33-948e-62ff64db9a2f@linaro.org>
Message-ID: <5872f7233bc0dc4669aa1324f3ae3cf0@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_144302_371373_5BAF75E0 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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

On 02/11/2023 15:56, Tudor Ambarus wrote:

> Let's try something else:
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 5584bf9cbfd1..a0af7a7eb727 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1074,7 +1074,7 @@ static int spi_nor_erase_die(struct spi_nor *nor,
> loff_t addr, size_t die_size)
> 
>         if (nor->spimem) {
>                 struct spi_mem_op op =
> -                       
> SPI_NOR_DIE_ERASE_OP(nor->params->die_erase_opcode,
> +                       SPI_NOR_DIE_ERASE_OP(nor->erase_opcode,
>                                              nor->addr_nbytes, addr,
> multi_die);
> 
>                 spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> 
> I expect that with this the first sector from each die will be erased.

You are right. This is exactly what happens with this change:

First die:

~# hexdump  /dev/mtd0
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0010000 9231 efb8 d664 d77b 231c 3522 d7e8 4f6e

Second die:

~# hexdump -s 0x4000000 /dev/mtd0
4000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
4010000 0418 0518 60a0 9214 2411 2004 c144 9e2b

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
