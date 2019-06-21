Return-Path: <SRS0=RgZt=UU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39BD9C43613
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 10:35:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D389E2084E
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 10:35:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EFeSLPkx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="wnSJN2YS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D389E2084E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HADi46RynxlAK2qo1xO85c3fbs6Z+OS825i5mUP3By8=; b=EFeSLPkx3k3nIb
	mmzNZewZ4rK/oZVQ+Mg8wFOhfPWBgyEBAFphnzNV85RLsqzCfuWFaJ+1E8o/F4Dws3Wz7D40CMHfB
	TJOffT/zDplMUJv+cZFcf2aaUupnYm7vwFKtLngWcUAkJI/3v+df9BLZp7Eg1rqJd6XzAenpbyfT4
	vbGfSc9dWsXJIMLmSXTaNcSWtXREwxY1ydWK8+ezFf2DWTyflAe6Dr4V86KjQs3LH/bibO2EOG7wg
	z5TPc146QoI84hSQofsR9YPMfKncuK7Rgu0kfwNbHuh932kayENtceoUuTARz7Spi3X/zi+vP7inV
	ScVMvD1F9OCsUWG++1cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1heGtW-0003gB-P4; Fri, 21 Jun 2019 10:35:46 +0000
Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heGrQ-0000lX-Hx
 for linux-mtd@lists.infradead.org; Fri, 21 Jun 2019 10:33:39 +0000
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id x5LAXDpi001409
 for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2019 19:33:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x5LAXDpi001409
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1561113194;
 bh=slfiaAY4ctD94Gy3nIbu6Gult9fpiEPn6QKaADUxQkE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=wnSJN2YSm5dcil8H1o67DeyN/Hp6D/EDbhbYZM0bvHEoQz7AJD5o5SqBj5Pj9t91/
 9IS93tRtVysnYe37IvrmPonY66k77U3crau83eCosz69Vf3h1ZAIK1JKJNThAMgY/u
 QEChTxJ7/HRHvWma9BpSelr3N5EHG/3k2vCrRaiFnxJLEvagewR/62y5vD2mvT9bPz
 Z4kGWlnyfT4gXbmhNvZNMu2IxM9xSpE8/tzbdRl2W4k5LPWwzxd5IXZddWd4qQwlUE
 2izOTbELWcIifKESaowAUrgJFUhIK6sAMyn8B5u4XPoMFVuOl/rHJ/lSFyi/dDy3gc
 XRujiIC7LqT8A==
X-Nifty-SrcIP: [209.85.222.41]
Received: by mail-ua1-f41.google.com with SMTP id v20so2836207uao.3
 for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2019 03:33:14 -0700 (PDT)
X-Gm-Message-State: APjAAAXCrzpjmh/f5k7Y/jtufvoUDTZoBW9nDRpRAaRvvvqJ2rE6k9ma
 4cta78Xv1yXo20b9C+JFhPlMtIYCGdmQYTou/rM=
X-Google-Smtp-Source: APXvYqxmLwDT8bifOHDTDpQKL32lnNXuu/XL4hAyCx//Eg7ndO/Vsaqad1/OJc7brSky8Jqv5hVmgu5F8KQh3cyMtv4=
X-Received: by 2002:ab0:5ea6:: with SMTP id y38mr45596842uag.40.1561113193212; 
 Fri, 21 Jun 2019 03:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190521084335.15026-1-s.hauer@pengutronix.de>
 <20190521090417.7883-1-miquel.raynal@bootlin.com>
 <20190521114022.2c3bbc77@collabora.com>
 <20190521114808.76c56e27@xps13>
In-Reply-To: <20190521114808.76c56e27@xps13>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 21 Jun 2019 19:32:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNATMC5VHGG=CdT1Lv_7HD8y65yVRGsBo92-3c2S1_QTGdA@mail.gmail.com>
Message-ID: <CAK7LNATMC5VHGG=CdT1Lv_7HD8y65yVRGsBo92-3c2S1_QTGdA@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: initialize ntargets with maxchips
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190621_033336_985182_1AE4BBC9 
X-CRM114-Status: GOOD (  16.90  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, May 21, 2019 at 6:48 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Boris,
>
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Tue, 21 May
> 2019 11:40:22 +0200:
>
> > On Tue, 21 May 2019 11:04:17 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >
> > > On Tue, 2019-05-21 at 08:43:35 UTC, Sascha Hauer wrote:
> > > > memorg->ntargets is initialized with '1'. It should be initialized with
> > > > the maxchips argument from nand_scan() instead. Otherwise multi chip
> > > > support errors out on the secondary chip selects when trying to call
> > > > nand_reset() on them:
> > > >
> > > > WARNING: CPU: 0 PID: 1 at drivers/mtd/nand/raw/internals.h:114
> > > > nand_reset_op+0x194/0x1c4
> > > >
> > > > With this memorg->ntargets is initialized with the maximum number of
> > > > chip selects supported by the driver. After having detected the number
> > > > of actually connected chips memory->ntargets is updated with that
> > > > number.
> > > >
> > > > Fixes: 32813e288414 ("mtd: rawnand: Get rid of chip->numchips")
> > > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > > > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > >
> > > Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.
> >
> > Are you sure it's mtd/next? I'd expect it to be queued in mtd/fixes not
> > mtd/next.
>
> Yes, I failed to checkout the right branch :)
> I meant mtd/fixes, will move the patch.
>

I was also suffering from this problem today,
then found this patch.


Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>



-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
