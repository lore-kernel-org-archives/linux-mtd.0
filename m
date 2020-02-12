Return-Path: <SRS0=zQg3=4A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B6CC2BA83
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 17:45:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE7522073C
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 17:45:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S63XwxII"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE7522073C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0MUQWdhUBtffpWdXP1ycsg04qT4iOJjKj0ZK8+YMDvQ=; b=S63XwxIIG1MWmZ
	JGdYK7DJJR056HwMF0kUl7ary+l2T50dekLRbxYbLtQr6ryYIDXLkRSoPJIrPl9IX4A3iuuhlzYlp
	k4Mv8GNAyBnfeumQn20KgaMEkFxpIefEs0XrOexS41L7YyuJQ3AeG1rhczyj8EinKmRgD/LuVJMr/
	EbfYifohzerwwwIREgkk3D1zwWGKybO0vacAmhhipsbo3T76QyYH4ovBt+JqY2Wr29hgZvL/wOoks
	J+Jq2n7aV0mpeqoSIMBbsr2MM83fgto4qwjq/iUIx7zX+vI5385iCZBsqVbuOYJKury5Oxrx1V93x
	aNO3XhjyLqogJ/4LT/Iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1w51-0001Bf-Ng; Wed, 12 Feb 2020 17:45:43 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1w4y-0001AZ-EH
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2020 17:45:42 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48Hn9Y48Qfz1rj6M;
 Wed, 12 Feb 2020 18:45:37 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48Hn9Y3f5Bz1qqkB;
 Wed, 12 Feb 2020 18:45:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id OK7_B58RCQ6h; Wed, 12 Feb 2020 18:45:35 +0100 (CET)
X-Auth-Info: 0h5vY65oB+v8C5oSlXyR4Ko/l8r/I9OSXzEQwmQ2eYQ=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 12 Feb 2020 18:45:35 +0100 (CET)
Subject: Re: [PATCH] Revert "mtd: rawnand: denali: get
 ->setup_data_interface() working again"
To: Masahiro Yamada <masahiroy@kernel.org>
References: <20200205070834.3087104-1-marex@denx.de>
 <20200205101223.21d99d93@xps13>
 <45a10680-5fe6-7cab-a7ef-f7f7a952e822@denx.de>
 <20200205105045.6877aca6@xps13>
 <bdb54ba5-648a-0b79-661c-5eb9604a1ee5@denx.de>
 <b6f094b7-01a9-34a2-bf10-019a05bc7cb3@denx.de>
 <20200211170707.2183625e@xps13>
 <b1a10583-e110-9568-4007-aa2b3f38a7be@denx.de>
 <CAK7LNARqYDh4AJ+N-PTHui0H89-humECskJVUxW4cTf6edEBMQ@mail.gmail.com>
 <f4e2deeb-cc0e-fb06-46fa-d6cf4f2a73ad@denx.de>
 <CAK7LNAR4MU+Rfmpz99iwLuEbD4jMwUdh91uz3zyQdvjyLEQcMQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <29cce21c-2214-7238-0bc5-db2c1a54576f@denx.de>
Date: Wed, 12 Feb 2020 18:44:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAK7LNAR4MU+Rfmpz99iwLuEbD4jMwUdh91uz3zyQdvjyLEQcMQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_094540_785029_3674EFFE 
X-CRM114-Status: GOOD (  27.17  )
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

On 2/12/20 5:56 PM, Masahiro Yamada wrote:
> Hi.

Hi,

[...]

>>>>>>>>>>> On SoCFPGA, denali->clk_rate = 31.25 MHz and denali->clk_x_rate = 125 MHz,
>>>>>>>>>>> hence the driver sets NAND_KEEP_TIMINGS flag.
>>>
>>>
>>> Interesting.
>>> I have never seen such clock rates before.
>>>
>>>
>>> For all known upstream platforms
>>> (Altera SOCFPGA, Socionext UniPhier, Intel MRST),
>>> the NAND controller core clock is 50 MHz,
>>> the NAND bus clock is 200MHz.
>>
>> You can configure whatever rate you want in the QSys HPS component.
> 
> OK.
> 
> The SOCFPGA maintainer, Dinh Nguyen, said this:
> "From the clock controller, it provides a single 200MHz clock to the NAND
> IP. Inside the NAND IP, there is a /4 for the clk. The 200MHz clock is
> used for the clk_x and ecc_clk."

That sounds like some root clock. You can read the entire documentation
for the SoCFPGA CV/AV here:
http://www.altera.com/literature/hb/cyclone-v/cv_5v4.pdf
See section 3 , look for 'nand' there. Note that NAND can be supplied
from at least two different PLLs -- main and peripheral.

> http://lists.infradead.org/pipermail/linux-arm-kernel/2018-July/592702.html
> 
> 
> 
> Maybe, you are using a brand-new,
> different type of SOCFPGA?

Cyclone V and Arria V , so no.

>>> What would happen if you hard-code:
>>> denali->clk_rate = 50000000;
>>> denali->clk_x_rate = 200000000;
>>
>> It will not work, because the IP would be using incorrect clock.
> 
> I wanted to see the past tense here instead of
> future tense + subjunctive mood.
> 
> I wanted you to try it.
> 
> 
> 
>>
>>> like I had already suggested to Tim Sander:
>>> https://lore.kernel.org/lkml/CAK7LNAQOCoJC0RzOhTEofHdR+zU5sQTxV-t4nERBExW1ddW5hw@mail.gmail.com/
>>>
>>> Unfortunately, he did not want to do it, but
>>> I am still interested in this experiment because
>>> I suspect this might be a bug of drivers/clk/socfpga/.
>>
>> No, this is a feature of the platform, you can configure any clock you
>> want pretty much.
> 
> 
> OK, but if you agree the 4.19.10 is working,
> 
> denali->clk_rate = 50000000; denali->clk_x_rate = 200000000;
> 
> is worth trying.

Why would misconfiguring the IP be worth trying ?

>>> 4.19.10 kernel (, which Tim Sander agreed the timing was working fine)
>>> was hard-coding them in order to deal with the immature SOCFPGA clock driver.
>>
>> The 4.19 was working fine for Tim (and me as well), because it didn't
>> have this bug which this patch removes.
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

I think Boris / Miquel mentioned that above already.

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

They are non-zero, 31.25 MHz and 125 MHz respectively.

> If this patch were applied, we would end up with NAND_KEEP_TIMINGS set.
> Then ->setup_data_interface() hook would be skipped.
> So, the timings from previous stage would be retained.
> 
> Is this what you want to do?

I don't know ? The calculated timings are apparently not working.

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

If the clock are non-zero, how would this be a division by zero ?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
