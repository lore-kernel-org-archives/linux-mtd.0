Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FDm4s-0002yW-UT
	for linux-mtd@lists.infradead.org; Mon, 27 Feb 2006 12:22:34 -0500
Message-ID: <44033534.7040708@yandex.ru>
Date: Mon, 27 Feb 2006 20:21:56 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@gmail.com>
References: <43EB96DC.3030900@eptar.com> <43F74BF1.1080307@ru.mvista.com>	
	<1140337326.2480.674.camel@localhost.localdomain>	
	<200602210942.38302.manningc2@actrix.gen.nz>	
	<1140471467.2480.793.camel@localhost.localdomain>	
	<43FB00B4.9040706@yandex.ru>	
	<1140523614.2480.931.camel@localhost.localdomain>	
	<44004666.8030805@yandex.ru>	
	<625fc13d0602270527k39b18cabv5762c008bb1e2b73@mail.gmail.com>	
	<44032266.1040501@yandex.ru>
	<625fc13d0602270815l5c334b06u1a41a1ed7b7dc4ad@mail.gmail.com>
In-Reply-To: <625fc13d0602270815l5c334b06u1a41a1ed7b7dc4ad@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh, I believe you're only *partially* right

Please, switch to "architecture mode", leave this "low-level programmer" 
mode. Forget about few bytes of DRAM for now, please! :-)

The bellow are different points which should help me to change your mind.

1. The region is an attribute of *flash chip*. The region is *not* an 
attribute of MTD device. MTD device may describe the whole flash chip, 
it may describe a part of flash chip (partitions), and it may describe 
many flash chips (concatenation).

So, I state: the notion of region has nothing to do with the notion of 
MTD device.

If you have a specific application, which works with a *flash chip* not 
an *MTD device*, please, introduce another software object, sort of 
"struct flash_chip". Let your applications to work with these "struct 
flash_chip" objects.

Putting references to regions to the MTD device structure (struct 
mtd_info) is *bad*.

2. Well, you're in ecstasy of the current approach (kidding :-) ). Then 
explain me, why if, let's say JFFS3, opens an MTD device, it has access 
to some weird "regions"? What's on earth is going on? This is definitely 
error-prone. This is messy. This is bad design. JFFS3 does not want to 
see regions.

3. Regions... How do you look at them?

We could look at them like this:
a). They are different entities, used for completely different purposes, 
a rare program needs to use all of them simultaneously, they may have 
different eraseblock size and other properties, they are just different. 
Yes, it happened to be that they are on one single chip, but they are 
still different.

Or we could look at them narrower:
b). A region is a kind of "appendix" to the flash chip, where the 
bootcode or whatever may be put. There is not more then one (or really 
few) regions per flash chip. There is only one big and main "data" 
region, and one or few small auxiliary regions.

I reckon that the reality is more like b). And in this respect I see 
your point. Indeed, what for should we spend more DRAM to describe this 
unworthy "appendix" (aka region) by a distinct software object? Let's 
push this all together!

I can agree with you *partially*, providing that chips like a). are 
*not* going to appear. Partially means that I only agree that there *may 
be* no reason to create a distinct MTD device for this poor appendix.

So I state: Ok, in b)-like chips, do not create a distinct MTD device. 
Let's invent something different. But this must not be in struct 
mtd_info anyway.

Do you see my points?

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
