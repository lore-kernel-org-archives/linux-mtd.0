Received: from mailserv.intranet.gr ([146.124.14.106])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C6off-0005OQ-3q
	for linux-mtd@lists.infradead.org; Mon, 13 Sep 2004 07:06:58 -0400
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
	by mailserv.intranet.gr (8.13.1/8.13.1) with ESMTP id i8DB6waG002139
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Sep 2004 14:06:59 +0300 (EEST)
Message-ID: <41457E01.6060507@intracom.gr>
Date: Mon, 13 Sep 2004 14:01:21 +0300
From: Pantelis Antoniou <panto@intracom.gr>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: MTD lock support for AMD_STD flash.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there

While trying to get MTD in 2.6 working in my board I stubbled on
this.

The lock/unlock logic does not seem to work for AMD STD jedec flashes.

> Oops: kernel access of bad area, sig: 11 [#1]
> NIP: C00F5354 LR: C00F5348 SP: C03FFDF0 REGS: c03ffd40 TRAP: 0300    Not tainted
> MSR: 00009032 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
> DAR: C4CD1002, DSISR: 00018C09
> TASK = c0341980[107] 'fw_saveenv' THREAD: c03fe000Last syscall: 54
> GPR00: 00000000 C03FFDF0 C0341980 00000014 C01D9C24 00000007 91FE2C56 00000000
> GPR08: C01D9C28 C5061000 C03ABF0C C03FFD20 00021555 20000900 03FCF500 03FCA31C
> GPR16: 007FFE30 03FCF478 03F7E438 7FFFFB00 00000000 C00F52D0 C03FFE68 C01A5E68
> GPR24: 00000000 C3FF4D90 C3FDEF20 C01A5E68 C03FFE68 00000000 C3FF4DC8 FFC70002
> NIP [c00f5354] do_xxlock_oneblock+0x84/0xbc
> LR [c00f5348] do_xxlock_oneblock+0x78/0xbc
> Call trace:
>  [c00f4944] cfi_amdstd_varsize_frob+0x1c4/0x260
>  [c00f5404] cfi_amdstd_unlock_varsize+0x34/0x44
>  [c00ee09c] part_unlock+0x64/0x7c
>  [c00f1140] mtd_ioctl+0x860/0xa14
>  [c006235c] sys_ioctl+0x424/0x450
>  [c00037b0] ret_from_syscall+0x0/0x44
> Kernel panic - not syncing: Aiee, killing interrupt handler!
>  <0>Rebooting in 180 seconds..

This happens when trying to lock a block for MX29LV040C, and I think
will happen with all AMD STD flashes.

The thing is that these chips don't have support for locking, but I can't
find a way to declare it in the command set.

So the way to avoid this I set the lock & unlock methods in my map file.

This is a gross hack however and I'm wondering if there's an easier way...

Regards

Pantelis
