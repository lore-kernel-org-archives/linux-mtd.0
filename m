Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cz9fR-0001B2-HX
 for linux-mtd@lists.infradead.org; Fri, 14 Apr 2017 22:26:15 +0000
Received: by mail-wm0-x243.google.com with SMTP id d79so538553wmi.2
 for <linux-mtd@lists.infradead.org>; Fri, 14 Apr 2017 15:25:52 -0700 (PDT)
Subject: Re: [PATCH 10/10] mtd: spi-nor: aspeed: optimize read mode
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linux-mtd@lists.infradead.org
References: <1491497808-25487-1-git-send-email-clg@kaod.org>
 <1491497808-25487-11-git-send-email-clg@kaod.org>
 <7d80fbb3-81d9-3ac0-6bb9-47d2d4cf0855@gmail.com>
 <e27b9f19-947f-ab72-056d-d71812e69356@kaod.org>
 <6f7f424c-2a3f-4b6d-f7aa-bfae749de0b3@gmail.com>
 <1492206032.25766.7.camel@kernel.crashing.org>
 <26f0d520-bfe3-cc26-d3d5-3185813b7ffb@gmail.com>
 <1492207894.25766.20.camel@kernel.crashing.org>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Joel Stanley <joel@jms.id.au>,
 Rob Herring <robh+dt@kernel.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <c5d30733-20c8-275a-03b1-9b446b5bcc71@gmail.com>
Date: Sat, 15 Apr 2017 00:25:49 +0200
MIME-Version: 1.0
In-Reply-To: <1492207894.25766.20.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/15/2017 12:11 AM, Benjamin Herrenschmidt wrote:
> On Fri, 2017-04-14 at 23:51 +0200, Marek Vasut wrote:
>> On 04/14/2017 11:40 PM, Benjamin Herrenschmidt wrote:
>>>
>>> Strong disagreement here :-)
>>>
>>> DT is not *strictly* HW properties. Never was despite what some
>>> fanatics around might say :-) Its also platform properties and can
>>> include policies.
>>
>> /me grabs popcorn ... :-)
> 
> Be my guest ! I only invented the bloody thing in the first place after
> all ;-) (Well, the FDT format rather, and its use in Linux, the DT
> itself dates back from Open Firmware).

:-)

>>> We put things like UART speeds in there, MAC addresses, etc...
>>
>> UART speeds or UART max/allowed speeds ? That's basically HW property
>> since flaky HW might not allow all sorts of UART speed options. MAC
>> address is a HW property.
> 
> Both. The point is that there is no hard lines. Every time people come
> up with hard lines, we end up with inflexible horror shows that fail to
> solve practical issues on the field.

True

> There is no good reason to forbid passing such a simple policy argument
> that way. None. Other than ideological that is.
>
>>> it makes
>>> sense to put calibration info and in this case, request to perform
>>> SW
>>> calibration.
>>
>> That's a hard question and I don't have the right answer to this.
> 
> I do, and it's fine :-)
> 
>>> Module parameters are crap. They are a major pain to use, they are
>>> in
>>> practice only good for tweaking/experimenting.
>>
>> That's correct, but then turning the calibration off would probably
>> be only used in such experimental setups or during HW bringup (if at
>> all).
>> Based on the discussion thus far, my impression is that thepreferred
>> and mostly used default is calibration enabled.
> 
> Probably yes. So we could reverse the problem and say that we have
> the calibration enabled by default, and an optional device-tree
> property to force a fixed speed.

That sounds like a good option, yes. And if it's just forcing fixed
speed, that's awesome, but I think there are more values that might need
to be passed ... I think that's what Cedric can answer.

> That becomes akin to what we do with Ethernet PHYs for example :)

Even better, I recall seeing some speed DT props in the SPI binding
docs, so we already have those in place.

> Cheers,
> Ben.
> 
>>
>>


-- 
Best regards,
Marek Vasut
