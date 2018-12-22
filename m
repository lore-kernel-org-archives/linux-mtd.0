Received: from mail236c50.megamailservers.eu ([91.136.10.246]
 helo=mail56c50.megamailservers.eu)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gagmy-0004Ob-Lc
 for linux-mtd@lists.infradead.org; Sat, 22 Dec 2018 12:53:58 +0000
Subject: Re: [PATCH v2] mtd: rawnand: nandsim: Add support to disable subpage
 writes.
To: linux-mtd@lists.infradead.org
References: <20181222124008.28046-1-ken@kenjo.org>
Cc: richard.weinberger@gmail.com
From: Kenneth Johansson <ken@kenjo.org>
Message-ID: <10756fcb-b284-5465-ed5c-8251cb00d9c2@kenjo.org>
Date: Sat, 22 Dec 2018 13:53:39 +0100
MIME-Version: 1.0
In-Reply-To: <20181222124008.28046-1-ken@kenjo.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

So there was a comment from Richard on the original patch that got 
mangled so it did not even have a subject line.

The original intent for this patch was to make it possible to setup the 
simulator with the same parameters as some real hardware.
That is the command "mtdinfo /dev/mtdX" would show the same on the 
simulator as the real hardware.

It's true that you could change the vid offset with ubiattach but that 
require you know that the LEB missmatch error you get is fixed by a 
different vid offset and you need to understand what that value should be.
This way you only need to match the basic mtd parameters and the rest 
will just work automatically.


On 2018-12-22 13:40, Kenneth Johansson wrote:
> This is needed if you try to use an already existing ubifs image that
> is created for hardware that do not support subpage write.
>
> It is not enough that you can select what nandchip to emulate as the
> subpage support might not exist in the actual nand driver.
>
> Signed-off-by: Kenneth Johansson <ken@kenjo.org>
> ---
>   drivers/mtd/nand/raw/nandsim.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
> index c452819..3e9eaa2 100644
> --- a/drivers/mtd/nand/raw/nandsim.c
> +++ b/drivers/mtd/nand/raw/nandsim.c
> @@ -110,6 +110,7 @@ static unsigned int overridesize = 0;
>   static char *cache_file = NULL;
>   static unsigned int bbt;
>   static unsigned int bch;
> +static unsigned int no_subpage;
>   static u_char id_bytes[8] = {
>   	[0] = CONFIG_NANDSIM_FIRST_ID_BYTE,
>   	[1] = CONFIG_NANDSIM_SECOND_ID_BYTE,
> @@ -142,6 +143,7 @@ module_param(overridesize,   uint, 0400);
>   module_param(cache_file,     charp, 0400);
>   module_param(bbt,	     uint, 0400);
>   module_param(bch,	     uint, 0400);
> +module_param(no_subpage,     uint, 0400);
>   
>   MODULE_PARM_DESC(id_bytes,       "The ID bytes returned by NAND Flash 'read ID' command");
>   MODULE_PARM_DESC(first_id_byte,  "The first byte returned by NAND Flash 'read ID' command (manufacturer ID) (obsolete)");
> @@ -177,6 +179,7 @@ MODULE_PARM_DESC(cache_file,     "File to use to cache nand pages instead of mem
>   MODULE_PARM_DESC(bbt,		 "0 OOB, 1 BBT with marker in OOB, 2 BBT with marker in data area");
>   MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
>   				 "be correctable in 512-byte blocks");
> +MODULE_PARM_DESC(no_subpage,	 "Disable use of subpage write");
>   
>   /* The largest possible page size */
>   #define NS_LARGEST_PAGE_SIZE	4096
> @@ -2260,6 +2263,10 @@ static int __init ns_init_module(void)
>   	/* and 'badblocks' parameters to work */
>   	chip->options   |= NAND_SKIP_BBTSCAN;
>   
> +	/* turn off subpage to be able to simulate using a nand controller without subpage support */
> +	if (no_subpage)
> +		chip->options   |= NAND_NO_SUBPAGE_WRITE;
> +
>   	switch (bbt) {
>   	case 2:
>   		 chip->bbt_options |= NAND_BBT_NO_OOB;
