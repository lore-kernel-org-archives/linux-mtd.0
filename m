Return-Path: <SRS0=0ZJr=25=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E58F3C00523
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 08:18:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B08C4205F4
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 08:18:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qVx786it"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B08C4205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c8SHfshAUU+3qUzQwbRgagomXUZkbdqpDxtCdw9TFtM=; b=qVx786it2JFPiv
	w5gR+EgBCwZDZhgXiBiZP3uOFubOUgzEcFZ8MlU8EIHIStMYbB+RwTfQKYFXmPtJcb9gdD88izDej
	Bg3ZD0GJRaMzNThoPX4hF4mFmhlHQUi+xsaJ7ytN+Hv0lXh41sWCQhzucs1VEstDvDA4k/co9Ak3L
	yf+Zzu0LbOkuVae5GGwQG/N835TKsmMd1jhHcjQwcAxSllfPhBkW7iVg/0jRQXF6ObeswVILp6gt5
	rFylMU3Jsur7o5hH5n+drY6muXxR7tqqy/IC+Jn8NysGsJJVvZKG5TTZNBpy91sofLuhCQ2WX61YO
	/YHOJl7Z/JgbcdVxEpYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ip6Xx-0002b2-Qd; Wed, 08 Jan 2020 08:18:33 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ip6Xu-0002ZE-R7
 for linux-mtd@lists.infradead.org; Wed, 08 Jan 2020 08:18:32 +0000
Received: from mail-qv1-f43.google.com ([209.85.219.43]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M3UEW-1ipemB3sLi-000dvV for <linux-mtd@lists.infradead.org>; Wed, 08 Jan
 2020 09:18:26 +0100
Received: by mail-qv1-f43.google.com with SMTP id dc14so1035417qvb.9
 for <linux-mtd@lists.infradead.org>; Wed, 08 Jan 2020 00:18:25 -0800 (PST)
X-Gm-Message-State: APjAAAUojvEzgrVIDxtCAhFCSpViJJZcS0HSJOzKT5Kw6bO2h0+ogAAW
 VIOlZIa7mjmTRL51l42srVSQ4+rH+hTfUtPSu48=
X-Google-Smtp-Source: APXvYqw0ZBNJxzzyqnFyauYwGWHsDYTX8zgJMSpwqoHcf3dieGCqPMdb2QQItS7mU7UFLZCj05288vbPPvGH5wUT7Io=
X-Received: by 2002:a0c:d788:: with SMTP id z8mr2851256qvi.211.1578471504503; 
 Wed, 08 Jan 2020 00:18:24 -0800 (PST)
MIME-Version: 1.0
References: <20200107212509.4004137-1-arnd@arndb.de>
 <20200108091528.2c89d97f@xps13>
In-Reply-To: <20200108091528.2c89d97f@xps13>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Jan 2020 09:18:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0Q+-zYhkw_CpanXis7iM=9Hqw1Et8-GwxYw5d5Qy-sQA@mail.gmail.com>
Message-ID: <CAK8P3a0Q+-zYhkw_CpanXis7iM=9Hqw1Et8-GwxYw5d5Qy-sQA@mail.gmail.com>
Subject: Re: [PATCH] mtd: sm_ftl: fix NULL pointer warning
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-Provags-ID: V03:K1:2RrohvNKEQRbaFLolWMOpKIK8R/En3wFfuY3dnOLCIZn6jo/HvV
 Ds8HFDOt8kGWTTlLm22TIGrIRVBtP9GH4BgAbqGCocAbQYmZWRaiyIUZA6dAfTr7KBBr7x7
 x0+1oFQfkboTEoETCBErRFxht7uSghEKZ05ET+1yQONdyKlMgnBY3CKXuUr3V3selOK43Qo
 zyTSkYYaSkEVMkOnbybVg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hSyBhCz4BzM=:hVt8QjM7F3lATjYNIMxsyf
 K0az8ChWntG01PFAwv/sIJALRS2usAmgLTJOSKduZi35Jul5h2ieRkCjEp055cTFvSxpCYntD
 mZ73AcbAlKKe/19OLqgWXQFQuC6VnHU0G/MikNp4iJqKHKEoNEsFeZHTFz13Q9PsXhsBti6zg
 1zxIPPTr4oPt/1hTabPUzfUzo8OuHEjeJTN2VUySuPSSyzNokp8VhAkLUK3B0jM8daV2dTrQX
 Dew4aoTqZv7yBhDr0ji/w5iPB2DfB7xC7Tnhwk8RF9bPnBcBKckZU859aW4wAvUyfyanFa/+M
 Ygi6af+6qrNjD/7bPkNmfZDQto97wXTtZQU/4R2ts5l7biCtJY6+mQHeuA850d2ZX2IsCPmgK
 ATIgHaC5M7421KI2fTfdfYH/S8vxecPXWyDWC1yDxP8oUh2zI+wI52peVfGOcyr19x0vGkMNd
 D7C2Sz97rJ2cWovk0cbZk0fEy6EoyUsF8nCna4k1e4Pm2xER4KTTwrtrZrEJCCyJx3U9T3Yox
 TUp2zT5zAbqTm1CnWU6Ky8vTBIl8bZqLAx10s4Rueo1STyyM+mcN3RNmrnrjG98UHzN1xLFsy
 6pSzsmCP0F6hU/g3eZya6/T67pH2n6SjmUf0MEJSJCFZCBeezjzcYKPJS/vstWD7c5SdsN/gq
 u0zEToC+0Oi8AQi3jETjT5myMT8GFQnx7rAC+xlK1BvGqfb7pFwk/iziUXNgdNsUcRR+OsGfe
 K6sNxVqItKANg0yTOoJeWLY7LoFkOhfL2mIDVs3PpJRHsabR/5aiLJcwTvfwVS06Kv5MLQX9h
 jFVNwe8IraPFwAeKQP6sPE8Hi8vTtZ6jcCOGKpIP9/Cp6/Z9ciOoSm/ny/wrr/JZCC7PSj3zT
 3jIjb3RfbnXvYj/hmWJQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_001831_166756_E7FE365C 
X-CRM114-Status: GOOD (  20.52  )
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
Cc: Oleksandr Natalenko <oleksandr@redhat.com>, Wenwen Wang <wenwen@cs.uga.edu>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jan 8, 2020 at 9:15 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Arnd,
>
> Arnd Bergmann <arnd@arndb.de> wrote on Tue,  7 Jan 2020 22:24:52 +0100:
>
> > With gcc -O3, we get a new warning:
> >
> > In file included from arch/arm64/include/asm/processor.h:28,
> >                  from drivers/mtd/sm_ftl.c:8:
> > In function 'memset',
> >     inlined from 'sm_read_sector.constprop' at drivers/mtd/sm_ftl.c:250:3:
> > include/linux/string.h:411:9: error: argument 1 null where non-null expected [-Werror=nonnull]
> >   return __builtin_memset(p, c, size);
> >
> > From all I can tell, this cannot happen (the function is called
> > either with a NULL buffer or with a -1 block number but not both),
> > but adding a check makes it more robust and avoids the warning.
> >
> > Fixes: mmtom ("init/Kconfig: enable -O3 for all arches")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/mtd/sm_ftl.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
> > index 4744bf94ad9a..b9f272408c4d 100644
> > --- a/drivers/mtd/sm_ftl.c
> > +++ b/drivers/mtd/sm_ftl.c
> > @@ -247,7 +247,8 @@ static int sm_read_sector(struct sm_ftl *ftl,
> >
> >       /* FTL can contain -1 entries that are by default filled with bits */
> >       if (block == -1) {
> > -             memset(buffer, 0xFF, SM_SECTOR_SIZE);
> > +             if (buffer)
> > +                     memset(buffer, 0xFF, SM_SECTOR_SIZE);
> >               return 0;
> >       }
> >
>
> What about a simpler form:
>
>         if (buffer && block == -1) { ...
>
> Instead of an additional indentation level?

That would fail to return early from the function if we ever get block==-1
and buffer==NULL, probably resulting is worse problems later.

       Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
