Received: from mail-ie0-x236.google.com ([2607:f8b0:4001:c03::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5K9l-00011C-Lg
 for linux-mtd@lists.infradead.org; Mon, 20 Jan 2014 19:05:11 +0000
Received: by mail-ie0-f182.google.com with SMTP id lx4so1659084iec.41
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jan 2014 11:04:47 -0800 (PST)
Date: Mon, 20 Jan 2014 11:04:41 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] mtd: nand_ids: Add device parameters for Toshiba's
 TC58NVG1S3ETAI0 NAND EEPROM
Message-ID: <20140120190441.GJ8919@ld-irv-0074>
References: <1389089083-29694-1-git-send-email-sr@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1389089083-29694-1-git-send-email-sr@denx.de>
Cc: linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 07, 2014 at 11:04:43AM +0100, Stefan Roese wrote:
> Toshiba's TC58NVG1S3ETAI0 is a single 3.3V 2 Gbit (2,214,592,512 bits) NAND
> Electrically Erasable and Programmable Read-Only Memory (NAND E2PROM)
> organized as (2048 + 64) bytes x 64 pages x 2048 blocks.
> 
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Pekon Gupta <pekon@ti.com>
> Cc: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/nand/nand_ids.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
> index a87b0a3..cb4ece3 100644
> --- a/drivers/mtd/nand/nand_ids.c
> +++ b/drivers/mtd/nand/nand_ids.c
> @@ -31,6 +31,9 @@ struct nand_flash_dev nand_flash_ids[] = {
>  	 * listed by full ID. We list them first so that we can easily identify
>  	 * the most specific match.
>  	 */
> +	{"TC58NVG1S3ETAI0 2G 3.3V 8-bit",
> +		{ .id = {0x98, 0xda, 0x90, 0x15, 0x76, 0x00, 0x00, 0x00} },
> +		  SZ_2K, SZ_256, SZ_128K, 0, 5, 64, NAND_ECC_INFO(1, SZ_512) },

I have to NAK this in its current form, for two reasons:

1) This is not a specific enough ID string. It conflicts with another
NAND which was recently supported.

2) This patch may not really be needed at all. The "full ID" listing is
only for NAND which can't be detected via other means (e.g., ONFI, or
traditional extended ID parsing). Is this NAND mis-detected in Linus'
current tree? As I read the code, it should correctly identify this
NAND's device size, page size, OOB size, etc.

See this commit for reference:

commit 60c6738245612df9499b340c15edf48b8f3e7981
Author: Brian Norris <computersforpeace@gmail.com>
Date:   Tue Jun 25 13:17:59 2013 -0700

    mtd: nand: detect OOB size for Toshiba 24nm raw SLC

   https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=60c6738245612df9499b340c15edf48b8f3e7981

It adds support for a class of Toshiba 24nm NAND, including this one:

    24nm SLC 2Gbit TC58NVG1S3HTA00
    ID: 0x98 0xda 0x90 0x15 0x76 0x16 0x08 0x00

Please reconcile your patch with the comments found there.

>  	{"TC58NVG2S0F 4G 3.3V 8-bit",
>  		{ .id = {0x98, 0xdc, 0x90, 0x26, 0x76, 0x15, 0x01, 0x08} },
>  		  SZ_4K, SZ_512, SZ_256K, 0, 8, 224, NAND_ECC_INFO(4, SZ_512) },

Thanks,
Brian
