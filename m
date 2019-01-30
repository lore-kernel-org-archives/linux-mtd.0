Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D150C282D7
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 17:17:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DEDD2087F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 17:17:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MVk8wOCm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tCZqGIjc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DEDD2087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SeZu8D34J0Jqy9C62K5eGoaZXePoUgtH5LMqx5eJTxQ=; b=MVk8wOCmfDtmWm
	4i7lewjdWvVj1yhAaL4DuC9i9SHfn56OUcfOyFO0xPcCYqADxp1bTLnrIo9IsN5S6I49LE8OUguNM
	IhOA7ZyqPjY07rQV7OH2jlQgRHfkFQY6fkC8UiscVi1PNeE7tq9bnNZgDlN+LMWc7/EfS7LvYBe/R
	hZTKBpV4Gx+kJvzCW6svf7TiPVgff5r5XlwLHnCo8ZL9O/V52i0GCdgVh0OjAjuLyc6dAg/+Kdz+y
	zTT8+aqAqyXIboJ056UxVs3vX5XL7JrCCe0sKvXWgZiWZw/hNGUDBXmhfZRNklVRyVs9AL+APfTJR
	fRyaMJAu1wSU6Rya+GRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gotTo-0001vR-M7; Wed, 30 Jan 2019 17:16:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gotTd-0001lU-H7; Wed, 30 Jan 2019 17:16:42 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D4E4B2087F;
 Wed, 30 Jan 2019 17:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548868601;
 bh=Oatp8hHzMKUaCp26kUxlwj8i5yYQCiqot1zlvVr2AE0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tCZqGIjcOgaTCj9ogJHGm3d7Ov8jJuPhwUZVJIaLsXpihDzQ2B1+qclis+/W1wkNe
 lpwadyRvoU96DWncXa/btn+bIp9ebgahJVKysWxslc/yDKJnt2OvHzFOXJbLfymFJF
 HPw51pP9OkpBWSh/l0/h0NVnoc6IzL8U3wVshOTY=
Date: Wed, 30 Jan 2019 18:16:32 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH 2/9] spi: atmel-quadspi: order header files inclusion
 alphabetically
Message-ID: <20190130181616.175206b8@bbrezillon>
In-Reply-To: <20190130150818.24902-3-tudor.ambarus@microchip.com>
References: <20190130150818.24902-1-tudor.ambarus@microchip.com>
 <20190130150818.24902-3-tudor.ambarus@microchip.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_091641_579877_1046E75B 
X-CRM114-Status: GOOD (  11.41  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: alexandre.belloni@bootlin.com, Nicolas.Ferre@microchip.com,
 linux-kernel@vger.kernel.org, Ludovic.Desroches@microchip.com,
 broonie@kernel.org, linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 30 Jan 2019 15:08:31 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Cosmetic change, no functional change.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Boris Brezillon <bbrezillon@kernel.com>

> ---
>  drivers/spi/atmel-quadspi.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
> index f79b17792a11..64475ad16c83 100644
> --- a/drivers/spi/atmel-quadspi.c
> +++ b/drivers/spi/atmel-quadspi.c
> @@ -22,16 +22,15 @@
>   * This driver is based on drivers/mtd/spi-nor/fsl-quadspi.c from Freescale.
>   */
>  
> -#include <linux/kernel.h>
>  #include <linux/clk.h>
> -#include <linux/module.h>
> -#include <linux/platform_device.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/interrupt.h>
> -#include <linux/of.h>
> -
>  #include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>  #include <linux/spi/spi-mem.h>
>  
>  /* QSPI register offsets */


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
