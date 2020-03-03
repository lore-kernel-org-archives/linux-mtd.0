Return-Path: <SRS0=aQsM=4U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA12C3F2C6
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2020 17:13:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91AC720863
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2020 17:13:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Th32PIl1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91AC720863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eM1Ivh2fMk71ErwxFxDBIqkDmrwbKlzjyDzkxtzbXkQ=; b=Th32PIl1X28L/J
	R4el+y1MX++uF13y42TN0Yqqc+DgEJaBwq8tq11LaXFwqEqh2FpRfIfS+Vrh+m1NfV4QJ7hzVV+Vy
	+9FbJ5evveCtOBs9+7lgKx6pu1vjoKDrIOwBPc4NC9B3qQoOvNEmyK4Q5mYGPWfXeWg0Xp1yPlsjF
	MiHU02FMlc2L98/+VnFBMAboGvDy7weEU7ewYqVhYuFW3RJ2HZpvG0QQNkkLM4EIdko9bCVZ5VTu8
	0hLESnAAgMua0OplqHbXeLJeBrCpi26Lc2v6u0fxBT6ZmxEmqhhyLqrGxd+eb1MgUVZritXQTBIkF
	Zk+iHOCE1D0wa44JIxYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9B6z-0004W4-1c; Tue, 03 Mar 2020 17:13:41 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9B6v-0004Vh-2e
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2020 17:13:38 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48X3WL3QVFz1rY67;
 Tue,  3 Mar 2020 18:13:34 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48X3WL2hcBz1qyDv;
 Tue,  3 Mar 2020 18:13:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id agO0GKgrehjs; Tue,  3 Mar 2020 18:13:32 +0100 (CET)
X-Auth-Info: eIbBlhidtRIf4dNDrdIadwQ93O4Y4wJ0VIrQJFwuT4k=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue,  3 Mar 2020 18:13:32 +0100 (CET)
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
 <CAK7LNAT3EG0XocC0xT0f=6MBpXLga3FehOjEYbRyP6AJUbqb2Q@mail.gmail.com>
 <311cdc3c-59b5-a46b-62f0-e78fc970134a@denx.de>
 <CAK7LNAT1Bzs68X8PiWQHg4g2bpPGd-WM9D4vwf59XfwwLVuVQQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <e86925d0-805c-d364-57ca-6400b77cffd7@denx.de>
Date: Tue, 3 Mar 2020 18:11:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAK7LNAT1Bzs68X8PiWQHg4g2bpPGd-WM9D4vwf59XfwwLVuVQQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_091337_419591_0E7FAA56 
X-CRM114-Status: GOOD (  19.33  )
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

On 2/25/20 1:41 AM, Masahiro Yamada wrote:
> Hi.

Hi,

> On Thu, Feb 20, 2020 at 3:45 AM Marek Vasut <marex@denx.de> wrote:
>>
>> On 2/18/20 6:55 AM, Masahiro Yamada wrote:
>>> Hi
>>
>> Hi,
>>
>> [...]
>>
>>>> There is no change around the ->setup_data_interface() hook
>>>> after v4.19
>>>> The only difference I could think of is the clock frequency.
>>>>
>>>> But, it is OK if you do not want to test it.
>>>>
>>>> And you are confident.
>>>>
>>>> So, let's suspect the ->setup_data_interface() hook.
>>>>
>>>>
>>>> If possible, can you provide the dump of
>>>> the attached debug code?
>>>>
>>>
>>>
>>> I attached two experimental patches.
>>>
>>> I cannot test them because
>>> the mainline code works fine for my boards.
>>>
>>> Does either of them improve something
>>> on your settings?
> 
> 
> 
> I am still waiting for you to let me know
> the result of my patches.

Neither patch works, sorry.

>> Considering that the NAND works if denali_setup_data_interface() is not
>> called, would it rather make sense to first read and print what's
>> programmed into the controller and then print what the code calculated
>> and intends to program into the controller ?
> 
> denali_select_target() is called every operation.
> So, if you dumped this function for a working platform,
> it might flood the printk buffer.
> 
> denali_setup_data_interface() is called just twice.
> That's why I injected the debug code there.
> 
> 
>>
>> See attached patch, with which (without this revert) you get this:
>> denali->reg + TWHR2_AND_WE_2_RE = 0x00001414 -> 0x0000143f
>> denali->reg + TCWAW_AND_ADDR_2_DATA = 0x0000143f -> 0x00001432
>> denali->reg + RE_2_WE = 0x00000014 -> 0x00000019
>> denali->reg + ACC_CLKS = 0x00000004 -> 0x00000005
>> denali->reg + RDWR_EN_LO_CNT = 0x00000002 -> 0x00000009
>> denali->reg + RDWR_EN_HI_CNT = 0x00000002 -> 0x00000004
>> denali->reg + CS_SETUP_CNT = 0x00000001 -> 0x00000008
>> denali->reg + RE_2_RE = 0x00000014 -> 0x00000019
> 
> OK, the left-hand side is probably the timing
> set up by U-Boot.

Yep, the timings that work. So now, how do you get to those working
timings using the Linux driver ?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
