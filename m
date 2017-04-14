Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cz98E-0004oD-Cn
 for linux-mtd@lists.infradead.org; Fri, 14 Apr 2017 21:51:55 +0000
Received: by mail-wm0-x22d.google.com with SMTP id o81so1803196wmb.1
 for <linux-mtd@lists.infradead.org>; Fri, 14 Apr 2017 14:51:33 -0700 (PDT)
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
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Joel Stanley <joel@jms.id.au>,
 Rob Herring <robh+dt@kernel.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <26f0d520-bfe3-cc26-d3d5-3185813b7ffb@gmail.com>
Date: Fri, 14 Apr 2017 23:51:19 +0200
MIME-Version: 1.0
In-Reply-To: <1492206032.25766.7.camel@kernel.crashing.org>
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

On 04/14/2017 11:40 PM, Benjamin Herrenschmidt wrote:
> On Fri, 2017-04-14 at 18:18 +0200, Marek Vasut wrote:
>>> Here is a proposal. We could activate this algo using a property such
>>> as :
>>>
>>>        "speed-mode" = "freq" or "auto-adjust"
>>>
>>> How's that ?
>>
>> Thinking about it a bit more, I think having a module parameter is the
>> right approach here ... or maybe compile-time switch. This shouldn't be
>> in DT as it's not HW property.
>
> Strong disagreement here :-)
>
> DT is not *strictly* HW properties. Never was despite what some
> fanatics around might say :-) Its also platform properties and can
> include policies.

/me grabs popcorn ... :-)

> We put things like UART speeds in there, MAC addresses, etc...

UART speeds or UART max/allowed speeds ? That's basically HW property
since flaky HW might not allow all sorts of UART speed options. MAC
address is a HW property.

> it makes
> sense to put calibration info and in this case, request to perform SW
> calibration.

That's a hard question and I don't have the right answer to this.

> Module parameters are crap. They are a major pain to use, they are in
> practice only good for tweaking/experimenting.

That's correct, but then turning the calibration off would probably be
only used in such experimental setups or during HW bringup (if at all).
Based on the discussion thus far, my impression is that the preferred
and mostly used default is calibration enabled.

> Ben.
>


-- 
Best regards,
Marek Vasut
