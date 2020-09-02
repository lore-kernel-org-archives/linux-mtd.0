Return-Path: <SRS0=vQrn=CL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152B4C433E2
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Sep 2020 12:16:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE52420767
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Sep 2020 12:16:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ePv37EOO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4hB+raa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE52420767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cSo7oEs+q2s0rksiG6z2DdBUbi+p+50m8lJqoSo05K0=; b=ePv37EOO9HEAp5czCTqau8Dpe
	W5/6Q/DuVD5HhRlM+x7/JDh30eAGB30f2k7CJgz5gBZCseRW5Z7a3myH4v2QKepozhniURxiKOd+A
	ugskCuCXA+Y/qsl7qeSTCTSwFPHW+yI3ykDHFj2V0hzrWakO4cOK/WLSbRO5lX4NuF3uJhcpPVLX9
	+WyqfF9T7zNw96O2hrBnEy6B7i5zd6QqvCyI7ZQeHYYT70Mi9B0/M1tvQWf3XtrpYSTVEX8rj4iph
	p40shhyKJr7HSFyy/LklpZECjEAlrA2X5f10jqovT8wirKyHp2pjObSanwh07uNEUmr981hzwwo7Q
	r/vP/Iw8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDRft-00015x-CJ; Wed, 02 Sep 2020 12:15:37 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDRfr-00015Z-2L
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2020 12:15:35 +0000
Received: by mail-il1-x141.google.com with SMTP id e14so4746965ile.6
 for <linux-mtd@lists.infradead.org>; Wed, 02 Sep 2020 05:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tryYBEafll/kgxjcybERxJdf+V7haRFlhCKbSc2fIiI=;
 b=I4hB+raa5Qicg5qpzsWrJo1wVXkPW7Gn/8ihNxAzhg8YhIGtcMh1BDJp4LHbqZBbv4
 iFtNL2hf3/UYJQnV/3kmlNUeK75ml0CCZoNQh9+gkEAjoX0f6avXSuhcIoeaMspIzvg2
 0vszBdfhdP7CpLJ3xjr/d2pFeggxxRMfBcq20WC+2GSErtt3BLbwINXepvuoWQp4olo8
 dNgxgb+YzhwB+Zamy/8dgDS6ZoH+fHUyfYEZ8jKYA4wIyWVGgAH4k4sQm0RRLjBEuoAk
 EAkt6wD/z00LH/hsL4o72Tu0YCqHMI4eQB1+LjubRQsNLBOQnYPE4z6zBX6Cs1fVo0o9
 JXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tryYBEafll/kgxjcybERxJdf+V7haRFlhCKbSc2fIiI=;
 b=Wz+tylcSLCOap/HZK3avr4aljp/1jfiia/zXSrXrlUdlPeSNetjvPmKfhPz8NxGIzi
 kDjXyF1lm6ydfu28r8Ms5xnmcWuwICX0HaGzsZP+kR5kT0vT3nGRQuNrRa/mUSRH1COb
 luNYA4FkyCnW5sA1aYHMoHoli6YB7xGflXPwxB3+TVrWb1Jm2CTfXjHCa02sfo6UMTgF
 YH+jtkUN9HAy62ydiKlSwUsl/DCR3AMwCoDRXOve6PDbg2zEK35OngWKc6snvFJE686M
 vUEycF/xqN5Zlg7TZOOnyHoB9tvkOpyOTesTdf4pawdGShFcuEQ2SqxoYsJs56a8OKe2
 VU0g==
X-Gm-Message-State: AOAM533ibWpYOEzwB0p1cKG0ZgGFiw3Z95Y4bROjuvEYM74wjmHFHRiS
 3xvgkkEBkTqwOmMMH5loKeNEh1kh+90n7PHMRQ==
X-Google-Smtp-Source: ABdhPJxasvpTtmILTvhI9urTcrHK3ormhpjkbIgeYM54YOby9yyTnSm21MA2vVPUoX0dXaEQzA99bGOekrTm2PrCHLg=
X-Received: by 2002:a92:cccb:: with SMTP id u11mr3346582ilq.54.1599048931323; 
 Wed, 02 Sep 2020 05:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <1592312547-19239-1-git-send-email-yangyicong@hisilicon.com>
 <1592312547-19239-3-git-send-email-yangyicong@hisilicon.com>
 <CAO8h3eFLVLRmw7u+rurKsg7=Nh2q-HVq-HgVXig8gf5Dffk8MA@mail.gmail.com>
 <30ca8ffc-74a7-92b0-5563-286967d23dc9@hisilicon.com>
In-Reply-To: <30ca8ffc-74a7-92b0-5563-286967d23dc9@hisilicon.com>
From: =?UTF-8?Q?Matthias_Wei=C3=9Fer?= <m.weisser.m@gmail.com>
Date: Wed, 2 Sep 2020 14:15:19 +0200
Message-ID: <CAO8h3eE2ZzffbAC_pk+uDwxMtmPWbkHCXnxvXz-hLujueH3jFQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Disable the flash quad mode in
 spi_nor_restore()
To: Yicong Yang <yangyicong@hisilicon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_081535_150353_9E4DA97A 
X-CRM114-Status: GOOD (  10.54  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 me@yadavpratyush.com, john.garry@huawei.com, linuxarm@huawei.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 alexander.sverdlin@nokia.com, Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Vignesh

Am Di., 1. Sept. 2020 um 16:20 Uhr schrieb Yicong Yang
<yangyicong@hisilicon.com>:
> I've tested the following patch with s25fs128s1.
> I left the flash quad enabled before managed by spi-nor driver,
> and it'll stay QE after removed. So I think it'll also address the issue
> mentioned. Please have a test.

Thanks for the patch. I can confirm that current 5.9-rc3 bricks my hardware
and your patch on top of it fixes that. Therefore

Tested-by: Matthias Weisser <m.weisser.m@gmail.com>

But I am still concerned about wearing out nonvolatile QE bits (not in my
case, but there may be others) which may also brick hardware after a lot of
boots (by set and reset QE bit on every boot).

So, from my limited point of view, your patch fixes my problem but overall
I think the original approach should be thought-out a bit more.

Regards,
Matthias

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
