Return-Path: <SRS0=tKtu=DM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52122C4363A
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 14:54:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAE942078A
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 14:54:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="09OZS+pV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KJ+MkWhW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAE942078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xzw3/4eFqqJ2gPQXPb8weUF5Xf09NPiFNdRtzUOlNaI=; b=09OZS+pVpsStbzY+jV9IrG1vq
	6pDdZXLtRoh2u1aFcBuPs0lxgPrm41dgXJldl5L6NikZsWAnkLiWtAX3KanoP0CMOLxKH1iV3ttzi
	h2VfQj+YnZ/prQTf5ig8AOTJjVJOi5dOe/cVtK8o2ogmd5c0C5NDtBHmgTlT/G3oYCUH8ds5a90K7
	aoou/FxaAkb+pzlVfkkFSPR+smkOy1B5AwmY7HYbWDjeWJR3YKQm6SDDjv8o8CwzvtIB3o80/GKS0
	6nkYB92sSh5crYT9pC6iRMd9Gdty2j+ahI7jYlZGw457URqE8cOcNnrKANRa0GWaXsZX189Tb3qc3
	Ofy9Bxvfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPRsI-0005yq-RN; Mon, 05 Oct 2020 14:54:02 +0000
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPRsG-0005yF-CZ
 for linux-mtd@lists.infradead.org; Mon, 05 Oct 2020 14:54:01 +0000
Received: by mail-vs1-xe41.google.com with SMTP id e62so4367047vsc.10
 for <linux-mtd@lists.infradead.org>; Mon, 05 Oct 2020 07:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ym6bsjkoVHeKT2YlsX+HlWwN/shfAKw/+hwQ4HCTOvw=;
 b=KJ+MkWhWuGC2LVG1fwszRlcVzZxqs9l3qG0znHupdzRMH5eJBIsd7UFgzbcMIOuqqk
 wQQwPrl6rnk4eqTGoAq7q3tC0U2s+w8vyHlCS4nhmyKEJ1Y15MxHJTUSLw8NSlCTf2qJ
 ji9krD059ZPvVx6WsDUgJjUYwe0xw0uBFUtJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ym6bsjkoVHeKT2YlsX+HlWwN/shfAKw/+hwQ4HCTOvw=;
 b=MAGCL0iC+cJ5jMFRktGdXdbQRdqmYRBgOaguJp1T0HLNMRN6eH8X61aYCwEmaaJZoc
 eBgV4fa4mW8X1boeINd/fZq6NaUxyAZi1Un1th+HGMMcu8+2J+UeMWk0DyjMZjOEuEQX
 bJajx37vmTb7QrE8ZgcmwSupFbHFb2dB5SUnn/je8wJqrpBNlC9Zh0Gx7qtlaMH5KAPE
 hYfW6AzoR7avMUz4aPOlE5DkXArs5mtbopzlaU+SrG6bwbC5fQmBIQXzFXQFp4p6WBPP
 ey+K+1cMZT4RXvZi6XhxncUwoIgWkIVDqtdX1Icj1HsNb+BAU+QGN6HafabqYGkUScef
 tiAQ==
X-Gm-Message-State: AOAM5336+8MedDmBQwOrqDZ9YnXaHQ85JNnIGoBse+pFS9jOQFQ8RQwi
 2XMId+zlhjia3SVfdusoQ7h3gEOfM4YRaQ==
X-Google-Smtp-Source: ABdhPJztTewP83E+LlNoFF8YBuBXeBGVKwBt+K37jy4dOsuYZuWFW5RmiThRjjNmOlFMn9/buB8r8w==
X-Received: by 2002:a05:6102:38d:: with SMTP id m13mr325065vsq.2.1601909638156; 
 Mon, 05 Oct 2020 07:53:58 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com.
 [209.85.217.52])
 by smtp.gmail.com with ESMTPSA id h8sm10409vsj.34.2020.10.05.07.53.57
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2020 07:53:57 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id u74so1821305vsc.2
 for <linux-mtd@lists.infradead.org>; Mon, 05 Oct 2020 07:53:57 -0700 (PDT)
X-Received: by 2002:a67:8bc2:: with SMTP id n185mr270743vsd.49.1601909636866; 
 Mon, 05 Oct 2020 07:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200902160002.1.I658d1c0db9adfeb9a59bc55e96a19e192c959e55@changeid>
 <20201003150633.23416-1-michael@walle.cc>
 <CAD=FV=VB-ML0=kmN-yAH7sD-sMiX9Cq1_9B9QwVL=Ed5ZrGnbg@mail.gmail.com>
 <b376b3f2e41662237d50d589e3696b06@walle.cc>
 <CAD=FV=VddVg=QLS32Jr-Mxh6nyiB2=1MybxGiYuuaKd+fQ4+Lw@mail.gmail.com>
 <23aa87ccb6ae4133a17885b809194161@walle.cc>
In-Reply-To: <23aa87ccb6ae4133a17885b809194161@walle.cc>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 5 Oct 2020 07:53:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UoXqBJea36=5f-i_g82Tn6Zhib2GmF8G65UbPJskXiGA@mail.gmail.com>
Message-ID: <CAD=FV=UoXqBJea36=5f-i_g82Tn6Zhib2GmF8G65UbPJskXiGA@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Prefer asynchronous probe
To: Michael Walle <michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_105400_468777_1D42F458 
X-CRM114-Status: GOOD (  23.05  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, richard@nod.at,
 LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Sun, Oct 4, 2020 at 7:10 AM Michael Walle <michael@walle.cc> wrote:
>
> Hi,
>
> Am 2020-10-03 19:00, schrieb Doug Anderson:
> > On Sat, Oct 3, 2020 at 9:54 AM Michael Walle <michael@walle.cc> wrote:
> >> While debugging another issue I also noticed that sometimes my
> >> /dev/mtdN devices were reordered. Note that I have two SPI flashes.
> >> Might this also be connected to the async probe?
> >
> > It's likely.  My guess is that you shouldn't really be depending on
> > the numbering.  If you need to depend on the numbering, there should
> > be something that guarantees it like a device tree alias.  We have
> > struggled with similar things on MMC for years and I guess Ulf finally
> > decided that we weren't going to get a better solution than the device
> > tree aliases.
>
> But this has to be supported by spi-nor first, right? So that would also
> be something which has to be added before we can make the probe async.
> And as far as I know there is no such mechanism like /dev/disk/by-X for
> /dev/mtdN.

I did a quick skim and didn't see any mechanism like this for the MTD
layer, so I think you're right.  Something like this would almost
certainly need to be added.  As per the discussion in the MMC threads
about this, though, probably whatever you have working right now is
"by luck".  It may be stable from boot to boot, but I don't think
there are any guarantees that a new kernel version won't come along
and shuffle your IDs around.  Presumably it would be a good idea for
MTD folks to come up with some sort of solution here...

-Doug

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
