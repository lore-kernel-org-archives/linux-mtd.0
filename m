Received: from mail-qy0-f177.google.com ([209.85.216.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RnGtZ-0003yG-8W
 for linux-mtd@lists.infradead.org; Tue, 17 Jan 2012 21:48:46 +0000
Received: by qcso7 with SMTP id o7so2565347qcs.36
 for <linux-mtd@lists.infradead.org>; Tue, 17 Jan 2012 13:48:42 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 17 Jan 2012 16:48:42 -0500
Message-ID: <CAGiDA6LO-PWL6OeGwwPJzdx8TVEXMA84ceOvQZ3UECKkG54YAw@mail.gmail.com>
Subject: Kernel panic when reading mtd device
From: "Shawn J. Goff" <shawn7400@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm having a problem with mtd on an Atmel SAM9x25-based system with a
Numonyx m25p128 SPI nor flash. When I use flashcp to copy a jffs2
partition to the mtd device, it erases and writes fine, but as soon as
it tries to read, I get a panic. The same thing happens when I try to
mount the filesystem from the mtdblock device, except that it does
many reads with a length of 4096 and a few shorter ones until it
eventually does a large read (18552 bytes) - then it panics. I
experimented with dd; it works for block sizes up to 4096; any bigger
than that, and it gets pretty much this same panic. I've included the
panic message caused by dd below; the others are slightly different; I
can sned them if it helps.

So apparently, anytime m25p80_read is called with a len>4096, I get a
panic. The flash device doesn't have any limit with regards to the
number of bytes that can be read; in fact, the address counter
automatically rolls over and it will keep spitting out data forever if
you tell it to. So, where is the problem? Should it be able to handle
> 4096 byte reads, or should other functions not even be asking for
reads > 4096 bytes? Or am I completely off track?

I'm using 2.6.39.4 with patches from
Linux4SAM(ftp://ftp.linux4sam.org/pub/linux/2.6.39-at91/).

# dd if=/dev/mtd1 bs=8192
[   15.890000] MTD_open
[   15.890000] MTD_read
[   15.890000] spi0.1: m25p80_read from 0x007c0000, len 8192
[   15.900000] Unable to handle kernel paging request at virtual
address ffe00000
[   15.900000] pgd = c0004000
[   15.910000] [ffe00000] *pgd=21ffe831, *pte=00000000, *ppte=00000000
[   15.910000] Internal error: Oops: 817 [#1]
[   15.910000] last sysfs file:
/sys/devices/platform/atmel_spi.0/spi0.1/mtd/mtd2ro/dev
[   15.910000] Modules linked in: mtdchar
[   15.910000] CPU: 0    Not tainted  (2.6.39.4 #20)
[   15.910000] PC is at __memzero+0x24/0x80
[   15.910000] LR is at 0x0
[   15.910000] pc : [<c065c564>]    lr : [<00000000>]    psr: 20000013
[   15.910000] sp : c182be5c  ip : 00000000  fp : c182beac
[   15.910000] r10: 0000000a  r9 : c0c91160  r8 : c184c07c
[   15.910000] r7 : c184c0f0  r6 : c0c91150  r5 : c0cb3e08  r4 : c0c910f0
[   15.910000] r3 : 00000000  r2 : 00000000  r1 : 00000fc0  r0 : ffe00000
[   15.910000] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM
Segment kernel
[   15.910000] Control: 0005317f  Table: 20d5c000  DAC: 00000017
[   15.910000] Process rcu_kthread (pid: 6, stack limit = 0xc182a270)
[   15.910000] Stack: (0xc182be5c to 0xc182c000)
[   15.910000] be40:
             c06bb58c
[   15.910000] be60: c182bea4 c182be70 c059eff4 c05a057c 00000000
0000000d c0cb3e2c c0c91000
[   15.910000] be80: 00000000 c0c910f0 c0cb3de4 c0cb3e4c c0cb3e2c
c0c91000 c07f55bc 0000000a
[   15.910000] bea0: c182bed4 c182beb0 c06bb9f8 c06bb4d8 c182bed4
00000000 c07f5580 c07dec28
[   15.910000] bec0: 00000000 00000001 c182bef4 c182bed8 c05750fc
c06bb860 00000006 00000101
[   15.910000] bee0: c182a000 00000018 c182bf2c c182bef8 c05757f4
c057507c c182a000 00000000
[   15.910000] bf00: c0ccfec4 60000013 c0ccfec4 c07f75e0 c182bf7c
c182bf88 c0588de8 00000000
[   15.910000] bf20: c182bf44 c182bf30 c0575a48 c057577c c182bf7c
c181c534 c182bf5c c182bf48
[   15.910000] bf40: c0575c14 c0575a0c c181c534 c181c534 c182bf74
c182bf60 c05a2340 c0575b94
[   15.910000] bf60: c1815040 c182a000 c182bfbc c182bf78 c05a2414
c05a22dc 00000000 00000000
[   15.910000] bf80: c1815040 c0588de8 c182bf88 c182bf88 c182bfbc
c182bfcc c1819f44 00000000
[   15.910000] bfa0: c05a2350 00000000 00000000 00000000 c182bff4
c182bfc0 c05889c0 c05a2360
[   15.910000] bfc0: c1819f44 00000000 00000000 00000000 c182bfd0
c182bfd0 c1819f44 c0588938
[   15.910000] bfe0: c05737c0 00000013 00000000 c182bff8 c05737c0
c0588948 bbee3b8c 338832cc
[   15.910000] Backtrace:
[   15.910000] [<c06bb4c8>] (atmel_spi_next_xfer+0x0/0x2c8) from
[<c06bb9f8>] (atmel_spi_tasklet_func+0x1a8/0x1e0)
[   15.910000] [<c06bb850>] (atmel_spi_tasklet_func+0x0/0x1e0) from
[<c05750fc>] (tasklet_action+0x90/0xe0)
[   15.910000]  r8:00000001 r7:00000000 r6:c07dec28 r5:c07f5580 r4:00000000
[   15.910000] [<c057506c>] (tasklet_action+0x0/0xe0) from
[<c05757f4>] (__do_softirq+0x88/0x13c)
[   15.910000]  r7:00000018 r6:c182a000 r5:00000101 r4:00000006
[   15.910000] [<c057576c>] (__do_softirq+0x0/0x13c) from [<c0575a48>]
(do_softirq+0x4c/0x58)
[   15.910000] [<c05759fc>] (do_softirq+0x0/0x58) from [<c0575c14>]
(local_bh_enable+0x90/0xb4)
[   15.910000]  r4:c181c534
[   15.910000] [<c0575b84>] (local_bh_enable+0x0/0xb4) from
[<c05a2340>] (rcu_process_callbacks+0x74/0x84)
[   15.910000]  r4:c181c534
[   15.910000] [<c05a22cc>] (rcu_process_callbacks+0x0/0x84) from
[<c05a2414>] (rcu_kthread+0xc4/0xec)
[   15.910000]  r5:c182a000 r4:c1815040
[   15.910000] [<c05a2350>] (rcu_kthread+0x0/0xec) from [<c05889c0>]
(kthread+0x88/0x90)
[   15.910000] [<c0588938>] (kthread+0x0/0x90) from [<c05737c0>]
(do_exit+0x0/0x614)
[   15.910000]  r7:00000013 r6:c05737c0 r5:c0588938 r4:c1819f44
[   15.910000] Code: e52de004 e1a0c002 e1a0e002 e2511040 (a8a0500c)
[   16.220000] ---[ end trace 6c8392cc6073f822 ]---
[   16.220000] Kernel panic - not syncing: Fatal exception in interrupt
