Received: from mail-oa0-x232.google.com ([2607:f8b0:4003:c02::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeqDl-0001bZ-4M
 for linux-mtd@lists.infradead.org; Fri, 08 Nov 2013 17:51:50 +0000
Received: by mail-oa0-f50.google.com with SMTP id j17so2717595oag.23
 for <linux-mtd@lists.infradead.org>; Fri, 08 Nov 2013 09:51:25 -0800 (PST)
Date: Fri, 8 Nov 2013 09:51:19 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 1/2] mtd: gpmi: fix the NULL pointer
Message-ID: <20131108175119.GA20061@ld-irv-0074.broadcom.com>
References: <1383817597-31992-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1383817597-31992-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, stable@vger.kernel.org,
 festevam@gmail.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 07, 2013 at 05:46:36PM +0800, Huang Shijie wrote:
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
> This patch uses the local array(whose size is 4 bytes) to replace
> the referencing of the @chip->buffers->databuf.
> 
> Use the macro FINGERPRINT_LEN to avoid the hardcode.
> 
> Cc: stable@vger.kernel.org 

This is only for 3.12+, right, since we changed around the
nand_scan_tail() behavior? (commit
f720e7ce510bf79f029be45ce200ccfce5551280)

> Reported-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 7ac2280..d34cc54 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1343,6 +1343,7 @@ static int nand_boot_set_geometry(struct gpmi_nand_data *this)
>  }
>  
>  static const char  *fingerprint = "STMP";
> +#define FINGERPRINT_LEN		4
>  static int mx23_check_transcription_stamp(struct gpmi_nand_data *this)
>  {
>  	struct boot_rom_geometry *rom_geo = &this->rom_geometry;
> @@ -1352,7 +1353,7 @@ static int mx23_check_transcription_stamp(struct gpmi_nand_data *this)
>  	unsigned int search_area_size_in_strides;
>  	unsigned int stride;
>  	unsigned int page;
> -	uint8_t *buffer = chip->buffers->databuf;
> +	uint8_t buffer[FINGERPRINT_LEN + 1];

I agree with Fabio; we don't actually need the +1. (Of course, saving 1
byte is not that much of a problem. But making the code more
straightforward is.) If you "ack" I'll just drop the +1 myself.

>  	int saved_chip_number;
>  	int found_an_ncb_fingerprint = false;
>  

Thanks for looking into this quickly, BTW.

Brian
