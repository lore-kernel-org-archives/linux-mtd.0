Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NnUGr-0008EX-LH
	for linux-mtd@lists.infradead.org; Fri, 05 Mar 2010 09:56:42 +0000
Received: by pwj2 with SMTP id 2so2177061pwj.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 05 Mar 2010 01:56:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <56a87efc1003041401t4382d2i504b309a6c98d3d7@mail.gmail.com>
References: <56a87efc1003041025n7d7f8d7ud740b259308fea7@mail.gmail.com>
	<D47DD163F8914C69B534C8AA8FF3258F@WINXP>
	<56a87efc1003041233o8c10a1fif541dc9efee6462c@mail.gmail.com>
	<56a87efc1003041401t4382d2i504b309a6c98d3d7@mail.gmail.com>
Date: Fri, 5 Mar 2010 10:56:34 +0100
Message-ID: <62cbdcd91003050156g404106a5pfdf10bb29d9ce837@mail.gmail.com>
Subject: Re: JFFS2 errors on ppc-4xx with CFI NOR flash
From: massimo cirillo <maxcir@gmail.com>
To: Ryan Thompson <i@ry.ca>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Massimo.CIRILLO@numonyx.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I suppose you don't have CONFIG_MTD_XIP enabled.
So in order to completely disable the suspend,
please in chip_ready() function just after "case FL_ERASING:"
(line 775) put the line "goto sleep;" and repeat your test.
Let me know.

2010/3/4 Ryan Thompson <i@ry.ca>:
>> On Thu, Mar 4, 2010 at 1:03 PM, massimo cirillo <maxcir@gmail.com> wrote=
:
>>> As first attempt try to disable erase suspend feature in the flash
>>> driver.
>
> I have tried this against my 2.6.31 tree by uncommenting the following
> in drivers/mtd/chips/cfi_cmdset_0001.c:40:
>
> =A0 =A0#define CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE
>
> Now my test output looks like the following. Note that it ran
> successfully from 3% - 53%, which is right in the range where problems
> tend to appear.
>
> Filesystem =A0 =A0 =A0 =A0 =A0 1K-blocks =A0 =A0 =A0Used Available Use% M=
ounted on
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 =A01032 =A0 =A0 31096 =A0 =
3% /mnt
> [... snip 3 - 52%, no errors ...]
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 16668 =A0 =A0 15460 =A052%=
 /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 16912 =A0 =A0 15216 =A053%=
 /mnt
> Jan =A01 00:17:27 rjt kernel: Newly-erased block contained word 0x0 at
> offset 0x0022a030
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 17308 =A0 =A0 14820 =A054%=
 /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 17572 =A0 =A0 14556 =A055%=
 /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 17836 =A0 =A0 14292 =A056%=
 /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 18100 =A0 =A0 14028 =A056%=
 /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 18368 =A0 =A0 13760 =A057%=
 /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 18604 =A0 =A0 13524 =A058%=
 /mnt
> Jan =A01 00:18:40 rjt kernel: Newly-erased block contained word 0x0 at
> offset 0x01b2a010
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 18992 =A0 =A0 13136 =A059%=
 /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 19260 =A0 =A0 12868 =A060%=
 /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 19524 =A0 =A0 12604 =A061%=
 /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 19788 =A0 =A0 12340 =A062%=
 /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 20052 =A0 =A0 12076 =A062%=
 /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 20316 =A0 =A0 11812 =A063%=
 /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 20552 =A0 =A0 11576 =A064%=
 /mnt
> Jan =A01 00:20:04 rjt kernel: Newly-erased block contained word 0x0 at
> offset 0x013ca034
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 20944 =A0 =A0 11184 =A065%=
 /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 21208 =A0 =A0 10920 =A066%=
 /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 21476 =A0 =A0 10652 =A067%=
 /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 21740 =A0 =A0 10388 =A068%=
 /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 22004 =A0 =A0 10124 =A068%=
 /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 22244 =A0 =A0 =A09884 =A06=
9% /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 22504 =A0 =A0 =A09624 =A07=
0% /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 22764 =A0 =A0 =A09364 =A07=
1% /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 23032 =A0 =A0 =A09096 =A07=
2% /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 23296 =A0 =A0 =A08832 =A07=
3% /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 23564 =A0 =A0 =A08564 =A07=
3% /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 23828 =A0 =A0 =A08300 =A07=
4% /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 24092 =A0 =A0 =A08036 =A07=
5% /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 24328 =A0 =A0 =A07800 =A07=
6% /mnt
> Jan =A01 00:22:48 rjt kernel: Newly-erased block contained word 0x0 at
> offset 0x0052a004
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 24716 =A0 =A0 =A07412 =A07=
7% /mnt
> Jan =A01 00:23:02 rjt kernel: Newly-erased block contained word 0x0 at
> offset 0x003ea034
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 25116 =A0 =A0 =A07012 =A07=
8% /mnt
> Jan =A01 00:23:42 rjt kernel: Newly-erased block contained word 0x0 at
> offset 0x0006a028
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 25492 =A0 =A0 =A06636 =A07=
9% /mnt
> Jan =A01 00:24:03 rjt kernel: Newly-erased block contained word 0x0 at
> offset 0x01dc9fb8
> Jan =A01 00:24:12 rjt kernel: f0000000.flash: block erase error: (status =
timeout)
> Jan =A01 00:24:12 rjt kernel: Erase at 0x01da0000 failed immediately: err=
no -62
> Jan =A01 00:24:27 rjt kernel: Newly-erased block contained word 0x0 at
> offset 0x01c6a004
> Jan =A01 00:24:36 rjt kernel: f0000000.flash: block erase error: (status =
timeout)
> Jan =A01 00:24:36 rjt kernel: Erase at 0x01c40000 failed immediately: err=
no -62
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 26268 =A0 =A0 =A05860 =A08=
2% /mnt
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 26528 =A0 =A0 =A05600 =A08=
3% /mnt
> Jan =A01 00:25:33 rjt kernel: Newly-erased block contained word 0x0 at
> offset 0x017aa034
> Jan =A01 00:25:41 rjt kernel: f0000000.flash: block erase error: (status =
timeout)
> Jan =A01 00:25:41 rjt kernel: Erase at 0x01780000 failed immediately: err=
no -62
> Jan =A01 00:25:45 rjt kernel: Newly-erased block contained word 0x0 at
> offset 0x0176a024
> Jan =A01 00:25:54 rjt kernel: f0000000.flash: block erase error: (status =
timeout)
> Jan =A01 00:25:54 rjt kernel: Erase at 0x01740000 failed immediately: err=
no -62
> Jan =A01 00:26:14 rjt kernel: Newly-erased block contained word 0x0 at
> offset 0x0154a048
> Jan =A01 00:26:23 rjt kernel: f0000000.flash: block erase error: (status =
timeout)
> Jan =A01 00:26:23 rjt kernel: Erase at 0x01520000 failed immediately: err=
no -62
> Jan =A01 00:26:44 rjt kernel: Newly-erased block contained word 0x0 at
> offset 0x0150a024
> Jan =A01 00:26:53 rjt kernel: f0000000.flash: block erase error: (status =
timeout)
> Jan =A01 00:26:53 rjt kernel: Erase at 0x014e0000 failed immediately: err=
no -62
> Jan =A01 00:27:18 rjt kernel: Newly-erased block contained word 0x0 at
> offset 0x0140738c
> Jan =A01 00:27:27 rjt kernel: f0000000.flash: block erase error: (status =
timeout)
> Jan =A01 00:27:27 rjt kernel: Erase at 0x013e0000 failed immediately: err=
no -62
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 28076 =A0 =A0 =A04052 =A08=
7% /mnt
> Jan =A01 00:28:10 rjt kernel: Newly-erased block contained word 0x0 at
> offset 0x00f6a048
> Jan =A01 00:28:18 rjt kernel: f0000000.flash: block erase error: (status =
timeout)
> Jan =A01 00:28:18 rjt kernel: Erase at 0x00f40000 failed immediately: err=
no -62
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 28584 =A0 =A0 =A03544 =A08=
9% /mnt
> Jan =A01 00:28:42 rjt kernel: Newly-erased block contained word 0x0 at
> offset 0x00d2a040
> Jan =A01 00:28:51 rjt kernel: f0000000.flash: block erase error: (status =
timeout)
> Jan =A01 00:28:51 rjt kernel: Erase at 0x00d00000 failed immediately: err=
no -62
> Jan =A01 00:29:04 rjt kernel: Newly-erased block contained word 0x0 at
> offset 0x00cca02c
> Jan =A01 00:29:12 rjt kernel: f0000000.flash: block erase error: (status =
timeout)
> Jan =A01 00:29:12 rjt kernel: Erase at 0x00ce0000 failed immediately: err=
no -62
> Jan =A01 00:29:42 rjt kernel: Newly-erased block contained word 0x0 at
> offset 0x00aca038
> Jan =A01 00:29:51 rjt kernel: f0000000.flash: block erase error: (status =
timeout)
> Jan =A01 00:29:51 rjt kernel: Erase at 0x00aa0000 failed immediately: err=
no -62
> Jan =A01 00:30:02 rjt kernel: Newly-erased block contained word 0x0 at
> offset 0x0096a010
> Jan =A01 00:30:11 rjt kernel: f0000000.flash: block erase error: (status =
timeout)
> Jan =A01 00:30:11 rjt kernel: Erase at 0x00940000 failed immediately: err=
no -62
> /dev/mtd/modules =A0 =A0 =A0 =A0 32128 =A0 =A0 29872 =A0 =A0 =A02256 =A09=
3% /mnt
>
> The errors continued until the filesystem actually reported 100% full
> and my script terminated. The entire 3%-100% operation took about 21
> minutes for <32MiB, and was definitely much slower towards the end
> with all the errors.
>
> - R
>
