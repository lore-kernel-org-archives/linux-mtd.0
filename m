Return-Path: <SRS0=zQg3=4A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0514EC2BA83
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 16:57:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C54F721569
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 16:57:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g0+3lest";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="r1+AJqbN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C54F721569
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=um5at1mGpTAlgsXKMKEUdkaTy3PU7Ua9h5FcYPmDYBU=; b=g0+3lest17l9Ec
	zwRbhsqfTBTOp07M+fKnOQ21TAkA3GlVVtTK/AdBco66L5k8qQZIEBMDqzS6dHILZzTiHEo7pE4oB
	sug8tBcTxAVlNzoF4TgMcHfODUGhxO5eQcezn15QqjAdWMQagCUClZoUx8C20IC1bpfqSBh9KnXGV
	xdka+Mw64IXczR9rl2DoqNd8utVe9mM8T46R+ADi5xeYXqyfcpjM2KBtOYagsPmuKW7PULRGglKx0
	0ztmknkMCSNqfuxl6B8+X3VredFX8PWO7ecA6ClbpJJJN7si3vAflbqV4VhaSGQTP5QxQO74SKzrO
	GwtQURxYJuFgQuaUwI+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1vKX-0003XA-Qd; Wed, 12 Feb 2020 16:57:41 +0000
Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1vKU-0003WY-UX
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2020 16:57:40 +0000
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 01CGvNXk030284
 for <linux-mtd@lists.infradead.org>; Thu, 13 Feb 2020 01:57:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 01CGvNXk030284
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1581526644;
 bh=/BpoZYg7cOkczb7OmtsSf7V8uthCZoK75H+HwRCb3nQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=r1+AJqbNoi62fmTtHIY7b4Y4WFPdlWteyRt7zW/txDXBzFJtRlUOLnIYUVaeO25IK
 /3YZ7Ax1P1ALVWJteyPupgFtPOnQzbJjmQfS+t3Kl77KVZtoCZnOxB+uJjdsre8ZAa
 tuncQa1xjm1RUGjQ9zI6918Rr4McUikfpIcXvCeqMM86xMBBSTn+i5jOyK72P4iN7G
 YaLC0rQC8s7+94OrOW1DdDw+/GLS1S5nsDsntDJozPxl3yR1ABV0U/EruRk5wgd8mh
 Ryfa1oAIVRMmR79QX6JT+CFAlrJNeW1t8fon3rU4oO6IAnYa1zQtczQHO76AbsXEn7
 fsBInYwpIT+WQ==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id x123so1959686vsc.2
 for <linux-mtd@lists.infradead.org>; Wed, 12 Feb 2020 08:57:23 -0800 (PST)
X-Gm-Message-State: APjAAAWSKywL9DJ7zroC48x7ox8HiaaefFQIvuBi71ng7rzWs5rkW8CH
 iAVqkV7Us7pNn4/YjVcmlOr2BBtKsfN/0bfyev0=
X-Google-Smtp-Source: APXvYqwzrGXgsQ/ByoWl4hzLPns0IUcf+Ere/sWVmPtkpI0pw3May/r/JAgAcAaVCYfa5bmX+hFdScd2vI+QHVN20QM=
X-Received: by 2002:a05:6102:190:: with SMTP id
 r16mr12372195vsq.215.1581526642467; 
 Wed, 12 Feb 2020 08:57:22 -0800 (PST)
MIME-Version: 1.0
References: <20200205070834.3087104-1-marex@denx.de>
 <20200205101223.21d99d93@xps13>
 <45a10680-5fe6-7cab-a7ef-f7f7a952e822@denx.de> <20200205105045.6877aca6@xps13>
 <bdb54ba5-648a-0b79-661c-5eb9604a1ee5@denx.de>
 <b6f094b7-01a9-34a2-bf10-019a05bc7cb3@denx.de>
 <20200211170707.2183625e@xps13> <b1a10583-e110-9568-4007-aa2b3f38a7be@denx.de>
 <CAK7LNARqYDh4AJ+N-PTHui0H89-humECskJVUxW4cTf6edEBMQ@mail.gmail.com>
 <f4e2deeb-cc0e-fb06-46fa-d6cf4f2a73ad@denx.de>
In-Reply-To: <f4e2deeb-cc0e-fb06-46fa-d6cf4f2a73ad@denx.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 13 Feb 2020 01:56:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR4MU+Rfmpz99iwLuEbD4jMwUdh91uz3zyQdvjyLEQcMQ@mail.gmail.com>
Message-ID: <CAK7LNAR4MU+Rfmpz99iwLuEbD4jMwUdh91uz3zyQdvjyLEQcMQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "mtd: rawnand: denali: get ->setup_data_interface()
 working again"
To: Marek Vasut <marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_085739_243291_E34CC448 
X-CRM114-Status: GOOD (  20.05  )
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


On Wed, Feb 12, 2020 at 10:41 PM Marek Vasut <marex@denx.de> wrote:
>
> On 2/12/20 10:00 AM, Masahiro Yamada wrote:
> > Hi Marek,
>
> Hi,
>
> > On Wed, Feb 12, 2020 at 5:35 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 2/11/20 5:07 PM, Miquel Raynal wrote:
> >>> Hi Marek, Masahiro,
> >>>
> >>> Marek Vasut <marex@denx.de> wrote on Tue, 11 Feb 2020 11:04:10 +0100:
> >>>
> >>>> On 2/5/20 11:08 AM, Marek Vasut wrote:
> >>>>> On 2/5/20 10:50 AM, Miquel Raynal wrote:
> >>>>>> Hi Marek,
> >>>>>>
> >>>>>> Marek Vasut <marex@denx.de> wrote on Wed, 5 Feb 2020 10:41:05 +0100:
> >>>>>>
> >>>>>>> On 2/5/20 10:12 AM, Miquel Raynal wrote:
> >>>>>>>> Hi Marek,
> >>>>>>>>
> >>>>>>>> Marek Vasut <marex@denx.de> wrote on Wed,  5 Feb 2020 08:08:34 +0100:
> >>>>>>>>
> >>>>>>>>> This reverts commit d311e0c27b8fcc27f707f8cac48cd8bdc4155224, which
> >>>>>>>>> completely breaks NAND access on Altera SoCFPGA (detected on ArriaV
> >>>>>>>>> SoC).
> >>>>>>>>>
> >>>>>>>>> On SoCFPGA, denali->clk_rate = 31.25 MHz and denali->clk_x_rate = 125 MHz,
> >>>>>>>>> hence the driver sets NAND_KEEP_TIMINGS flag.
> >
> >
> > Interesting.
> > I have never seen such clock rates before.
> >
> >
> > For all known upstream platforms
> > (Altera SOCFPGA, Socionext UniPhier, Intel MRST),
> > the NAND controller core clock is 50 MHz,
> > the NAND bus clock is 200MHz.
>
> You can configure whatever rate you want in the QSys HPS component.

OK.

The SOCFPGA maintainer, Dinh Nguyen, said this:
"From the clock controller, it provides a single 200MHz clock to the NAND
IP. Inside the NAND IP, there is a /4 for the clk. The 200MHz clock is
used for the clk_x and ecc_clk."


http://lists.infradead.org/pipermail/linux-arm-kernel/2018-July/592702.html



Maybe, you are using a brand-new,
different type of SOCFPGA?



> > What would happen if you hard-code:
> > denali->clk_rate = 50000000;
> > denali->clk_x_rate = 200000000;
>
> It will not work, because the IP would be using incorrect clock.

I wanted to see the past tense here instead of
future tense + subjunctive mood.

I wanted you to try it.



>
> > like I had already suggested to Tim Sander:
> > https://lore.kernel.org/lkml/CAK7LNAQOCoJC0RzOhTEofHdR+zU5sQTxV-t4nERBExW1ddW5hw@mail.gmail.com/
> >
> > Unfortunately, he did not want to do it, but
> > I am still interested in this experiment because
> > I suspect this might be a bug of drivers/clk/socfpga/.
>
> No, this is a feature of the platform, you can configure any clock you
> want pretty much.


OK, but if you agree the 4.19.10 is working,

denali->clk_rate = 50000000; denali->clk_x_rate = 200000000;

is worth trying.


>
> > 4.19.10 kernel (, which Tim Sander agreed the timing was working fine)
> > was hard-coding them in order to deal with the immature SOCFPGA clock driver.
>
> The 4.19 was working fine for Tim (and me as well), because it didn't
> have this bug which this patch removes.


d311e0c27b8fcc27f707f8ca did not exist in 4.19

But, 7a08dbaedd36 did not exist either in 4.19


$ git describe  7a08dbae
v4.20-rc2-34-g7a08dbaedd36
$ git describe  d311e0c
v5.0-rc2-3-gd311e0c27b8f


So, your patch is getting it back to
v4.20-rc2-34-g7a08dbaedd36
where the condition for ->setup_data_interface() call
is accidentally inverted for the Denali driver.



BTW, did you notice your code was doing the opposite
to your commit description?


Your commit description goes like this:

"On SoCFPGA, denali->clk_rate = 31.25 MHz and denali->clk_x_rate = 125 MHz,
hence the driver sets NAND_KEEP_TIMINGS flag. This did not happen before
and is actually incorrect, as on SoCFPGA we do not want to retain timings
from previous stage (the timings might be incorrect or outright invalid)."


You clearly state denali->clk_rate and denali->clk_x_rate
are non-zero values.

If this patch were applied, we would end up with NAND_KEEP_TIMINGS set.
Then ->setup_data_interface() hook would be skipped.
So, the timings from previous stage would be retained.

Is this what you want to do?


One more thing, if your patch were applied,
we would get back to the situation
where the back-trace happens due to zero-division:


When denali->clk_x_rate is zero,
NAND_KEEP_TIMINGS would not be set with your patch.
So, ->setup_data_interface() would be called.

This would cause zero divion at line 781.
        t_x = DIV_ROUND_DOWN_ULL(1000000000000ULL, denali->clk_x_rate);



-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
