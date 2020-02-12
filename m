Return-Path: <SRS0=zQg3=4A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE986C2BA83
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 13:42:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A197D20659
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 13:42:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HDkHhJLS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A197D20659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BlWIWEmVPLkIWkuXYEg0J45UJTV9dHrRP6xnSeVNN9g=; b=HDkHhJLSzhsA2t
	T4vmLwh1KDz7vUB2Julfpc3RyMxZIJqSenSVn8uIJyMKODr61aptzSdWmIV8Yp5/iALDJncB+BABB
	tm6cwMPiZsBlnrSp6Ogx5KqRMO89OLU7UTdO4M04CqxVbA5JsTpin9PAkIzKBKBPi8nwKRpkpzBG2
	+UJtWCu+EHEG6L9ZDCZRMbwHfcS8N47VORkAtWPwQrzSTWTKrWwKC5yw9X1tP0Qz8POOd/OfdQWiY
	uuLY3hnUv2vi1g4OZ0kEvi5UGnT8CeItGVzs3urkx5d/EaRb4X8qV9h26kxpJ/IePaTlFf+n4x/1k
	Ih0CLeBFdomXRoIARWyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1sH3-0006qk-Sq; Wed, 12 Feb 2020 13:41:53 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1sGz-0006q8-Vu
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2020 13:41:52 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48HgmB70klz1rhZ9;
 Wed, 12 Feb 2020 14:41:46 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48HgmB6CWkz1qtfC;
 Wed, 12 Feb 2020 14:41:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 4F5Oo3l7SDiJ; Wed, 12 Feb 2020 14:41:44 +0100 (CET)
X-Auth-Info: AT6nzdsj3C7r2riuEjrpPJuQ6WDfd6Ngj6qyLos4UWk=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 12 Feb 2020 14:41:44 +0100 (CET)
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
From: Marek Vasut <marex@denx.de>
Message-ID: <f4e2deeb-cc0e-fb06-46fa-d6cf4f2a73ad@denx.de>
Date: Wed, 12 Feb 2020 10:37:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAK7LNARqYDh4AJ+N-PTHui0H89-humECskJVUxW4cTf6edEBMQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_054150_313761_C60E607B 
X-CRM114-Status: GOOD (  15.62  )
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

On 2/12/20 10:00 AM, Masahiro Yamada wrote:
> Hi Marek,

Hi,

> On Wed, Feb 12, 2020 at 5:35 AM Marek Vasut <marex@denx.de> wrote:
>>
>> On 2/11/20 5:07 PM, Miquel Raynal wrote:
>>> Hi Marek, Masahiro,
>>>
>>> Marek Vasut <marex@denx.de> wrote on Tue, 11 Feb 2020 11:04:10 +0100:
>>>
>>>> On 2/5/20 11:08 AM, Marek Vasut wrote:
>>>>> On 2/5/20 10:50 AM, Miquel Raynal wrote:
>>>>>> Hi Marek,
>>>>>>
>>>>>> Marek Vasut <marex@denx.de> wrote on Wed, 5 Feb 2020 10:41:05 +0100:
>>>>>>
>>>>>>> On 2/5/20 10:12 AM, Miquel Raynal wrote:
>>>>>>>> Hi Marek,
>>>>>>>>
>>>>>>>> Marek Vasut <marex@denx.de> wrote on Wed,  5 Feb 2020 08:08:34 +0100:
>>>>>>>>
>>>>>>>>> This reverts commit d311e0c27b8fcc27f707f8cac48cd8bdc4155224, which
>>>>>>>>> completely breaks NAND access on Altera SoCFPGA (detected on ArriaV
>>>>>>>>> SoC).
>>>>>>>>>
>>>>>>>>> On SoCFPGA, denali->clk_rate = 31.25 MHz and denali->clk_x_rate = 125 MHz,
>>>>>>>>> hence the driver sets NAND_KEEP_TIMINGS flag.
> 
> 
> Interesting.
> I have never seen such clock rates before.
> 
> 
> For all known upstream platforms
> (Altera SOCFPGA, Socionext UniPhier, Intel MRST),
> the NAND controller core clock is 50 MHz,
> the NAND bus clock is 200MHz.

You can configure whatever rate you want in the QSys HPS component.

> What would happen if you hard-code:
> denali->clk_rate = 50000000;
> denali->clk_x_rate = 200000000;

It will not work, because the IP would be using incorrect clock.

> like I had already suggested to Tim Sander:
> https://lore.kernel.org/lkml/CAK7LNAQOCoJC0RzOhTEofHdR+zU5sQTxV-t4nERBExW1ddW5hw@mail.gmail.com/
> 
> Unfortunately, he did not want to do it, but
> I am still interested in this experiment because
> I suspect this might be a bug of drivers/clk/socfpga/.

No, this is a feature of the platform, you can configure any clock you
want pretty much.

> 4.19.10 kernel (, which Tim Sander agreed the timing was working fine)
> was hard-coding them in order to deal with the immature SOCFPGA clock driver.

The 4.19 was working fine for Tim (and me as well), because it didn't
have this bug which this patch removes.

[...]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
