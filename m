Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LKVHH-00010r-BM
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 10:04:46 +0000
Date: Wed, 7 Jan 2009 11:04:04 +0100
From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
To: Jonathan Cameron <jic23@cam.ac.uk>
Subject: Re: jffs2, 2.6.28-git8 : Weird problem.
Message-ID: <20090107110404.1f4cc284@hskinnemoen-d830>
In-Reply-To: <4963BAD4.50803@cam.ac.uk>
References: <4963BAD4.50803@cam.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jonathan Cameron wrote:
> Having applied a few board specific patches on top of
> Linus' tree (around 2.6.28-git8)
> run into the following.
> 
> Anyone have an ideas or seeing anything similar?

Yes, I think the same thing just happened on my avr32 board
(ATSTK1006)...see below.

> Works fine on 2.6.28 so git bisection underway, but
> will take a while given speed of flashing this device
> (intelmote 2)

Please let me know the result, or if you need any help.

Haavard

Unable to handle kernel NULL pointer dereference at virtual address 00000150
ptbr = 93a9b000 pgd = 93b45000
Oops: Kernel access of bad area, sig: 11 [#1]
FRAME_POINTER chip: 0x01f:0x1e82 rev 2
Modules linked in:
PC is at set_dumpable+0x16/0x5e
LR is at commit_creds+0x86/0x10c
pc : [<9005bfc6>]    lr : [<9002e4fe>]    Not tainted
sp : 93bbff00  r12: 00000000  r11: 00000000
r10: ffffffff  r9 : 00000000  r8 : 00000150
r7 : 93bbff00  r6 : 939b9420  r5 : 901eca58  r4 : 00000000
r3 : 939e02e0  r2 : 90021494  r1 : 900a40c4  r0 : 93b52400
Flags: qvnzC
Mode bits: hjmde....G
CPU Mode: Supervisor
Process: jffs2_gcd_mtd1 [281] (task: 939e02e0 thread: 93bbe000)
Stack: (0x93bbff00 to 0x93bc0000)
ff00: 9002e4fe 93bbff14 939b9420 901eca58 00000000 90021b00 93bbff44 93bbe000 
ff20: 901ea8b0 00000000 00000000 90021494 900a40c4 93b52400 ffffffff ffffffff 
ff40: 93bbff58 900a40da 93bbffdc 00000000 93b52400 00000000 00000001 038e300c 
ff60: b3ec22cd 11c4148c b11833cc 338d19ec 77ca338c 734831ec 23dc63cc 33ec334c 
ff80: 33cc33cd 338c30cc 37cc338c b3fcb68d 9001be6c 93bbffa4 90204640 939e05c0 
ffa0: 93b5248c 90014166 93badcfc 90204640 939e05c0 93b5248c 00400000 900180e0 
ffc0: 900180e0 93bc0000 00000000 00000000 00000000 00000000 00000000 90021494 
ffe0: 00000000 00000000 00000000 00000000 00000000 90021494 900a40c4 93b52400 
Call trace:
 [<9002e4fe>] commit_creds+0x86/0x10c
 [<90021b00>] daemonize+0x14c/0x16c
 [<900a40da>] jffs2_garbage_collect_thread+0x16/0x108
 [<90021494>] do_exit+0x0/0x488
