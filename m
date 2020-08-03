Return-Path: <SRS0=IhQK=BN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA61C433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 14:22:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A8732076E
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 14:22:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iqzFn06k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="c/rMlTX+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A8732076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Yb8Fp/fvatbJmVoWMUzJ4DWyyitzG1ZOZvzI+bLYGXM=; b=iqzFn06kCgbUUrWhzOrGYGjDX
	YR6oh0X8UZUSzld1aCRCFwUWIR+6gZjw6PjF1uK7uPMjXVdTORPEKfw9399DXT3lTaISJXGnNpKmo
	ty+S7gLJG/S+7hiKt8IIWhw1MLGahe9yK5eLIfn/zAz12IL2cBgI4F8g98jVq8MZU3DJNH2cmJucz
	9v/OIGX/qq0M5Y3Lz0ul5FeP9RmPrLkRQGjHxMHkldDy9GZ3U/eQFqiaQw3XSXadFPZ08RZCtQycn
	2Bth0MdTYhPM0gcxaW6uVSbN+IoSNMzCnBvyf7KYal2dGVkeWj6Z0IQ6OBZ/hBlnPIlZ7281ebDvh
	ACx7MPnCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2bM1-0001Ot-Ci; Mon, 03 Aug 2020 14:22:17 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2bLx-0001MB-Fn
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2020 14:22:14 +0000
Received: by mail-qk1-x743.google.com with SMTP id 77so2940043qkm.5
 for <linux-mtd@lists.infradead.org>; Mon, 03 Aug 2020 07:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+6U3fsmoRxsdzTrGF6+v9nKYi2wiEIz1y0w1GdZEAgg=;
 b=c/rMlTX+pF6DK6cNfyzRR5HU0imloK+lrQAGqCCO6KFukqa/DOaBBJ7ijihiEJHzUK
 Uh/tdNJ2H/Xs0VbunlCTw8cW1sCiVImy+oifN5UTi/TdhJxb6gCwWDhXCf6BF8usd5Sf
 mqECCzILP1BjGuZkgyEvCEOGQuJGzRyqbV/zCcAxJu9WQYNcBWzN+bqa1KZf9qyoH6RR
 zhhRYTwF75PNg0gYm2tVKVXxoy8lE1gQz+wBI/idkkZ0QdzlTZgzpwanuuggQPScxu+c
 qb1C4xHtXgP2HWSrtMCDNtX22U0WpvctYjQiANkSKfZQsXpuK+FV0myoNFx+dTXcKupY
 RUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+6U3fsmoRxsdzTrGF6+v9nKYi2wiEIz1y0w1GdZEAgg=;
 b=BwLRKVL3Ro4kwmlgxgEIX42eRp7sE2DTu8L9bqN1GiIVKUOUpwJKneNNrKZr+yQZyA
 Jc7pFWsis5dXmMARD5wKu8z0f4q1QuqR+HVpI0rcu7a/w/2/D7jFAB396e7immIm2/jz
 YMVJeM/TlHwu8L+ZTvEGMC/busxm05sPahCypMFF68YzqEz5A/fmxjBNiei00hu7d/gk
 YDQCmcQvo+dvZmE0+mLpUj0JAVKpgjTuZEoEalL373Y5Fr+I4Wg16+MaiW9BtrBdtmSB
 rdK73/T5HUnUhTCfT68z6GHNejQ4v4IHejMlBo+vXt4mWYYR4c7fXgCmgm+sMCsOYQ/k
 tvaw==
X-Gm-Message-State: AOAM532A5SXqUbHs4euheNiI2zcqzWxNb9cUgJJgMCHAKPpmz/DBHhJi
 tuXxCM84S5vTtIOK7fCFZtDEZVtU1uCJok6Rn2RHxg==
X-Google-Smtp-Source: ABdhPJxWIhpgMAjpjcjBBv4+U86NToUZpwQ7ZtnsSHKtMLJZOo/QaHcUs4SfUM0rBxsiNuYhy/wgovHJ5os+SSsWH9Q=
X-Received: by 2002:a37:b6c5:: with SMTP id g188mr15413581qkf.1.1596464530649; 
 Mon, 03 Aug 2020 07:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200803134449.72502-1-daniel.gutson@eclypsium.com>
 <CAK8P3a0rZi9hBsA6+YQCpCdYj6uY6z+cfVVi37jY1aNx7B5iTQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0rZi9hBsA6+YQCpCdYj6uY6z+cfVVi37jY1aNx7B5iTQ@mail.gmail.com>
From: Daniel Gutson <daniel@eclypsium.com>
Date: Mon, 3 Aug 2020 11:21:59 -0300
Message-ID: <CAFmMkTGTX=NwpRKcTTkQN2S6LEWkvMzpL7eCHK99HgC_giNgUg@mail.gmail.com>
Subject: Re: [PATCH] Remove attempt by intel-spi-pci to turn the SPI flash
 chip writeable
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_102213_853051_EE924C59 
X-CRM114-Status: GOOD (  21.04  )
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
Cc: Richard Hughes <hughsient@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 3, 2020 at 10:55 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Aug 3, 2020 at 3:45 PM Daniel Gutson
> <daniel.gutson@eclypsium.com> wrote:
>
> > However, this flag applies only for a number of devices, coming from the
> > platform driver, whereas the devices detected through the PCI driver
> > (intel-spi-pci) are not subject to this check since the configuration
> > takes place in intel-spi-pci which doesn't have an argument.
>
> This part of the description sounds wrong: the current behavior is that
> the BIOS setting is ignored for PCI devices and it only uses the module
> parameter, the same way as it does for the platform driver.

Actually, the BIOS setting is not ignored, since it is not bypassable.
There is a lock in the BIOS setting, that, if enabled no matter what the
driver does, it will be still read only. However, if that lock is not set,
the SPI chip will be writable because of the driver. That's why
I say 'attempts'.
The intel-spi-pci driver doesn't have a module parameter, and that's
why it unconditionally attempts to turn the chip writable (it will succeed
if it is not locked).
What I did was just left the intel-spi-pci driver without any module parameter,
as it currently is, but removed the part where it attempts to turn the chip
writable (just in case the BIOS is not locked).

>
> With your patch, both the BIOS setting and the module parameter
> have to explicitly allow writing on PCI devices, while at least for Bay
> Trail platform devices the BIOS write protection is still ignored.
>
> It sounds like this is what you want, but you should update the description
> accordingly.
>
>       Arnd



-- 
Daniel Gutson
Argentina Site Director
Enginieering Director
Eclypsium

Below The Surface: Get the latest threat research and insights on
firmware and supply chain threats from the research team at Eclypsium.
https://eclypsium.com/research/#threatreport

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
