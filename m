Return-Path: <SRS0=sdQx=42=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC25C10F27
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 10:28:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 507C920409
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 10:28:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NyJCRvLL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="Ojcpasb+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 507C920409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j7SbRoCZ91YRhbNq24Awzklzai0c3j7U4cJkewfY37Q=; b=NyJCRvLL5dKRel
	fPxhbzV3OXFK/2zVNlW08Pzg5fS8K8DpmvWXpk9dED1cjuuAtPjh9BxBxLb9IXSgt6+O27tEjdn1Y
	EXk56EVjCdXNUHPv2cdqkEHH/Wcz3cALLbvzFUVXrfHMOC1bkAXr+XffpO0etxTuEjWYyF8tgqX5o
	k+6jvezGWZlU9e6mju+kcrpyy6UvjHdXfTWj1Mc8KHwR5kXhMUy7epKQOwA8MRoYh1lX+H1stqM69
	ARPOm//dejkXV4Xi+8qL3uhwVohAOy9bMYFf2OBNB+E6STo2w6BH2bVJiVNEu1tO8BcKn726XBDqG
	VYiQ6bhrPscRDWUq+V9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBFeF-0004vm-31; Mon, 09 Mar 2020 10:28:35 +0000
Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBFeC-0004vH-8u
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2020 10:28:33 +0000
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 029AS8FC012481
 for <linux-mtd@lists.infradead.org>; Mon, 9 Mar 2020 19:28:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 029AS8FC012481
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1583749689;
 bh=jaROwbXlRbbdorTS4/KA8VJVMElH6i4OSgV4v9HDR8w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ojcpasb+INIoLhu7y8aeL5297ZDGX805MOB6Oc356XaEn4QholKe1wum0Pug7s93W
 Wdih/L4fA0xc/VDBUoMSEhiKGMkNsbJw5x5OoP+lC9xH7Q4GWGlJdLf/KNSoTjWi2V
 inknOh2euw3p4RbLb/N1aUEcdWtaofKEgoroqaDAoC61+7GaUm4GqJhrHBG+7ucsuv
 7jxDYfQ+JM7NPofFkqH55xYPf4boLgPL4nfWHq7MvBFsoGCUJalAOu23fg/PwuDlDa
 XLBiGjmIPmpdTKEy1Zn2HKDz8pI1WZh1x96djKqKaRK0GEOmM4Z0IfcX9XlwGWpFj4
 AmFD7oi5k1ouw==
X-Nifty-SrcIP: [209.85.217.45]
Received: by mail-vs1-f45.google.com with SMTP id i25so1856206vsq.9
 for <linux-mtd@lists.infradead.org>; Mon, 09 Mar 2020 03:28:08 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1nLzsggIgi/n2fcNWGVLIDquWgFnZ0AQHKSdPjv9UhT4fD2Q+T
 +Myax91revAqsUBeVxFJ4oS+PruNukK/XHR0KRA=
X-Google-Smtp-Source: ADFU+vuE62peg5pizBYSjIAh7i1knKZ2sKkVuwLeYaj8XnvOqORirTb2OSBDoqIM7Eh/GSiFSkQhcN6llQ5r3RAxzY4=
X-Received: by 2002:a05:6102:8f:: with SMTP id
 t15mr749818vsp.215.1583749687319; 
 Mon, 09 Mar 2020 03:28:07 -0700 (PDT)
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
 <CAK7LNAT1Bzs68X8PiWQHg4g2bpPGd-WM9D4vwf59XfwwLVuVQQ@mail.gmail.com>
 <e86925d0-805c-d364-57ca-6400b77cffd7@denx.de>
In-Reply-To: <e86925d0-805c-d364-57ca-6400b77cffd7@denx.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 9 Mar 2020 19:27:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNARDp1Zru3_XAQyBZHwsRov-QWOnrrwodS8pjszsKy2ysw@mail.gmail.com>
Message-ID: <CAK7LNARDp1Zru3_XAQyBZHwsRov-QWOnrrwodS8pjszsKy2ysw@mail.gmail.com>
Subject: Re: [PATCH] Revert "mtd: rawnand: denali: get ->setup_data_interface()
 working again"
To: Marek Vasut <marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_032832_534996_B18F49BD 
X-CRM114-Status: GOOD (  21.49  )
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

On Wed, Mar 4, 2020 at 2:13 AM Marek Vasut <marex@denx.de> wrote:
>
> On 2/25/20 1:41 AM, Masahiro Yamada wrote:
> > Hi.
>
> Hi,
>
> > On Thu, Feb 20, 2020 at 3:45 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 2/18/20 6:55 AM, Masahiro Yamada wrote:
> >>> Hi
> >>
> >> Hi,
> >>
> >> [...]
> >>
> >>>> There is no change around the ->setup_data_interface() hook
> >>>> after v4.19
> >>>> The only difference I could think of is the clock frequency.
> >>>>
> >>>> But, it is OK if you do not want to test it.
> >>>>
> >>>> And you are confident.
> >>>>
> >>>> So, let's suspect the ->setup_data_interface() hook.
> >>>>
> >>>>
> >>>> If possible, can you provide the dump of
> >>>> the attached debug code?
> >>>>
> >>>
> >>>
> >>> I attached two experimental patches.
> >>>
> >>> I cannot test them because
> >>> the mainline code works fine for my boards.
> >>>
> >>> Does either of them improve something
> >>> on your settings?
> >
> >
> >
> > I am still waiting for you to let me know
> > the result of my patches.
>
> Neither patch works, sorry.
>
> >> Considering that the NAND works if denali_setup_data_interface() is not
> >> called, would it rather make sense to first read and print what's
> >> programmed into the controller and then print what the code calculated
> >> and intends to program into the controller ?
> >
> > denali_select_target() is called every operation.
> > So, if you dumped this function for a working platform,
> > it might flood the printk buffer.
> >
> > denali_setup_data_interface() is called just twice.
> > That's why I injected the debug code there.
> >
> >
> >>
> >> See attached patch, with which (without this revert) you get this:
> >> denali->reg + TWHR2_AND_WE_2_RE = 0x00001414 -> 0x0000143f
> >> denali->reg + TCWAW_AND_ADDR_2_DATA = 0x0000143f -> 0x00001432
> >> denali->reg + RE_2_WE = 0x00000014 -> 0x00000019
> >> denali->reg + ACC_CLKS = 0x00000004 -> 0x00000005
> >> denali->reg + RDWR_EN_LO_CNT = 0x00000002 -> 0x00000009
> >> denali->reg + RDWR_EN_HI_CNT = 0x00000002 -> 0x00000004
> >> denali->reg + CS_SETUP_CNT = 0x00000001 -> 0x00000008
> >> denali->reg + RE_2_RE = 0x00000014 -> 0x00000019
> >
> > OK, the left-hand side is probably the timing
> > set up by U-Boot.
>
> Yep, the timings that work. So now, how do you get to those working
> timings using the Linux driver ?


How about
0001-denali-more-complicated-calculation-for-timings.patch

+ following ?

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index b0482108a127..ea38aa42873e 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -860,9 +860,9 @@ static int denali_setup_data_interface(struct
nand_chip *chip, int chipnr,

        /*
         * Determine the minimum of acc_clks to meet the data setup timing.
-        * (one additional clock cycle just in case)
+        * (two additional clock cycles just in case)
         */
-       acc_clks = DIV_ROUND_UP(timings->tREA_max, t_x) + 1;
+       acc_clks = DIV_ROUND_UP(timings->tREA_max, t_x) + 2;

        /* Determine the minimum of rdwr_en_lo_cnt from RE#/WE# pulse width */
        rdwr_en_lo = DIV_ROUND_UP(max(timings->tRP_min, timings->tWP_min), t_x);


-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
