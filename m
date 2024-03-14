Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382BAC54E60
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2024 23:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w6y9S3c4hVX4dlzUoeJlgQKE2z/iLedxhujoLB3o86Y=; b=xxuXvILI5bmc7O
	EpzON89aBTr0nA5sAfAXjAa79PDwbNxgXGJ/dB//cWaihXQ8pMt4YZtYHPV1X8DU2S5VirNY+v0bw
	BsZwNl5WqnTb4f2T/VNtnrfSBDPltYV4bc/mSzYPXuOkwntrY6R7NHsSbOMsWKvzAGHiYqA/Vot5P
	ZlA/Ibc8HaICwiO7OeftZUmc/SUS/ihPnEIVn4AGKU38GGZzkPjTGmRN4U0lgBowBU4pO3qQPsqRS
	JivIAVzRXBTuUZOyEh17ijvczb/zX3qLvhvyyJ4zsYj0XZ2gYhYq6MatiZ7x/DIlbXD4TLL5BYq2j
	GNDaqn9IMfI8E8cfH0bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rku5l-0000000FtwC-0Caw;
	Thu, 14 Mar 2024 23:02:29 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rku5g-0000000FtuZ-3njT;
	Thu, 14 Mar 2024 23:02:27 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-690b24973beso20699786d6.0;
        Thu, 14 Mar 2024 16:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710457341; x=1711062141; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2vTaB+3nXPkQbpP8KjsP8gIf1ZGCsjZmDvyUllaXpP8=;
        b=kKbMVq+L+RyIOtFHswYhB1TL4BeqGCHqKsdAXRckkMqhKa20Cl7F7+5tXl/8cBoQbm
         u8eHXBPkTDXGViRnmoOjUtxvAo52FAi5JcOwcgLBrT9/e7crtlme0PJya2EltX5xtZ8Z
         p+zBoRh8hTpYV6Pp4nLp2DIfbhfn+QFW3TUx6W1rdaMaBRvefPuSt+nRNQwEv8UL7F+w
         KW7E1eslTWzO9vNZB1p6wmMsw3nr40P6owfyZ6sycQYfKoXMt2X+e9Zzzr3L8RUgK69J
         zt8TpMQua/OfBBh05V8EjCYKZGNFDHd7oglh1MhMSJyCqj8bvn2ZekUOno3EhxMIJQ/P
         yg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710457341; x=1711062141;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2vTaB+3nXPkQbpP8KjsP8gIf1ZGCsjZmDvyUllaXpP8=;
        b=VApXhmVlBB5SI6dkKjZuLgXX3mUBHajKudVDEUnP2fY17dx+3Hi51pC+dnHON1kzZ1
         gmNgdIklLNa8dlXwfbI4P+n4coi8/sXVFKuLyRB7UIjMHl9Hf28rPY78gKyTdXj6uWK1
         d0DIKpQG+d810ULvWiWoQFH4FufdDFS4Rju2R1QSZAShmUgMLBTKXbqzMl4/hMc5btlx
         5PMRjgepl5v2sjbYPTZqdDGT9Ar7qA5fhl3BI8fUs8zu7pT0A9bogTHW6xDop5KeoI5f
         CjWshGT6L9Pq5JV1JTYZk/73wmbBJ3etxu7Zq0s3hbfY8BS41LMdVIBDcWjXYh0gU9Ip
         OUcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9324+e3Y/aolkR9LlDLev5PEaTZgz7W/72mwUZICuT2O7FANM4FO1f9cGRi1/sk/5vhudF7UhYebJPBwSu2N0onVXLKZ2+HwK2PEmo5UQYURErGHnPZe1HB26yek8x9pK8KnZ1nWfdW/t7quZUefpBipB
X-Gm-Message-State: AOJu0YzMRGmBrxE0EmMCyhkK8Oi0Ko2WtF/NtBx6WtkYS97rb7ONeAo8
	2+wzFbzYJqI0X1mYYX229qNJNCb7sUa6nU9d8g5PLfP1De7Z+0De
X-Google-Smtp-Source: AGHT+IH6Ayv2Q+7NsVrU8mVfqofnEIVHBT8AiarIiX0b2aAL3TdeYXbbOC0jmCpuURTOnqc4RT3LLA==
X-Received: by 2002:ad4:4b28:0:b0:690:e164:31e0 with SMTP id s8-20020ad44b28000000b00690e16431e0mr5281385qvw.25.1710457341368;
        Thu, 14 Mar 2024 16:02:21 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id jm14-20020ad45ece000000b00690c5cc0ff6sm1074393qvb.124.2024.03.14.16.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 16:02:19 -0700 (PDT)
Message-ID: <d3c66783-b71f-431f-9028-45897f12f2a0@gmail.com>
Date: Thu, 14 Mar 2024 16:02:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/13] mtd: rawnand: brcmnand: driver and doc updates
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: William Zhang <william.zhang@broadcom.com>,
 Linux MTD List <linux-mtd@lists.infradead.org>,
 Linux ARM List <linux-arm-kernel@lists.infradead.org>,
 Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
 kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 anand.gore@broadcom.com, dregan@mail.com, kamal.dasu@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com,
 Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 David Regan <dregan@broadcom.com>, devicetree@vger.kernel.org,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>
References: <20240223034758.13753-1-william.zhang@broadcom.com>
 <90ecf4d2-0eee-48e6-8222-7d3b5fd52b2f@broadcom.com>
 <20240229101101.5208195c@xps-13> <20240314230402.5fc7bbf3@xps-13>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240314230402.5fc7bbf3@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_160224_998939_F9E1385E 
X-CRM114-Status: GOOD (  33.57  )
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

On 3/14/24 15:04, Miquel Raynal wrote:
> Hi Florian,
> 
> miquel.raynal@bootlin.com wrote on Thu, 29 Feb 2024 10:11:01 +0100:
> 
>> Hi Florian,
>>
>> florian.fainelli@broadcom.com wrote on Mon, 26 Feb 2024 09:36:02 -0800:
>>
>>> On 2/22/24 19:47, William Zhang wrote:
>>>> This patch series is an update from the previous version [1] after
>>>> exex_op support and fixes (patch 1 to 4 from the previous version.)
>>>>
>>>> It updates all the BCMBCA SoC to support the nand controller and add
>>>> functions to handle BCMBCA specific needs on ECC and Write Protection
>>>> usage. The device tree document is also updated accordingly with the new
>>>> properties needed by the driver.
>>>>
>>>> In addition there is a bug fix for exec_op helper functions, log level
>>>> adjustment on uncorrectable ECC error and some coding style fixes.
>>>>
>>>> [1] https://lore.kernel.org/lkml/20230606231252.94838-1-william.zhang@broadcom.com/
>>>
>>> Miquel, thanks for having applied the patches, we should have discussed ahead of time whether you should take the SoC/board-level DTS changes through your tree or mine, but it's fine either way and should not lead to conflicts in Linus' tree.
>>
>> I'm sorry for not thinking about this ahead of time, I was also not
>> Cced on the other patches, I noticed it (told Willliam) and just forgot
>> about this when I applied the series.
>>
>> It is currently living in -next so if there is any problem I can still
>> act.
>>
>> However for this kind of change I usually apply the bindings and .c
>> changes independently from the DT patches. I believe there is no
>> problem having one or the other being merged first, or do I overlook
>> something?
> 
> What the heck /o\ I just understand now my mistake, I am very truly
> sorry for that...
> 
> You were telling me I should sync with you before taking DT changes,
> and I was so convinced I _did_not_ take the DT, when I looked at the
> branch I did not understand your point. But I am totally sorry I
> actually did take the DTs by mistake and I truly did not notice it.
> Confirmation bias I suppose. My very sincere apologies.
> 
> As mentioned previously, I was not CC'ed on the DT patches, but I
> believe the linux-mtd list was, so the patches didn't appear in my
> inbox, and once I was happy with the binding/driver changes I applied
> it all without noticing the DT changes had sneaked in.
> 
> I'm finally preparing the PR for Linus and I see it now...
> 
> I believe the SoC tree is closed now so it's up to you what I should do
> with them. Let me know if you want me to keep them in my tree and
> forward them to Linus or if I should drop them and you'll take them for
> the next cycle. Also, if I keep them, shall I add some tag of yours on
> these 3 patches? For the record I did not review them.

Yes please add my:

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>

tag, and it's fine I don't expect that we will get conflicts for those 
files.

> 
> Thanks and again, I'm confused. I never apply DT patches like that,
> your initial remark was more than legitimate.

Not a problem!
-- 
Florian


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
