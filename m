Received: from mail-ob0-x22f.google.com ([2607:f8b0:4003:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgJ1B-0007bn-9z
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 18:48:54 +0000
Received: by mail-ob0-f175.google.com with SMTP id va2so6326139obc.20
 for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2013 10:48:32 -0800 (PST)
Date: Tue, 12 Nov 2013 10:43:04 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3] mtd: gpmi: fix the NULL pointer
Message-ID: <20131112184304.GL20061@ld-irv-0074.broadcom.com>
References: <1384230188-29585-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1384230188-29585-1-git-send-email-b32955@freescale.com>
Cc: fabio.estevam@freescale.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, stable@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 12, 2013 at 12:23:08PM +0800, Huang Shijie wrote:
> The imx23 board will check the fingerprint, so it will call the
> mx23_check_transcription_stamp. This function will use @chip->buffers->databuf
> as its buffer which is allocated in the nand_scan_tail().
> 
> Unfortunately, the mx23_check_transcription_stamp is called before the
> nand_scan_tail(). So we will meet a NULL pointer bug:
> 
> --------------------------------------------------------------------
> [    1.150000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xd7 (Samsung NAND 4GiB 3,3V 8-bit), 4096MiB, page size: 4096, OOB size: 8
> [    1.160000] Unable to handle kernel NULL pointer dereference at virtual address 000005d0
> [    1.170000] pgd = c0004000
> [    1.170000] [000005d0] *pgd=00000000
> [    1.180000] Internal error: Oops: 5 [#1] ARM
> [    1.180000] Modules linked in:
> [    1.180000] CPU: 0 PID: 1 Comm: swapper Not tainted 3.12.0 #89
> [    1.180000] task: c7440000 ti: c743a000 task.ti: c743a000
> [    1.180000] PC is at memcmp+0x10/0x54
> [    1.180000] LR is at gpmi_nand_probe+0x42c/0x894
> [    1.180000] pc : [<c025fcb0>]    lr : [<c02f6a68>]    psr: 20000053
> [    1.180000] sp : c743be2c  ip : 600000d3  fp : ffffffff
> [    1.180000] r10: 000005d0  r9 : c02f5f08  r8 : 00000000
> [    1.180000] r7 : c75858a8  r6 : c75858a8  r5 : c7585b18  r4 : c7585800
> [    1.180000] r3 : 000005d0  r2 : 00000004  r1 : c05c33e4  r0 : 000005d0
> [    1.180000] Flags: nzCv  IRQs on  FIQs off  Mode SVC_32  ISA ARM  Segment kernel
> [    1.180000] Control: 0005317f  Table: 40004000  DAC: 00000017
> [    1.180000] Process swapper (pid: 1, stack limit = 0xc743a1c0)
> --------------------------------------------------------------------
> 
> This patch rearrange the init procedure:
>    Set the NAND_SKIP_BBTSCAN to skip the nand scan firstly, and after we
>    set the proper settings, we will call the chip->scan_bbt() manually.
> 
> Cc: stable@vger.kernel.org
> Reported-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Huang Shijie <b32955@freescale.com>

This looks good. Thanks guys. Pushed to l2-mtd.git.

I'm not sure how much sense all your function names make now; for
instance, gpmi_pre_bbt_scan() doesn't have anything to do with the BBT
scan any more, does it?

Brian
