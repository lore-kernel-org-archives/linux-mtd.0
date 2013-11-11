Received: from mail-ie0-x233.google.com ([2607:f8b0:4001:c03::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vfx9v-0002Qm-PB
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2013 19:28:28 +0000
Received: by mail-ie0-f179.google.com with SMTP id u16so4878516iet.24
 for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2013 11:28:06 -0800 (PST)
Date: Mon, 11 Nov 2013 11:27:59 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2] mtd: gpmi: Fix NULL pointer dereference
Message-ID: <20131111192759.GG20061@ld-irv-0074.broadcom.com>
References: <1384197222-23783-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1384197222-23783-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, b32955@freescale.com,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 11, 2013 at 05:13:41PM -0200, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> Currently mx23_check_transcription_stamp() uses chip->buffers->databuf
> as its buffer, which is allocated by nand_scan_tail().
> 
> Since commit 720e7ce5 ("mtd: gpmi: remove the nand_scan()"), 
> mx23_check_transcription_stamp() is called before nand_scan_tail(), which causes
> a NULL pointer dereference:
> 
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
> 
> In order to fix this problem, allocate the buffer locally via kzalloc().
> 
> Also, as mx23_check_transcription_stamp() can return en error code now, adapt
> the logic in mx23_boot_init() to take this into account.
> 
> Cc: <stable@vger.kernel.org> # 3.12
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
> Changes since v1:
> - Drop sizeof(*buffer) from size calculatio in kzalloc (Brian Norris)
> - Propagate the error if mx23_check_transcription_stamp returns a negative
> error code (Brian Norris)

Signed-off-by: Brian Norris <computersforpeace@gmail.com>

I'll give Huang a chance to comment before pulling this in.

Thanks,
Brian
