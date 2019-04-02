Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0466C4360F
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 13:03:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 904802084C
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 13:03:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cuu+3BsH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IWWnrBEo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 904802084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K4FQkMfCFK10OuzQQkpyjePCzK3CfN/suHv0TyIVK34=; b=Cuu+3BsHBq4KmS
	XRzQXYMLhUW5NAQQZJwJkkTrROnSFGUUmdRGt3frpMPN4rpSt1im+3TN3KkVmIJEC5Jii8b6o2LHj
	4VbU1Tefy+MqF8cMVjcYWQOY5lWvsZfIpIqzVJjLeJDJKn5Pgfm5YnbSSKMUdqRfcwfS70R8+bPUz
	Axn87ve0rovfDAU/9p+PrVCusTklBLKmJs3w/WMFTZhMWFU8xKAM6rMMfWQF/Rjdvb3iUQH4jX0Nv
	YESnozXnGlEY+x9069VoOQrW/d26JWDMyAQBJpDjV/aLi6h3JDmIERHwLdrpEmbRquiosAUux8jrm
	9ba5T3BaY7PbC3WztrIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBJ4t-00029b-F8; Tue, 02 Apr 2019 13:03:47 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBJ4o-00028b-5S
 for linux-mtd@lists.infradead.org; Tue, 02 Apr 2019 13:03:45 +0000
Received: by mail-wr1-x441.google.com with SMTP id t17so3512289wrw.13
 for <linux-mtd@lists.infradead.org>; Tue, 02 Apr 2019 06:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DQWHTFATcrNq7p1doqrSs5jwQheVwZtAPpOEYrBA9dQ=;
 b=IWWnrBEolfDAfbXn6wDewwkC8/iEPN4G7fGk8Fq8KpwiiWMb86IPABcnRXM9Fend/V
 KoLl9xGwqSWDsJnSG3K6ZeNfnv4CAUy6JFQBSiq3zShlVirEuZn53GxZZ1Bx7iXxV0Uw
 koGBc7EiIvPa7qeIB/pe+7GmAPcedGZrobBlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DQWHTFATcrNq7p1doqrSs5jwQheVwZtAPpOEYrBA9dQ=;
 b=MoZESm2zakCpt8OUoKpjXkK1NtUW28j9lvUJecWcbWA4duXhQQ8z9D7Vm/1La8tBXQ
 pSzRD6ars8hk0Mnx3uVl8X7y/esBFPGPDPt2Pji4QrF+w/ZwLH84S4Q4CkXDDz/+cB4h
 q0O0yobeRvwJuCDSpFxHhqG4TTvbtUGqI30SU/e1OV9AKhW6sLG1kHAio6v1XVuyJ6ur
 5fCLHIfm5bWYI5TGHqyfrpdk+dDnJ4yRAaS1yq8vx6oCYKc/ngNE9Pu3PG6F5aNxs4z8
 06btjjCYuQwkHg/e9U/I7TDk64RGQMbFKkWHdeJCuT4p6O0jLiHkVOPrYmeLW4YCwHnA
 zTZQ==
X-Gm-Message-State: APjAAAWibjDJVB1Emi9DjSdMyXUXTmHNylKJCGidbXccMBb6mSVBb6q8
 LlArLSedAVnX3d7rh4mLfr4KTak6FIYvTxCqI9DPwg==
X-Google-Smtp-Source: APXvYqy9eyhNqpy+q8Dkhvof3BQ1jAxICjUW8hTh5/9xi8re0w3+v6gtoNxPEmvbQ9r5zy9lNJh7X0UNRhx5hQLJNwU=
X-Received: by 2002:adf:ed8f:: with SMTP id c15mr45990160wro.144.1554210219791; 
 Tue, 02 Apr 2019 06:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190328045910.98250-1-zhuohao@chromium.org>
 <20190401112748.4a3d5539@collabora.com>
 <CABD5ybm_1BjKSsMFGy=LuM0bsCcBnnY7Eid_Ni3OQ5e+aFZ7pg@mail.gmail.com>
 <20190402095628.5d376263@collabora.com>
 <7077290a-8acc-465b-6ed0-fddd35ab8fd6@ti.com>
 <CABD5yb=JnwY_rMYwTOHjU3izoA8wxfRVgfAGK9zWh=7NZ7H23Q@mail.gmail.com>
 <20190402140141.385a79d8@collabora.com>
In-Reply-To: <20190402140141.385a79d8@collabora.com>
From: Zhuohao Lee <zhuohao@chromium.org>
Date: Tue, 2 Apr 2019 21:03:28 +0800
Message-ID: <CABD5ybnB1JK2_zg0Lsi_1Ny5wGBP9dE4FbP6NCHAPbXpgJqkTg@mail.gmail.com>
Subject: Re: [PATCH v1] mtd: core: add sysfs nodes for querying the flash name
 and id
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_060342_225814_FDD4D2B5 
X-CRM114-Status: GOOD (  24.93  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, bbrezillon@kernel.org, richard@nod.at,
 Brian Norris <briannorris@chromium.org>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Boris, Thanks for your comment.
But I can't find the related stuff (or i got the wrong way). Is that
feature merged?
Could you please point out the commit? I can make the change base on it.

On Tue, Apr 2, 2019 at 8:01 PM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Tue, 2 Apr 2019 19:06:37 +0800
> Zhuohao Lee <zhuohao@chromium.org> wrote:
>
> > On Tue, Apr 2, 2019 at 4:26 PM Vignesh Raghavendra <vigneshr@ti.com> wrote:
> > >
> > >
> > >
> > > On 02/04/19 1:26 PM, Boris Brezillon wrote:
> > > > On Tue, 2 Apr 2019 15:39:54 +0800
> > > > Zhuohao Lee <zhuohao@chromium.org> wrote:
> > > >
> > > >> Thanks Boris for the comment. Please take a look the reply at below.
> > > >>
> > > >> On Mon, Apr 1, 2019 at 5:27 PM Boris Brezillon
> > > >> <boris.brezillon@collabora.com> wrote:
> > > >>>
> > > >>> On Thu, 28 Mar 2019 12:59:10 +0800
> > > >>> Zhuohao Lee <zhuohao@chromium.org> wrote:
> > > >>>
> > > >>>> Currently, we don't have sysfs nodes for querying the underlying flash
> > > >>>> name and flash id. This information is important especially when we
> > > >>>> want to know the flash detail of the defective system. In order to
> > > >>>> support the query, we add two pointers (*flashname, *id) into the
> > > >>>> mtd_info structure and create two sysfs nodes (flashname, id). This
> > > >>>> patch is modified based on the SPI-NOR flash system as we only have
> > > >>>> that system now. But the idea should be applied to the other flash
> > > >>>> driver like NAND flash.
> > > >>>>
> > > >>>> The output of new sysfs nodes on my device are:
> > > >>>> cat /sys/devices/platform/soc/11010000.spi/spi_master/spi1/spi1.0/mtd/mtd0/flashname
> > > >>>> w25q64dw
> > > >>>> cat /sys/devices/platform/soc/11010000.spi/spi_master/spi1/spi1.0/mtd/mtd0/id
> > > >>>> ef6017
> > > >>>
> > > >>> I'm not sure I like the idea of exposing this kind of info through
> > > >>> sysfs as it then makes part of the ABI. Did you consider exposing that
> > > >>> through debugfs?
> > > >>
> > > >> Yes, i did consider the debugfs. I think the debugfs is depended on
> > > >> CONFIG_DEBUG_FS.
> > > >> If removing that config, the partname and partid will be lost. So, i
> > > >> proposed to use
> > > >> sysfs.
> > > >
> > > > Then just enable debugfs if you need this information :P.
> > My original intention is adding the new sysfs nodes (i.e partname and
> > partid) into the common place like mtdcore.c
> > so that the userspace program can just read the common sysfs nodes.
> > So far, what i can contribute is for the spi-nor but if the other
> > flash drivers, like nand-flash, can also support
> > the partname and partid query, then, we can have common sysfs nodes to
> > query the underlying device info.
> > Compare to the debugfs, i think different drivers may have different
> > name for the partname and partid.
>
> We've recently unified how MTD related stuff are exposed through
> debugfs and you can now have generic MTD fields exposed there.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
