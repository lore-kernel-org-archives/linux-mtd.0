Received: from mail-vc0-x22e.google.com ([2607:f8b0:400c:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgCdU-0003Hh-A7
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 12:00:01 +0000
Received: by mail-vc0-f174.google.com with SMTP id ld13so4156979vcb.33
 for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2013 03:59:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1384230188-29585-1-git-send-email-b32955@freescale.com>
References: <1384230188-29585-1-git-send-email-b32955@freescale.com>
Date: Tue, 12 Nov 2013 09:59:38 -0200
Message-ID: <CAOMZO5A26K9tMPEjRMoMP9ZEAsiV_kwGYO5NX=5uA3nF=zn7Zw@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: gpmi: fix the NULL pointer
From: Fabio Estevam <festevam@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=UTF-8
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, stable@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 12, 2013 at 2:23 AM, Huang Shijie <b32955@freescale.com> wrote:
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

Tested-by: Fabio Estevam <fabio.estevam@freescale.com>

Thanks
