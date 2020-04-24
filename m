Return-Path: <SRS0=YgIB=6I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA587C54FD0
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 13:36:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE1CA20736
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 13:36:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dVqo85dJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE1CA20736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yadavpratyush.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWE3pe6slzy2HqTFYuUj0WkY2C4PNGfXvvKt6H+exTM=; b=dVqo85dJSiqnMk
	L3S+sN1b8g9/MgHXvL18VJX8GnrSRWU5Tpfymt7iTAoaaXq+8mhryifHSMR0DXZ1PKZLz7DbeasrF
	+B3BM7QFhlbwCY7ywicjZzx414kgPZFsnI3q/OKyT32hP/kys88tkzePlRywqZ3rhwF9J4Wg/Is+q
	F3HS6+LWG8r9ZIEcEP81HEhUQBY7zhBhShlWSP1t+omVBJ3El2SYKInrHLJyd08VrtWzZen3b+UnL
	8biPapMlk9z1F2zDh2XL5nbKT8JAblhrdvR+NrrdqqexFcXzH8UpukvTtyw/piFxIgB5Rya1UI6me
	9/tnUD1qlNXXJcxGuYIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRyUy-0008BA-UP; Fri, 24 Apr 2020 13:36:08 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRyUw-00089s-1e
 for linux-mtd@lists.infradead.org; Fri, 24 Apr 2020 13:36:07 +0000
X-Originating-IP: 42.109.208.177
Received: from localhost (unknown [42.109.208.177])
 (Authenticated sender: me@yadavpratyush.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 34F40C0014;
 Fri, 24 Apr 2020 13:35:59 +0000 (UTC)
Date: Fri, 24 Apr 2020 19:05:52 +0530
From: Pratyush Yadav <me@yadavpratyush.com>
To: Yicong Yang <yangyicong@hisilicon.com>
Subject: Re: [RFC PATCH 2/2] mtd: spi-nor: Disable the flash quad mode in
 spi_nor_restore()
Message-ID: <20200424133552.oymmxczeyuak6wo7@yadavpratyush.com>
References: <1587720044-49172-1-git-send-email-yangyicong@hisilicon.com>
 <1587720044-49172-3-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587720044-49172-3-git-send-email-yangyicong@hisilicon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_063606_222359_9DA479A6 
X-CRM114-Status: GOOD (  13.99  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com,
 tudor.ambarus@microchip.com, richard@nod.at, john.garry@huawei.com,
 linuxarm@huawei.com, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 alexander.sverdlin@nokia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Yicong,

On 24/04/20 05:20PM, Yicong Yang wrote:
> If the flash's quad mode is enabled, it'll remain in the quad mode when
> it's removed. If we drive the flash next time in SPI/Dual mode, then
> problem occurs as the flash's quad enable bit is not cleared.
> 
> Disable the quad mode in spi_nor_restore(), the flash will leave
> quad mode when remove. This will make sure the flash always enter the
> correct mode when loaded.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  drivers/mtd/spi-nor/core.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index d0516e8..611c0b7 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3001,6 +3001,11 @@ void spi_nor_restore(struct spi_nor *nor)
>  	if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES) &&
>  	    nor->flags & SNOR_F_BROKEN_RESET)
>  		nor->params->set_4byte_addr_mode(nor, false);
> +
> +	/* disable quad mode */
> +	if (spi_nor_get_protocol_width(nor->read_proto) == 4 ||
> +	    spi_nor_get_protocol_width(nor->write_proto) == 4)
> +		nor->params->quad_enable(nor, false);

If a flash doesn't have a quad enable function, this will lead to a NULL 
pointer access. Please use spi_nor_quad_enable() instead.

>  }
>  EXPORT_SYMBOL_GPL(spi_nor_restore);

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
