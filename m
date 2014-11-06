Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmI6R-0000tW-FD
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 08:07:41 +0000
Message-ID: <545B2C30.2010206@nod.at>
Date: Thu, 06 Nov 2014 09:07:12 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: The future of ubi_assert()
References: <545A9E6E.3000208@nod.at>
 <1415258504.958.151.camel@sauron.fi.intel.com>
In-Reply-To: <1415258504.958.151.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 06.11.2014 um 08:21 schrieb Artem Bityutskiy:
> On Wed, 2014-11-05 at 23:02 +0100, Richard Weinberger wrote:
>> Artem,
>>
>> I'm not happy with ubi_assert().
> 
> Good start of an e-mail, immediately sets the goal - make Richard
> happy :-)
> 
> 
>> Currently it only prints a warning and a stack trace but execution
>> continues.
> 
> Yeah, that was an idea initially, when this all was in process of
> creation, and we were testing it a lot, and had problems. We did wanted
> to see a warning, and then let things continue, and see what happens
> next. And we put really a lot of them, and often they were bogus, and
> sometimes it was good for production even, because a bogus assert did
> not stop the whole thing.
> 
>>  In production nobody will notice and while developing turning
>> it into a plain BUG_ON is most of the time more useful because execution stops
>> exactly where the boo boo happens one can analyze stack/registers.
> 
> Sure, for some of the critical ones it BUG_ON is a better answer.
> 
>> I propose splitting ubi_assert() into two new functions.
>>
>> 1. ubi_bug_on()
>> Basically a BUG_ON(), it shall be used for assertions where execution of
>> UBI cannot proceed and anything we can do is crashing the machine.
> 
> Just use plain BUG_ON() then.

Fine by me.

>> 2. ubi_warn_on()
>> This macro shall be used for assertions where further execution is possible
>> in read-only mode. ubi_warn_on() would be a WARN_ON() plus ubi_ro_mode().
> 
> OK, just use plain WARN_ON(). Many asserts can be just removed even, I
> think.

I think we can do better.
Think of wl.c, if an ubi_assert() in wl.c does not hold, we can put the UBI device
into read-only mode and continue execution.
BUG_ON() would be too much and WARN_ON() would lead to data corruption as the execution
would go on...
Something like ext4's errors=remount-ro. :)

>> I'm sure that the vast majority of all ubi_asserts() can be turned into a ubi_warn_on().
> 
> The reason we introduced macros, originally, was that we did not want
> all our asserts to be compiled in. Because we put them nearly
> everywhere. Wrapping allowed us to compile them off when debugging was
> disabled.

Makes sense.

> But nowadays many of them can be just killed, and we can use WARN_ON() /
> BUG_ON() without wrapping them.
> 

Please see my comment above on wl.c.

Thanks,
//richard
