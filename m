Return-Path: <SRS0=ZMJ0=QO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 574E5C282C2
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 08:38:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CA7C2147C
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 08:38:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rh95acut"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CA7C2147C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KXxYUSou8MtoWPI61USuGxdFD8ESh6RJTpY9rqQzSU4=; b=rh95acutMzaOMt
	8Xe4eZuZFM79YpUCtYuI1IogW8CgsRMy0qIeuVyaBm56m4U8pHEac7LkWAPgNYxbDHdtqPzuEptZE
	WM+K9+7N6UUfCyD/exJXHBpG0iyeeSbNzK+TPeuqXZ1LPPS1v0vMmW7lYAIUja5uX6SH6weLP7O7G
	HDUskaSSGbaVNhWjxa7r5546O8ou3Ag2STRu4CaYYotL6R2Ncs4FMCfb/6F5PhZdorNNTOoMTILhw
	bcemwVsw5PSAR/s39kFXtQgejU7ifZvDraZ5joGBz/bGq9nWDx6jxjr9uXwzBGibkar6QqQDL/oZy
	YIB0W+ADyTKiYPrZyYvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grfCP-0005Ts-Dd; Thu, 07 Feb 2019 08:38:21 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grfBj-0004xw-K9
 for linux-mtd@lists.infradead.org; Thu, 07 Feb 2019 08:38:15 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 995792798E5;
 Thu,  7 Feb 2019 08:37:37 +0000 (GMT)
Date: Thu, 7 Feb 2019 09:37:34 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] mtd: powernv: SPDX and comment fixups
Message-ID: <20190207093734.400875cd@collabora.com>
In-Reply-To: <20190206003659.27107-1-joel@jms.id.au>
References: <20190206003659.27107-1-joel@jms.id.au>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_003740_692236_5748F08D 
X-CRM114-Status: GOOD (  25.80  )
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
Cc: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Joel,

On Wed,  6 Feb 2019 11:06:58 +1030
Joel Stanley <joel@jms.id.au> wrote:

> This converts the powernv flash driver to use SPDX, and adds some
> clarifying comments that came out of a discussion on how the mtd driver
> works.

Can you split that in 2 patches, one adding the SPDX header, and the
other one clarifying the driver behavior.

Thanks,

Boris

> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/mtd/devices/powernv_flash.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
> index 22f753e555ac..0bf43336c3f7 100644
> --- a/drivers/mtd/devices/powernv_flash.c
> +++ b/drivers/mtd/devices/powernv_flash.c
> @@ -1,17 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
>  /*
>   * OPAL PNOR flash MTD abstraction
>   *
>   * Copyright IBM 2015
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
>   */
>  
>  #include <linux/kernel.h>
> @@ -261,6 +253,14 @@ static int powernv_flash_probe(struct platform_device *pdev)
>  	 * The current flash that skiboot exposes is one contiguous flash chip
>  	 * with an ffs partition at the start, it should prove easier for users
>  	 * to deal with partitions or not as they see fit
> +	 *
> +	 * When developing the skiboot MTD driver an experiment with FFS
> +	 * parsing in the kernel, and exposing a seperate /dev/mtdX for each
> +	 * partition (eg BOOTKERNEL, PAYLOAD, NVRAM, etc), was done.
> +	 *
> +	 * We didn't go with that as it meant users couldn't do a full flash
> +	 * re-write, as this can cause a partition to change size, and there
> +	 * wasn't a way to tell the MTD layer that a device has shrunk/grown.
>  	 */
>  	return mtd_device_register(&data->mtd, NULL, 0);
>  }


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
