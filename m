Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsHxO-00065B-T1
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 17:57:28 +0000
Received: by mail-wi0-f177.google.com with SMTP id o1so244838wic.36
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 09:57:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAC5umyh6H-0JXyQ9V97FH_Cp7Y2swbRMJptXJwnE0cK6HqbkGQ@mail.gmail.com>
References: <1327674295-3700-1-git-send-email-akinobu.mita@gmail.com>
 <1327674295-3700-2-git-send-email-akinobu.mita@gmail.com>
 <1327684589.12089.22.camel@joe2Laptop>
 <CAN8TOE8Hq8f3ipQFxBAHXK5ArSH6wNc8GA5CbYr_xORBa5gAWw@mail.gmail.com>
 <CAC5umyh6H-0JXyQ9V97FH_Cp7Y2swbRMJptXJwnE0cK6HqbkGQ@mail.gmail.com>
Date: Tue, 31 Jan 2012 09:57:26 -0800
Message-ID: <CAN8TOE_e8FkTTABRTyrXr5EW3wsJeXaODE4Wpud4ype=tcRFFQ@mail.gmail.com>
Subject: Re: [PATCH] mtd/nand: use string library
From: Brian Norris <computersforpeace@gmail.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: eric.dumazet@gmail.com, Scott Branden <sbranden@broadcom.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Jiandong Zheng <jdzheng@broadcom.com>, Joe Perches <joe@perches.com>,
 akpm@linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 27, 2012 at 3:52 PM, Akinobu Mita <akinobu.mita@gmail.com> wrot=
e:
> 2012/1/28 Brian Norris <computersforpeace@gmail.com>:
>> On Fri, Jan 27, 2012 at 9:16 AM, Joe Perches <joe@perches.com> wrote:
>>> On Fri, 2012-01-27 at 23:24 +0900, Akinobu Mita wrote:
>>>> - Use memchr_inv to check if the data contains all 0xFF bytes.
>>>> =A0 It is faster than looping for each byte.
>>>
>>> Stupid question:
>>>
>>> Are there any mtd devices modified that are slower
>>> at 64 bit accesses than repeated 8 bit accesses?
>>
>> I believe this patch deals with kernel buffers, not any kind of direct
>> access to the MTD, so the question (which is not stupid IMO) should be
>> regarding CPU architectures. And my educated guess is that 64-bit
>> access should not be any slower. I do know that 8-bit access *is*
>> slower for some relevant architectures.
>
> It could be slower when the number of bytes scanned is very small
> (found a unmatched character immediately, or the size of the area
> is very small), because memchr_inv() needs to generate a 64bit pattern
> to compare before starting the loop. =A0I recalled that Eric Dumazet
> pointed out it could generate the 64bit pattern more efficiently.
> (https://lkml.org/lkml/2011/8/8/480)
>
> Even if that small scanning is slower, this change can be assumed cleanup
> patch that simplifies the code.

Well, I agree that it qualifies as cleanup as well, but we should at
least make an attempt not to cause performance regression...

So by my understanding, the use of memchr_inv() is on buffers of
minimum length of 10 in this patch, so we're likely to have decent
results. And memcmp() usage looks fine to me.

So unless other concerns arise:

Acked-by: Brian Norris <computersforpeace@gmail.com>
