Return-Path: <SRS0=0bx7=GS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C048DC433E6
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jan 2021 19:33:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74B0F23A9C
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jan 2021 19:33:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74B0F23A9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FHy2g6hkn9ilHPsBV54nWP66dO6/3UN8tmKxM3EKVRs=; b=mgLwOOaZMY5p0VtVGa+RvlU49
	9mDTZt6205QqNjtwfAHTNw4nl0WJHwXAHrUmduEBOJfhG4rLeUmSdQLNuVOIVe02bF9iIXED9BCoD
	UvYpTmlje9PknEeCwYC83FdP8dSZee6YIyyOZhFc2zBVjqK8Y5cvG3nAqipcOAo8hkJ7hsAApmlUh
	72Rcah9jrmw6idnlulYWWzu7UvSvzCGtvoHIN90QvYjZ3rmNEedyqv7+Hph/4Qi6VgZvDGJFF6/g9
	RCZqPCNQEnZge6Jnn6vPuWnxxrBlKlt+AtsZBxybvw3u/RV5aWvOjUmMUZh31Vjd3R2ksvr6/p+WX
	pw8rmjo9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Uq2-0000p8-3x; Fri, 15 Jan 2021 19:32:50 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Upy-0000no-Ng
 for linux-mtd@lists.infradead.org; Fri, 15 Jan 2021 19:32:48 +0000
Received: by mail-yb1-xb33.google.com with SMTP id x6so6085759ybr.1
 for <linux-mtd@lists.infradead.org>; Fri, 15 Jan 2021 11:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yrntnvckKCepxIVGjBYYjKcJ5T21TGSOX6mTET4Mbb4=;
 b=aRTsraIKlUuQFEjVVGnhQoQYrJ3WnMp8QsGp3NcbrXCuRr0Zpcez8ag8Ma/2RyXUlD
 cFAGhhnRfQx1Wqvxf8pgicpjMtlR8Ad74SNf6J15jGZO9flGtKt7on2CSbaiOS2RhunB
 UKASJcjqjq8m9pZK7FSG4X/Hdtt5N44smkVlUmBLOzVTYClQ/XmE0Fq64Jc8nBgvo3yp
 dZWiX44uJIjsXaRTFM4+Ki+iCEylAtIcaigtnayhhxOAo3rzAJS4w3wZswaPIr57HWLb
 +on/Nlltx5U06DZ0rYUn+PUL3nchLujnwrr6feC3PBn5OBTVYmnc48SroAgTXkTOEAvC
 E+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yrntnvckKCepxIVGjBYYjKcJ5T21TGSOX6mTET4Mbb4=;
 b=Aluj5btTJglU1wJ2ic1eihTbyP+6QqDldXy5MsSiBQgbj6WhEwUA3eLoGn87slHsTJ
 aDeNP0QGrk7YqGCX6lsmR2UdDBtT/LmHFb6UZTR4+w3x3ySihBaknCEPPcYSxe/0H/Sb
 oCn8EeI8PVmFXFXk0y/9+0xaRSoldNRElgq6UjUPF+LH2qb5rsUXW1Cz0tqqU1eX/Trt
 /hB4oHropTZiAgr2Kb0G/T1TcuO/dlo8VFbLLuRUWB7GxWjZzaFxGtiHLDdwyooFjw7H
 iERNogiwR8DIlHnI2pNPfyXYtKtcIKILpF8pABpLJqUea9+QLA+jqe4O+H3B2psbetdC
 tpng==
X-Gm-Message-State: AOAM531BlJSBrBr2fMANIcHb7s/IszsCTt+6vDm6Wsxc03rnPyFyXWyT
 qkG1/+LoHbesYj2VZLDc/N8bwDnmvEDIFDsLi5WgWI3L
X-Google-Smtp-Source: ABdhPJx4wQuZIQmQSAPrtJXDkWAQ2hNH1BTWIwO0Ddmqiq0dmIO+40XrOdT9mR9AuA3Fv0P1E2RU9g7DdpMHaYDeIHI=
X-Received: by 2002:a25:f02:: with SMTP id 2mr17580195ybp.190.1610739161317;
 Fri, 15 Jan 2021 11:32:41 -0800 (PST)
MIME-Version: 1.0
References: <CAA=hcWR+nsKAEH+Y9+U+3j21QtpdnBTenLdd65-yt0zpYPzX0g@mail.gmail.com>
In-Reply-To: <CAA=hcWR+nsKAEH+Y9+U+3j21QtpdnBTenLdd65-yt0zpYPzX0g@mail.gmail.com>
From: Jupiter <jupiter.hce@gmail.com>
Date: Sat, 16 Jan 2021 06:32:04 +1100
Message-ID: <CAA=hcWRXRDe6vu38PcFTc6oS+vU2DPqLRik_D3zTKiex99bX5g@mail.gmail.com>
Subject: Re: MTD UBI undefined reference failed to build OE gatesgarth branch
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_143247_626175_AC9206A2 
X-CRM114-Status: GOOD (  14.73  )
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
Cc: meta-freescale@lists.yoctoproject.org,
 linux-mtd <linux-mtd@lists.infradead.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

The mtd build was fine, what could be missing not to link mtd?

$ ls 2020.04-r0/build/mx6ull_14x14_evk_nand_config/drivers/mtd

built-in.o  mtdcore.su  mtdpart.o   mtd_uboot.o   mtd-uclass.o   nand     spi
mtdcore.o   mtd.o       mtdpart.su  mtd_uboot.su  mtd-uclass.su  onenand  ubi



On 1/15/21, Jupiter <jupiter.hce@gmail.com> wrote:
> Hello,
>
> I was able to build MTD, UBI and u-boot on OE version Zeus branch, but
> failed in gatesgarth branch. Here are errors, what could I be missing?
>
> u-boot-imx/2020.04-r0/git/cmd/ubi.c:478: undefined reference to
> `mtd_probe_devices'
> u-boot-imx/2020.04-r0/git/cmd/ubi.c:484: undefined reference to
> `put_mtd_device'
> u-boot-imx/2020.04-r0/git/drivers/mtd/ubi/build.c:1161: undefined
> reference to `put_mtd_device'
> u-boot-imx/2020.04-r0/git/drivers/mtd/ubi/build.c:1229: undefined
> reference to `get_mtd_device_nm'
> u-boot-imx/2020.04-r0/git/drivers/mtd/ubi/io.c:1407: undefined
> reference to `mtd_read'
> u-boot-imx/2020.04-r0/git/drivers/mtd/ubi/io.c:279: undefined
> reference to `mtd_write'
>
> u-boot-imx/2020.04-r0/git/drivers/video/cfb_console.c:2025: undefined
> reference to `video_hw_init'
> u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:51: undefined
> reference to `dm_spi_claim_bus'
> u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:55: undefined
> reference to `dm_spi_xfer'
> u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:58: undefined
> reference to `dm_spi_release_bus'
> u-boot-imx/2020.04-r0/git/Makefile:1701: recipe for target 'u-boot' failed
> make[1]: *** [u-boot] Error 1
> WARNING: exit code 1 from a shell command.
>
> There are a couple of warning messages I am not sure if they are
> important or just nonsense, like CONFIG_DEFAULT_DEVICE_TREE has
> already been defined but it complained:
>
> Device Tree Source is not correctly specified.
> Please define 'CONFIG_DEFAULT_DEVICE_TREE'
> or build with 'DEVICE_TREE=<device_tree>' argument
>
> u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:51:8: warning:
> implicit declaration of function 'dm_spi_claim_bus'; did you mean
> 'spi_claim_bus'? [-Wimplicit-function-declaration]
>    51 |  ret = dm_spi_claim_bus(dev);
>       |        ^~~~~~~~~~~~~~~~
>       |        spi_claim_bus
> @
> u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:55:8: warning:
> implicit declaration of function 'dm_spi_xfer'; did you mean
> 'spi_xfer'? [-Wimplicit-function-declaration]
>    55 |  ret = dm_spi_xfer(dev, priv->nregs * 8, priv->buffer, NULL,
>       |        ^~~~~~~~~~~
>       |        spi_xfer
> u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:58:2: warning:
> implicit declaration of function 'dm_spi_release_bus'; did you mean
> 'spi_release_bus'? [-Wimplicit-function-declaration]
>    58 |  dm_spi_release_bus(dev);
>       |  ^~~~~~~~~~~~~~~~~~
>       |  spi_release_bus
>
> Appreciate your advice.
>
> Thank you very much.
>
> Kind regards,
>
> - jupiter
>


--
"A man can fail many times, but he isn't a failure until he begins to
blame somebody else."
-- John Burroughs

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
