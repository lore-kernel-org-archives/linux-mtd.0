Message-ID: <4E11B9F7.5080606@atmel.com>
Date: Mon, 04 Jul 2011 15:02:47 +0200
From: Nicolas Ferre <nicolas.ferre@atmel.com>
MIME-Version: 1.0
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RFC PATCH] MTD: atmel_nand: optimize read/write buffer	functions
References: <1309261856-27402-1-git-send-email-nicolas.ferre@atmel.com>
	<20110628111043.GH6588@pengutronix.de>
	<20110628145937.GG21898@n2100.arm.linux.org.uk>
	<4E0B2427.9020202@atmel.com>
	<20110629133124.GO21898@n2100.arm.linux.org.uk>
In-Reply-To: <20110629133124.GO21898@n2100.arm.linux.org.uk>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: hong.xu@atmel.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	=?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 29/06/2011 15:31, Russell King - ARM Linux :
> On Wed, Jun 29, 2011 at 03:09:59PM +0200, Nicolas Ferre wrote:
>> Le 28/06/2011 16:59, Russell King - ARM Linux :
>>> I think you need to read Documentation/bus-virt-phys-mapping.txt,
>>> particularly the part after "NOTE NOTE NOTE".
>>>
>>> Dereferencing ioremap'd memory is not permitted.  That includes passing
>>> it to memcpy.  Even with a cast.
>>
>> So that means that I should use memcpy_fromio() even if the code if far
>> less optimized.
>>
>> Shouldn't I re-implement some kind of IO copying function to deal with
>> this IO memory so that I could take advantage of 8 words bursts?
> 
> You could improve the IO memcpy/set etc implementations, which are
> currently mostly unloved - I think that's a catch-22 which really needs
> solving.  They're not efficient because no one has taken the time to use
> them, and everyone's avoiding them because they're not very efficient.
> So, as no one's using them no one's motivated to improve them.

Ok, so I use them in my following patch.

And as a long-term exercise, I will try to have a look at those IO
memcpy/set functions for ARM...

Thanks for you advices, best regards,
-- 
Nicolas Ferre
