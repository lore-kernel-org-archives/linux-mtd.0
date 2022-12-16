Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9F0C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Dec 2022 00:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hPfYyR6GkY3/vwzoVAu0LNxn+CC4z7H6XNX/fqZZyXA=; b=dP+njh5HF/NLZl
	LhSVQueRa8vKd84j/1dgCp0oOW5G84bkzJeeXWcQ9HJjlwxh0GHc+waqVsxLxeHm7ZTGhvw7Ydi5g
	yWiKSrYjdSeCamsudexnJT8s8KvdUBOYvBxPdGGW+5eXTB7EueBQjwbMDcZ92u9ELF6vq30VBbMbC
	KxmiDunQ8EJ65eIN3pHnIqUakfQoTQaY5uOa8BuojYd6QqUcAiUYHtGYIh440XIPbUBlvvzQwGqlb
	Y9ehWPjUlcYOfFYiD4b4hXw65Lco34Eu/iOikfIEzhwqiNB6G0GgEFu01VC/5pQX/Qug1bv353Qi8
	HNoDdPG7aLLJCSfAahIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5yi3-00C3nU-7G; Fri, 16 Dec 2022 00:36:19 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5yhq-00C3ka-53; Fri, 16 Dec 2022 00:36:08 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id D1CA885353;
	Fri, 16 Dec 2022 01:36:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1671150964;
	bh=T+mP39cIMEHonu9/Zp55tlLxMp85cHAptl0xyYvMQsM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AUDRlfoMeRq2pJ9H7ddvAVT3EcXuJJ5kdj5V4dRKnxh8iAwuvHg18ImxaWlOjgoSw
	 MDf7E0qfLcX5ru3Sq7KknXCm6WWlkCqD9Wh0qNvEODNfWICtPS8mQxhuqy1GwKshtk
	 ssAlrIb2uA9Dwlls8bZVFhvebI8FCnU+BVIKXFu8Uo2B0a5Blm0Zm899HdfNFyIMsW
	 L170opc6OPwjeYScXDDOLPrf+b+VP4OEWr5JtvdxnjFzdoB9gOg2n24QbeBYcvP2a7
	 CvMXYoGlcST04PIMR3qf4ma9tMDsst/Wg3c4h4/umc4g/w2so1Ppk71wp9PfQdUXMh
	 qDmc35GRNKPRg==
Message-ID: <a54bf573-c14a-a546-10fc-e50274986ff5@denx.de>
Date: Fri, 16 Dec 2022 01:36:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is 0
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, u-boot@lists.denx.de
References: <20221202150556.14c5ae43@xps-13>
 <2b6fc52d-60b9-d0f4-ab91-4cf7a8095999@denx.de>
 <20221202160030.1b8d0b8a@xps-13>
 <223b7a4e-3aff-8070-7387-c77d2ded1dd6@denx.de>
 <20221202164904.08d750df@xps-13>
 <0503c46d-c385-74f5-f762-51d87a5ebaff@denx.de>
 <20221202174255.2c1cb2ff@xps-13>
 <e80377c9-1542-d47d-6d35-2efdc15bcbf8@denx.de>
 <20221202175730.231d75d5@xps-13>
 <7afd364c-33b8-38a9-65a6-015b4360db6b@denx.de>
 <Y43VdPftDbq6cD2L@francesco-nb.int.toradex.com>
 <20221205144917.6514168a@xps-13>
 <ecca019d-b0b7-630c-4221-2684cb51634c@denx.de>
 <20221215081604.5385fa56@xps-13>
 <ac50a1ee-4312-48f6-af78-7b95a77e6fda@denx.de>
 <20221215090446.28363133@xps-13>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221215090446.28363133@xps-13>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_163606_538612_5CF9A189 
X-CRM114-Status: GOOD (  37.28  )
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

On 12/15/22 09:04, Miquel Raynal wrote:
> Hi Marek,

Hi,

[...]

>>> Yesterday while talking about an ACPI mis-description which needed
>>> fixing, I realized fixing up what the firmware provides to Linux should
>>> preferably be handled as early as possible. So my first first idea was
>>> to avoid using the broken "fixup mtdparts" function in U-Boot and I am
>>> still convinced this is what we should do in priority. However, as
>>> rightly pointed in this thread, we need to take care about the case
>>> where someone would use a newer DT (let's say, with the reverted changed
>>> reverted again) with an old U-Boot. I am still against piggy hacks in
>>> the generic ofpart.c driver, but what we could do however is a DT
>>> fixup in the init_machine (or the dt_fixup) hook for imx7 Colibri, very
>>> much like this:
>>> https://elixir.bootlin.com/linux/latest/source/arch/arm/mach-mvebu/board-v7.c#L111
>>> Plus a warning there saying "your dt is broken, update your firmware".
>>
>> This does not work, because the old U-Boot fixup_mtdparts() may be applied on any machine,
> 
> No: https://elixir.bootlin.com/u-boot/latest/A/ident/fdt_fixup_mtdparts

These are the boards from vendors who upstreamed their properly.

This does NOT take into account either boards which are using downstream 
U-Boot, or older U-Boot e.g. because they can not easily update.

> And we should make our best so its use does not proliferate.

I am not disputing that, but that's a separate U-Boot side fix which I 
hope Francesco would submit soon, AND, more importantly, the code is 
already in at least two U-Boot releases, so it's done, it's not going 
away any time soon.

> It's not like there is half a dozen of good ways to describe and forward
> partitions today.

That's really not what I am disputing here, the approach to describing 
partitions is crystal clear as far as I can tell.

>> it is not colibri mx7 specific. Also, new arch-side workaround are
>> really not welcome by the architecture maintainers as far as I can
>> tell.
> 
> So what? Let's propose the change and see what the maintainers have to
> say. I am open to discussion.

Why is there such strong opposition toward generic fix in the OF 
partition parser ?

> As I said, it is not colibri mx7 specific, there are a few boards which
> might be affected,

... that you know about ...

> they are all clearly identifiable with a compatible.
> It's not the entire planet either.

Neither of us can make this statement with certainty, because neither of 
us knows what hardware is running the affected version of U-Boot.

>>> So next time someone stumbles upon this issue, we can tell them "fix
>>> your bootloader", and apply the same hack in their board family (there
>>> are three or four IIRC which might be concerned some day).
>>
>> There are also those machines we do not even know about which might be generating bogus DT using old U-Boot and fixup_mtdparts(), so, unless there is some all-arch fixup implementation, we wouldn't be able to fix them all on arch side. I think the all-arch fixup implementation would be the driver one, i.e. this patch as it is (or maybe with some improvement).
> 
> If we don't know about them, as you say, I don't feel concerned.
> 
> If something is buggy, people will report it, we will point them in the
> right direction so they can fix their firmware and propose a similar
> fix in their case which will involve adding a new machine compatible to
> the list of boards that should tweak the #size-cell property.

Why is a potentially lengthy list of compatible strings in arch code, 
which every single user has to find _after_ their system completely 
fails to boot and forces them to perform potentially difficult recovery, 
potentially after an update to new linux-stable release no less -- over 
-- 4 liner generic fix in OF partition parser, which covers all the 
systems, does not cause systems to fail to boot completely, does not 
force users to suffer through recovery, does not require a list of 
compatibles in arch code, and rather only gracefully prints a warning ?

I very much prefer the second solution over the first.

And one more thing, the list of compatibles in arch code does not really 
work anyway, since once user updates their bootloader, the compatible 
won't change and the arch-side workaround would still be applied, which 
is not desired at that point anymore.

>>> That would fix all cases and only have an impact on the affected boards.
>>
>> Sadly, it does only fix the known cases, not the unknown cases like downstream forks which never get any bootloader updates ever, and which you can't find in upstream U-Boot, and which you therefore cannot easily catch in the arch side fixup.
> 
> And ?

I was under the impression Linux was supposed to deliver the best 
possible experience to its users even on not-perfect hardware, and if 
there are any quirks, the kernel should try to fix them up or work 
around them as best as it can, not dismiss them as broken hardware and 
fail to boot outright.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
