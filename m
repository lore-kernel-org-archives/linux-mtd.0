Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E058C5475B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Mar 2024 17:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VDAmg+NMMoluQ0w/v2QP2iZhgFVXcmHJQbE7/j5oy5c=; b=DgOSn7cjWp+aLv
	CaN+QPz/fv5u0kmcSRd6697840cOzpOZ5OA2P7KUVSqedhf/7gPyAGAjAlLKktddiu8mSDcBFv6fQ
	UI8lBZUiS2sYTMEzHgazNPq8MHuC9qMYVNjci/4II9ihMtX2h6q0a5Yr4+nYHVXkMvRmFXH9w02zR
	oRUQY0zYtXUVlVwZKTTx4jJuzLhibPSnk1HANgMv5b9tWmfpHDMc3TpkSjrJJcGe5CWCqMDJYdIZr
	ppquTjJLBRoslSYF+3CxjG4y69X5r6CfBrrSsv0c0CHzvUAV0P6f7dt/u+gu3OjMTAsjVaiP2Cmcu
	yTaazHI5npr5SNHSKnXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjjB5-00000002Sfv-3MNF;
	Mon, 11 Mar 2024 17:11:07 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjjB3-00000002SfA-0qcn
	for linux-mtd@lists.infradead.org;
	Mon, 11 Mar 2024 17:11:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710177063;
	bh=+lBe23s/WG6muqa4DBbIpUBMBeF/WOWUU+ZtlFupPx8=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=KH/wP4q03T8xPtqjrF1mQDBjJ7uFFF0tAoSP37d4ex4ee2AYE6fmE2A3EBPxWr5uH
	 i2ESweQDRMRO7DXqpnEwoNkQKnwkkbB8MwCg8bnYvuZoZMw5A3x6q00ykvCW37WrE2
	 L5zl/kHumRmGSP8qJlieiffr/Y27P4cI8gEZjIKf6R9dNsWQplboZpeNShG719gheL
	 ptCfxdmTPN572sl8mGhosZXLIwhFUL6RwudnHWPr4JBx97YrAonrRYl3TCyyNTulXz
	 vC9Z9LRHZTspNnyMVjLUICm+veAY/4sTCedd3Xr1guQ6G8u5yoERpzwkC2WE6Ea5zE
	 yWxz3+vwzWByg==
Received: from [10.193.1.1] (broslavsky.collaboradmins.com [68.183.210.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5A4C9378200D;
	Mon, 11 Mar 2024 17:10:59 +0000 (UTC)
Message-ID: <865fc24b-ae27-4084-893b-c5c389480a09@collabora.com>
Date: Mon, 11 Mar 2024 22:11:33 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, kernel@collabora.com,
 kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: core: correct type of i
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20240304090103.818092-1-usama.anjum@collabora.com>
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <20240304090103.818092-1-usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_101105_413861_D2B59F4C 
X-CRM114-Status: GOOD (  14.46  )
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

Soft reminder

On 3/4/24 2:01 PM, Muhammad Usama Anjum wrote:
> The i should be signed to find out the end of the loop. Otherwise,
> i >= 0 is always true and loop becomes infinite. Make its type to be
> int.
> 
> Fixes: 6a9eda34418f ("mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
> Changes since v1:
> - Make i int instead of u8
> ---
>  drivers/mtd/spi-nor/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 65b32ea59afc6..3e1f1913536bf 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3373,7 +3373,7 @@ static u32
>  spi_nor_get_region_erasesize(const struct spi_nor_erase_region *region,
>  			     const struct spi_nor_erase_type *erase_type)
>  {
> -	u8 i;
> +	int i;
>  
>  	if (region->overlaid)
>  		return region->size;

-- 
BR,
Muhammad Usama Anjum

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
