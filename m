Received: from mail-vc0-f176.google.com ([209.85.220.176])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UkKwh-0006wl-9G
 for linux-mtd@lists.infradead.org; Wed, 05 Jun 2013 21:08:40 +0000
Received: by mail-vc0-f176.google.com with SMTP id ha11so1463120vcb.7
 for <linux-mtd@lists.infradead.org>; Wed, 05 Jun 2013 14:08:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE9UDGuQd9AbE-4UVcAiqCFpqhY=fX+LbrDybdgr16THdQ@mail.gmail.com>
References: <1370310406-413-1-git-send-email-computersforpeace@gmail.com>
 <1370310406-413-3-git-send-email-computersforpeace@gmail.com>
 <51AD9140.90500@freescale.com>
 <CAN8TOE9UDGuQd9AbE-4UVcAiqCFpqhY=fX+LbrDybdgr16THdQ@mail.gmail.com>
Date: Wed, 5 Jun 2013 14:08:17 -0700
Message-ID: <CAN8TOE8FRtQupXwvAtrVSN-C-nQz-XgOW7OA5C=XRs9YmCwTkg@mail.gmail.com>
Subject: Re: [PATCH 3/3] mtd: cfi_cmdset_0002: increase do_write_buffer()
 timeout
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: Arnd Bergmann <arnd@arndb.de>, Artem Bityutskiy <dedekind1@gmail.com>,
 Imre Deak <imre.deak@intel.com>, Kevin Cernekee <cernekee@gmail.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adding a few others

For reference, this thread started with this patch:

http://lists.infradead.org/pipermail/linux-mtd/2013-June/047164.html

On Wed, Jun 5, 2013 at 11:01 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Tue, Jun 4, 2013 at 12:03 AM, Huang Shijie <b32955@freescale.com> wrot=
e:
>> =D3=DA 2013=C4=EA06=D4=C204=C8=D5 09:46, Brian Norris =D0=B4=B5=C0:
>>> After various tests, it seems simply that the timeout is not long enoug=
h
>>> for my system; increasing it by a few jiffies prevented all failures
>>> (testing for 12+ hours). There is no harm in increasing the timeout, bu=
t
>>> there is harm in having it too short, as evidenced here.
>>>
>> I like the patch1 and patch 2.
>>
>> But extending the timeout from 1ms to 10ms is like a workaround. :)
>
> I was afraid you might say that; that's why I stuck the first two
> patches first ;)
...
>> I GUESS your problem is caused by the timer system, not the MTD code. I
>> ever met this type of bug.
...
>> I try to describe the jiffies bug with my poor english:
>>
>> [1] background:
>> CONFIG_HZ=3D100, CONFIG_NO_HZ=3Dy
>>
>> [2] call nand_wait() when we write a nand page.
>>
>> [3] The jiffies was not updated at a _even_ speed.
>>
>> In the nand_wait(), you wait for 20ms(2 jiffies) for a page write,
>> and the timeout occurs during the page write. Of course, you think that
>> we have already waited for 20ms.
>> But in actually, we only waited for 1ms or less!
>> How do i know this? I use the gettimeofday to check the real time when
>> the timeout occur.
>
> I suspected this very type of thing, since this has come up in a few
> different contexts. And for some time, with a number of different
> checks, it appeared that this *wasn't* the case. But while writing
> this very email, I had the bright idea that my time checkpoint was in
> slightly the wrong place; so sure enough, I found that I was timing
> out after only 72519 ns! (That is, 72 us, or well below the max write
> buffer time.)

So I can confirm that with the 1ms timeout, I actually am sometimes
timing out at 40 to 70 microseconds. I think this may have multiple
causes:
(1) uneven timer interrupts, as suggested by Huang?
(2) a jiffies timeout of 1 is two short (with HZ=3D1000, msecs_to_jiffies(1=
) is 1)

Regarding reason (2):

My thought (which matches with Imre's comments from his [1]) is that
one problem here is that we do not know how long it will be until the
*next* timer tick -- "waiting 1 jiffy" is really just waiting until
the next timer tick, which very well might be in 40us! So the correct
timeout calculation is something like:

uWriteTimeout =3D msecs_to_jiffies(1) + 1;

or with Imre's proposed methods (not merged upstream yet), just:

uWriteTimeout =3D msecs_to_jiffies_timeout(1);

Thoughts?

Note that a 2-jiffy timeout does not, in fact, totally resolve my
problems; with a timeout of 2 jiffies, I still get a timeout that
(according to getnstimeofday()) occurs after only 56us. It does
decrease its rate of occurrence, but Huang may still be right that
reason (1) is involved.

Brian

[1] http://marc.info/?l=3Dlinux-kernel&m=3D136854294730957
