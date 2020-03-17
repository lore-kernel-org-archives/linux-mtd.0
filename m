Return-Path: <SRS0=BLjR=5C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACCFC10F29
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2020 09:28:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF938205ED
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2020 09:28:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="llZkyzaB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="FmVvBQ5N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF938205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QdWhSmB7FUNOco12XZQXcIT3lKXveGYYL59eGVyCGOc=; b=llZkyzaBT9BhnB
	nVBQopPobaYd2o8QlFMEO27cXFfw7uHoKYUjZIgqgwUfcVwX4V7/09FVEQXCRzLBMNECFGnUqrCqo
	F+VSzVnLXsyfYge9Zu6P22KxbA079ZHDBV9DsTFBa18bO262bTNfd0eEKSCYFxEbTqTxPG0UXbggh
	bfNDyMiQMY9NKDYT23I/HF/PWebFGhM9hDAOS7PJpTCS60+/wQ5sgK3PJUq69pMkiygQ4o9TUjPQb
	N34XIb5mxkBBD4YE2G0S20UF4IoulYKOh99HMJCYnHJEC6b0gksTjQnh+uCYfGD3SLLrbvSEH602K
	/IRKHbtaYvCI7uACzmxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jE8Wc-0008G8-8h; Tue, 17 Mar 2020 09:28:38 +0000
Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jE8WY-0008FJ-A5
 for linux-mtd@lists.infradead.org; Tue, 17 Mar 2020 09:28:36 +0000
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 02H9S5Ve024831
 for <linux-mtd@lists.infradead.org>; Tue, 17 Mar 2020 18:28:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 02H9S5Ve024831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1584437286;
 bh=rpOFg4qBHY2DfO2OU1up95OxAWFlrtCaX4jRZ7ivC5s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FmVvBQ5Nz5bpNqyE9aM392jfZwkQEFFJMwYPY1owYTIw/T0h9WC3AJnYGxGnRAtAd
 FWkYfUkwux1nEPesDnR2dpBO95hkHBFwqWUKhIbUtyBN4A93IwxYaRlOq39qdQ/6qd
 5edsaUM7bntXLwKjKfd+5unyld/oBvKtK3gFOm5/OIYLtTgvAVu75E3JPIX8YwiEAd
 oozUisErMuvp1NqeodfmICjI9/iaMtkTLObVxNs3tTou1ryY2w1FsL0Z6BKi800E0o
 fG32/gKO01U7TRbrrqMra7UmUonX+d6BjWwjLnZcZm5JPCVAZseBYGdoxIHlmLR6gS
 hqESnYbmsj21w==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id x206so4631195vsx.5
 for <linux-mtd@lists.infradead.org>; Tue, 17 Mar 2020 02:28:05 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2e9u2rXJNB9YvyKpfYSCKMq0cbVtgYlHHXpmRrE3782Dm/235+
 CDMO69zcPZ96LMLIQhfnEueGccUI+fx5ueUufkI=
X-Google-Smtp-Source: ADFU+vvV6dqDFjXg2yV6u4pLtnn/BAWLShyzlzF3QfkxdsZKxWCzGNm4tOpiuJ2CsfM9WLC0uAdBCriSpqMQ7Te7aD4=
X-Received: by 2002:a67:3201:: with SMTP id y1mr3021738vsy.54.1584437284481;
 Tue, 17 Mar 2020 02:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200205070834.3087104-1-marex@denx.de>
 <20200211170707.2183625e@xps13>
 <b1a10583-e110-9568-4007-aa2b3f38a7be@denx.de>
 <CAK7LNARqYDh4AJ+N-PTHui0H89-humECskJVUxW4cTf6edEBMQ@mail.gmail.com>
 <f4e2deeb-cc0e-fb06-46fa-d6cf4f2a73ad@denx.de>
 <CAK7LNAR4MU+Rfmpz99iwLuEbD4jMwUdh91uz3zyQdvjyLEQcMQ@mail.gmail.com>
 <29cce21c-2214-7238-0bc5-db2c1a54576f@denx.de>
 <CAK7LNASckTZO-9uVjtQH8iKhU0HH9WiMK-CzMxjESQOOUM0cKA@mail.gmail.com>
 <CAK7LNAT3EG0XocC0xT0f=6MBpXLga3FehOjEYbRyP6AJUbqb2Q@mail.gmail.com>
 <311cdc3c-59b5-a46b-62f0-e78fc970134a@denx.de>
 <CAK7LNAT1Bzs68X8PiWQHg4g2bpPGd-WM9D4vwf59XfwwLVuVQQ@mail.gmail.com>
 <e86925d0-805c-d364-57ca-6400b77cffd7@denx.de>
 <CAK7LNARDp1Zru3_XAQyBZHwsRov-QWOnrrwodS8pjszsKy2ysw@mail.gmail.com>
 <d4b4abf4-1af9-d57c-5b93-2d56a5dc456b@denx.de> <20200311140807.6f56baf3@xps13>
 <5fa809a3-cd2b-74de-3615-387232051ae2@denx.de> <20200311143302.309bf468@xps13>
 <aaec50bb-05da-8d4e-3e15-17fbfeb52f68@denx.de> <20200311153923.443f3e64@xps13>
 <45157038-8309-3c00-3019-a1c7afc059c0@denx.de>
In-Reply-To: <45157038-8309-3c00-3019-a1c7afc059c0@denx.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 17 Mar 2020 18:27:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQK57+iNS_GVd3j1u6g2S88i+HFCGkX2A0ckUitC9HhrA@mail.gmail.com>
Message-ID: <CAK7LNAQK57+iNS_GVd3j1u6g2S88i+HFCGkX2A0ckUitC9HhrA@mail.gmail.com>
Subject: Re: [PATCH] Revert "mtd: rawnand: denali: get ->setup_data_interface()
 working again"
To: Marek Vasut <marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_022834_699135_2BA9FBAC 
X-CRM114-Status: GOOD (  36.59  )
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
Cc: Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Tim Sander <tim@krieglstein.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,


On Sat, Mar 14, 2020 at 11:49 PM Marek Vasut <marex@denx.de> wrote:
>
> On 3/11/20 3:39 PM, Miquel Raynal wrote:
> > Hi Marek,
>
> Hello Miquel,
>
> [...]
>
> >>> I checked the denali driver and indeed u-boot should not be much clever
> >>> than Linux. Are the differences significant? The code is so close, you
> >>> can probably check why you have differences. Also verify that the same
> >>> ONFI mode is used.
> >>
> >> It might've made sense to check those driver differences before making
> >> such an statement ;-)
> >> That said, I don't think either U-Boot or Linux uses the ONFI
> >> information for this NAND, but I might be wrong.
> >
> > I don't know what is the exact device but most of the time, even for
> > non ONFI-compliant chips, the core starts talking at the lowest ONFI
> > speed (mode 0) and then negotiate with the NAND chip the actual timings
> > to use. This works if get/set_features is supported, otherwise you
> > might have a default mode somewhere. Is it the same in both cases? Does
> > the core tries to apply the same timings? Is the calculation the same?
> >
> > These are pointers but I am sure you can figure all that out.
>
> The calculation is obviously not the same anymore, due to the recent
> changes in the Linux driver, which seems to have broken it (in Linux).
>
> >>>>> and
> >>>>> may optimize better the timings depending on the selected mode ([0-5])
> >>>>> (hence the different calls to ->setup_data_interface().
> >>>>
> >>>> I would expect those two should produce identical timing parameters,
> >>>> period, otherwise one or the other is wrong. Thus far, it was Linux that
> >>>> produced non-working results.
> >>>
> >>> Again, we define minimum and maximum delays. If the right thing is to
> >>> not wait more than 5us and you wait up to 6, it does not mean you
> >>> wrote "bad timings". 4us would be a bad timing though. It depends on
> >>> what you are looking at.
> >>
> >> I am look at for example
> >>
> >>  denali->reg + TCWAW_AND_ADDR_2_DATA = 0x0000143f -> 0x00001432
> >>
> >> Register was 0x143f before, now is 0x1432 , which is less.
> >> I guess that would be the "bad timing" then ?
> >
> > Well, is it a minimum or a maximum ? How do you know U-Boot value is
> > straight on the edge? If you want to know if timings are valid, open
> > the part datasheet, do the math with a paper and compare. This is the
> > scientific way to declare timings valid or invalid.
>
> If the value were straight at the edge, I would expect this would
> trigger errors over the years, when those values were used, or maybe it
> would trigger an error in the thermal chamber tests ? If neither of that
> happens, then the values are probably not at the edge enough to matter.


This is a trade-off between the performance and the safety.

If you want to be very safe, you can use
the power-on-reset defaults.
The default register values are chosen to insert long enough
wait time to work with any devices.
Of course, it is slow, though.

Generally speaking, the datasheet spec contains the deviation,
so I think aligning with nand_timings.c will guarantee the
device will work over years.

So, in my understanding, ->setup_data_interface() hook
can simply encode struct nand_sdr_timings into the
controller registers.

One question I am still wondering is why this problem was
triggered only after Linux 4.19

As you said, the clock manager on SOCFPGA can change the
clock frequencies that drive the NAND controller.

In your setting,
denali->clk_rate = 31.25 MHz and denali->clk_x_rate = 125 MHz

But, maybe
denali->clk_rate = 50 MHz and denali->clk_x_rate = 200 MHz
on somebody else's. This exactly matches to the frequencies
the denali drivers originally used.
So, the register values are on the edge in this case.
But, nobody reported the problem before v4.19.





> That said, timing calculations do not factor in only the datasheet
> values, but also signal propagation delays and other details of the data
> path on the PCB and in the SOC, so it's not as simple as you claim it
> is.


I think you are right.
Most of parameters can be derived from the ONFI datasheet,
but the acc_clks register must contain the propagation delays.

This is why I was asking you to test the iffy patches
that increment the acc_clks by 1 or 2.



> Moreover, while the NAND datasheet is available in public, the
> Denali IP datasheet is not, so "do the math with a paper and compare" is
> inapplicable here either way, sorry.
>
> >>>>> Run a stress test, if it passes, you should be good :)
> >>>>
> >>>> Thank you for the hint, I think the stress test thus far could be
> >>>> considered sufficient. I guess we can agree on that ?
> >>>
> >>> Oh yeah absolutely :)
> >
> > Just to be sure, we are talking about the new timings derived with
> > Masahiro's patch in Linux here, right?
>
> The timings which went through extensive testing are the original ones.
>
> The ones coming out of Masahiro's patch at least do not trigger those
> massive UBI errors, however they were tested only very lightly. And I
> feel like adding +1/-1 somewhere into the patch is rather iffy, so I
> would hope the Denali datasheet has something about this and why this is
> needed.


This is iffy, but I have no idea to parameterize
the SoC/board-dependent delay.

In the posted patch, I used 'data_setup_on_host'
to avoid the magic number.




>
> > Because "perfect timings" => "work in the oven" but let be clear on
> > the fact that "work in the oven" does not imply "perfect timings".
>
> Let's be clear that I still prefer "practically working and possibly
> imperfect" over "theoretically perfect and practically not working".
>
> Also, correction, thermal chamber is not an owen, it does testing over
> the entire temperature range of the device.
>
> --
> Best regards,
> Marek Vasut



-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
