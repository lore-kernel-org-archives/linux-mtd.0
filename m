Return-Path: <SRS0=zQg3=4A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50132C2BA83
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 09:01:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 207FE206ED
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 09:01:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t1NttGxK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="W/xfd5lc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 207FE206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYuEyFZbJG4ilrlPAn5CZbjZDl2h/wT03LfvFryPedA=; b=t1NttGxKUjS78N
	/Tg3MIZ+CxYO7J5CGjtE4FFglmursFPy72vEvu5aVU3eyX5QjmPD6aVV1Ta5nf/UxEyePnm8Cd66J
	46z4KlTjrWMbtQmHKdnTXFG+On/ADGIKkhLVRVZXyPqDjpJVLK7corxNrvnz/HbTRuxKSuK0rWmbb
	zUF1s4FcvYF65X0Ezfy/2cIfUM3oRqsVRXO+h1XsIGg9xbXof1hcFXZPI1enY8HesgxfTD9FyMaXf
	0zHRScznKTXDuXSsw5aql4CMMqCLOx5213sjT9mQxq7aEiUi4SG3LtFDBv9V4+GHa8gcX+icY3HZn
	F4Whyge1iZOSMUb7xt9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1ntn-0007OH-Ga; Wed, 12 Feb 2020 09:01:35 +0000
Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1ntk-0007Np-70
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2020 09:01:34 +0000
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id 01C91BWK026333
 for <linux-mtd@lists.infradead.org>; Wed, 12 Feb 2020 18:01:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 01C91BWK026333
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1581498073;
 bh=YAl8FATAC1byT9htCwgUC9ooK/VW8r2DIsRcQxM9VAw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=W/xfd5lcYdYHw2hZaXHFTm6DELILb6J3x73QaeVe7KyvRdwyUQFIT02lKWAOzyf9u
 VPmNreZQ3BxTqakDxc9hGvl3vVJk9Rk/TauIxRRYAsofnf4T0pxr6u3zqfhuVXLVw7
 lu8ToQAx48Z6olgC3OFo/JLs5gXrz+AaAsosDlSap/dyR4JgpKAI81Qn59CFKx4kPW
 Mb3CZvtF7a/SJwDJKpPrn3tDeMUngF5+c18uUQrQsqmDSDj67vM++k1lP573tr+GIA
 7VjAH981iM4n8FY5OjoTDq+GMuDjJnwoP3pU3otj+34sWzWLkyNfyDNi8rKXXZhlXD
 XT2uomEJDPmXw==
X-Nifty-SrcIP: [209.85.217.52]
Received: by mail-vs1-f52.google.com with SMTP id c18so661181vsq.7
 for <linux-mtd@lists.infradead.org>; Wed, 12 Feb 2020 01:01:12 -0800 (PST)
X-Gm-Message-State: APjAAAXdRYYWk/aJvMNDo917Avvf/vkCEK3whXa7u0bZy+7UeVfjtPJL
 V3n50gG5SVrf7ll8Qi2YczikIab4vCJfi9G9ntI=
X-Google-Smtp-Source: APXvYqyy+LMdxq/qKO54+heNLUHpGYO0paqy53/XKNiG87TRobPsxdsWvBivsos0RfJ44kbxn5whTCW58f+ZhNJGxGc=
X-Received: by 2002:a05:6102:3102:: with SMTP id
 e2mr11378923vsh.179.1581498070820; 
 Wed, 12 Feb 2020 01:01:10 -0800 (PST)
MIME-Version: 1.0
References: <20200205070834.3087104-1-marex@denx.de>
 <20200205101223.21d99d93@xps13>
 <45a10680-5fe6-7cab-a7ef-f7f7a952e822@denx.de> <20200205105045.6877aca6@xps13>
 <bdb54ba5-648a-0b79-661c-5eb9604a1ee5@denx.de>
 <b6f094b7-01a9-34a2-bf10-019a05bc7cb3@denx.de>
 <20200211170707.2183625e@xps13> <b1a10583-e110-9568-4007-aa2b3f38a7be@denx.de>
In-Reply-To: <b1a10583-e110-9568-4007-aa2b3f38a7be@denx.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 12 Feb 2020 18:00:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNARqYDh4AJ+N-PTHui0H89-humECskJVUxW4cTf6edEBMQ@mail.gmail.com>
Message-ID: <CAK7LNARqYDh4AJ+N-PTHui0H89-humECskJVUxW4cTf6edEBMQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "mtd: rawnand: denali: get ->setup_data_interface()
 working again"
To: Marek Vasut <marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_010132_607685_F26544CF 
X-CRM114-Status: GOOD (  23.01  )
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

Hi Marek,


On Wed, Feb 12, 2020 at 5:35 AM Marek Vasut <marex@denx.de> wrote:
>
> On 2/11/20 5:07 PM, Miquel Raynal wrote:
> > Hi Marek, Masahiro,
> >
> > Marek Vasut <marex@denx.de> wrote on Tue, 11 Feb 2020 11:04:10 +0100:
> >
> >> On 2/5/20 11:08 AM, Marek Vasut wrote:
> >>> On 2/5/20 10:50 AM, Miquel Raynal wrote:
> >>>> Hi Marek,
> >>>>
> >>>> Marek Vasut <marex@denx.de> wrote on Wed, 5 Feb 2020 10:41:05 +0100:
> >>>>
> >>>>> On 2/5/20 10:12 AM, Miquel Raynal wrote:
> >>>>>> Hi Marek,
> >>>>>>
> >>>>>> Marek Vasut <marex@denx.de> wrote on Wed,  5 Feb 2020 08:08:34 +0100:
> >>>>>>
> >>>>>>> This reverts commit d311e0c27b8fcc27f707f8cac48cd8bdc4155224, which
> >>>>>>> completely breaks NAND access on Altera SoCFPGA (detected on ArriaV
> >>>>>>> SoC).
> >>>>>>>
> >>>>>>> On SoCFPGA, denali->clk_rate = 31.25 MHz and denali->clk_x_rate = 125 MHz,
> >>>>>>> hence the driver sets NAND_KEEP_TIMINGS flag.


Interesting.
I have never seen such clock rates before.


For all known upstream platforms
(Altera SOCFPGA, Socionext UniPhier, Intel MRST),
the NAND controller core clock is 50 MHz,
the NAND bus clock is 200MHz.



What would happen if you hard-code:
denali->clk_rate = 50000000;
denali->clk_x_rate = 200000000;

like I had already suggested to Tim Sander:
https://lore.kernel.org/lkml/CAK7LNAQOCoJC0RzOhTEofHdR+zU5sQTxV-t4nERBExW1ddW5hw@mail.gmail.com/

Unfortunately, he did not want to do it, but
I am still interested in this experiment because
I suspect this might be a bug of drivers/clk/socfpga/.


4.19.10 kernel (, which Tim Sander agreed the timing was working fine)
was hard-coding them in order to deal with the immature SOCFPGA clock driver.

See this code:
https://elixir.bootlin.com/linux/v4.19.10/source/drivers/mtd/nand/raw/denali_dt.c#L162


Masahiro Yamada




> >>>>>>> and is actually incorrect, as on SoCFPGA we do not want to retain timings
> >>>>>>> from previous stage (the timings might be incorrect or outright invalid).
> >>>>>>>
> >>>>>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> >>>>>>> Cc: Dinh Nguyen <dinguyen@kernel.org>
> >>>>>>> Cc: Masahiro Yamada <masahiroy@kernel.org>
> >>>>>>> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> >>>>>>> Cc: Tim Sander <tim@krieglstein.org>
> >>>>>>> To: linux-mtd <linux-mtd@lists.infradead.org>
> >>>>>>> ---
> >>>>>>>  drivers/mtd/nand/raw/denali.c | 2 +-
> >>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
> >>>>>>> index b6c463d02167..5fe3c62a756e 100644
> >>>>>>> --- a/drivers/mtd/nand/raw/denali.c
> >>>>>>> +++ b/drivers/mtd/nand/raw/denali.c
> >>>>>>> @@ -1209,7 +1209,7 @@ int denali_chip_init(struct denali_controller *denali,
> >>>>>>>         }
> >>>>>>>
> >>>>>>>         /* clk rate info is needed for setup_data_interface */
> >>>>>>> -       if (!denali->clk_rate || !denali->clk_x_rate)
> >>>>>>
> >>>>>> I don't get it, if both clk_rate and clk_x_rate are set, the if
> >>>>>> condition will not be entered, right?
> >>>>>
> >>>>> Err, then it's the other way around and I need to keep the timings on
> >>>>> socfpga ?
> >>>>
> >>>> Ok.
> >>>>
> >>>> Do you have a different compatible? Or a register to check? How do you
> >>>> discriminate the different platforms by software? The quick and dirty
> >>>> solution is to add a special case for your platform and specifically
> >>>> use the NAND_KEEP_TIMINGS horror.
> >>>
> >>> Sure, there's a socfpga compatible and at least two for uniphier.
> >>>
> >>>> But I think using ->software_data_interface is the right solution. So
> >>>> I would highly recommend fixing the implementation of this hook
> >>>> for your platform and in this case the commit reverted is not the
> >>>> culprit, the one introducing setup_data_interface is (for the Fixes:
> >>>> tag).
> >>>
> >>> I'll leave the details to Yamada-san.
> >>
> >> Just got a confirmation that this fixes NAND behavior on SoCFPGA, so
> >> this patch should go in in some form.
> >
> > I'm sure it fixes it, but it is definitely not going in the right
> > direction!
> >
> > The right thing to do is fixing ->setup_data_interface().
> >
> > The bad thing to do if someone tells me that he will fix
> > ->setup_data_interface() in a second time is to keep the
> > NAND_KEEP_TIMINGS flag only for a single compatible.
>
> OK, I'll leave that to Yamada-san. I don't really want to interfere with
> his work on the Denali NAND driver.



-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
