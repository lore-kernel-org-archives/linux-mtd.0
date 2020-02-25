Return-Path: <SRS0=ETWj=4N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA46C35DEA
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2020 00:43:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17B172072D
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2020 00:43:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lfWM7Geo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="2++6nF3K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17B172072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LX7rguLURIwtB3TysvieFU13E39cUjmA//tPhCaupU8=; b=lfWM7GeoRK3/wO
	ludWvHtsvPtVh23SnixC/svjw+gZbW1Ga4JG6ob1OETUoXW6K6aP8yrj3nD1llfFK3jloLyl7LQwH
	TrMZXwV8V1PDviONohO5COxD9MfNqmHx5/UnbOPdGmc6qs80+5zzMFW53EYHKjOFLtAIKrXzl/eDt
	FVwdfgBW3UHa8kOI4mL1gWZ7X+jnaBkOldLeOcKPD6zCskMYregv7ShO7WfHrzT1bdYwZPuhI8exF
	aMAmfjjfTcKkkiC8AQekFlEk9WUFsELLz0EJ+fm0sn/oEfWqR8i4C36d56pr0DBZbPs+Xtpcik+eD
	WOrglFlhOM7X+MLFe/SQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6OJM-0004hb-ED; Tue, 25 Feb 2020 00:42:56 +0000
Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6OJJ-0004hA-9U
 for linux-mtd@lists.infradead.org; Tue, 25 Feb 2020 00:42:54 +0000
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 01P0gXUT014177
 for <linux-mtd@lists.infradead.org>; Tue, 25 Feb 2020 09:42:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 01P0gXUT014177
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1582591354;
 bh=h8zBFA7pphib6KBpzqRpC/Z91Rij4qImBfFW38QbBAQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2++6nF3K0ibrUCwQqxo9OS3+XkxnQMwCbLAjR02trRbARAy7cNBkZwgOJUWHOHZRb
 4chME9ubNeGrjRO7CuZEYga9Q+9LGihN+v+mK1Frhu3pzxSNlXk4B4lye4V5J8Vs7o
 xBKSQpkUXIrWqnpNZhzgFnvWgGLLTHo0VuzH8P9s1b5NgbepHRfqOzTa5mAQRxvTMx
 Ato2vZrV4A9Jj0uFh6nOiFGLTqsPGQF0xgUgW8PNGBm7ZVlADVlKwdo/k+HX3lbam7
 A9u1eW87U7QmgEPN6fo+Ad/oBRVT20UQZ+18sIDjYmjYxy5hrzp3fB+KhxSfZEMtXs
 Whs2GTNDu+wTg==
X-Nifty-SrcIP: [209.85.222.54]
Received: by mail-ua1-f54.google.com with SMTP id h32so3936487uah.4
 for <linux-mtd@lists.infradead.org>; Mon, 24 Feb 2020 16:42:34 -0800 (PST)
X-Gm-Message-State: APjAAAV3fNbkM+4qD82a5tcfFNyA47znNxqpJ+Kgf2ydiJrsSnxqAssR
 Jxm/07wGOcrR5UXvfYLYdbSzj8mTqDge8tBO4jU=
X-Google-Smtp-Source: APXvYqygO4UgTjUUosrAdF0oh/SNQH4MN+KILndQxdHsUaAgg2GWOhIQLVSrUdQRjkwKbmM667iqhmiSEkq1Shw3Jgw=
X-Received: by 2002:ab0:45c7:: with SMTP id u65mr25228402uau.109.1582591353143; 
 Mon, 24 Feb 2020 16:42:33 -0800 (PST)
MIME-Version: 1.0
References: <20200205070834.3087104-1-marex@denx.de>
 <20200205101223.21d99d93@xps13>
 <45a10680-5fe6-7cab-a7ef-f7f7a952e822@denx.de> <20200205105045.6877aca6@xps13>
 <bdb54ba5-648a-0b79-661c-5eb9604a1ee5@denx.de>
 <b6f094b7-01a9-34a2-bf10-019a05bc7cb3@denx.de>
 <20200211170707.2183625e@xps13> <b1a10583-e110-9568-4007-aa2b3f38a7be@denx.de>
 <CAK7LNARqYDh4AJ+N-PTHui0H89-humECskJVUxW4cTf6edEBMQ@mail.gmail.com>
 <f4e2deeb-cc0e-fb06-46fa-d6cf4f2a73ad@denx.de>
 <CAK7LNAR4MU+Rfmpz99iwLuEbD4jMwUdh91uz3zyQdvjyLEQcMQ@mail.gmail.com>
 <29cce21c-2214-7238-0bc5-db2c1a54576f@denx.de>
 <CAK7LNASckTZO-9uVjtQH8iKhU0HH9WiMK-CzMxjESQOOUM0cKA@mail.gmail.com>
 <CAK7LNAT3EG0XocC0xT0f=6MBpXLga3FehOjEYbRyP6AJUbqb2Q@mail.gmail.com>
 <311cdc3c-59b5-a46b-62f0-e78fc970134a@denx.de>
In-Reply-To: <311cdc3c-59b5-a46b-62f0-e78fc970134a@denx.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 25 Feb 2020 09:41:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT1Bzs68X8PiWQHg4g2bpPGd-WM9D4vwf59XfwwLVuVQQ@mail.gmail.com>
Message-ID: <CAK7LNAT1Bzs68X8PiWQHg4g2bpPGd-WM9D4vwf59XfwwLVuVQQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "mtd: rawnand: denali: get ->setup_data_interface()
 working again"
To: Marek Vasut <marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_164253_565216_5B6354C3 
X-CRM114-Status: GOOD (  14.19  )
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

Hi.

On Thu, Feb 20, 2020 at 3:45 AM Marek Vasut <marex@denx.de> wrote:
>
> On 2/18/20 6:55 AM, Masahiro Yamada wrote:
> > Hi
>
> Hi,
>
> [...]
>
> >> There is no change around the ->setup_data_interface() hook
> >> after v4.19
> >> The only difference I could think of is the clock frequency.
> >>
> >> But, it is OK if you do not want to test it.
> >>
> >> And you are confident.
> >>
> >> So, let's suspect the ->setup_data_interface() hook.
> >>
> >>
> >> If possible, can you provide the dump of
> >> the attached debug code?
> >>
> >
> >
> > I attached two experimental patches.
> >
> > I cannot test them because
> > the mainline code works fine for my boards.
> >
> > Does either of them improve something
> > on your settings?



I am still waiting for you to let me know
the result of my patches.



>
> Considering that the NAND works if denali_setup_data_interface() is not
> called, would it rather make sense to first read and print what's
> programmed into the controller and then print what the code calculated
> and intends to program into the controller ?

denali_select_target() is called every operation.
So, if you dumped this function for a working platform,
it might flood the printk buffer.

denali_setup_data_interface() is called just twice.
That's why I injected the debug code there.


>
> See attached patch, with which (without this revert) you get this:
> denali->reg + TWHR2_AND_WE_2_RE = 0x00001414 -> 0x0000143f
> denali->reg + TCWAW_AND_ADDR_2_DATA = 0x0000143f -> 0x00001432
> denali->reg + RE_2_WE = 0x00000014 -> 0x00000019
> denali->reg + ACC_CLKS = 0x00000004 -> 0x00000005
> denali->reg + RDWR_EN_LO_CNT = 0x00000002 -> 0x00000009
> denali->reg + RDWR_EN_HI_CNT = 0x00000002 -> 0x00000004
> denali->reg + CS_SETUP_CNT = 0x00000001 -> 0x00000008
> denali->reg + RE_2_RE = 0x00000014 -> 0x00000019

OK, the left-hand side is probably the timing
set up by U-Boot.


-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
