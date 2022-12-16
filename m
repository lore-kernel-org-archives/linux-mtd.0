Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A96C4167B
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Dec 2022 10:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZqXGJmxIEr9o3e/da4qxxmRixDSqVFXXpZa8pR27oU=; b=SUhT5mTyPU3c91
	L5M4VECCjzOLL22mA7dPXlQWNbXdUe3/ZQ6OyLQpOGFZeI+q1cO0xxmiVGE/pzXQOTm0Vit3i5qpU
	muJVIcXR9fFJ/eKfxB9uZb7XxTz42aIWmVVj/y6STDTJGVunGZ0vpi3hkrwAYHwVGS5prgYjBxrIx
	KyCG3eZRdMIl0uYySFw/pNjIith1yzDgLVhIX8P0SUroro+sjxb0pFYAyILFWKJBIOki0A7zhXNuw
	vzBsdLuhEPLcpocsZCYPrzY4SMFWPcg6o/5OgNm9LurqCQ8DAZhqEHoawM31Kic84Wy6ONmSPOa8q
	I3tDisaPQCRMVWbQ/01g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68Ep-00EC7i-Gx; Fri, 16 Dec 2022 10:46:47 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68EV-00EByS-Tn; Fri, 16 Dec 2022 10:46:30 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5A3C48520E;
	Fri, 16 Dec 2022 11:46:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1671187580;
	bh=PIqUEziaW7aCKgN+qBabJu/0k2cDZ3tExytmC9OPj2A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KOh4hmtiuQW7opZtbe3v6jE9Vydd9/5Abxh7LW6ZxAg4CA4D05VtO+sLpNGZNcO8m
	 bpRU8RIxmH67jls3FC7k7RicKM8xBxCMaFeXhYtPCU7cmFBrHjTM6HftzpfUB7E268
	 mSFZ8MmZ0iBU4VNXhNP9CZnNxahpwYeiQ/q6Rc87JJIDeqGNcgrZ0fpKpdnx17xYQJ
	 DeJiwDKc07jIoTdMQ8YR1VZ/iWgPNx+FNkZf038dtRAmQqmmSAE1kEMZdmeiprItGC
	 SiPA4lSexHMe4YD6wmOoGwfxDve5Q0Ig0txUiaecALA7CpluyiVG3Ut8YCjZfRVwYX
	 r5eDIkksdv8lw==
Message-ID: <6f5f5b32-d7fe-13cc-b52d-83a27bd9f53e@denx.de>
Date: Fri, 16 Dec 2022 11:46:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is 0
To: Francesco Dolcini <francesco@dolcini.it>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, u-boot@lists.denx.de
References: <Y5wiAPvPU+YY39oX@francesco-nb.int.toradex.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Y5wiAPvPU+YY39oX@francesco-nb.int.toradex.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_024628_298587_31EBBB90 
X-CRM114-Status: GOOD (  39.29  )
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

On 12/16/22 08:45, Francesco Dolcini wrote:
> Hello Marek and Miquel,

Hi,

> On Thu, Dec 15, 2022 at 08:16:04AM +0100, Miquel Raynal wrote:
>> So my first first idea was to avoid using the broken "fixup mtdparts"
>> function in U-Boot and I am still convinced this is what we should do
>> in priority.
> 
> This is something that was already discussed, but I was not really
> thinking much on it till now. Do you think that the whole idea of
> editing the MTD partitions from the firmware is wrong and we should just
> pass the partition on the command line OR that the current
> implementation is broken and can/should be fixed?

No, patching the partition layout into DT is fine. Firmwares of all 
kinds have been patching various parts of the DT before passing it to OS 
since forever, or more recently, merging multiple DT fragments and 
passing the composite DT to Linux.

As far as I recall, OF predates Linux and the OF tree has been usually 
assembled by the Forth firmware of that era from various chunks stored 
in different parts of the system. So this patching is fundamental part 
of the design since the beginning.

It is difficult to describe complex structure like the partition mapping 
on kernel command line, it should really be in DT or other such 
structure, so patching it into the DT is fine. The only detail here is, 
it should be patched into the DT correctly ... and ... if old firmwares 
do not do that, Linux should fix it up. You don't throw away your old PC 
just because it doesn't have perfect ACPI tables one would expect today, 
I don't see why we should do that with DT machines.

>> I am still against piggy hacks in the generic ofpart.c driver, but
>> what we could do however is a DT fixup in the init_machine (or the
>> dt_fixup) hook for imx7 Colibri, very much like this:
>> https://elixir.bootlin.com/linux/latest/source/arch/arm/mach-mvebu/board-v7.c#L111
>> Plus a warning there saying "your dt is broken, update your firmware".
> 
> I have a couple of concerns/question with this approach:
>   - do we have a single point to handle this? Different architectures are
>     affected by these issue. Duplicating the fixup code in multiple place
>     does not seems a great idea
>   - If we believe that the device tree is wrong, in the i.MX7 case
>     because of #size-cells should be set to 0 and not 1, we should not
>     alter the FDT. Other part of the code could rely on this being
>     correctly set to 0 moving forward.
> 
> If I understood you are proposing to have a fixup at the machine level
> that is converting a valid nand-controller node definition to a "broken"
> one. Unless I misunderstood you and you are thinking about rewriting the
> whole MTD partition from a broken definition to a proper one.
> 
> On Thu, Dec 15, 2022 at 09:04:46AM +0100, Miquel Raynal wrote:
>> marex@denx.de wrote on Thu, 15 Dec 2022 08:45:33 +0100:
>>> Sadly, it does only fix the known cases, not the unknown cases like
>>> downstream forks which never get any bootloader updates ever, and
>>> which you can't find in upstream U-Boot, and which you therefore
>>> cannot easily catch in the arch side fixup.
>>
>> And ?
> 
> I'm not personally and directly concerned, since the machine I care are
> all available upstream and known, however this is a general problem with
> U-Boot code being at the same time widely used on a range of embedded
> products and producing a broken MTD partition list.
> 
> I think we will just silently break boards and just creating a lot of
> issues to people. We would just introduce regression to the users, being
> aware of it and deliberately decide to not care and move the problem to
> someone else. I do not think this is a good way to go.

I agree.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
