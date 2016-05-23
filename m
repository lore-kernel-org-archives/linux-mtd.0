Received: from mail-lf0-x234.google.com ([2a00:1450:4010:c07::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b4qeh-0000zf-7N
 for linux-mtd@lists.infradead.org; Mon, 23 May 2016 14:16:28 +0000
Received: by mail-lf0-x234.google.com with SMTP id e130so38273283lfe.3
 for <linux-mtd@lists.infradead.org>; Mon, 23 May 2016 07:16:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CABatt_wQfDFN4U5SgOLrcxWNiZYVRQ4eGy1LQmdRJJN-qncUHw@mail.gmail.com>
References: <CABatt_xjhTpaUitXP_az+cOFEVA=eUedayFggrrH=Z7ZdBWUYg@mail.gmail.com>
 <CAFLxGvx9bnh6z1hkMXzdvynBOdDca6HJziEKG5pH95e+Ttaa8Q@mail.gmail.com>
 <CABatt_wMSQd7Tc=gP0rO53UghqjdaTonFFj4R_qu8zFJyfyz3A@mail.gmail.com>
 <573C4033.6010906@nod.at>
 <CABatt_wF4Vb0R=xiQapY4Q1ieBJ7Sjcvg3XXsE6QxWrACwchgw@mail.gmail.com>
 <573EC17D.40809@nod.at>
 <CABatt_wQfDFN4U5SgOLrcxWNiZYVRQ4eGy1LQmdRJJN-qncUHw@mail.gmail.com>
Date: Mon, 23 May 2016 15:16:03 +0100
Message-ID: <CABatt_zj+0Vr9PjM64VMYk-Gx+UGW-Xo6vJFNLJ1DsPNm0LPHQ@mail.gmail.com>
Subject: Re: UBIFS assert when rebooting a read only ubifs when it's been
 remounted r/w
From: Martin Townsend <mtownsend1973@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 20, 2016 at 10:47 AM, Martin Townsend
<mtownsend1973@gmail.com> wrote:
> On Fri, May 20, 2016 at 8:49 AM, Richard Weinberger <richard@nod.at> wrote:
>> Am 18.05.2016 um 12:39 schrieb Martin Townsend:
>>> I can't do the sync as the error only occurs during boot and I can see
>>> the assert whilst systemd is rmounting all the filesystems. Once I've
>>> logged in I can't get the assert to trigger again.  Just to summarise
>>> the conditions for triggering the assert
>>> To trigger I login and remount / as rw and then reboot (to a ro
>>> rootfs) and the assert first during the boot.
>>> The assert will appear on all subsequent boots (Providing I don't do
>>> the following)
>>> To get rid of the assert I can, once logged in, remount / rw and then
>>> ro and then reboot.
>>
>> Hmm, so there is no reset/power cut involved at all?
>> Can you trigger it when you mount a UBIFS by hand ro and remount?
>>
> I was resetting the board but will try the reboot command, I won't be
> able to try until Monday though as I don't currently have the board.
> I couldn't trigger this by booting via NFS and then trying to manually
> mount, remount UBIFS.
>
> Also will try patch on Monday :)
Hi Richard,

with reboot I get the assert on shutdown too, the commit
807612db2f9940b9fa6deaef054eb16d51bd3e00 is there already.  A
colleague doesn't see this problem so I will try on a newly flashed
board.

[  OK  ] Reached target Shutdown.
[   23.537561] watchdog watchdog0: watchdog did not stop!
[   23.660530] UBIFS assert failed in ubifs_remount_fs at 1869 (pid 1)
[   23.668470] CPU: 0 PID: 1 Comm: systemd-shutdow Tainted: G
 O    4.1.18-g6b41ca0b94 #1
[   23.677338] Hardware name: Generic AM43 (Flattened Device Tree)
[   23.683285] Backtrace:
[   23.687520] [<c0013398>] (dump_backtrace) from [<c00135b8>]
(show_stack+0x18/0x1c)
[   23.695223]  r7:00000000 r6:ee8abee4 r5:00000000 r4:ee01a000
[   23.700953] [<c00135a0>] (show_stack) from [<c060006c>]
(dump_stack+0x20/0x28)
[   23.708277] [<c060004c>] (dump_stack) from [<c029ba4c>]
(ubifs_remount_fs+0x558/0x800)
[   23.716325] [<c029b4f4>] (ubifs_remount_fs) from [<c013e1e0>]
(do_remount_sb+0x6c/0x1d8)
[   23.724469]  r9:ee0dfc40 r8:00000000 r7:00000000 r6:00000000
r5:00000000 r4:ee0dfc00
[   23.732293] [<c013e174>] (do_remount_sb) from [<c015d69c>]
(do_mount+0x80c/0xcd0)
[   23.739821]  r8:00000021 r7:ee0dfc00 r6:ee0fe0d0 r5:00000060 r4:00000000
[   23.746604] [<c015ce90>] (do_mount) from [<c015dee4>] (SyS_mount+0x9c/0xc8)
[   23.753592]  r10:00000000 r9:ee8aa000 r8:00000021 r7:7f5cc008
r6:00000000 r5:00000000
[   23.761502]  r4:00000000
[   23.764060] [<c015de48>] (SyS_mount) from [<c000f920>]
(ret_fast_syscall+0x0/0x3c)
[   23.771672]  r8:c000fac4 r7:00000015 r6:7f5c4464 r5:00000000 r4:00000000
[   23.778504] UBIFS assert failed in ubifs_remount_fs at 1869 (pid 1)
[   23.785113] CPU: 0 PID: 1 Comm: systemd-shutdow Tainted: G
 O    4.1.18-g6b41ca0b94 #1
[   23.793925] Hardware name: Generic AM43 (Flattened Device Tree)
[   23.799981] Backtrace:
[   23.802518] [<c0013398>] (dump_backtrace) from [<c00135b8>]
(show_stack+0x18/0x1c)
[   23.810446]  r7:00000000 r6:ee8abee4 r5:00000000 r4:ee01a000
[   23.816227] [<c00135a0>] (show_stack) from [<c060006c>]
(dump_stack+0x20/0x28)
[   23.823494] [<c060004c>] (dump_stack) from [<c029ba4c>]
(ubifs_remount_fs+0x558/0x800)
[   23.831597] [<c029b4f4>] (ubifs_remount_fs) from [<c013e1e0>]
(do_remount_sb+0x6c/0x1d8)
[   23.839806]  r9:ee0dfc40 r8:00000000 r7:00000000 r6:00000000
r5:00000000 r4:ee0dfc00
[   23.847748] [<c013e174>] (do_remount_sb) from [<c015d69c>]
(do_mount+0x80c/0xcd0)
[   23.855337]  r8:00000021 r7:ee0dfc00 r6:ee0fe0d0 r5:00000060 r4:00000000
[   23.862231] [<c015ce90>] (do_mount) from [<c015dee4>] (SyS_mount+0x9c/0xc8)
[   23.869374]  r10:00000000 r9:ee8aa000 r8:00000021 r7:7f5cc008
r6:00000000 r5:00000000
[   23.877312]  r4:00000000
[   23.879869] [<c015de48>] (SyS_mount) from [<c000f920>]
(ret_fast_syscall+0x0/0x3c)
[   23.887499]  r8:c000fac4 r7:00000015 r6:7f5c4464 r5:00000000 r4:00000000

- Martin

> Cheers,
> Martin.
>
>> Thanks,
>> //richard
>
> Cheers,
> Martin.
>
>> Thanks,
>> //richard
