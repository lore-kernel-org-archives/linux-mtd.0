Return-Path: <SRS0=STJJ=JX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD49C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Apr 2021 08:50:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 799B060233
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Apr 2021 08:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 799B060233
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HrT1maPF5TnbLKOcqN6qpn+BAI9DqnlW1aZIsZglk4c=; b=Diqjo5mranJNSfQKbhiU0ZL1F
	hoVLUAgCBVlFLDU25eH4Qcf88HA4uz5MOxrbh+N9h5gKPr+a2yhSlh2hLWTD2oxSv1Q6MkQw2u/ny
	UXz5S3PrNa87dzSof4j6VPjp1RKp38kaBAExqPr8cwZ5R6fAq+9lmOh184as3OkFtd3fYz1/OyCFP
	nmQI+zZIFRzoV5WVKFpn8r8Sc+pBTaIOniz7F+NuIRsqdQprLk3Xfr2d2aomE5xjjfKHQfYGFO48D
	U2arhMYHUbnyG8YJG0OM+aInpvAztHrweKBbhuvQcFendBeC9H0H6EW6FW29RUqSU+rLwSqtff4zR
	xfevmiFpw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lawvy-007EhG-8B; Mon, 26 Apr 2021 08:49:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lawvv-007Egk-Vp
 for linux-mtd@desiato.infradead.org; Mon, 26 Apr 2021 08:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=keMrPxdnuQ2eyE2+o6RIGcLK/2JgBIc9v2ZJ/1tg/H0=; b=tj7lOoJ4mofd4ESNgiIj83UCh1
 103ExPvk7qszTckFK4cuAUhuo8TyhZDW5RrvcTArY+kDO9ZIjo4zCCmacb38FIVINgzmT3zpybz1E
 gbUz4PRgUrL/wyTLPhHkQ+h315JxSC65iiiJydyVzKouTTxCIAUVOUN14nBHsM9oPA9saZ9Ny33ze
 pz9jWyc5BdEiJjLkRoO4A+88CFoOyBtO6ztySt5WQsCdAlmvHUG5K1y4Jt+QnaTqZhbysTZkACAEq
 yxQUyQrsUBDQXGYMUnGbTrp6B+lgYEnN7LQt/4S5J/+PbdhMoDh0V4NmhDVWm/M2RlEmqYLygiSVu
 65wPvyPQ==;
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lawvr-00Fq36-Cs
 for linux-mtd@lists.infradead.org; Mon, 26 Apr 2021 08:49:34 +0000
Received: by mail-ej1-x62c.google.com with SMTP id zg3so1602586ejb.8
 for <linux-mtd@lists.infradead.org>; Mon, 26 Apr 2021 01:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=keMrPxdnuQ2eyE2+o6RIGcLK/2JgBIc9v2ZJ/1tg/H0=;
 b=vOdz2AyqkR3N5gPVxiZCUvx3pwe8/rQGZ+2j+E/JBgMN8eOJSORqUBLvDSsqshjjqq
 9f2as81NwE9dqyACbniLf8mDhhtOT3NT/9b2rb0L73tdKMug+c4ShHAQYdyVjstEf93I
 hCBG2UyqoHUVG9LLYjqyyzMFHEe1PvogaJz0PpHVfQzHio3FDdO4IQZnAcoODX0x8ZaK
 1Pw3nEwJYCLq6do0GScc+6NXzb02uu5W7cSgLLwM+ZwhncxObEr9ccn44pPAgVssZ1lm
 3bHw+vn0mQjufyGzQy427dLjK9lmODSn8yy/VLLVAYw6DqWu/yhEpojz+SmnGKn4H6a0
 yXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=keMrPxdnuQ2eyE2+o6RIGcLK/2JgBIc9v2ZJ/1tg/H0=;
 b=FqdS92A+BIqg1gwrMLxRh3lBxvy1vdTDixPQTInoGQVoO0vb35IFmIPjU8xeQibv9f
 c5VZuLeasykX8gBDNKGAYllWv0/Tv2x0s4LDzStTvYL9aQf+m4YXItNtNgtAG4Osy4xA
 kHEIvmJYMhlO3SoHb4BESsqvsIt6+K0yozlGuS2S/OcYHNm5BldE+jfNKBbsJ4GOJ0P7
 OHxqzsQ+7/PQY4+iWvzQr4Z8cGKys8ctaC5vvS7Nq+CAaLV8ansLmJmb0PCB1Wgxw4bx
 Se7EDtKuzahO8Tf4+PKIr1h4LDII2pYxjSkDqhDBKK6TTXLRuMuwzI31tc427401t1SG
 teMg==
X-Gm-Message-State: AOAM530nxNmc6W+milRAe6erwn+Zth/3xVXBjphndGhEEc/gvEaIDe7R
 js4Z1yyDLuIXISAZz2I3+N9xGuPXnFC61IUH0A==
X-Google-Smtp-Source: ABdhPJwqaMEQcuKfPyhQlZO2Ldty9Q32hy0Rd8cJYaxnYq/jZ5M1ilOtRmGoaGrhrGb8QlvfWHn8eSHwPcza1j87ikQ=
X-Received: by 2002:a17:906:3613:: with SMTP id
 q19mr412831ejb.231.1619426969899; 
 Mon, 26 Apr 2021 01:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210316141916.447493-1-rsalvaterra@gmail.com>
 <CALjTZvaX8miSycr4oGmF_rGN4KWWBzfyBj1-7jefT=Uz3w9Oww@mail.gmail.com>
 <ee050b2dce3a233318748df416be0ebff4402ed2.camel@infradead.org>
In-Reply-To: <ee050b2dce3a233318748df416be0ebff4402ed2.camel@infradead.org>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Mon, 26 Apr 2021 09:49:18 +0100
Message-ID: <CALjTZvZ5-c3+v2db=mqwVF12yn68BwRk8HWi2rr2yK8F-kZzvg@mail.gmail.com>
Subject: Re: [RFC PATCH v2] jffs2: add support for zstd compression
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 lizhe67@huawei.com, christian.brauner@ubuntu.com, gustavoars@kernel.org, 
 trix@redhat.com, keescook@chromium.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_014931_462294_09A89D4F 
X-CRM114-Status: GOOD (  18.21  )
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

Hi, David,

On Mon, 26 Apr 2021 at 09:24, David Woodhouse <dwmw2@infradead.org> wrote:
>
> On Thu, 2021-03-25 at 14:47 +0000, Rui Salvaterra wrote:
> > Friendly ping (and also cc'ing dwmw2).
> >
> > On Tue, 16 Mar 2021 at 14:19, Rui Salvaterra <rsalvaterra@gmail.com> wrote:
> > >
> > > Implement support for zstd compression in jffs2 at the default compression
> > > level (3).
> > >
> > > Lightly tested in OpenWrt, on a single CPU embedded MIPS32 system (AirGrid M2).
>
> Seems reasonable. Do you have the corresponding addition for mkfs.jffs2
> and can you report the boot time / image sizes with it vs. zlib on a
> typical platform?

I haven't done any changes to userspace, other than OpenWrt's fstools
(to force-enable zstd compression at mount time, with compr=zstd).

> And if it doesn't make a difference to boot time or image size... why
> are we doing it?

In OpenWrt, we're carrying an enormous patch [1] which enables lzma
compression in (and only in) jffs2. Having a single compression
algorithm with good all-around performance, usable by other subsystems
(e.g. zram, ubifs) would allow us to disable other redundant
algorithms and consequently reduce the total image size (I measured an
increase of nearly 200 kB by the lzma patch alone).

[1] https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/generic/pending-5.10/530-jffs2_make_lzma_available.patch;h=1bccb30a69f69ff8e2e70a747b1f3b25d1079c8f;hb=HEAD

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
