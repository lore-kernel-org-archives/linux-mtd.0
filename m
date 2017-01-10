Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cQwss-0001gM-BW
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2017 13:54:44 +0000
Subject: Re: [PATCH v2 2/2] UBI: Make mtd parameter readable
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20170110125643.10990-1-andriy.shevchenko@linux.intel.com>
 <20170110125643.10990-2-andriy.shevchenko@linux.intel.com>
 <CAFLxGvyTKH-7X0byYOYardGZXGQZtpHTr=aRhqD6WunDqXbneg@mail.gmail.com>
 <1484056111.2133.16.camel@linux.intel.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <71c71f00-dcb1-081b-ec55-bc7c39ad32d5@nod.at>
Date: Tue, 10 Jan 2017 14:54:16 +0100
MIME-Version: 1.0
In-Reply-To: <1484056111.2133.16.camel@linux.intel.com>
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

Am 10.01.2017 um 14:48 schrieb Andy Shevchenko:
>>> -module_param_call(mtd, ubi_mtd_param_parse, NULL, NULL, 000);
>>> +module_param_call(mtd, ubi_mtd_param_parse, NULL, NULL, 0400);
> 
>> What is the use case?
>> AFAIKT the permissions are 000
> 
> If it's not 0 in current case than you easily crash the kernel because
> parser will be gone at that time. This is fixed by patch 1.

Before your changes it was non-issue, right? ;)

> 
>>  because a parser is involved and to
>> "understand" the parameter,
>> a reader needs the ubi_mtd_param_parse() function.
> 
> Are you implying that writer is a bot and reader is human being? 
> The use case is obvious (any security reasons are implied?) -- allow
> user to see what was written there in the first place.

I'm asking for the use case, why is exposing this parameter to user space
a good thing? Who will use it?

> Permissions 0000 are error prone.

Why?

Thanks,
//richard
