Return-Path: <SRS0=ETWj=4N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC32C35DEE
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2020 00:39:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EA952072D
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2020 00:39:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y3c/FVSl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="oYlar61l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EA952072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xkgw3nEH3cj3myYdK0wy62gf5qeTtc2aE+GFCRZouCo=; b=Y3c/FVSl6bvuNe
	YOe5PKdd/UUzsWJxf8T5MSLPU8pTZKf+MYJeyXY+7P0PZ9k2VWTzRv31lUjTjpaIib2BGXh9Fn7G3
	2dv4gpQ/RoaBwwnpojuwm0ZZXpUCoAZnvmr+fqAtDmyE3OFxXSd2GgMYRYTyFr4N2a3SuKzwo/arB
	hN8XOsVCXUkvTPiQRPMWrvGnyBk19YQ7XmET5kkvx2TXmD7SJhVCH32KyUsfrzdXu4wsbTvqAzk/a
	AspBSZ8kXdvEq1CyTrro3s9RHvQ5qzFUQ+wBeCeAQ344LQQ/2CBC3md/gcM9iDJWay061xxNn4vmU
	NGrEZpWiCfV5v0xaptJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6OG9-0002zl-Kc; Tue, 25 Feb 2020 00:39:37 +0000
Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6OG5-0002p1-7r
 for linux-mtd@lists.infradead.org; Tue, 25 Feb 2020 00:39:35 +0000
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 01P0dGq0012380
 for <linux-mtd@lists.infradead.org>; Tue, 25 Feb 2020 09:39:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 01P0dGq0012380
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1582591157;
 bh=oOB3pnOayOWEScW+oJcHwA3chxgQvyYnpOluVJ9bbqg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oYlar61lcUBLrkiIXMHGg1eDlMh/RXhG0cOonw6LkI2z0xwlY2SEIVufLdRBwuEwB
 nqfOsIC8ilva6GzTfOdYRLLP6mbYy24nJeeW8+aRYMxshSYxkgzOMrcI6GZl0YHWSf
 y8ZI+MHg0Fkkgez21ncgcwLysolxEiZBHhNcOdYzOz9HvPm2F/plpWQs4K3xPnDh1a
 S0kd3cxnzNJk1R8Ayj8f7snlO8Eqh1MJ3cUQR4i6FJIRWiRPSK6bgIUP1m5DfAgzDO
 Te180BofNAE1jTRUHaPkiVJBimXz3l0T/JPRpFnyQkJGYEwJGuoAweSbK2YZ7x77N4
 zFruryC2G6f6Q==
X-Nifty-SrcIP: [209.85.222.48]
Received: by mail-ua1-f48.google.com with SMTP id y3so3934342uae.3
 for <linux-mtd@lists.infradead.org>; Mon, 24 Feb 2020 16:39:17 -0800 (PST)
X-Gm-Message-State: APjAAAW65GkzKizqrHV5GsIMVviQdc9zHHc0PE3luLHArxS6nO3YQXyB
 X7sL3qdt4gmDaZsz6nnmRvNWAGb+V7h/gcScZcM=
X-Google-Smtp-Source: APXvYqxq+M+i6Ls58F781ZA8MYglVVJAgTtQ8OPdS5XMZiT6mxMIxp+uAlX2fMGWwY9LzrIfehW5ujo5s8ZGsGQSTD4=
X-Received: by 2002:ab0:14ea:: with SMTP id f39mr27038484uae.40.1582591156141; 
 Mon, 24 Feb 2020 16:39:16 -0800 (PST)
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
 <1b5912e0-4ff2-2b86-5d87-d264c3bf1d42@denx.de>
In-Reply-To: <1b5912e0-4ff2-2b86-5d87-d264c3bf1d42@denx.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 25 Feb 2020 09:38:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQOkRT=OmcaOuaCazwsz9=oBiWiBTZoTGCWVyuh1T_4NQ@mail.gmail.com>
Message-ID: <CAK7LNAQOkRT=OmcaOuaCazwsz9=oBiWiBTZoTGCWVyuh1T_4NQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "mtd: rawnand: denali: get ->setup_data_interface()
 working again"
To: Marek Vasut <marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_163933_522748_8BA90DF7 
X-CRM114-Status: GOOD (  16.94  )
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

On Thu, Feb 20, 2020 at 3:44 AM Marek Vasut <marex@denx.de> wrote:
>
> On 2/17/20 9:33 AM, Masahiro Yamada wrote:
> > Hi,
>
> Hi,
>
> [...]
>
> > If possible, can you provide the dump of
> > the attached debug code?
>
> Without this revert:


Thanks for the dump.

denali_setup_data_interface() is called multiple times.

>
> Denali: clk_rate=31250000, clk_x_rate=125000000
> Denali: tREA=40000
> Denali: acc_clks=5
> Denali: tRHW=200000
> Denali: re_2_we=25
> Denali: tRHZ=200000
> Denali: re_2_re=25
> Denali: tCCS=500000000
> Denali: tWHR=120000
> Denali: we_2_re=63
> Denali: tADL=400000
> Denali: addr_2_data=50
> Denali: tREH=30000
> Denali: tWH=30000
> Denali: rdwr_en_hi=4
> Denali: tRP=50000
> Denali: tWP=50000
> Denali: tRC=100000
> Denali: tWC=100000
> Denali: rdwr_en_lo_hi=13
> Denali: rdwr_en_lo=9
> Denali: tCS=70000
> Denali: tCEA=100000
> Denali: cs_setup=8


This is the first call,
which I am not interested in.



> Denali: clk_rate=31250000, clk_x_rate=125000000
> Denali: tREA=16000
> Denali: acc_clks=2
> Denali: tRHW=100000
> Denali: re_2_we=13
> Denali: tRHZ=100000
> Denali: re_2_re=13
> Denali: tCCS=100000
> Denali: tWHR=80000
> Denali: we_2_re=13
> Denali: tADL=400000
> Denali: addr_2_data=50
> Denali: tREH=7000
> Denali: tWH=7000
> Denali: rdwr_en_hi=1
> Denali: tRP=10000
> Denali: tWP=10000
> Denali: tRC=20000
> Denali: tWC=20000
> Denali: rdwr_en_lo_hi=4
> Denali: rdwr_en_lo=3
> Denali: tCS=15000
> Denali: tCEA=25000
> Denali: cs_setup=2


This is the second call,
which sets up the final register values.

The parameter, acc_clks=2, is
the part I suspect the most.

(and that is why I attached two patches
to tweak acc_clks).



>
> With this revert, setup_data_interface() is not called, so there is no log.
>
> [...]
>
> >>> When denali->clk_x_rate is zero,
> >>> NAND_KEEP_TIMINGS would not be set with your patch.
> >>> So, ->setup_data_interface() would be called.
> >>>
> >>> This would cause zero divion at line 781.
> >>>         t_x = DIV_ROUND_DOWN_ULL(1000000000000ULL, denali->clk_x_rate);
> >>
> >> If the clock are non-zero, how would this be a division by zero ?
> >
> >
> > You have a false assumption "If the clock are non-zero...".
> >
> > clk_get_rate() may return zero if the clock driver
> > is not ready to provide the frequency information.
> >
> >
> >
> > The current code:
> >   If clk_rate or clk_x_rate is zero,
> >    do not call denali_setup_data_interface().
> >   If neither clk_rate nor clk_x is zero,
> >    call denali_setup_data_interface().
> >
> >
> > With your patch:
> >   If clk_rate or clk_x_rate is zero,
> >    call denali_setup_data_interface(),
> >    which causes zero division.
> >   If neither clk_rate nor clk_x is zero,
> >    do not call denali_setup_data_interface().
>
> OK, so it's just a miscommunication. In my case, neither of the clock
> are zero. On SoCFPGA, I think clk_rate = clk_x_rate / 4, but I'm not
> sure if that's always the case.


Drivers must be written in a generic manner
to take care of any possibility.

clk_get_rate() returns 0 if the clock driver
does not support ->recalc_rate() operation
or CONFIG_HAVE_CLK=n.



-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
