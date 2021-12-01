Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFBBC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Dec 2021 08:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=shIiZ1H8wQqZcbenlHUDghB+BbP9UyKYmS7+tGPhYJE=; b=L7rPnR45Rizwxm
	SP2nc2Tu7WYyxEG2dc+M38yacEHMQHRyR1sQ0NbxNWSyOeIJ2f6TR0plTbN8fTmD8w3OL9X9U6WCf
	TxOPtJwBtMriuQq8EcMjpDgyd51ctxkwj4ON/bhh21fQ1OHrOYJE0UE3Xstwu/DhY3I/D7WVMq0x+
	Zvh0Uv1P7CH828jmI5VuzG42V0bvazttVQWIyMLrk3ktFkhfMfbpt2t0kfIMw2dLq4WLIjOq+51ay
	ABUikygv0tAIewkIOY4JGMYZWqB8QISKPhFNLSoCCxvBZ7dG7c/WP2Pv3dxB80IiD/Tv2lq3zij6O
	tNHjuQp3x9LGxu6j9xgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msKmx-007nKN-8m; Wed, 01 Dec 2021 08:16:27 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msKml-007nEy-Qb
 for linux-mtd@lists.infradead.org; Wed, 01 Dec 2021 08:16:17 +0000
Received: by mail-ed1-x52e.google.com with SMTP id v1so98023339edx.2
 for <linux-mtd@lists.infradead.org>; Wed, 01 Dec 2021 00:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=V6zQR0fGtot8Y0hr0EL8eBOomgUYse/RC/KrmAqMq4c=;
 b=N3Jv//xt4KCpN2hwq3/lUeQmNMzmpXDcMhFnL/mORbGNyheFXxAcmxcjZIhUBxwhaX
 o/YmqiqOI+AaXwMbzZfzLlBXLh8OC+R79N52vzOrY2jsd6rKIfK9hZBc+Ac4S91Cvq96
 8iW0LBMuy52nNLmNYSL/zT9xYIF9AXvK46T7zmSyizmjfuRdDMMysNFgcd0/ObTk4/57
 MpsRx02bRwMDEEP0gRoKs4lhdk275wr6RLzUR0JVKAK3USDVeFKy2eZ4ig7I/srmHUQK
 GKt1sZWFcpan5JoDXhY0gEAK45fPgYC1udTV9J2B7BeNT+7dBsqau0EsmNUv7Kd00ypw
 tNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V6zQR0fGtot8Y0hr0EL8eBOomgUYse/RC/KrmAqMq4c=;
 b=lwhCtbyRREMIybFk6FO7bjwbIYb2UBOWjqJsO1+zMRXyYUL7ZGCvvcCXTVQb6OGK0z
 7NrfOzRWeaZj3ROq6KWuCIzF2uZVmGxHhMP7pOe/t5sB5Aq+ekpAjUuSuCkikBKZs36G
 /QAU52l9dHDkix9pGFtFqoHCGK9P0QgFCEfsXpc7QDAXF2Sir47sCBVDERB3kaq7ceAA
 1ZTBZtDDCvropGRNNhrMlliuPM5d/8zdTVb87mQ1s6YHZbm7j9RCqg8/F09ab0f80Op8
 kcFO+nReB954HMVnjVd1YKs2NA3B8/96Sv+H61xBymXmBvzVNIgiwQn04Zgsp3OiCA42
 SLCQ==
X-Gm-Message-State: AOAM532OZeGRKn30IrRF4AH2GzW/ANT85mNDidRCwUlOc+nM6p6CA5I+
 dVANMUjWsqRbzO5YLy7VUgfywQ==
X-Google-Smtp-Source: ABdhPJw2TIwxrsYqtYN6BP9l9K2r8DpCSdz3W6t0gaidwFtoXgWxuCKj5Yk5vxSQdBMhC85ZX3lSVQ==
X-Received: by 2002:a05:6402:42d4:: with SMTP id
 i20mr6507147edc.372.1638346572931; 
 Wed, 01 Dec 2021 00:16:12 -0800 (PST)
Received: from ?IPV6:2a02:768:2307:40d6::e05? ([2a02:768:2307:40d6::e05])
 by smtp.gmail.com with ESMTPSA id hq37sm11047185ejc.116.2021.12.01.00.16.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 00:16:12 -0800 (PST)
Message-ID: <734dfe79-6e3f-1e68-c167-bab3ae9e8d52@monstr.eu>
Date: Wed, 1 Dec 2021 09:16:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] mtd: rawnand: arasan: Fix clock rate in NV-DDR
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Olga Kitaina <okitain@gmail.com>,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
Cc: linux-mtd@lists.infradead.org, nagasure@xilinx.com, richard@nod.at,
 vigneshr@ti.com, linux-kernel@vger.kernel.org
References: <20211127180758.30884-1-okitain@gmail.com>
 <20211129095559.01aa63a6@xps13>
 <3da5dff5-53d4-15db-075d-9b195f2f75dd@gmail.com>
 <20211130082017.1400f24b@xps13>
 <fb6a4b49-7c10-4ed1-7054-5dd8ce2d8073@gmail.com>
 <20211201090941.73e67f65@xps13>
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <20211201090941.73e67f65@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_001615_922407_BF7C6C39 
X-CRM114-Status: GOOD (  24.19  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,


On 12/1/21 09:09, Miquel Raynal wrote:
> Hi Olga,
> 
> + Michal (please add him in Cc of your next iteration)
> 
> okitain@gmail.com wrote on Tue, 30 Nov 2021 23:08:20 +0300:
> 
>> Hi Miquel,
>>
>> On 30.11.2021 10:20, Miquel Raynal wrote:
>>> Hi Olga,
>>>
>>> okitain@gmail.com wrote on Mon, 29 Nov 2021 21:06:05 +0300:
>>>    
>>>> Hi Miquel,
>>>>
>>>> On 29.11.2021 11:55, Miquel Raynal wrote:
>>>>> Hi Olga,
>>>>>
>>>>> Please add all the MTD maintainers in copy, as requested by
>>>>> get_maintainers.pl.
>>>>>
>>>>> okitain@gmail.com wrote on Sat, 27 Nov 2021 21:07:58
>>>>> +0300:
>>>>>      
>>>>>> According to the Arasan NAND controller spec,
>>>>>> the flash clock rate for SDR must be <= 100 MHz,
>>>>>> while for NV-DDR it must be the same as the rate
>>>>>> of the CLK line for the mode.
>>>>>
>>>>> I completely missed that, where did you get the information?
>>>>
>>>> The "Data Interface Transitions" chapter of the spec contains timings for flash clock setup in NV-DDR
>>>> and NV-DDR2 modes. The "time period" of those clocks is equal to tCK in NV-DDR and tRC in NV-DDR2.
>>>>
>>>> The same chapter should have information about necessary steps to switch from NV-DDR to SDR,
>>>> which includes setting the flash clock to 100 MHz.
>>>>
>>>>
>>>> Just to make sure i'm not shooting myself in the foot: am I changing the right clock?
>>>> The documentation points out that we have to change flash_clk, which i thought was
>>>> nfc->controller_clk and set up by anand->clk, but it seems like it might actually be nfc->bus_clk.
>>>
>>> I believe I made a serious mistake, re-reading the code it feels like
>>> I'm changing the system's clock (which basically changes nothing in our
>>> case) instead of changing the NAND bus clock.
>>>    
>>>> In that case, does setting nfc->controller_clk to 100 MHz by default make sense?
>>>> There isn't a hard limit on what the system clock might be (beyond a specific SoC),
>>>> but there are timing requirements for the flash clock, and so setting a specific
>>>> system clock frequency seems unnecessary for most devices.
>>>>   
>>>
>>> Please create a two-patch series:
>>> 1- Setting the right clock in the current code base (inverting bus_clk
>>> and controller_clk where relevant, setting one to 100MHz and letting
>>> the other as it is)
>>> 2- Changing the default NV-DDR rate based on tCK (below patch).
>>>
>>> Do you have the necessary hardware for testing?
>>
>> I'm sorry to say - I do not. The SoC this problem was initially noticed on can't run latest Linux,
>> and even if it did I have no way of acquiring an NV-DDR-capable flash.
>>
>> Since Bootlin merged in NV-DDR support into the kernel, is it possible for you to test
>> the next iteration of this patch series on NV-DDR hardware as well?
>> Say, by purposefully preventing NV-DDR mode 5 from being chosen in anfc_setup_interface()?
> 
> I don't have the hardware anymore.
> 
> Please send a v2 with the necessary changes, then we will ask Naga (or
> somebody else from the same team) with access to the board to test it.

Keep Amit in loop. He has access to HW and able to test.

Thanks,
Michal

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
