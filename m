Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5D8C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 07:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/SKb58IlsUxiDqhLXyOFkDWmymWgxtFvz5zTefoIC8=; b=UzqkPP4ITtVI9B95U1RxgH4Ayg
	O+CcOY5QhXUvJJkH+co8bjFnsMjePh5ONj7gIJERAKRIPofsqgtIAIVUMDPMFea8FThT9qgstE7on
	UMMu0jazxiEag23DTwgmBdu05vl9rsmQVBwZ46hTq26UNFEVzSZZjpO5R8quETgaO2q0RXQ4TnXg0
	Qlszn+1vdB3YI2Qjqwyh3h7a6tjsdz9BbqAswrEF2OKKTIvF74jePNXkLnPLv+ZiT+SjgkhPTf03m
	08bum/L/j33TOAgetz8L1qIK8QlKQBL9w56o6VF256WKrh4KrU+EEAkOvkIPiRCu3VCBQIGF3BeFM
	d3QxvYFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM3JM-0043Rs-74; Mon, 21 Feb 2022 07:40:44 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM3JJ-0043Q3-Hv
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 07:40:43 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 5CFC12223A;
 Mon, 21 Feb 2022 08:40:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645429239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jk3lDnI8DX9v4V3hx6YghZovwYBmB0LKbO0lcLOwXUc=;
 b=J7kFqRXevRKTH+kNOmTACu4gS8Fb2rSygGQMfeeCOXbGzPzM8kVGbj8VsZu/NPo+nr2JyQ
 sasu4sTTfaRH1KGNGQvUCr+Ap3/uJCV4F4XdfjstQQSsYIHApkz7t7KNYh7D6zv+HzJhn5
 Y2gzf2QWXPL8MFtFu2pRs40MDE+c2YI=
MIME-Version: 1.0
Date: Mon, 21 Feb 2022 08:40:39 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, broonie@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 nicolas.ferre@microchip.com, zhengxunli@mxic.com.tw, jaimeliao@mxic.com.tw
Subject: Re: [PATCH 3/4] mtd: spi-nor: sfdp: Get the 8D-8D-8D byte order from
 BFPT
In-Reply-To: <20220218145900.1440045-4-tudor.ambarus@microchip.com>
References: <20220218145900.1440045-1-tudor.ambarus@microchip.com>
 <20220218145900.1440045-4-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <ac94e7628af971121921961fa4209683@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_234041_793291_66029A5C 
X-CRM114-Status: GOOD (  13.83  )
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

Am 2022-02-18 15:58, schrieb Tudor Ambarus:
> Parse BFPT in order to retrieve the byte order in 8D-8D-8D mode.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/sfdp.c | 3 +++
>  drivers/mtd/spi-nor/sfdp.h | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index a5211543d30d..551edbb039f0 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -633,6 +633,9 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  		return -EOPNOTSUPP;
>  	}
> 
> +	if (bfpt.dwords[BFPT_DWORD(18)] & BFPT_DWORD18_BYTE_ORDER_SWAPPED)
> +		nor->flags |= SNOR_F_DTR_BSWAP16;
> +
>  	return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
>  }
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
> index bbf80d2990ab..9a834ea31c16 100644
> --- a/drivers/mtd/spi-nor/sfdp.h
> +++ b/drivers/mtd/spi-nor/sfdp.h
> @@ -97,6 +97,7 @@ struct sfdp_bfpt {
>  #define BFPT_DWORD18_CMD_EXT_INV		(0x1UL << 29) /* Invert */
>  #define BFPT_DWORD18_CMD_EXT_RES		(0x2UL << 29) /* Reserved */
>  #define BFPT_DWORD18_CMD_EXT_16B		(0x3UL << 29) /* 16-bit opcode */
> +#define BFPT_DWORD18_BYTE_ORDER_SWAPPED		BIT(31)
> 
>  struct sfdp_parameter_header {
>  	u8		id_lsb;

Reviewed-by: Michael Walle <michael@walle.cc>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
