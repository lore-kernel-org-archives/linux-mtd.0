Return-Path: <SRS0=2g81=4H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC97C34056
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2020 18:45:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6043A24670
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2020 18:45:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UHoWMphu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6043A24670
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2YgCLpV4nHZifQ7Z+cJudvx5nFaDCT2Ekz3IVsaMCg=; b=UHoWMphueclASc
	qkWjFCwmMrmKYfB2t2buR4KM2zCkOL+DCfajlQU0q9PfHGx/AAgU21kPN5Os5QpVZF9DFmIb+aR/u
	gs15tCRbxdZTL2AIyFkB+9ONW0iYPY5aORkA9ICTQ6z8yPsX1hkKH84TLrrTXXSxOO+66TlHFqwzw
	f49Gglkmsj/NTJL+P4TXsTHuNYelveuByUcIxmnawPz8CuvqDGVAVHdJF/fdwPV4c8n+nLL8hj39N
	QFocMtl3nHrHt2oHbnepEDVSBN2+B7e3XrEiCcbdGiDVv40C0vFa8ATOJjKUmCWpAJU9VoVlwWBaC
	x+FqFtMmd684PaAeSs+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4ULF-0006Q7-8d; Wed, 19 Feb 2020 18:45:01 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4ULB-0006PU-4u
 for linux-mtd@lists.infradead.org; Wed, 19 Feb 2020 18:44:59 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48N68k2XHJz1rTY6;
 Wed, 19 Feb 2020 19:44:54 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48N68k1Tmdz1qyDL;
 Wed, 19 Feb 2020 19:44:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 848bk_QkFJRF; Wed, 19 Feb 2020 19:44:52 +0100 (CET)
X-Auth-Info: Z7OJ2e9J/tWaEowQWpJWc+KZ2p8Y3JECwTx9XDlPMBQ=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 19 Feb 2020 19:44:52 +0100 (CET)
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
 <29cce21c-2214-7238-0bc5-db2c1a54576f@denx.de>
 <CAK7LNASckTZO-9uVjtQH8iKhU0HH9WiMK-CzMxjESQOOUM0cKA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <1b5912e0-4ff2-2b86-5d87-d264c3bf1d42@denx.de>
Date: Wed, 19 Feb 2020 19:27:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAK7LNASckTZO-9uVjtQH8iKhU0HH9WiMK-CzMxjESQOOUM0cKA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_104457_491353_AC0EDB8C 
X-CRM114-Status: GOOD (  16.13  )
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

On 2/17/20 9:33 AM, Masahiro Yamada wrote:
> Hi,

Hi,

[...]

> If possible, can you provide the dump of
> the attached debug code?

Without this revert:

Denali: clk_rate=31250000, clk_x_rate=125000000
Denali: tREA=40000
Denali: acc_clks=5
Denali: tRHW=200000
Denali: re_2_we=25
Denali: tRHZ=200000
Denali: re_2_re=25
Denali: tCCS=500000000
Denali: tWHR=120000
Denali: we_2_re=63
Denali: tADL=400000
Denali: addr_2_data=50
Denali: tREH=30000
Denali: tWH=30000
Denali: rdwr_en_hi=4
Denali: tRP=50000
Denali: tWP=50000
Denali: tRC=100000
Denali: tWC=100000
Denali: rdwr_en_lo_hi=13
Denali: rdwr_en_lo=9
Denali: tCS=70000
Denali: tCEA=100000
Denali: cs_setup=8
Denali: clk_rate=31250000, clk_x_rate=125000000
Denali: tREA=16000
Denali: acc_clks=2
Denali: tRHW=100000
Denali: re_2_we=13
Denali: tRHZ=100000
Denali: re_2_re=13
Denali: tCCS=100000
Denali: tWHR=80000
Denali: we_2_re=13
Denali: tADL=400000
Denali: addr_2_data=50
Denali: tREH=7000
Denali: tWH=7000
Denali: rdwr_en_hi=1
Denali: tRP=10000
Denali: tWP=10000
Denali: tRC=20000
Denali: tWC=20000
Denali: rdwr_en_lo_hi=4
Denali: rdwr_en_lo=3
Denali: tCS=15000
Denali: tCEA=25000
Denali: cs_setup=2

With this revert, setup_data_interface() is not called, so there is no log.

[...]

>>> When denali->clk_x_rate is zero,
>>> NAND_KEEP_TIMINGS would not be set with your patch.
>>> So, ->setup_data_interface() would be called.
>>>
>>> This would cause zero divion at line 781.
>>>         t_x = DIV_ROUND_DOWN_ULL(1000000000000ULL, denali->clk_x_rate);
>>
>> If the clock are non-zero, how would this be a division by zero ?
> 
> 
> You have a false assumption "If the clock are non-zero...".
> 
> clk_get_rate() may return zero if the clock driver
> is not ready to provide the frequency information.
> 
> 
> 
> The current code:
>   If clk_rate or clk_x_rate is zero,
>    do not call denali_setup_data_interface().
>   If neither clk_rate nor clk_x is zero,
>    call denali_setup_data_interface().
> 
> 
> With your patch:
>   If clk_rate or clk_x_rate is zero,
>    call denali_setup_data_interface(),
>    which causes zero division.
>   If neither clk_rate nor clk_x is zero,
>    do not call denali_setup_data_interface().

OK, so it's just a miscommunication. In my case, neither of the clock
are zero. On SoCFPGA, I think clk_rate = clk_x_rate / 4, but I'm not
sure if that's always the case.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
