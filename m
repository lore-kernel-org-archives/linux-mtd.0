Received: from mo6-p05-ob.rzone.de ([2a01:238:20a:202:5305::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TioUB-0007ZQ-Gs
 for linux-mtd@lists.infradead.org; Wed, 12 Dec 2012 15:44:41 +0000
Message-ID: <50C8A652.9040301@denx.de>
Date: Wed, 12 Dec 2012 16:44:18 +0100
From: Stefan Roese <sr@denx.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: Support Persistent Protection Bits
 (PPB) locking
References: <1354864954-30290-1-git-send-email-sr@denx.de>
 <1355151644.2657.41.camel@sauron.fi.intel.com> <50C62CBA.5040401@denx.de>
 <1355325915.3400.8.camel@sauron.fi.intel.com>
In-Reply-To: <1355325915.3400.8.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Holger Brunck <holger.brunck@keymile.com>, devicetree-discuss@ozlabs.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/12/2012 04:25 PM, Artem Bityutskiy wrote:
> On Mon, 2012-12-10 at 19:40 +0100, Stefan Roese wrote:
>> On 12/10/2012 04:00 PM, Artem Bityutskiy wrote:
>>> On Fri, 2012-12-07 at 08:22 +0100, Stefan Roese wrote:
>>>> +       /*
>>>> +        * Wait for some time as unlocking of all sectors takes quite long
>>>> +        */
>>>> +       timeo = jiffies + (2 * HZ);     /* 2s max (un)locking */
>>>
>>> Please, use msecs_to_jiffies() instead.
>>
>> Sure, thats better.
> 
> Would you please do this instead?

Yes. I was just waiting for some further comments.

>> AFAIK, chip->mutex protects the access to the chip itself. So that
>> sequences are not interrupted.
>>
>> I have to admit that I haven't looked into get_chip() so far. It seems
>> to handle a state machine. Normally (idle state) it will just fall
>> through (FL_READY).
> 
> So it looks like the idea is that you first take the mutex, then call
> get_chip() which will wait for the chip becoming really ready, and then
> you can safely use it.

Thats it.

>>
>>> Why you need to drop the mutex here?
>>
>> Not sure, that might not be necessary. Copy and past from another loop
>> in the same file.
> 
> Probably from 'get_chip()' ?

Yes, most likely.

>>> Why is it not an ABBA deadlock to do this:
>>>
>>> Task 1: In the loop above, has chip locked, doing
>>>         mutex_lock(&chip->mutex);
>>>
>>> Task 2: done mutex_lock(&chip->mutex), now doing
>>>         ret = get_chip(map, chip, adr + chip->start, FL_LOCKING);
>>
>> I don't see two different locks/mutexes (only A) here. As get_chip()
>> does no request any real mutex. Please correct me if I'm wrong.
> 
> Right, there is indeed no deadlock.
> 
>> In many other places UDELAY() is called:
>>
>> #define UDELAY(map, chip, adr, usec)  \
>> do {  \
>> 	mutex_unlock(&chip->mutex);  \
>> 	cfi_udelay(usec);  \
>> 	mutex_lock(&chip->mutex);  \
>> } while (0)
> 
> Why not to use this as well then for consistency?

Okay, will do.

I'll send a new patch version today.

Thanks for the review,
Stefan
