Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCs3H-000602-JW
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2014 14:41:40 +0000
Message-ID: <52F8E508.1020207@nod.at>
Date: Mon, 10 Feb 2014 15:41:12 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
References: <52F6BA07.60707@nod.at> <20140208231501.GG22376@1wt.eu>
 <52F6BCCD.5070302@nod.at> <20140208233758.GH22376@1wt.eu>
 <52F6C916.2030506@nod.at> <20140209075157.GJ22376@1wt.eu>
 <20140210024827.GB9643@localhost>
 <1392017750.31031.8.camel@sauron.fi.intel.com>
 <20140210082714.GB10872@localhost> <20140210084616.GP22376@1wt.eu>
 <20140210142026.GB15607@localhost>
In-Reply-To: <20140210142026.GB15607@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 10.02.2014 15:20, schrieb Ezequiel Garcia:
> On Mon, Feb 10, 2014 at 09:46:16AM +0100, Willy Tarreau wrote:
>>>>
>>>> If write support has 0 or 1.5 customers and it was not tested
>>>> extensively, and never used in any kind of production, I am not sure it
>>>> is needed to be there. But let's first hear your answers.
>>>>
>>>
>>> No, this hasn't been tested intensively and I'm pretty sure nobody would
>>> ever put it in production before conducting such tests himself.
>>
>> For sure, but conversely, disabling it in the code would result in
>> nobody ever testing it !
>>
> 
> I agree completely and it's why I wanted to have it available.
> 
>>>
>>> If you really think distros will enable it and users will "just it", without
>>> thinking about the consequences, then I'd say let's just remove it.
>>
>> In my opinion, this would result in users falling back to mtdblock as
>> they currently to when they want a block device. This is even worse.
>>
>> I'd really like to have this feature as a standard one, it shortens
>> the gap which exists between MTD and eMMC which is becoming more and
>> more common these days, precisely because of the difficulty to deal
>> with NAND directly while eMMC provides the abstraction which offers
>> more flexibility.
>>
> 
> Artem, I'd say it's your call. Want me to drop write support or not?
> 
> Unfortunately, I don't have enough time to conduct extensive testings on
> that, but just simple read/write test on some filesystem as Willy did on
> ext2

Please, at lest run xfstests. :)

> Quite frankly, I want to see this merged as soon as possible, so if we
> are still having second thoughts, I'll submit a read-only version and
> we'll see about adding write support later.
> 

If you have addressed the issues I pointed out feel free to add
Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
