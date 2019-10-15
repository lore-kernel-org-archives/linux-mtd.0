Return-Path: <SRS0=fWin=YI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1452ECE58C
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2019 19:00:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C7C620663
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2019 19:00:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CBJgCXD1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKp8MbAd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C7C620663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XGqW+c0/ws7YcY6CHNoT4rkvstsdcrU2wxbJomDMZQo=; b=CBJgCXD1VINNR/
	FK4K5efaEwoJbLUwzbCyyvEoarPGTZBQHCZ2BhlZBJIw1K/TYjElDnfquIU0f7b2p6vpMj+KzK/1e
	7LemVqPQFaIMws2l28HCTuIRoOuraTk97TfNlndF7pDsOnLpJ4WQrjVUD64XaDpTlZ0y6B8Jq8Gkn
	T/q52IlLTJb412XqiCK4tJArELXI+zqB877MLcnSsO4k1ABZRwZveRgA8OKneEO9rObnvltj5aGLo
	z4e4zQp0Vydlv93yAqLcq2u+WJ+BE6X7aoZedxD12OfEHaojRZhsUdGo6d5fzHVpE+z6/lDEQSpvw
	iLtaz8PYqVuB+nzKKM8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKS3A-0001Hx-6x; Tue, 15 Oct 2019 19:00:04 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKS37-0001Gi-AI
 for linux-mtd@lists.infradead.org; Tue, 15 Oct 2019 19:00:03 +0000
Received: by mail-wr1-x42f.google.com with SMTP id y19so25179308wrd.3
 for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2019 11:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sT31cPY3q3Y+qR8eK0/0NIPAXRh6ipujGOqbNzhOHtI=;
 b=GKp8MbAdME9h6C02iyLMhVZ2Tq8fzRE74Sj2iraKzpx/xmcMK4kYOu+QqFRFBC5iYm
 o0DvDS8lckt4x8UUNgNW18gdeVQCUg2WaPC9ITdjqS9WyLRGLXl1n5LKyk4xkMVjYiSY
 WaS1Ma9E3+894l/wght17XxN2S4Q+bxDzEo6NMWUBB7EuEStSLEo4tPEKdLU6geldgr3
 vdkATjjO+u2sVqVBNy+OTJJvuMNuUw+Rkcf/8UbeVZeezpyrlI07ocG2Sof4ydyRzJBt
 BYEt5GnXueEhbwMnZR+jOymM93fKwJPr9F6PHiL7TF/xBVx0wM/ZSv3YO8svZRC4Iice
 oOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sT31cPY3q3Y+qR8eK0/0NIPAXRh6ipujGOqbNzhOHtI=;
 b=bt8RFKAe6p8crfWtRKNhmfiDpZ2V+heQdlzPnveI1siWbkZ6x7emquvBWGtZqWiyr+
 FqhfUrGa5J1q14HGjoBQPoEiF9kWy+pthZk5ZKSQBEIeMVG/RVLiEe5iEaj7cK837AnC
 fdzMxoVjfDmzwualDbIo+FxxB5xD7fD9+lpLuSIKeA9DcgSJOg1RFcvS5JRmSLKmkcnK
 ZqZX51Ded/d5MNovBAmFXP1g65cSXolkdMC8Kl1Hc234arSERlHUKsCV573CjkU6kWo6
 L+Neau+acDp9lxTSRVP8lPRqttDRRNWvVBQtGpTtRBKkQnYd0oLYJS1rsbMIUScpgM/M
 0H8w==
X-Gm-Message-State: APjAAAV/qFGPjyOEiyDfMXjWJWN299lKeTMRpFDaCOdDWXRNvLjjdZEU
 jxtSuCZDi53toEUHEIkbwSxwiTPwizKoVgFgo/o=
X-Google-Smtp-Source: APXvYqyYHG/xtxX0RDyq6Jf9HBTG3bAMD7jCvEssSoiGKj5xGoRUnXWrMS/fueGtUsbLEUEy7fSqJtUxft28SeH75BA=
X-Received: by 2002:a5d:5589:: with SMTP id i9mr32962796wrv.129.1571165998711; 
 Tue, 15 Oct 2019 11:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAO1O6seC1UFVrDM1FxP09uPrQhAUxp3pU=YUy09Vj98mpcU=Cw@mail.gmail.com>
In-Reply-To: <CAO1O6seC1UFVrDM1FxP09uPrQhAUxp3pU=YUy09Vj98mpcU=Cw@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 15 Oct 2019 20:59:47 +0200
Message-ID: <CAFLxGvz8t-oyzkZE-9X=b+f10-no=E8mqhxmct9eJ2PK54bTfw@mail.gmail.com>
Subject: Re: mtdswap + ubi results in deadlock
To: Emil Lenngren <emil.lenngren@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_120001_379849_F523756D 
X-CRM114-Status: GOOD (  12.65  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Emil,

On Tue, Oct 15, 2019 at 7:00 PM Emil Lenngren <emil.lenngren@gmail.com> wrote:
>
> Hi. I'm trying to use mtdswap together with ubi increase memory.
> Normally mtdswap has its own wear leveling but I want ubi to do that
> job instead. So I removed all wear leveling and oob usage from mtdswap
> (or really it doesn't do wear leveling if the mtd device has no oob)
> and am now using it with a gluebi mtd partition on top of ubi. It
> works good but in some occasions it deadlocks because ubi internally
> uses kmalloc, which in case of low memory, waits for swap to complete.
> But swap won't complete until the data is written to flash.
>
> Do you have any idea how to mitigate this issue?

Well, if you use UBI for swap then no memory allocation within UBI is allowed
to trigger swapping. Otherwise the memory allocation goes into
recursion and locks
up. This is what happens in your case.

You can try to pinpoint these allocations and use GFP_NOFS there but I fear
that will case other problems.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
