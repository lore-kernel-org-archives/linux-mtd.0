Return-Path: <SRS0=8YuD=3E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E95C33CB1
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2020 15:42:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A18B2053B
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2020 15:42:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u331kyzw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="FdYmDlvQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A18B2053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ragnatech.se
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HdQ+q9D5IKBfdtu9m8ZVy6pol0ZsqMz2mSt5qE930q8=; b=u331kyzwbdXj/W
	JhIQ/9oDfCWaBcrGxHc9DtAM1Yp9AuUkGkX5846HJH5UseUZ15pfEZlu+3rOuzhcZCbXSTv3EczkD
	NyncIlZcyxzenN68VUorxt2qjnfIXCfwGEfchvSk462JYgwMZVP3VYtg+0UL3CDt85Zq+29mmm8Rr
	iCm3w/L7poa/EkKTkenFaDdTyhrbPMK2+i+YxkfpstsYsFQDbDMtFuGvsc3NZg9/mDkcXbm654xZv
	3VLo4LZOpyF9iLVIkrvMaf3Pz/Le2TleaPOvwtowpYAJ696af5Z/5qo8/a8+Yy4peVRKxQx2yFGO4
	7rNdLxsh9wsTfT4En6dQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irkoG-0008EI-AZ; Wed, 15 Jan 2020 15:42:20 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irkoB-0008Ci-F0
 for linux-mtd@lists.infradead.org; Wed, 15 Jan 2020 15:42:19 +0000
Received: by mail-lf1-x141.google.com with SMTP id b15so13047623lfc.4
 for <linux-mtd@lists.infradead.org>; Wed, 15 Jan 2020 07:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=N8b+H5+4AZUL8IrGlHZ9KVMloMXldascwYgfWlKN9rE=;
 b=FdYmDlvQrDy1LEQoaENUdqQc5r3i7VCErTzZ5eHAyDXArk/GW99jkbp7T/Mxjk+CG5
 SBO4KnwzdCUIyGt6JV6AdRoxJFp1eVMUJMitA7oIj0LPDMFAhG6SktRL6shLejMecolJ
 RNf+yvdk+EcEmv89u84BAdIxqY6qt/udZVFDgOdC4nHiuekLe/06CWxUyaKL+AFPoM8w
 GqHLhnocT6dX9ydIprR4NVtLzNqnbWO7GY1L+fzMKUl0LPNlQ1Ga+enLfzmcwAk7YC4j
 GfKHXJAQBo9oZP4QqL1b03SoNylfIePIRZZLMJQmcOsmbTR8HAOcM5imRIIFSdmEOZAW
 3trA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=N8b+H5+4AZUL8IrGlHZ9KVMloMXldascwYgfWlKN9rE=;
 b=biWuIZ956s83aoLFjYAq440hgFbPzKnYgtf9vZLxuptM4QnmcXXNWPNhZ7cFWUmCty
 1Shah1BjsFBz2hzeXgEDV8QTXCrIKOYa2OPwcGAHYLR1rQvFqj950T3ccES+gyz85kxO
 MmB5bFTKZf5LQRoThYze/eEOKfAo+qPNMYS1I9ueRWeuFy4jPO//pafq8Uxhoq3RB4Qz
 4tWwZI9xO0AhHNZ4NslDynJjByPBcLryZEr2Nw7j24UkEZP0hs80XmRJ2F+GUS7XJ6r+
 H0pmOqAhUZHn7jckO1aNj0MwD0odv1Hspr4ROdh1W06ezpfScj1jWYYHyEMV2lnsJ30t
 6U1A==
X-Gm-Message-State: APjAAAWMn3aZs20slJpdwcmR5qaUHossqh1nGHoC3mEc3FQuO98LB/6a
 plME3+QC7BWIu1cMcK9PUnBu+Q==
X-Google-Smtp-Source: APXvYqzYfC/bkCYczOz0Rbf8DDPIo53usGVtIxNysW7JZRLyBZmcO/JlAzaVVBNPrSuP94EewnXcPA==
X-Received: by 2002:ac2:5503:: with SMTP id j3mr5100238lfk.104.1579102932939; 
 Wed, 15 Jan 2020 07:42:12 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
 by smtp.gmail.com with ESMTPSA id g85sm9118361lfd.66.2020.01.15.07.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 07:42:12 -0800 (PST)
Date: Wed, 15 Jan 2020 16:42:12 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH resend] mtd: maps: physmap: Add minimal Runtime PM support
Message-ID: <20200115154212.GA977577@oden.dyn.berto.se>
References: <20200115131323.6883-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115131323.6883-1-geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_074215_564997_6044DA49 
X-CRM114-Status: GOOD (  24.91  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Kevin Hilman <khilman@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Chris Brandt <chris.brandt@renesas.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Geert,

Thanks for your work.

On 2020-01-15 14:13:23 +0100, Geert Uytterhoeven wrote:
> Add minimal runtime PM support (enable on probe, disable on remove), to
> ensure proper operation with a parent device that uses runtime PM.
> =

> This is needed on systems where the FLASH is connected to a bus
> controller that is contained in a PM domain and/or has a gateable
> functional clock.  In such cases, before accessing any device connected
> to the external bus, the PM domain must be powered up, and/or the
> functional clock must be enabled, which is typically handled through
> runtime PM by the bus controller driver.
> =

> An example of this is the Renesas APE6-EVM development board, which has
> an Ethernet controller and a CFI FLASH connected to the Bus State
> Controller (BSC) of an R-Mobile APE6 SoC.
> As long as the Ethernet driver, which had Runtime PM support since
> commit 3a611e26e958b037 ("net/smsc911x: Add minimal runtime PM
> support"), keeps the BSC powered, accessing the FLASH works.
> When the ethernet node in r8a73a4-ape6evm.dts is disabled, the BSC is
> never powered up, and the kernel crashes when trying to access the
> FLASH:
> =

>     Unhandled fault: imprecise external abort (0x1406) at 0x00000000
>     pgd =3D (ptrval)
>     [00000000] *pgd=3D7fef2835
>     Internal error: : 1406 [#1] SMP ARM
>     CPU: 0 PID: 122 Comm: hd Tainted: G        W         5.5.0-rc1-ape6ev=
m-00814-g38ca966db25b9dbd-dirty #136
>     Hardware name: Generic R8A73A4 (Flattened Device Tree)
>     PC is at chip_ready+0x12c/0x380
>     LR is at chip_ready+0x10c/0x380
> =

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Probably the device should be powered down after probing, and powered
> up/down on-demand in the various {get,put}_chip() functions.  However,
> that is an optimization which touches more intimidate details of the
> internal MTD API, and can be done later.
> ---
>  drivers/mtd/maps/physmap-core.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> =

> diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-c=
ore.c
> index a9f7964e2edb6668..8f7f966fa9a7ee8a 100644
> --- a/drivers/mtd/maps/physmap-core.c
> +++ b/drivers/mtd/maps/physmap-core.c
> @@ -38,6 +38,7 @@
>  #include <linux/mtd/cfi_endian.h>
>  #include <linux/io.h>
>  #include <linux/of_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/gpio/consumer.h>
>  =

>  #include "physmap-gemini.h"
> @@ -64,16 +65,16 @@ static int physmap_flash_remove(struct platform_devic=
e *dev)
>  {
>  	struct physmap_flash_info *info;
>  	struct physmap_flash_data *physmap_data;
> -	int i, err;
> +	int i, err =3D 0;
>  =

>  	info =3D platform_get_drvdata(dev);
>  	if (!info)
> -		return 0;
> +		goto out;
>  =

>  	if (info->cmtd) {
>  		err =3D mtd_device_unregister(info->cmtd);
>  		if (err)
> -			return err;
> +			goto out;
>  =

>  		if (info->cmtd !=3D info->mtds[0])
>  			mtd_concat_destroy(info->cmtd);
> @@ -88,7 +89,10 @@ static int physmap_flash_remove(struct platform_device=
 *dev)
>  	if (physmap_data && physmap_data->exit)
>  		physmap_data->exit(dev);
>  =

> -	return 0;
> +out:
> +	pm_runtime_put(&dev->dev);
> +	pm_runtime_disable(&dev->dev);
> +	return err;
>  }
>  =

>  static void physmap_set_vpp(struct map_info *map, int state)
> @@ -484,13 +488,19 @@ static int physmap_flash_probe(struct platform_devi=
ce *dev)
>  		return -EINVAL;
>  	}
>  =

> +	pm_runtime_enable(&dev->dev);
> +	pm_runtime_get_sync(&dev->dev);
> +
>  	if (dev->dev.of_node)
>  		err =3D physmap_flash_of_init(dev);
>  	else
>  		err =3D physmap_flash_pdata_init(dev);
>  =

> -	if (err)
> +	if (err) {
> +		pm_runtime_put(&dev->dev);
> +		pm_runtime_disable(&dev->dev);
>  		return err;
> +	}
>  =

>  	for (i =3D 0; i < info->nmaps; i++) {
>  		struct resource *res;
> -- =

> 2.17.1
> =


-- =

Regards,
Niklas S=F6derlund

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
