Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40218C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 14:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dZmx+hv6vy7DX1gHd9/jfLYwubYQ7PIOUgfcV/o6a0U=; b=qKiuF350xgPs4u
	jkHZ4NwjvkEc17Bw66JWEsDPQ0oBsAL8C04Z60/ozRyuboy6JnJeMuMd1II627Ezvi93BJZRFJb2z
	sNKv4hoWg7DiAjLSA7J0TlylajEg9haEIoJygU22Q9shgS+WKQ3cEFecFmMgdRUNErR7TNl9Aswmh
	I+/VJ/QuAwnp6hgoXA5J4no6bcnzzvOOU6OGBXn/TW0YJ0pBW7SosVnUbpDJNqWvLpU0rROggVbSr
	7HyDZdom6iUVMBX3OX+Jx7tw9QZkXWvnVK4nu4G3J7gyRKfFOx2WGDZsKZ0E8Q12AbNbd80YygWlk
	t/WnzOPYWQQ5I66nQTKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt97w-004jgB-1L; Mon, 23 May 2022 14:33:44 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt97s-004jdJ-Bd
 for linux-mtd@lists.infradead.org; Mon, 23 May 2022 14:33:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653316420; x=1684852420;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IuGXxsgG3ZhE9KtfQ6orMoFZqsUCaaLiOomnMzr6usE=;
 b=UfCJ2qYUejT9NJSPAzx66d8a/AsmVBGcF6GWRy6/GRhk3wYemtzfF5hP
 yhpu2qwQL0OnMUrRtJpngMb/U6CJJW3hWoJT/pY1zRpxiEhqfVITdp1RD
 V1E+r6AK0CmsQMtNU8ZHVPk3enMubURPUKdV7CcmqhiNB70336xigDjAL
 AC/WgrLGzdaZALf/Oti9C0X3ZGxty8lMk6u25HWQYm3BU8wxwzOjbrOyf
 idzCA4bPZ8f+k8CL2nz6/qjlrLngdf9V6Rwv/U36MIHUgehq5erBCe03w
 csZoaWjcxVbIFFCaD9p1g+gw3371sCrCNaBQLN00vWIA1L6+pCiDg6D/z w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="255304352"
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="255304352"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 07:33:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="600679342"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.249.171.16])
 ([10.249.171.16])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 07:33:34 -0700
Message-ID: <fde9bd5a-7161-9222-4719-4279b2416163@linux.intel.com>
Date: Mon, 23 May 2022 22:33:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] mtd: spi-nor: macronix: Add support for mx66l2g45g
Content-Language: en-US
To: linux-mtd@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 Michael Walle <michael@walle.cc>
Cc: linux-kernel@vger.kernel.org
References: <20220523143002.1754922-1-jiaqing.zhao@linux.intel.com>
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <20220523143002.1754922-1-jiaqing.zhao@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_073340_541006_2D948E3A 
X-CRM114-Status: GOOD (  13.28  )
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

Use PARSE_SFDP for now as the SNOR_ID3() patch is not merged yet, will
switch to it after it is merged.

On 2022-05-23 22:30, Jiaqing Zhao wrote:
> Macronix mx66l2g45g is a 3V, 2Gbit (256MB) NOR flash that supports
> x1, x2, and x4 operation modes.
> 
> Tested read/write/erase with Aspeed AST2600 BMC SoC operating in x2
> mode at 50MHz, using Aspeed spi-mem driver.
> 
> Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
> ---
>  drivers/mtd/spi-nor/macronix.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index d81a4cb2812b..fd24ce9f02e2 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -95,6 +95,8 @@ static const struct flash_info macronix_nor_parts[] = {
>  	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },
> +	{ "mx66l2g45g",  INFO(0xc2201c, 0, 64 * 1024, 4096)
> +		PARSE_SFDP },
>  	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048)
>  		NO_SFDP_FLAGS(SPI_NOR_QUAD_READ) },
>  	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
