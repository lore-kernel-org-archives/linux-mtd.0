Date: Tue, 20 Jan 2015 12:31:44 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH] mtd: atmel_nand: check NFC busy flag by HSMC_SR instead
 of NFC cmd regs
Message-ID: <20150120203144.GN9759@ld-irv-0074>
References: <1421318753-14960-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1421318753-14960-1-git-send-email-josh.wu@atmel.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 15, 2015 at 06:45:53PM +0800, Josh Wu wrote:

Was this written by Boris? If so, then it needs a 'From:' line at the
start of the body. (Make sure 'Author' is correct in git, then
git-format-patch/git-send-email will get it right for you.)

> Currently the driver read NFC command registers to get NFC busy flag.
> Actually this flag also can be get by reading HSMC_SR register.
> 
> Use the read NFC command registers need mapping a huge memory region.
> To save the mapped memory region, we change to check NFC busy flag by
> reading HSMC_SR register.

Are we actually saving anything yet? You didn't change the requested
region yet.

> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Acked-by: Josh Wu <josh.wu@atmel.com>

Since this is passing through your hands, Josh, it should be
'Signed-off-by' not 'Acked-by'.

> ---
> 
>  drivers/mtd/nand/atmel_nand.c     | 3 +--
>  drivers/mtd/nand/atmel_nand_nfc.h | 1 +
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index 3853597..125330b 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -1699,8 +1699,7 @@ static int nfc_send_command(struct atmel_nand_host *host,
>  		cmd, addr, cycle0);
>  
>  	timeout = jiffies + msecs_to_jiffies(NFC_TIME_OUT_MS);
> -	while (nfc_cmd_readl(NFCADDR_CMD_NFCBUSY, host->nfc->base_cmd_regs)
> -			& NFCADDR_CMD_NFCBUSY) {
> +	while (nfc_readl(host->nfc->hsmc_regs, SR) & NFC_SR_BUSY) {
>  		if (time_after(jiffies, timeout)) {
>  			dev_err(host->dev,
>  				"Time out to wait CMD_NFCBUSY ready!\n");

Change the timeout text?

> diff --git a/drivers/mtd/nand/atmel_nand_nfc.h b/drivers/mtd/nand/atmel_nand_nfc.h
> index 85b8ca6..4d5d262 100644
> --- a/drivers/mtd/nand/atmel_nand_nfc.h
> +++ b/drivers/mtd/nand/atmel_nand_nfc.h
> @@ -35,6 +35,7 @@
>  #define		NFC_CTRL_DISABLE	(1 << 1)
>  
>  #define ATMEL_HSMC_NFC_SR	0x08		/* NFC Status Register */
> +#define		NFC_SR_BUSY		(1 << 8)
>  #define		NFC_SR_XFR_DONE		(1 << 16)
>  #define		NFC_SR_CMD_DONE		(1 << 17)
>  #define		NFC_SR_DTOE		(1 << 20)

Brian
