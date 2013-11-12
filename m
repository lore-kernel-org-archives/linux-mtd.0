Received: from mail-ob0-x22c.google.com ([2607:f8b0:4003:c01::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vg4VG-0001RO-Mt
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 03:18:59 +0000
Received: by mail-ob0-f172.google.com with SMTP id wm4so5345548obc.3
 for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2013 19:18:37 -0800 (PST)
Date: Mon, 11 Nov 2013 19:18:33 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH V2] mtd: gpmi: fix the NULL pointer
Message-ID: <20131112031833.GI20061@ld-irv-0074.broadcom.com>
References: <20131108175119.GA20061@ld-irv-0074.broadcom.com>
 <1384166419-23568-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1384166419-23568-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, stable@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,

On Mon, Nov 11, 2013 at 06:40:19PM +0800, Huang Shijie wrote:
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
> This patch does two things:
>  1.) Allocates the @chip->buffers itself, and set the NAND_OWN_BUFFERS
>      for chip->options.
>  2.) Also initialize the @chip->oob_poi which is used by the
>      mx23_write_transcription_stamp(). We replace the @chip->ecc.write_page_raw
>      with chip->write_buf, since the the @chip->ecc.write_page_raw is
>      initialize in the nand_scan_tail() too. If we not do so, we will meet
>      a NULL pointer too.

It seems like your GPMI init structure is yet again trying to circumvent
nand_base. I think there is a better solution that can help you avoid
working around things that *should* be initialized in nand_scan_tail.
I'll explain.

Your current init sequence consists of the following:

 |_ nand_scan_ident
 |_ nand_init_last
   |_ gpmi_init_last
     |_ gpmi_pre_bbt_scan
       |_ gpmi_set_geometry
       |_ nand_boot_init
         |_ mx23_boot_init
           |_ mx23_check_transcription_stamp (*)
           |_ mx23_write_transcription_stamp (*)
 |_ nand_scan_tail

The (*) portions are incorrect right now. But they also seem to be
related to bad block scanning, not the initial configuration of the
device. Furthermore, they depend on some functionality of
nand_scan_tail.

So I would recommend the following: set the NAND_SKIP_BBTSCAN, then
rearrange to the following call structure:

 |_ nand_scan_ident
 |_ chip->options |= NAND_SKIP_BBTSCAN;
 |_ nand_init_last
   |_ gpmi_init_last [1]
     |_ gpmi_set_geometry
 |_ nand_scan_tail
 |_ gpmi_pre_bbt_scan [2]
   |_ nand_boot_init
     |_ mx23_boot_init
       |_ mx23_check_transcription_stamp
       |_ mx23_write_transcription_stamp
 |_ chip->scan_bbt() [3]

Regarding [1] and [2]: we can split apart the code from gpmi_init_last()
so that have the stuff that is *only* necessary to do before [3] placed
under [2]. That way, nand_scan_tail() will initialize remaining pieces,
and all you have to do is configure and run your BBT scan. No more
dancing around uninitialized callback functions or buffers.

What do you think?

Brian
