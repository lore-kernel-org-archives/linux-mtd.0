Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UjlEp-0003eZ-Gp
 for linux-mtd@lists.infradead.org; Tue, 04 Jun 2013 07:01:00 +0000
Message-ID: <51AD9140.90500@freescale.com>
Date: Tue, 4 Jun 2013 15:03:28 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 3/3] mtd: cfi_cmdset_0002: increase do_write_buffer()
 timeout
References: <1370310406-413-1-git-send-email-computersforpeace@gmail.com>
 <1370310406-413-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1370310406-413-3-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA06=D4=C204=C8=D5 09:46, Brian Norris =D0=B4=B5=C0:
> After various tests, it seems simply that the timeout is not long enoug=
h
> for my system; increasing it by a few jiffies prevented all failures
> (testing for 12+ hours). There is no harm in increasing the timeout, bu=
t
> there is harm in having it too short, as evidenced here.
>
I like the patch1 and patch 2.

But extending the timeout from 1ms to 10ms is like a workaround. :)

>From the NOR's spec, even the maximum write-to-buffer only costs several
hundreds us,
such as 200us.

I GUESS your problem is caused by the timer system, not the MTD code. I
ever met this type of bug.
The bug is in the kernel 3.5.7, but the latest kernel has fixed it with
NO_HZ_IDLE/NO_HZ_COMMON features.
I do not meet the issue the latest linux-next tree.

I try to describe the jiffies bug with my poor english:

[1] background:
CONFIG_HZ=3D100, CONFIG_NO_HZ=3Dy

[2] call nand_wait() when we write a nand page.

[3] The jiffies was not updated at a _even_ speed.

In the nand_wait(), you wait for 20ms(2 jiffies) for a page write,
and the timeout occurs during the page write. Of course, you think that
we have already waited for 20ms.
But in actually, we only waited for 1ms or less!
How do i know this? I use the gettimeofday to check the real time when
the timeout occur.

[4] if i disable the local timer, the bug disappears.


So, could you check the real time when the timeout occurs?



Btw: My NOR's timeout is proved to be a silicon bug by Micron.

thanks
Huang Shijie
