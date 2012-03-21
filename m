Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SAS19-00043c-Bz
 for linux-mtd@lists.infradead.org; Wed, 21 Mar 2012 20:20:24 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dedekind1@gmail.com
Subject: Re: [PATCH] mtd: add documentation about locking context of MTD API
References: <1332195985-21043-1-git-send-email-robert.jarzmik@free.fr>
 <4F67B3B8.7090909@nod.at> <87r4wo8arp.fsf@free.fr>
 <1332243871.11468.23.camel@sauron.fi.intel.com>
Date: Wed, 21 Mar 2012 21:20:10 +0100
In-Reply-To: <1332243871.11468.23.camel@sauron.fi.intel.com> (Artem
 Bityutskiy's message of "Tue, 20 Mar 2012 13:44:31 +0200")
Message-ID: <87mx79905h.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> writes:

> On Mon, 2012-03-19 at 23:51 +0100, Robert Jarzmik wrote:
>> Richard Weinberger <richard@nod.at> writes:
>> 
>> > Am 19.03.2012 23:26, schrieb Robert Jarzmik:
>> >> Add a comment to mtd header for MTD drivers writters, so that they
>> >> know that each function in the MTD API, ie. in the mtd_info
>> >> structure, is called in a sleeping context.
>> >> 
>> >
>> > Why do we need this comment?
>> Because I was asked to, in [1].
>
> Well, Richard has a point :-)
Ok ... but I don't get it. I think it's because my previous statement "As a
driver writer, I'm always interested to know whether I can msleep() or not." is
not good enough ... Neither is my USB example (I was thinking of commit id
5e23e90f33888769ffe253663cc5f3ea0bb6da49 btw).

> But I guess you can simply write "may sleep" instead of "sleeping context". Or
> may be even use "may_sleep()" in the wrappers?
may_sleep() doesn't exist AFAIK. might_sleep() does exist, but it's already
mentioned in my patch, and because you're talking about may_sleep() while I used
might_sleep(), I'm confused.

Do you want me to take my patch and do a simple 's/in a sleeping context/and may
sleep/g', or is it more complicated ?

-- 
Robert
