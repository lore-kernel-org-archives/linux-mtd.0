Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctu58-00067z-Jn
 for linux-mtd@lists.infradead.org; Fri, 31 Mar 2017 10:47:04 +0000
Received: by mail-lf0-x242.google.com with SMTP id n78so6963732lfi.3
 for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2017 03:46:41 -0700 (PDT)
Subject: Re: [PATCH V2 1/2] mtd: move code reading DT specified part probes to
 the core
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <20170330215332.32699-1-zajec5@gmail.com>
 <20170331093013.29123-1-zajec5@gmail.com>
 <20170331115654.41592eba@bbrezillon>
 <40a0f980-c849-30de-c906-a708e4d90be5@gmail.com>
 <20170331123153.038e3ada@bbrezillon>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Frank Rowand <frowand.list@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <99d4944c-3eb9-5bbd-efd0-2ac6862ab1fb@gmail.com>
Date: Fri, 31 Mar 2017 12:46:38 +0200
MIME-Version: 1.0
In-Reply-To: <20170331123153.038e3ada@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/31/2017 12:31 PM, Boris Brezillon wrote:
> On Fri, 31 Mar 2017 12:12:56 +0200
> Rafał Miłecki <zajec5@gmail.com> wrote:
>
>> On 03/31/2017 11:56 AM, Boris Brezillon wrote:
>>> On Fri, 31 Mar 2017 11:30:12 +0200
>>> Rafał Miłecki <zajec5@gmail.com> wrote:
>>>
>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>
>>>> Handling (creating) partitions for flash devices requires using a proper
>>>> driver that will read partition table (out of somewhere). We can't
>>>> simply try all existing drivers one by one, so MTD subsystem allows
>>>> drivers to specify a list of applicable part probes.
>>>>
>>>> So far physmap_of was the only driver with support for linux,part-probe
>>>> DT property. Other ones had list or probes hardcoded which wasn't making
>>>> them really flexible. It prevented using common flash drivers on
>>>> platforms that required some specific partition table access.
>>>>
>>>> This commit moves support for mentioned DT property to the MTD core
>>>> file. Thanks to calling it on device parse registration (as suggested by
>>>> Boris) all drivers gain support for it for free.
>>>>
>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>> ---
>>>>  drivers/mtd/maps/physmap_of.c | 36 +-----------------------------------
>>>>  drivers/mtd/mtdcore.c         | 34 ++++++++++++++++++++++++++++++++++
>>>
>>> Maybe you should split the patch:
>>> 1/ add core infrastructure
>>> 2/ remove open-coded version in drivers/mtd/maps/physmap_of.c
>>
>> What's the gain of that? Is this patch too complex to review properly? Will that
>> be useful for anyone to have it split? For me it only adds an intermediate code
>> duplication.
>
> The gain is that we get rid of the dependency we have on patch "mtd:
> physmap_of: use OF helpers for reading strings" which is not even
> mentioned in your mails.

This is definitely my mistake, initially I pushed a proper comment below tear
line but have overwritten it later. Sorry!


>>> BTW, not sure the intermediate "mtd: physmap_of: use OF helpers
>>> for reading strings" patch is really useful, since you move to the
>>> common infrastructure here.
>>> By following my suggestion you get rid of the dependency you have
>>> between this series and patch "mtd: physmap_of: use OF helpers for
>>> reading strings".
>>
>> I learned (the very hard way) MTD people can be really nitpicking so I'm
>> sending as simple patches as I can. I see it as the only way for someone from
>> OpenWrt/LEDE project to get patch through your review.
>
> And I learned the hard way that OpenWRT/LEDE developers tend to not
> listen to our advices and keep arguing on things that have been proven
> to be existing because of bad decision they made at some point in the
> project life. So I think we're even :-P.

I wish you could sometimes forget what you've learned and review/discuss things
without all that negative approach I keep seeing.


>> It's like with this patch: even a simple code move can be questioned. Please
>> drop this patchset, I'll resend it after/if I manage to get
>> [PATCH] mtd: physmap_of: use OF helpers for reading strings
>> accepted.
>
> But really, what's the point of this patch? It's just a cleanup. You're
> not fixing a bug or changing the behavior, and your real objective is
> to get support for the linux,part-probe in the core, which will then
> allow us to drop the open-coded version you have in physmap_of.c.
>
> I don't think it deserves an intermediate patch, unless your real
> objective is patchcount.

OK, I'm going to trust that and see how easily I get can patch your way. I'll
resend combined version soon.
