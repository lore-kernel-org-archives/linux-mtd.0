Return-Path: <SRS0=yNtI=5H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16CF6C4332B
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Mar 2020 17:44:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF233206C3
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Mar 2020 17:44:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h1q0IzFD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="lELr3M2T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF233206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D0O3U9YMcPuZNoDavf3zoe45hLP2CQQC0nzzQ3pyPVc=; b=h1q0IzFDceiDYe
	MWj94yOVYwn7i6jkZS/dfeZ1eizQ+Uyd/XHHYy3bnF+uzRgGY7YSnRD5fYBo0R1XypLCjqfTw+9lJ
	BaYQ1WCz96l1ZSuFRq7fHBf4onoZXCemkA0AYgNgaktpZsoMIMJs8scHbO+FRgATteI97gIPTUV0p
	6zUCgKvjQ+GWxp1vNne2LgOFiO1jelMZmNUxVRj7xv3FGlWdnFw5/mfJ4oTs2PpadIMRzk4FVFiMN
	51xnxUxD5riURvUimlnQt+uYWAu1Y/OnBwMeCZeqGwt5T4sITt7FvN+VFep64oKQWcSqFFnE3NXQf
	nBqvYU4vZ10RXaHFZV5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jG4dv-0000wm-08; Sun, 22 Mar 2020 17:44:11 +0000
Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jG4dr-0000rn-5T
 for linux-mtd@lists.infradead.org; Sun, 22 Mar 2020 17:44:09 +0000
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 02MHhOaa030473
 for <linux-mtd@lists.infradead.org>; Mon, 23 Mar 2020 02:43:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 02MHhOaa030473
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1584899005;
 bh=5VWidLyAxVr+JeX12AUe51S3Q/Q1o/QNC542fp0/ac0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lELr3M2T1b2z+PTuaN61NmzZA0ZJpltxAm+qO8LVscXqyGM7PDKOQz1ybEPSrRM9k
 w6AdPPZroYYf9yp/T5jE8nmjVRmNyXGOVQXy8Bz+Zg8gKjCe3t/5e7oebKCavPSBJv
 KjAVX+308yXcIg1uqgblfU8Ap1hIH/xxdyZJ+4hnmf4wRZDdlzwYXenCZUOua1caIN
 xwCHTcYk8fkmF9jGn6KgQhTe/kUhuKsKtj1WoYcnhW7PZIY4D9MQZv4u5sSwWIQN9r
 I1eGP6JR4dlyOvEZetdkQY2/YWZBtmkFVV0PpbLXnFommVUdYxYDb0x3Cl56cmLWiW
 mV6H1D7M8bLQQ==
X-Nifty-SrcIP: [209.85.221.173]
Received: by mail-vk1-f173.google.com with SMTP id t3so3146467vkm.10
 for <linux-mtd@lists.infradead.org>; Sun, 22 Mar 2020 10:43:25 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2iFdIMMmjgc+WgE0M7/dl+HfbNFQ2V6iok4BJLHqpVnMGxlFUu
 xnl0Ic6vYa1euJgwEWULBjZyTC9NdlnqovBwMIY=
X-Google-Smtp-Source: ADFU+vtXZeP+HF7+ab1Tv1t/7gTA17dXviS4+j9NRUv29wPBxhgZ3QGDxW90tubOYkkoQ6EQEQp2se4/+vSsYfbSd/k=
X-Received: by 2002:a1f:3806:: with SMTP id f6mr4073980vka.12.1584899004183;
 Sun, 22 Mar 2020 10:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200316104307.1891-1-yamada.masahiro@socionext.com>
 <20200320181159.5004099f@xps13> <2d02c851-4249-053c-99e9-69b209bffad2@denx.de>
In-Reply-To: <2d02c851-4249-053c-99e9-69b209bffad2@denx.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 23 Mar 2020 02:42:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR5_uCmfmxAduMRxnBNzhtCwNR65OJ__AdZsNz2iiNJWA@mail.gmail.com>
Message-ID: <CAK7LNAR5_uCmfmxAduMRxnBNzhtCwNR65OJ__AdZsNz2iiNJWA@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: denali: add more delays before latching
 incoming data
To: Marek Vasut <marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200322_104407_420862_A91B2F10 
X-CRM114-Status: GOOD (  17.83  )
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
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Mar 21, 2020 at 2:15 AM Marek Vasut <marex@denx.de> wrote:
>
> On 3/20/20 6:11 PM, Miquel Raynal wrote:
> > Hi Marek,
> >
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Mon, 16 Mar
> > 2020 19:43:07 +0900:
> >
> >> The Denali IP have several registers to specify how many clock cycles
> >> should be waited between falling/rising signals. You can improve the
> >> NAND access performance by programming these registers with optimized
> >> values.
> >>
> >> Because struct nand_sdr_timings represents the device requirement
> >> in pico seconds, denali_setup_data_interface() computes the register
> >> values by dividing the device timings with the clock period.
> >>
> >> Marek Vasut reported this driver in the latest kernel does not work
> >> on his SOCFPGA board. (The on-board NAND chip is mode 5)
> >>
> >> The suspicious parameter is acc_clks, so this commit relaxes it.
> >>
> >> The Denali NAND Flash Memory Controller User's Guide describes this
> >> register as follows:
> >>
> >>   acc_clks
> >>     signifies the number of bus interface clk_x clock cycles,
> >>     controller should wait from read enable going low to sending
> >>     out a strobe of clk_x for capturing of incoming data.
> >>
> >> Currently, acc_clks is calculated only based on tREA, the delay on the
> >> chip side. This does not include additional delays that come from the
> >> data path on the PCB and in the SoC, load capacity of the pins, etc.
> >>
> >> This relatively becomes a big factor on faster timing modes like mode 5.
> >>
> >> Before supporting the ->setup_data_interface() hook (e.g. Linux 4.12),
> >> the Denali driver hacks acc_clks in a couple of ways [1] [2] to support
> >> the timing mode 5.
> >>
> >> We would not go back to the hard-coded acc_clks, but we need to include
> >> this factor into the delay somehow. Let's say the amount of the additional
> >> delay is 10000 pico sec.
> >>
> >> In the new calculation, acc_clks is determined by timings->tREA_max +
> >> data_setup_on_host.
> >>
> >> Also, prolong the RE# low period to make sure the data hold is met.
> >>
> >> Finally, re-center the data latch timing for extra safety.
> >>
> >> [1] https://github.com/torvalds/linux/blob/v4.12/drivers/mtd/nand/denali.c#L276
> >> [2] https://github.com/torvalds/linux/blob/v4.12/drivers/mtd/nand/denali.c#L282
> >>
> >> Reported-by: Marek Vasut <marex@denx.de>
> >> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >> ---
> >
> > Can you please give this patch a try and report the result?
>
> It's on my list, don't worry.


Preferably, please test v2.

Thanks.


-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
