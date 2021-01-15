Return-Path: <SRS0=0bx7=GS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24077C433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jan 2021 20:13:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE0D023A5A
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jan 2021 20:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE0D023A5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8JJW3utdZ884CQXw/JkDWbEhYRNFIzH+m38bj4aIMv0=; b=gPVVaJKQaRmJ6Fgu9u9tqO14O
	8vz9oXlFsr/yir8XabYbRC8YytQx0g35NnocCTcR2vP+DvddRqrlb85Vfi4sVt1xxtGndY9CLLWna
	JcPCjbtzHafgqoRG9VMRGUUfIn9dKhB15ZUTefKHEU5ycJhNfWKxSwfvaRYZoEIMkp4oxtgsiUi3I
	ltwx5cpS+tULoRYH14MNUWDIJmQpHheEO5xLHQn/ZDYWDVyO8WwTH57OQ7j+aEo1kmgeefaM7j81B
	E0n3A8Dt6dY/YkIhkZA+0jZLfxnnJ0FsIeDFGu5A1/G+CVA5b3f0xUDrPYp8PohB2ruVcINtwoicJ
	0uHsapchw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0VSx-0006ZL-CE; Fri, 15 Jan 2021 20:13:03 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0VSu-0006YS-9q
 for linux-mtd@lists.infradead.org; Fri, 15 Jan 2021 20:13:01 +0000
Received: by mail-lj1-x22c.google.com with SMTP id n8so2925875ljg.3
 for <linux-mtd@lists.infradead.org>; Fri, 15 Jan 2021 12:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MGwot5V7oV8XkTiQMjmzlaBRpDZIUDUR6lIRZt0UQn8=;
 b=ESeIeMmBpckCnerA1KIxynHee4g+Jo3OVlov90WJXEwPZL42xVaGtP/bm11bGmp4et
 rPwvlCueARRA4C/An2skKWZ4AX5DFsU4yiy+tA0wqGb0yVIydedPB4WnS7eHevMf0Rux
 PB/nXCQcGvKhXrLBSxgIrQJk+E2YxSgm+9MHFLNM6Zo7GCZCkyZVQRDBzyadmWvp0TOx
 /3vX3+iIpArZjbGB8G1BMzOOxPOziMgJENdgc95mg4dTs+ouowJDmIf5HgbMuLWBEZXM
 mH1ddHRTh22wJg7Ji0VVuILGTjdsj2kFgbZ133Wy9KLdyAQRo9aK0iV/uuvRVTgb/7US
 aSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MGwot5V7oV8XkTiQMjmzlaBRpDZIUDUR6lIRZt0UQn8=;
 b=f7WI71pg6afwo+4LD7aXsTneVQ1iRKXUkBj0K2DPJWILpTHmWvZkcdDVCQ5wP1zlWP
 uiyL3huZVVLXFQ4hRweFcFFIA3z0GXzzYshho8ZJNJVBooLSRVW5cL76aJIWI17fxg3V
 Bn2y0eA8KHuL+GhthNxirr3HDi3a7qLsjVIsXeOIPs0Kbn+gTBdVQx3B70HK0wkg2nCv
 K7jv/cDfO7eiIICmIWnVTMjzKYkTP3F3xEaPU1tBka+8nWlMdApZMQOVVSK6hDHBs/Me
 qUYdoZEQusUMwbCawJwrMo7P4nhrpj/xNU31K34BomljGJUODUoOkn/KTYwcY++2toj5
 8pXQ==
X-Gm-Message-State: AOAM530QAcybOUD027pinw0SJl4JTo8hUH0uT5LhUqVZtsHRy0NSLqDu
 dG/DRM7U43II62N/FY4W1Evx7ZjyiyQWVdAfclNRb+Qrgmg=
X-Google-Smtp-Source: ABdhPJwJwpzO09gkSd3XacgqSTaUPJv5QHRKE2GXB1Dmh44mtOhl8aqkVYy/3CKz9ie4zpP69v9bOU/0vos5GoL6sjU=
X-Received: by 2002:a2e:50c:: with SMTP id 12mr6096025ljf.226.1610741576260;
 Fri, 15 Jan 2021 12:12:56 -0800 (PST)
MIME-Version: 1.0
References: <CAA=hcWR+nsKAEH+Y9+U+3j21QtpdnBTenLdd65-yt0zpYPzX0g@mail.gmail.com>
 <CAA=hcWRXRDe6vu38PcFTc6oS+vU2DPqLRik_D3zTKiex99bX5g@mail.gmail.com>
In-Reply-To: <CAA=hcWRXRDe6vu38PcFTc6oS+vU2DPqLRik_D3zTKiex99bX5g@mail.gmail.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Fri, 15 Jan 2021 21:12:45 +0100
Message-ID: <CAHtQpK4OgZ5Qm6sFUiQavg6gd0taVUB2XiLHv8RG3q7O59B_TA@mail.gmail.com>
Subject: Re: [meta-freescale] MTD UBI undefined reference failed to build OE
 gatesgarth branch
To: JH <jupiter.hce@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_151300_409927_0BE50E12 
X-CRM114-Status: GOOD (  24.77  )
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
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 meta-freescale@lists.yoctoproject.org,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Jupiter,

On Fri, Jan 15, 2021 at 8:32 PM JH <jupiter.hce@gmail.com> wrote:
>
> Hello,
>
> The mtd build was fine, what could be missing not to link mtd?
>
> $ ls 2020.04-r0/build/mx6ull_14x14_evk_nand_config/drivers/mtd

From all the build logs you have, it look to me that you're trying to
build the U-Boot delivered by NXP as a part of their BSP release.

In this case, I suggest you'd rather contact NXP support in order to
address this failure, since it is a vendor BSP you're trying to
upgrade.

In addition, I do not think that all mailing lists you've cross-posted
your question to would be able to help you here:
- linux-mtd list is not really appropriate to solve U-Boot build issues;
- u-boot list is for upstream U-Boot patches and discussions, which is
way past over 2020.04 version (not even considering that you're
building U-Boot from NXP fork);
- oe-core is not a proper list to post questions specific to one SOC vendor;
- meta-freescale 'gatesgarth' branch does not have any U-Boot build
configuration for mx6ull_14x14_evk_nand_config, the only available
build config provided is for sd card;

Having all those points above, I'd suggest you contact NXP support at
first to see if they can solve those build errors for you.

If you would find a solution, you can send a PR to meta-freescale to
address it - this would be much appreciated.

>
> built-in.o  mtdcore.su  mtdpart.o   mtd_uboot.o   mtd-uclass.o   nand     spi
> mtdcore.o   mtd.o       mtdpart.su  mtd_uboot.su  mtd-uclass.su  onenand  ubi
>
>
>
> On 1/15/21, Jupiter <jupiter.hce@gmail.com> wrote:
> > Hello,
> >
> > I was able to build MTD, UBI and u-boot on OE version Zeus branch, but
> > failed in gatesgarth branch. Here are errors, what could I be missing?
> >
> > u-boot-imx/2020.04-r0/git/cmd/ubi.c:478: undefined reference to
> > `mtd_probe_devices'
> > u-boot-imx/2020.04-r0/git/cmd/ubi.c:484: undefined reference to
> > `put_mtd_device'
> > u-boot-imx/2020.04-r0/git/drivers/mtd/ubi/build.c:1161: undefined
> > reference to `put_mtd_device'
> > u-boot-imx/2020.04-r0/git/drivers/mtd/ubi/build.c:1229: undefined
> > reference to `get_mtd_device_nm'
> > u-boot-imx/2020.04-r0/git/drivers/mtd/ubi/io.c:1407: undefined
> > reference to `mtd_read'
> > u-boot-imx/2020.04-r0/git/drivers/mtd/ubi/io.c:279: undefined
> > reference to `mtd_write'
> >
> > u-boot-imx/2020.04-r0/git/drivers/video/cfb_console.c:2025: undefined
> > reference to `video_hw_init'
> > u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:51: undefined
> > reference to `dm_spi_claim_bus'
> > u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:55: undefined
> > reference to `dm_spi_xfer'
> > u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:58: undefined
> > reference to `dm_spi_release_bus'
> > u-boot-imx/2020.04-r0/git/Makefile:1701: recipe for target 'u-boot' failed
> > make[1]: *** [u-boot] Error 1
> > WARNING: exit code 1 from a shell command.
> >
> > There are a couple of warning messages I am not sure if they are
> > important or just nonsense, like CONFIG_DEFAULT_DEVICE_TREE has
> > already been defined but it complained:
> >
> > Device Tree Source is not correctly specified.
> > Please define 'CONFIG_DEFAULT_DEVICE_TREE'
> > or build with 'DEVICE_TREE=<device_tree>' argument
> >
> > u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:51:8: warning:
> > implicit declaration of function 'dm_spi_claim_bus'; did you mean
> > 'spi_claim_bus'? [-Wimplicit-function-declaration]
> >    51 |  ret = dm_spi_claim_bus(dev);
> >       |        ^~~~~~~~~~~~~~~~
> >       |        spi_claim_bus
> > @
> > u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:55:8: warning:
> > implicit declaration of function 'dm_spi_xfer'; did you mean
> > 'spi_xfer'? [-Wimplicit-function-declaration]
> >    55 |  ret = dm_spi_xfer(dev, priv->nregs * 8, priv->buffer, NULL,
> >       |        ^~~~~~~~~~~
> >       |        spi_xfer
> > u-boot-imx/2020.04-r0/git/drivers/gpio/74x164_gpio.c:58:2: warning:
> > implicit declaration of function 'dm_spi_release_bus'; did you mean
> > 'spi_release_bus'? [-Wimplicit-function-declaration]
> >    58 |  dm_spi_release_bus(dev);
> >       |  ^~~~~~~~~~~~~~~~~~
> >       |  spi_release_bus
> >
> > Appreciate your advice.
> >
> > Thank you very much.
> >
> > Kind regards,
> >
> > - jupiter
> >
>
>
> --
> "A man can fail many times, but he isn't a failure until he begins to
> blame somebody else."
> -- John Burroughs
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#24489): https://lists.yoctoproject.org/g/meta-freescale/message/24489
> Mute This Topic: https://lists.yoctoproject.org/mt/79697340/3617192
> Group Owner: meta-freescale+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-freescale/unsub [andrey.z@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
Regards,
Andrey.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
