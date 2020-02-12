Return-Path: <SRS0=zQg3=4A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F491C2BA83
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 17:15:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F24A2082F
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 17:15:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W9hYlJa/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="YfCsIwUb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F24A2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmvMBbJOj+6SEyaeWLGXcjg//2uk6UVbTBjA5cQelLA=; b=W9hYlJa/oPZSUl
	v5dHttB+N3OtsHCJT9yzv+LD+DzXpB8jPVyehxLKwyJcM3KEJcWFifrbLIXwcHrrnNKFEtHBJDFMl
	VdL+6974HyUHD+09lP8r5qIgkAW6yiNYnDNf9B8Zxo2GoO1ACrI2dZZzf/6WFEMZL6ytQtxISI2C3
	HujEnOoHuumTwRcQIjtN7+eRJrFlKWfIJm9/mEKZzCpOZCClQqFHnx2f8edztqcJBlcY/evO/kCwg
	9qpZcts4FQZbnVZhtSLkUtLR/ZdB3aoelxHVyfZJs+G2jvnl6a+ZuloUnQqkORyi+VjATvxGfjG0M
	a40CcXNxAL3jP2P9FuAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1vbI-0003oy-Hs; Wed, 12 Feb 2020 17:15:00 +0000
Received: from conssluserg-06.nifty.com ([210.131.2.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1vbE-0003of-Er
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2020 17:14:58 +0000
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id 01CHEU0f018452
 for <linux-mtd@lists.infradead.org>; Thu, 13 Feb 2020 02:14:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 01CHEU0f018452
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1581527672;
 bh=Qx21CTMd54mCxYgDLd39R0m/96X5stXM+Vis6XDEOCc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YfCsIwUbwCyYwRptle3qzNhCcnbKrtqZhcFYpTlUQp5jSswlVCOtj1bVRgyNDkEl4
 dcpSwB+kIPtF+C8RHGaqSFtlIEKSR8WDrPeSXLk0jFHFxmBmi4B/6SgzbPOTRTZOmF
 3yJ9tFgw7q7GhIeAkqURHhpF/8QNghLBMINhRbw7Ege0IoaP4LNOIJdIfYCDBbz13J
 oDUAbtyoF68DNy6Ok2V0ultLLBcdA3dZT4VKfUHSb5vTF/FUp9HhD9eIwBreCybRHM
 Tj0O4GvVA2ZrFxaLlIDd3yq/B9KB6812GU8aC+389TCaToI33qUoSKfTEsXi00mXLn
 U/5v2V4s3mH+Q==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id p14so1656072vsq.6
 for <linux-mtd@lists.infradead.org>; Wed, 12 Feb 2020 09:14:31 -0800 (PST)
X-Gm-Message-State: APjAAAXoFeSbzWtEs7eRrRH+4vcF7uPv8oeUcIj42ahgP0zgWOBHtoDX
 3kMossZOVDSVK17xG0E4LFK0qoJcDgToli7ENEw=
X-Google-Smtp-Source: APXvYqxJtDhrpzsg3uJuhyT/6XEVHdN9RbxH48WBpBvMznrUJGzJBudgGVmkQaTs457OPBOvkkBMRm8act4pZLJigmk=
X-Received: by 2002:a05:6102:190:: with SMTP id
 r16mr12427392vsq.215.1581527670015; 
 Wed, 12 Feb 2020 09:14:30 -0800 (PST)
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
In-Reply-To: <CAK7LNAR4MU+Rfmpz99iwLuEbD4jMwUdh91uz3zyQdvjyLEQcMQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 13 Feb 2020 02:13:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS+FeJy1NOXqVjmE8MRmDCVZpYNwtHZ=2ESnrdN9Mgmqw@mail.gmail.com>
Message-ID: <CAK7LNAS+FeJy1NOXqVjmE8MRmDCVZpYNwtHZ=2ESnrdN9Mgmqw@mail.gmail.com>
Subject: Re: [PATCH] Revert "mtd: rawnand: denali: get ->setup_data_interface()
 working again"
To: Marek Vasut <marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_091456_852118_AB8282BF 
X-CRM114-Status: GOOD (  28.22  )
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

On Thu, Feb 13, 2020 at 1:56 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hi.
>
>
> On Wed, Feb 12, 2020 at 10:41 PM Marek Vasut <marex@denx.de> wrote:
> >
> > On 2/12/20 10:00 AM, Masahiro Yamada wrote:
> > > Hi Marek,
> >
> > Hi,
> >
> > > On Wed, Feb 12, 2020 at 5:35 AM Marek Vasut <marex@denx.de> wrote:
> > >>
> > >> On 2/11/20 5:07 PM, Miquel Raynal wrote:
> > >>> Hi Marek, Masahiro,
> > >>>
> > >>> Marek Vasut <marex@denx.de> wrote on Tue, 11 Feb 2020 11:04:10 +0100:
> > >>>
> > >>>> On 2/5/20 11:08 AM, Marek Vasut wrote:
> > >>>>> On 2/5/20 10:50 AM, Miquel Raynal wrote:
> > >>>>>> Hi Marek,
> > >>>>>>
> > >>>>>> Marek Vasut <marex@denx.de> wrote on Wed, 5 Feb 2020 10:41:05 +0100:
> > >>>>>>
> > >>>>>>> On 2/5/20 10:12 AM, Miquel Raynal wrote:
> > >>>>>>>> Hi Marek,
> > >>>>>>>>
> > >>>>>>>> Marek Vasut <marex@denx.de> wrote on Wed,  5 Feb 2020 08:08:34 +0100:
> > >>>>>>>>
> > >>>>>>>>> This reverts commit d311e0c27b8fcc27f707f8cac48cd8bdc4155224, which
> > >>>>>>>>> completely breaks NAND access on Altera SoCFPGA (detected on ArriaV
> > >>>>>>>>> SoC).
> > >>>>>>>>>
> > >>>>>>>>> On SoCFPGA, denali->clk_rate = 31.25 MHz and denali->clk_x_rate = 125 MHz,
> > >>>>>>>>> hence the driver sets NAND_KEEP_TIMINGS flag.
> > >
> > >
> > > Interesting.
> > > I have never seen such clock rates before.
> > >
> > >
> > > For all known upstream platforms
> > > (Altera SOCFPGA, Socionext UniPhier, Intel MRST),
> > > the NAND controller core clock is 50 MHz,
> > > the NAND bus clock is 200MHz.
> >
> > You can configure whatever rate you want in the QSys HPS component.
>
> OK.
>
> The SOCFPGA maintainer, Dinh Nguyen, said this:
> "From the clock controller, it provides a single 200MHz clock to the NAND
> IP. Inside the NAND IP, there is a /4 for the clk. The 200MHz clock is
> used for the clk_x and ecc_clk."
>
>
> http://lists.infradead.org/pipermail/linux-arm-kernel/2018-July/592702.html
>
>
>
> Maybe, you are using a brand-new,
> different type of SOCFPGA?
>
>
>
> > > What would happen if you hard-code:
> > > denali->clk_rate = 50000000;
> > > denali->clk_x_rate = 200000000;
> >
> > It will not work, because the IP would be using incorrect clock.
>
> I wanted to see the past tense here instead of
> future tense + subjunctive mood.
>
> I wanted you to try it.
>
>
>
> >
> > > like I had already suggested to Tim Sander:
> > > https://lore.kernel.org/lkml/CAK7LNAQOCoJC0RzOhTEofHdR+zU5sQTxV-t4nERBExW1ddW5hw@mail.gmail.com/
> > >
> > > Unfortunately, he did not want to do it, but
> > > I am still interested in this experiment because
> > > I suspect this might be a bug of drivers/clk/socfpga/.
> >
> > No, this is a feature of the platform, you can configure any clock you
> > want pretty much.
>
>
> OK, but if you agree the 4.19.10 is working,
>
> denali->clk_rate = 50000000; denali->clk_x_rate = 200000000;
>
> is worth trying.
>
>
> >
> > > 4.19.10 kernel (, which Tim Sander agreed the timing was working fine)
> > > was hard-coding them in order to deal with the immature SOCFPGA clock driver.
> >
> > The 4.19 was working fine for Tim (and me as well), because it didn't
> > have this bug which this patch removes.
>
>
> d311e0c27b8fcc27f707f8ca did not exist in 4.19
>
> But, 7a08dbaedd36 did not exist either in 4.19
>
>
> $ git describe  7a08dbae
> v4.20-rc2-34-g7a08dbaedd36
> $ git describe  d311e0c
> v5.0-rc2-3-gd311e0c27b8f
>
>
> So, your patch is getting it back to
> v4.20-rc2-34-g7a08dbaedd36
> where the condition for ->setup_data_interface() call
> is accidentally inverted for the Denali driver.
>
>
>
> BTW, did you notice your code was doing the opposite
> to your commit description?
>
>
> Your commit description goes like this:
>
> "On SoCFPGA, denali->clk_rate = 31.25 MHz and denali->clk_x_rate = 125 MHz,
> hence the driver sets NAND_KEEP_TIMINGS flag. This did not happen before
> and is actually incorrect, as on SoCFPGA we do not want to retain timings
> from previous stage (the timings might be incorrect or outright invalid)."
>
>
> You clearly state denali->clk_rate and denali->clk_x_rate
> are non-zero values.
>
> If this patch were applied, we would end up with NAND_KEEP_TIMINGS set.
> Then ->setup_data_interface() hook would be skipped.
> So, the timings from previous stage would be retained.
>
> Is this what you want to do?
>
>
> One more thing, if your patch were applied,
> we would get back to the situation
> where the back-trace happens due to zero-division:
>
>
> When denali->clk_x_rate is zero,
> NAND_KEEP_TIMINGS would not be set with your patch.
> So, ->setup_data_interface() would be called.
>
> This would cause zero divion at line 781.
>         t_x = DIV_ROUND_DOWN_ULL(1000000000000ULL, denali->clk_x_rate);
>


I missed to read the whole of this thread.

As you discussed with Miquel and Boris,
you already understood the code and the description were opposite.






-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
