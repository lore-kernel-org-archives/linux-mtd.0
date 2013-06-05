Received: from mail-vb0-x231.google.com ([2607:f8b0:400c:c02::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UkI2K-0002nk-3T
 for linux-mtd@lists.infradead.org; Wed, 05 Jun 2013 18:02:17 +0000
Received: by mail-vb0-f49.google.com with SMTP id q13so1303117vbe.22
 for <linux-mtd@lists.infradead.org>; Wed, 05 Jun 2013 11:01:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <51AD9140.90500@freescale.com>
References: <1370310406-413-1-git-send-email-computersforpeace@gmail.com>
 <1370310406-413-3-git-send-email-computersforpeace@gmail.com>
 <51AD9140.90500@freescale.com>
Date: Wed, 5 Jun 2013 11:01:53 -0700
Message-ID: <CAN8TOE9UDGuQd9AbE-4UVcAiqCFpqhY=fX+LbrDybdgr16THdQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] mtd: cfi_cmdset_0002: increase do_write_buffer()
 timeout
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 4, 2013 at 12:03 AM, Huang Shijie <b32955@freescale.com> wrote:
> =D3=DA 2013=C4=EA06=D4=C204=C8=D5 09:46, Brian Norris =D0=B4=B5=C0:
>> After various tests, it seems simply that the timeout is not long enough
>> for my system; increasing it by a few jiffies prevented all failures
>> (testing for 12+ hours). There is no harm in increasing the timeout, but
>> there is harm in having it too short, as evidenced here.
>>
> I like the patch1 and patch 2.
>
> But extending the timeout from 1ms to 10ms is like a workaround. :)

I was afraid you might say that; that's why I stuck the first two
patches first ;)

> From the NOR's spec, even the maximum write-to-buffer only costs several
> hundreds us,
> such as 200us.
>
> I GUESS your problem is caused by the timer system, not the MTD code. I
> ever met this type of bug.

I suspected similarly, but I didn't (until now) believe that's the
case here. See below.

> The bug is in the kernel 3.5.7, but the latest kernel has fixed it with
> NO_HZ_IDLE/NO_HZ_COMMON features.

Did you track your bug down to a particular commit? 3.5.7 is the
stable kernel; do you know what mainline rev it showed up in? I'm not
quite interested in backporting all of the new 3.10 features!

> I do not meet the issue the latest linux-next tree.
>
> I try to describe the jiffies bug with my poor english:
>
> [1] background:
> CONFIG_HZ=3D100, CONFIG_NO_HZ=3Dy
>
> [2] call nand_wait() when we write a nand page.
>
> [3] The jiffies was not updated at a _even_ speed.
>
> In the nand_wait(), you wait for 20ms(2 jiffies) for a page write,
> and the timeout occurs during the page write. Of course, you think that
> we have already waited for 20ms.
> But in actually, we only waited for 1ms or less!
> How do i know this? I use the gettimeofday to check the real time when
> the timeout occur.

I suspected this very type of thing, since this has come up in a few
different contexts. And for some time, with a number of different
checks, it appeared that this *wasn't* the case. But while writing
this very email, I had the bright idea that my time checkpoint was in
slightly the wrong place; so sure enough, I found that I was timing
out after only 72519 ns! (That is, 72 us, or well below the max write
buffer time.)

I'm testing on MIPS with a 3.3 kernel, by the way, but I believe this
sort of bug has been around a while.

> [4] if i disable the local timer, the bug disappears.
>
> So, could you check the real time when the timeout occurs?
>
>
>
> Btw: My NOR's timeout is proved to be a silicon bug by Micron.

Interesting.

Brian
