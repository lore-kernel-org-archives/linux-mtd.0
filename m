Received: from mail-qc0-x232.google.com ([2607:f8b0:400d:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoJoo-0001G2-SX
 for linux-mtd@lists.infradead.org; Wed, 04 Dec 2013 21:17:15 +0000
Received: by mail-qc0-f178.google.com with SMTP id i17so3995700qcy.23
 for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2013 13:16:53 -0800 (PST)
Date: Wed, 4 Dec 2013 13:16:41 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Denis Carikli <denis@eukrea.com>
Subject: Re: [PATCHv2][] mtd: nand: mxc_nand: Add onfi & 4k flashs support.
Message-ID: <20131204211641.GA27149@ld-irv-0074.broadcom.com>
References: <1385565786-29705-1-git-send-email-denis@eukrea.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1385565786-29705-1-git-send-email-denis@eukrea.com>
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Denis,

On Wed, Nov 27, 2013 at 04:23:05PM +0100, Denis Carikli wrote:
>  * CMD_PARAM and read_param were added to get the ONFI structure.
>  * Fixed OOB size for flash with 224 OOB on i.MX51/3
> 
> Tested on an i.MX53 with:
> NAND device: Manufacturer ID: 0x2c, Chip ID: 0x38 (Micron MT29F8G08ABABAWP)
> NAND device: 1024MiB, SLC, page size: 4096, OOB size: 224
> 
> This patch was ported from that barebox commit:
>   632c457 nand_imx: update to support onfi & 4k flashs
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Signed-off-by: Denis Carikli <denis@eukrea.com>
> Signed-off-by: Eric Bénard <eric@eukrea.com>

I get several compiler and sparse warnings with this patch:

--- before_patching.log
+++ after_patching.log
@@ @@
+drivers/mtd/nand/mxc_nand.c:543:13: warning: 'send_read_param_v1_v2' defined but not used [-Wunused-function]
+drivers/mtd/nand/mxc_nand.c:556:36: warning: incorrect type in initializer (different address spaces) [sparse]
+drivers/mtd/nand/mxc_nand.c:556:36:    expected unsigned short [usertype] *mainbuf [sparse]
+drivers/mtd/nand/mxc_nand.c:556:36:    got void [noderef] <asn:2>*main_area0 [sparse]

> ---
> ChangeLog v1->v2:
> - Better commit message title.
> ---
>  drivers/mtd/nand/mxc_nand.c |   68 +++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 63 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index 9dfdb06..68c107c 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -529,6 +530,44 @@ static void send_page_v1(struct mtd_info *mtd, unsigned int ops)
>  	}
>  }
>  
> +static void send_read_param_v3(struct mxc_nand_host *host)
> +{
> +	/* Read ID into main buffer */
> +	writel(NFC_OUTPUT, NFC_V3_LAUNCH);
> +
> +	wait_op_done(host, true);
> +
> +	memcpy32_fromio(host->data_buf, host->main_area0, 1024);
> +}
> +
> +static void send_read_param_v1_v2(struct mxc_nand_host *host)

This function is not used in this patch. I think you left out the
'send_read_param' callback assignment for v1/v2. Did you actually test
this code?

> +{
> +	struct nand_chip *this = &host->nand;
> +
> +	/* NANDFC buffer 0 is used for device ID output */
> +	writew(0x0, NFC_V1_V2_BUF_ADDR);
> +
> +	writew(NFC_OUTPUT, NFC_V1_V2_CONFIG2);
> +
> +	/* Wait for operation to complete */
> +	wait_op_done(host, true);
> +
> +	if (this->options & NAND_BUSWIDTH_16) {
> +		u16 *mainbuf = host->main_area0;

You get a sparse warning here because you're dropping the __iomem
specifier. This hints at the following problem...

> +
> +		/*
> +		 * Pack the every-other-byte result for 16-bit ID reads
> +		 * into every-byte as the generic code expects and various
> +		 * chips implement.
> +		 */
> +
> +		mainbuf[0] = (mainbuf[0] & 0xff) | ((mainbuf[1] & 0xff) << 8);
> +		mainbuf[1] = (mainbuf[2] & 0xff) | ((mainbuf[3] & 0xff) << 8);
> +		mainbuf[2] = (mainbuf[4] & 0xff) | ((mainbuf[5] & 0xff) << 8);

You need to use IO accessors for this (like readl/writel or
io{read,write}{8,16,32}).

But really, what are you trying to do here? Is this a hack for a
hardware quirk, or is this just trying to hack the NAND-layer issues
that we still have with ONFI and NAND_BUSWIDTH_16?

At a minimum, it seems like you shouldn't be packing 'mainbuf' back into
'mainbuf', but should just copy it straight to host->data_buf instead.
But I think this code needs a more careful explanation first.

> +	}
> +	memcpy32_fromio(host->data_buf, host->main_area0, 1024);
> +}
> +
>  static void send_read_id_v3(struct mxc_nand_host *host)
>  {
>  	struct nand_chip *this = &host->nand;
> @@ -748,6 +787,10 @@ static void mxc_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
>  
>  	n = min(n, len);
>  
> +	/* handle the read param special case */
> +	if ((mtd->writesize == 0) && (len != 0))
> +		n = len;
> +

This is a bad hack. It seems like you should just be recording the size
of host->data_buf as host->data_buf_size instead of this funky logic
which tries to avoid overflows using knowledge of the page size.

>  	memcpy(buf, host->data_buf + col, n);
>  
>  	host->buf_start += n;
> @@ -841,9 +884,12 @@ static void mxc_do_addr_cycle(struct mtd_info *mtd, int column, int page_addr)
>  		 * MXC NANDFC can only perform full page+spare or
>  		 * spare-only read/write.  When the upper layers
>  		 * perform a read/write buf operation, the saved column
> -		  * address is used to index into the full page.
> +		 * address is used to index into the full page.
> +		 *
> +		 * The colum address must be sent to the flash in
> +		 * order to get the ONFI header (0x20)
>  		 */
> -		host->devtype_data->send_addr(host, 0, page_addr == -1);
> +		host->devtype_data->send_addr(host, column, page_addr == -1);
>  		if (mtd->writesize > 512)
>  			/* another col addr cycle for 2k page */
>  			host->devtype_data->send_addr(host, 0, false);
> @@ -997,9 +1043,11 @@ static void preset_v3(struct mtd_info *mtd)
>  
>  	writel(0, NFC_V3_IPC);
>  
> +	/* if the flash has a 224 oob, the NFC must be configured to 218 */
>  	config2 = NFC_V3_CONFIG2_ONE_CYCLE |
>  		NFC_V3_CONFIG2_2CMD_PHASES |
> -		NFC_V3_CONFIG2_SPAS(mtd->oobsize >> 1) |
> +		NFC_V3_CONFIG2_SPAS(((mtd->oobsize > 218) ?
> +			218 : mtd->oobsize) >> 1) |

min(mtd->oobsize, 218) >> 1

>  		NFC_V3_CONFIG2_ST_CMD(0x70) |
>  		NFC_V3_CONFIG2_INT_MSK |
>  		NFC_V3_CONFIG2_NUM_ADDR_PHASE0;

Brian
