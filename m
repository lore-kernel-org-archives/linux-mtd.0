Received: from baythorne.infradead.org ([2001:8b0:10b:1::1])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LuWTx-00010r-LT
	for linux-mtd@lists.infradead.org; Thu, 16 Apr 2009 18:38:41 +0000
Date: Thu, 16 Apr 2009 19:38:26 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH 1/3 v3] mtd: physmap_of: Add multiple regions and
	concatenation support
In-Reply-To: <1239889899.3390.216.camel@localhost.localdomain>
Message-ID: <alpine.LFD.2.00.0904161936090.12608@baythorne.infradead.org>
References: <1239883845-17804-1-git-send-email-sr@denx.de>
	<fa686aa40904160626k118cea3cvc0db38a2277e45b8@mail.gmail.com>
	<200904161537.59048.sr@denx.de>
	<fa686aa40904160646v75a98e02s446fd89c08cfebae@mail.gmail.com>
	<1239889899.3390.216.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: Grant Likely <grant.likely@secretlab.ca>, linuxppc-dev@ozlabs.org,
	Stefan Roese <sr@denx.de>, linux-mtd@lists.infradead.org,
	devicetree-discuss@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 16 Apr 2009, Artem Bityutskiy wrote:

> On Thu, 2009-04-16 at 07:46 -0600, Grant Likely wrote:
>> On Thu, Apr 16, 2009 at 7:37 AM, Stefan Roese <sr@denx.de> wrote:
>>> On Thursday 16 April 2009, Grant Likely wrote:
>>>>> Signed-off-by: Stefan Roese <sr@denx.de>
>>>>> Reviewd-by: Grant Likely <grant.likely@secretlab.ca>
>>>>
>>>> Yup, still looks good to me.  What boards has this been tested on?
>>>
>>> I tested this version on PPC405EX Kilauea equipped only one "standard"
>>> Spansion S29GL512 NOR chip. And a slightly modified version on an MPC8360
>>> board (kmeter1) which is equipped with the Intel P30 part mentioned in the
>>> bindings description. Slightly modified since this board support is not yet
>>> pushed upstream and currently using v2.6.28 (physmap_of.c has received minor
>>> modifications after 2.6.28 release).
>>
>> Okay.  It will be good to get this one into -next for some testing
>> exposure.  Unless he asks me to do otherwise, I'll leave this one to
>> David to pick up.
>
> David usually picks up stuff just before or during merge window,
> so if you want linux-next exposure, you need to have some extra
> care.

I don't necessarily do that on purpose; it just works out that way when 
I'm busy.

-- 
dwmw2
