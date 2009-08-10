Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MaPQM-0001P1-B9
	for linux-mtd@lists.infradead.org; Mon, 10 Aug 2009 07:36:10 +0000
Subject: Re: [patch for 2.6.31? 1/1] mtd: m25p80: fix null pointer
	dereference bug
From: Artem Bityutskiy <dedekind1@gmail.com>
To: akpm@linux-foundation.org
In-Reply-To: <200908062218.n76MIc40023062@imap1.linux-foundation.org>
References: <200908062218.n76MIc40023062@imap1.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 10 Aug 2009 10:33:45 +0300
Message-Id: <1249889625.19638.11.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: david-b@pacbell.net, linux-mtd@lists.infradead.org,
	avorontsov@ru.mvista.com, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-08-06 at 15:18 -0700, akpm@linux-foundation.org wrote:
> From: Anton Vorontsov <avorontsov@ru.mvista.com>
> 
> This patch fixes the following oops, observed with MTD_PARTITIONS=n:
> 
> m25p80 spi32766.0: m25p80 (1024 Kbytes)
> Unable to handle kernel paging request for data at address 0x00000008
> Faulting instruction address: 0xc03a54b0
> Oops: Kernel access of bad area, sig: 11 [#1]
> Modules linked in:
> NIP: c03a54b0 LR: c03a5494 CTR: c01e98b8
> REGS: ef82bb60 TRAP: 0300   Not tainted  (2.6.31-rc4-00167-g4733fd3)
> MSR: 00029000 <EE,ME,CE>  CR: 24022022  XER: 20000000
> DEAR: 00000008, ESR: 00000000
> TASK = ef82c000[1] 'swapper' THREAD: ef82a000
> GPR00: 00000000 ef82bc10 ef82c000 0000002e 00001eb8 ffffffff c01e9824 00000036
> GPR08: c054ed40 c0542a08 00001eb8 00004000 22022022 1001a1a0 3ff8fd00 00000000
> GPR16: 00000000 00000001 00000000 00000000 ef82bddc c0530000 efbef500 ef8356d0
> GPR24: 00000000 ef8356d0 00000000 efbf7a00 c0530ec4 ffffffed efbf5300 c0541f98
> NIP [c03a54b0] m25p_probe+0x22c/0x354
> LR [c03a5494] m25p_probe+0x210/0x354
> Call Trace:
> [ef82bc10] [c03a5494] m25p_probe+0x210/0x354 (unreliable)
> [ef82bca0] [c024e37c] spi_drv_probe+0x2c/0x3c
> [ef82bcb0] [c01f1afc] driver_probe_device+0xa4/0x178
> [ef82bcd0] [c01f06e8] bus_for_each_drv+0x6c/0xa8
> [ef82bd00] [c01f1a34] device_attach+0x84/0xa8
> ...
> 
> Signed-off-by: Anton Vorontsov <avorontsov@ru.mvista.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: David Brownell <david-b@pacbell.net>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

This one is in my l2-mtd-2.6.git now.
-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
