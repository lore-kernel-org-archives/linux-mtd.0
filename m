Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5Hyp-00036z-Qo
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2011 13:32:09 +0000
Received: by wwb39 with SMTP id 39so1991474wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 31 Mar 2011 06:32:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110330165140.c5ca5705.akpm@linux-foundation.org>
References: <bug-32242-10286@https.bugzilla.kernel.org/>
	<20110330165140.c5ca5705.akpm@linux-foundation.org>
Date: Thu, 31 Mar 2011 09:32:05 -0400
Message-ID: <AANLkTinq74akK9hPMt2vjmsqUGFx7L-ZG3D=FY88vXue@mail.gmail.com>
Subject: Re: [Bugme-new] [Bug 32242] New: irq 18, nobody cared, nor did irqpoll
From: Josh Boyer <jwboyer@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: bugzilla-daemon@bugzilla.kernel.org, linux-mmc@vger.kernel.org,
	harri@afaics.de, linux-acpi@vger.kernel.org,
	linux-mtd@lists.infradead.org, bugme-daemon@bugzilla.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 30, 2011 at 7:51 PM, Andrew Morton
<akpm@linux-foundation.org> wrote:
>> I got this at boot time of my laptop:
>>
>> [ =A0 11.837498] irq 18: nobody cared (try booting with the "irqpoll" op=
tion)
>> [ =A0 11.837503] Pid: 1618, comm: echo Not tainted 2.6.38.2 #1
>> [ =A0 11.837504] Call Trace:
>> [ =A0 11.837506] =A0<IRQ> =A0[<ffffffff810723af>] ?
>> __report_bad_irq.clone.2+0x30/0x7c
>> [ =A0 11.837515] =A0[<ffffffff81072502>] ? note_interrupt+0x107/0x179
>> [ =A0 11.837518] =A0[<ffffffff81072f8e>] ? handle_fasteoi_irq+0xa6/0xd4
>> [ =A0 11.837522] =A0[<ffffffff810036cc>] ? call_softirq+0x1c/0x28
>> [ =A0 11.837525] =A0[<ffffffff8100514f>] ? handle_irq+0x17/0x1d
>> [ =A0 11.837527] =A0[<ffffffff81004e80>] ? do_IRQ+0x45/0xad
>> [ =A0 11.837532] =A0[<ffffffff812a2d13>] ? ret_from_intr+0x0/0xe
>> [ =A0 11.837533] =A0<EOI> =A0[<ffffffff81175b76>] ? cfb_imageblit+0x19e/=
0x434
>> [ =A0 11.837539] =A0[<ffffffff812a2d0e>] ? common_interrupt+0xe/0x13
>> [ =A0 11.837543] =A0[<ffffffff81170fa7>] ? bit_putcs+0x3c0/0x455
>> [ =A0 11.837546] =A0[<ffffffff81170bcb>] ? bit_cursor+0x439/0x455
>> [ =A0 11.837549] =A0[<ffffffff8116b93b>] ? fbcon_putcs+0xef/0xfe
>> [ =A0 11.837551] =A0[<ffffffff81170be7>] ? bit_putcs+0x0/0x455
>> [ =A0 11.837554] =A0[<ffffffff8116ef5b>] ? fbcon_redraw.clone.15+0xcb/0x=
160
>> [ =A0 11.837557] =A0[<ffffffff8116f60e>] ? fbcon_scroll+0x61e/0xb9d
>> [ =A0 11.837561] =A0[<ffffffff811b2436>] ? scrup+0x67/0xd4
>> [ =A0 11.837563] =A0[<ffffffff811b25c7>] ? lf+0x25/0x58
>> [ =A0 11.837566] =A0[<ffffffff811b58fb>] ? do_con_write+0x8aa/0x1e40
>> [ =A0 11.837569] =A0[<ffffffff81170792>] ? bit_cursor+0x0/0x455
>> [ =A0 11.837572] =A0[<ffffffff811b6ed5>] ? con_write+0xd/0x23
>> [ =A0 11.837575] =A0[<ffffffff811a5593>] ? do_output_char+0x87/0x199
>> [ =A0 11.837578] =A0[<ffffffff811a56d4>] ? process_output+0x2f/0x43
>> [ =A0 11.837580] =A0[<ffffffff811a6063>] ? n_tty_write+0x26b/0x34d
>> [ =A0 11.837584] =A0[<ffffffff8103018a>] ? default_wake_function+0x0/0x1=
1
>> [ =A0 11.837587] =A0[<ffffffff811a3374>] ? tty_write+0x1ad/0x231
>> [ =A0 11.837589] =A0[<ffffffff811a5df8>] ? n_tty_write+0x0/0x34d
>> [ =A0 11.837593] =A0[<ffffffff810b7b60>] ? vfs_write+0xaf/0x129
>> [ =A0 11.837596] =A0[<ffffffff810b7db3>] ? sys_write+0x45/0x6e
>> [ =A0 11.837598] =A0[<ffffffff8100287b>] ? system_call_fastpath+0x16/0x1=
b
>> [ =A0 11.837600] handlers:
>> [ =A0 11.837601] [<ffffffffa01f80a7>] (sdhci_irq+0x0/0x4d5 [sdhci])
>> [ =A0 11.837621] [<ffffffffa05bb871>] (r852_irq+0x0/0x201 [r852])
>
> So both sdhci_irq and r852_irq were looking at the IRQ, but neither of
> them were interested in it.
>
> Could be that the bug lies in neither driver, at that something went
> wrong with the system setup. =A0ACPI?

I don't see anything that would implicate the MTD layer at all.  SDHCI
is unrelated to MTD.  Just an FYI.

josh
