Message-ID: <552EDA42.7070700@gmail.com>
Date: Wed, 15 Apr 2015 23:38:10 +0200
From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
To: Antoine Tenart <antoine.tenart@free-electrons.com>,
 ezequiel.garcia@free-electrons.com, dwmw2@infradead.org,
 computersforpeace@gmail.com
Subject: Re: [PATCH v4 05/10] mtd: nand: add Samsung K9GBG08U0A-M to nand_ids
 table
References: <1429118648-19416-1-git-send-email-antoine.tenart@free-electrons.com>
 <1429118648-19416-6-git-send-email-antoine.tenart@free-electrons.com>
In-Reply-To: <1429118648-19416-6-git-send-email-antoine.tenart@free-electrons.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: zmxu@marvell.com, boris.brezillon@free-electrons.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 jszhang@marvell.com, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15.04.2015 19:24, Antoine Tenart wrote:
> Add the full description of the Samsung K9GBG08U0A-M nand chip in the
> nand_ids table.
>
> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> ---
>   drivers/mtd/nand/nand_ids.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
> index dd620c19c619..500c33e1db06 100644
> --- a/drivers/mtd/nand/nand_ids.c
> +++ b/drivers/mtd/nand/nand_ids.c
> @@ -50,6 +50,10 @@ struct nand_flash_dev nand_flash_ids[] = {
>   		{ .id = {0xad, 0xde, 0x94, 0xda, 0x74, 0xc4} },
>   		  SZ_8K, SZ_8K, SZ_2M, 0, 6, 640, NAND_ECC_INFO(40, SZ_1K),
>   		  4 },
> +	{"NAND 4GiB 3,3V 8-bit",
> +		{ .id = {0xec, 0xd7, 0x94, 0x76, 0x64, 0x43}, },
> +		  8192, 4096, SZ_1M, LP_OPTIONS, 0, 0, NAND_ECC_INFO(40, SZ_1K),
> +		  4 },

According to the datasheet p.50, ECC_INFO() could also be parsed from
byte 5 bits [6:4] of EXT_ID.

I tried to catch up with the onfi_timing_mode_default discussion but
failed. Can someone please put me in the picture if we are going to add
full_id chips just because of the equivalent onfi timing mode? Or is it
safe to assume that all 0xd7 chips are mode 4 compatible?

Sebastian

>
>   	LEGACY_ID_NAND("NAND 4MiB 5V 8-bit",   0x6B, 4, SZ_8K, SP_OPTIONS),
>   	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE3, 4, SZ_8K, SP_OPTIONS),
>
