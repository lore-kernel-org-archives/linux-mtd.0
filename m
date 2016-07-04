Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bKCIZ-0003KU-6v
 for linux-mtd@lists.infradead.org; Mon, 04 Jul 2016 22:25:04 +0000
Subject: Re: [PATCH v2] UBI: only read necessary size when reading the VID
 header
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
References: <1467114667-30548-1-git-send-email-s.hauer@pengutronix.de>
 <1467118829.2456.40.camel@gmail.com> <20160628174304.GA80724@google.com>
 <1467172188.2456.64.camel@gmail.com> <20160704113835.7853d77d@bbrezillon>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <577AE227.6070504@nod.at>
Date: Tue, 5 Jul 2016 00:24:39 +0200
MIME-Version: 1.0
In-Reply-To: <20160704113835.7853d77d@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 04.07.2016 um 11:38 schrieb Boris Brezillon:
> On Wed, 29 Jun 2016 06:49:48 +0300
> Artem Bityutskiy <dedekind1@gmail.com> wrote:
> 
>> On Tue, 2016-06-28 at 10:43 -0700, Brian Norris wrote:
>>> Hi Artem,
>>>
>>> I'll comment on the other branches of this thread, but one thing
>>> here:
>>>
>>> On Tue, Jun 28, 2016 at 04:00:29PM +0300, Artem Bityutskiy wrote:  
>>>> Therefore, unless I misunderstood this patch - it introduces a
>>>> regression to those old setups at least (forces MTD to use an
>>>> intermediate buffer rather than copy data from NAND directly to the
>>>> buffer supplied by UBI)  
>>>
>>> It's really a balance between speed of the flash and speed of the
>>> memcpy().  
>>
>> Sure.
>>
>>>  I believe Boris may have benchmarked some of this recently,
>>> but I'm really inclined to believe that reading several times as much
>>> as
>>> you need from flash is much worse than doing some extra memcpy().  
>>
>> That's probably true.
>>
>>>  So
>>> even if we introduce an extra memcpy(), it might still be worth it to
>>> save the extra wait-for-flash time.  
>>
>> Right.
>>
>>> Intuitively, I expect that these days, the I/O time is much more
>>> significant than any memcpy().  
>>
>> All good points. Besides indeed in case of the subpage the memcpy() is
>> present anyway for (for unexpected reasons).
>>
>> So yeah, I think the concern I rose is a non-issue and we could proceed
>> with Sascha's patch. Thanks!
> 
> I see I don't have to convince you with real numbers, but, as pointed
> by Brian, memcpy() is indeed way faster than NAND I/Os (and ECC
> correction steps).

Thanks for all the input! :-)
I'll merge this patch in 4.8.

Thanks,
//richard
