Received: from smtpout.microchip.com ([198.175.253.82]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdaGD-0004Rb-LS
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2017 10:23:05 +0000
Subject: Re: [PATCH] mtd: spi-nor: flash_info table, use a u64 for the ID
To: Marek Vasut <marek.vasut@gmail.com>, <mark.marshall@omicronenergy.com>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
References: <a1113c0c-e0ad-3c22-eddd-c4b75b9b787d@gmail.com>
 <1486994000-32230-1-git-send-email-mark.marshall@omicronenergy.com>
 <615ab746-5c88-44bf-91dc-4a8b4087cacf@gmail.com>
CC: <markmarshall14@gmail.com>, <dwmw2@infradead.org>, <richard@nod.at>,
 <boris.brezillon@free-electrons.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <6839f623-807d-3704-11d6-773263afca9a@atmel.com>
Date: Tue, 14 Feb 2017 11:22:36 +0100
MIME-Version: 1.0
In-Reply-To: <615ab746-5c88-44bf-91dc-4a8b4087cacf@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Le 14/02/2017 à 06:02, Marek Vasut a écrit :
> On 02/13/2017 02:53 PM, mark.marshall@omicronenergy.com wrote:
>> From: Mark Marshall <mark.marshall@omicronenergy.com>
>>
>> The flash_info ID matching table is getting more complex as different
>> chips are added.  Some chips require different amounts of the response
>> to the RDID command to be matched.  Replace the current u8 array and
>> length with a u64 id and a u64 id_mask.  This allows us to simplify the
>> macros used to generate the flash_info table without loosing the ability
>> to generate "unusual" entries.
>>
>> --
>>
>> This patch replaces "m25p80: Use a 512 byte page size for Spansion
>> flash s25fl512s".  It is based on for-linus-20170212, from the
>> linux-mtd tree.
>>

This part should not appear in the commit message hence has to be moved
after the "---" line (after your Signed-off-by tag).

>>
>> Signed-off-by: Mark Marshall <mark.marshall@omicronenergy.com>
> 
> Minor nits below, looks good IMO. I'd still like someone else to review
> this whole idea though. Cyrille ?
> 
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 458 +++++++++++++++++++++---------------------
>>  1 file changed, 231 insertions(+), 227 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 1ae872b..c7ff237 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -41,15 +41,20 @@
>>  #define SPI_NOR_MAX_ADDR_WIDTH	4
>>  
>>  struct flash_info {
>> -	char		*name;
>> +	const char	*name;
>>  
>>  	/*
>> -	 * This array stores the ID bytes.
>> -	 * The first three bytes are the JEDIC ID.
>> -	 * JEDEC ID zero means "no ID" (mostly older chips).
>> +	 * This u64 stores the ID bytes.
>> +	 * The bytes are stored in big-endian order.

I don't agree with this comment: looking at the code, id stores a number
in the CPU order byte, not necessarily in big-endian.

Below in the patch we can find:
#define JEDEC_MFR(info)	((u8)((info)->id >> 56) & 0xff)

So you use the CPU order byte. Also that's why you call
get_unaligned_be64(): to convert the big-endian number read from the SPI
bus into a cpu-ordered u64.

Or maybe I didn't understand what you meant in your comment.

>> +	 * The upper three bytes are the JEDIC ID, the lower bytes are
>> +	 * the extension.
>>  	 */
>> -	u8		id[SPI_NOR_MAX_ID_LEN];
>> -	u8		id_len;
>> +	u64		id;
>> +
>> +	/*
>> +	 * An id_mask of zero means "no ID" (mostly older chips).
>> +	 */
>> +	u64		id_mask;
>>  
>>  	/* The size listed here is what works with SPINOR_OP_SE, which isn't
>>  	 * necessarily called a "sector" by the vendor.
>> @@ -87,7 +92,7 @@ struct flash_info {
>>  					 */
>>  };
>>  
>> -#define JEDEC_MFR(info)	((info)->id[0])
>> +#define JEDEC_MFR(info)	((u8)((info)->id >> 56) & 0xff)
>>  
>>  static const struct flash_info *spi_nor_match_id(const char *name);
>>  
>> @@ -870,55 +875,49 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>>  	return ret;
>>  }
>>  
>> -/* Used when the "_ext_id" is two bytes at most */
>> -#define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
>> -		.id = {							\
>> -			((_jedec_id) >> 16) & 0xff,			\
>> -			((_jedec_id) >> 8) & 0xff,			\
>> -			(_jedec_id) & 0xff,				\
>> -			((_ext_id) >> 8) & 0xff,			\
>> -			(_ext_id) & 0xff,				\
>> -			},						\
>> -		.id_len = (!(_jedec_id) ? 0 : (3 + ((_ext_id) ? 2 : 0))),	\
>> -		.sector_size = (_sector_size),				\
>> -		.n_sectors = (_n_sectors),				\
>> -		.page_size = 256,					\
>> -		.flags = (_flags),
>> -
>> -#define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
>> -		.id = {							\
>> -			((_jedec_id) >> 16) & 0xff,			\
>> -			((_jedec_id) >> 8) & 0xff,			\
>> -			(_jedec_id) & 0xff,				\
>> -			((_ext_id) >> 16) & 0xff,			\
>> -			((_ext_id) >> 8) & 0xff,			\
>> -			(_ext_id) & 0xff,				\
>> -			},						\
>> -		.id_len = 6,						\
>> -		.sector_size = (_sector_size),				\
>> -		.n_sectors = (_n_sectors),				\
>> -		.page_size = 256,					\
>> -		.flags = (_flags),
>> -
>> -#define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_width, _flags)	\
>> -		.sector_size = (_sector_size),				\
>> -		.n_sectors = (_n_sectors),				\
>> -		.page_size = (_page_size),				\
>> -		.addr_width = (_addr_width),				\
>> -		.flags = (_flags),
>> -
>> -#define S3AN_INFO(_jedec_id, _n_sectors, _page_size)			\
>> -		.id = {							\
>> -			((_jedec_id) >> 16) & 0xff,			\
>> -			((_jedec_id) >> 8) & 0xff,			\
>> -			(_jedec_id) & 0xff				\
>> -			},						\
>> -		.id_len = 3,						\
>> -		.sector_size = (8*_page_size),				\
>> -		.n_sectors = (_n_sectors),				\
>> -		.page_size = _page_size,				\
>> -		.addr_width = 3,					\
>> -		.flags = SPI_NOR_NO_FR | SPI_S3AN,
>> +/* Used to provide the full information about a device.
>> + */
> 
> Fix the comment format here , single line comment is enough
> ( /* comment */ )
> 
>> +#define INFO_FULL(_id, _id_mask, _sector_size, _n_sectors, _pg_sz, _addr_width, _flags)	\
>> +	.id = (_id),							\
>> +	.id_mask = (_id_mask),						\
>> +	.sector_size = (_sector_size),					\
>> +	.n_sectors = (_n_sectors),					\
>> +	.page_size = (_pg_sz),						\
>> +	.addr_width = (_addr_width),					\
>> +	.flags = (_flags),
>> +
>> +/* Used to provide information for a standard JEDEC device.  All
>> + * devices created with this macro have a three octet JEDEC identifier
>> + * and an optional extension identifier (normally 0, 2 or 3 octets
>> + * long).
>> + */
> 
> Multi-line comment looks like this:
> 
> /*
>  * foo
>  * bar
>  */
> 
>> +#define INFO(_jedec_id, _ext_id, _ext_len, _sector_size, _n_sectors, _flags) \
>> +	INFO_FULL(((u64)(_jedec_id) << (64 - (8 * 3))) |		\
>> +		  ((u64)(_ext_id) << (64 - (8 * (3 + _ext_len)))),	\

Could it be possible, in the first time at least, to keep the very same
prototype for the INFO() macro as before but still defining it using
your new INFO_FULL() macro?

#define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)

so as if _ext_len is always 3. For different _ext_len values, new
entries can directly use your INFO_FULL() macro.

Also keep CAT25_INFO() for now and simply make it an alias for INFO_NOID().

I would like this patch not to modify any entry of the spi_nor_ids[]
array for now. So if some issue is reported, it would be more easy to
revert and also it would avoid, or at least reduce, conflict with other
patches adding support to new memories.

> 
> Is the u64 cast needed ? I don't think so.
>

Indeed, I'm pretty sure the u64 is needed. For instance long time ago on
x86_64 I wrote something like that (userspace code):

uint64_t v;

v = 1 << 32;

but it didn't provide the right result. So yesterday I tried to have a
look at why it failed and whether things like (info)->id >> 56 would
work on all architectures.

To be confirmed but I found out that for a (var1 << var2) operation, it
seems that the result as the same type as var1. Hence is var1 is a
signed integer like 1 and var2 is greater than 31 the actual result is
unpredictable since the expected result can't be represented with a
signed int. That why I should have written something like:

uint64_t v;

v = 1ull << 32;

That why I think that the u64 cast is actually needed since the INFO()
macro is used with values such as 0x1f6601, which is a signed int too.


>> +		  GENMASK_ULL(63, 64 - (8 * (3 + _ext_len))),		\
> 
> You need parenthesis around _ext_len
> 
>> +		  (_sector_size),					\
>> +		  (_n_sectors),						\
>> +		  256,							\
>> +		  0,							\
>> +		  (_flags))
>> +
>> +#define INFO_NOID(_sector_size, _n_sectors, _page_size, _addr_width, _flags)	\
>> +	INFO_FULL(0,							\
>> +		  0,							\
>> +		  (_sector_size),					\
>> +		  (_n_sectors),						\
>> +		  (_page_size),						\
>> +		  (_addr_width),					\
>> +		  (_flags))
>> +
>> +#define INFO_S3AN(_jedec_id, _n_sectors, _page_size)			\
>> +	INFO_FULL(((u64)(_jedec_id) << (64 - (8 * 3))),			\
>> +		  GENMASK_ULL(63, 64 - (8 * 3)),			\
>> +		  (8*_page_size),					\
>> +		  (_n_sectors),						\
>> +		  (_page_size),						\
>> +		  3,							\
>> +		  SPI_NOR_NO_FR | SPI_S3AN)
>>  
>>  /* NOTE: double check command sets and memory organization when you add
>>   * more nor chips.  This current list focusses on newer chips, which
>> @@ -933,261 +932,266 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>>   */
>>  static const struct flash_info spi_nor_ids[] = {
>>  	/* Atmel -- some are (confusingly) marketed as "DataFlash" */
>> -	{ "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4, SECT_4K) },
>> -	{ "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K) },
>> +	{ "at25fs010",  INFO(0x1f6601, 0, 0, 32 * 1024,   4, SECT_4K) },
>> +	{ "at25fs040",  INFO(0x1f6604, 0, 0, 64 * 1024,   8, SECT_4K) },
>>  
>> -	{ "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8, SECT_4K) },
>> -	{ "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64, SECT_4K) },
>> -	{ "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64, SECT_4K) },
>> -	{ "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128, SECT_4K) },
>> +	{ "at25df041a", INFO(0x1f4401, 0, 0, 64 * 1024,   8, SECT_4K) },
>> +	{ "at25df321",  INFO(0x1f4700, 0, 0, 64 * 1024,  64, SECT_4K) },
>> +	{ "at25df321a", INFO(0x1f4701, 0, 0, 64 * 1024,  64, SECT_4K) },
>> +	{ "at25df641",  INFO(0x1f4800, 0, 0, 64 * 1024, 128, SECT_4K) },
>>  
>> -	{ "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8, SECT_4K) },
>> -	{ "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16, SECT_4K) },
>> -	{ "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32, SECT_4K) },
>> -	{ "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64, SECT_4K) },
>> +	{ "at26f004",   INFO(0x1f0400, 0, 0, 64 * 1024,  8, SECT_4K) },
>> +	{ "at26df081a", INFO(0x1f4501, 0, 0, 64 * 1024, 16, SECT_4K) },
>> +	{ "at26df161a", INFO(0x1f4601, 0, 0, 64 * 1024, 32, SECT_4K) },
>> +	{ "at26df321",  INFO(0x1f4700, 0, 0, 64 * 1024, 64, SECT_4K) },
>>  
>> -	{ "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16, SECT_4K) },
>> +	{ "at45db081d", INFO(0x1f2500, 0, 0, 64 * 1024, 16, SECT_4K) },
>>  
>>  	/* EON -- en25xxx */
>> -	{ "en25f32",    INFO(0x1c3116, 0, 64 * 1024,   64, SECT_4K) },
>> -	{ "en25p32",    INFO(0x1c2016, 0, 64 * 1024,   64, 0) },
>> -	{ "en25q32b",   INFO(0x1c3016, 0, 64 * 1024,   64, 0) },
>> -	{ "en25p64",    INFO(0x1c2017, 0, 64 * 1024,  128, 0) },
>> -	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128, SECT_4K) },
>> -	{ "en25qh128",  INFO(0x1c7018, 0, 64 * 1024,  256, 0) },
>> -	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512, 0) },
>> -	{ "en25s64",	INFO(0x1c3817, 0, 64 * 1024,  128, SECT_4K) },
>> +	{ "en25f32",    INFO(0x1c3116, 0, 0, 64 * 1024,   64, SECT_4K) },
>> +	{ "en25p32",    INFO(0x1c2016, 0, 0, 64 * 1024,   64, 0) },
>> +	{ "en25q32b",   INFO(0x1c3016, 0, 0, 64 * 1024,   64, 0) },
>> +	{ "en25p64",    INFO(0x1c2017, 0, 0, 64 * 1024,  128, 0) },
>> +	{ "en25q64",    INFO(0x1c3017, 0, 0, 64 * 1024,  128, SECT_4K) },
>> +	{ "en25qh128",  INFO(0x1c7018, 0, 0, 64 * 1024,  256, 0) },
>> +	{ "en25qh256",  INFO(0x1c7019, 0, 0, 64 * 1024,  512, 0) },
>> +	{ "en25s64",	INFO(0x1c3817, 0, 0, 64 * 1024,  128, SECT_4K) },
>>  
>>  	/* ESMT */
>> -	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64, SECT_4K | SPI_NOR_HAS_LOCK) },
>> +	{ "f25l32pa", INFO(0x8c2016, 0, 0, 64 * 1024, 64, SECT_4K | SPI_NOR_HAS_LOCK) },
>>  
>>  	/* Everspin */
>> -	{ "mr25h256", CAT25_INFO( 32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>> -	{ "mr25h10",  CAT25_INFO(128 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>> -	{ "mr25h40",  CAT25_INFO(512 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>> +	{ "mr25h256", INFO_NOID( 32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>> +	{ "mr25h10",  INFO_NOID(128 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>> +	{ "mr25h40",  INFO_NOID(512 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>>  
>>  	/* Fujitsu */
>> -	{ "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE) },
>> +	{ "mb85rs1mt", INFO(0x047f27, 0, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE) },
>>  
>>  	/* GigaDevice */
>>  	{
>> -		"gd25q16", INFO(0xc84015, 0, 64 * 1024,  32,
>> +		"gd25q16", INFO(0xc84015, 0, 0, 64 * 1024,  32,
>>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>  			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>>  	},
>>  	{
>> -		"gd25q32", INFO(0xc84016, 0, 64 * 1024,  64,
>> +		"gd25q32", INFO(0xc84016, 0, 0, 64 * 1024,  64,
>>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>  			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>>  	},
>>  	{
>> -		"gd25q64", INFO(0xc84017, 0, 64 * 1024, 128,
>> +		"gd25q64", INFO(0xc84017, 0, 0, 64 * 1024, 128,
>>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>  			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>>  	},
>>  	{
>> -		"gd25lq64c", INFO(0xc86017, 0, 64 * 1024, 128,
>> +		"gd25lq64c", INFO(0xc86017, 0, 0, 64 * 1024, 128,
>>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>  			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>>  	},
>>  	{
>> -		"gd25q128", INFO(0xc84018, 0, 64 * 1024, 256,
>> +		"gd25q128", INFO(0xc84018, 0, 0, 64 * 1024, 256,
>>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>  			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>>  	},
>>  
>>  	/* Intel/Numonyx -- xxxs33b */
>> -	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
>> -	{ "320s33b",  INFO(0x898912, 0, 64 * 1024,  64, 0) },
>> -	{ "640s33b",  INFO(0x898913, 0, 64 * 1024, 128, 0) },
>> +	{ "160s33b",  INFO(0x898911, 0, 0, 64 * 1024,  32, 0) },
>> +	{ "320s33b",  INFO(0x898912, 0, 0, 64 * 1024,  64, 0) },
>> +	{ "640s33b",  INFO(0x898913, 0, 0, 64 * 1024, 128, 0) },
>>  
>>  	/* ISSI */
>> -	{ "is25cd512", INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
>> +	{ "is25cd512", INFO(0x7f9d20, 0, 0, 32 * 1024,   2, SECT_4K) },
>>  
>>  	/* Macronix */
>> -	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
>> -	{ "mx25l2005a",  INFO(0xc22012, 0, 64 * 1024,   4, SECT_4K) },
>> -	{ "mx25l4005a",  INFO(0xc22013, 0, 64 * 1024,   8, SECT_4K) },
>> -	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16, 0) },
>> -	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
>> -	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
>> -	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
>> -	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
>> -	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
>> -	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
>> -	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>> -	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
>> -	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K) },
>> -	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
>> -	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
>> -	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
>> +	{ "mx25l512e",   INFO(0xc22010, 0, 0, 64 * 1024,   1, SECT_4K) },
>> +	{ "mx25l2005a",  INFO(0xc22012, 0, 0, 64 * 1024,   4, SECT_4K) },
>> +	{ "mx25l4005a",  INFO(0xc22013, 0, 0, 64 * 1024,   8, SECT_4K) },
>> +	{ "mx25l8005",   INFO(0xc22014, 0, 0, 64 * 1024,  16, 0) },
>> +	{ "mx25l1606e",  INFO(0xc22015, 0, 0, 64 * 1024,  32, SECT_4K) },
>> +	{ "mx25l3205d",  INFO(0xc22016, 0, 0, 64 * 1024,  64, SECT_4K) },
>> +	{ "mx25l3255e",  INFO(0xc29e16, 0, 0, 64 * 1024,  64, SECT_4K) },
>> +	{ "mx25l6405d",  INFO(0xc22017, 0, 0, 64 * 1024, 128, SECT_4K) },
>> +	{ "mx25u6435f",  INFO(0xc22537, 0, 0, 64 * 1024, 128, SECT_4K) },
>> +	{ "mx25l12805d", INFO(0xc22018, 0, 0, 64 * 1024, 256, 0) },
>> +	{ "mx25l12855e", INFO(0xc22618, 0, 0, 64 * 1024, 256, 0) },
>> +	{ "mx25l25635e", INFO(0xc22019, 0, 0, 64 * 1024, 512, 0) },
>> +	{ "mx25u25635f", INFO(0xc22539, 0, 0, 64 * 1024, 512, SECT_4K) },
>> +	{ "mx25l25655e", INFO(0xc22619, 0, 0, 64 * 1024, 512, 0) },
>> +	{ "mx66l51235l", INFO(0xc2201a, 0, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
>> +	{ "mx66l1g55g",  INFO(0xc2261b, 0, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
>>  
>>  	/* Micron */
>> -	{ "n25q016a",	 INFO(0x20bb15, 0, 64 * 1024,   32, SECT_4K | SPI_NOR_QUAD_READ) },
>> -	{ "n25q032",	 INFO(0x20ba16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
>> -	{ "n25q032a",	 INFO(0x20bb16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
>> -	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
>> -	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
>> -	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
>> -	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
>> -	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
>> -	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>> -	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>> -	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>> -	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>> +	{ "n25q016a",	 INFO(0x20bb15, 0, 0, 64 * 1024,   32, SECT_4K | SPI_NOR_QUAD_READ) },
>> +	{ "n25q032",	 INFO(0x20ba16, 0, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
>> +	{ "n25q032a",	 INFO(0x20bb16, 0, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
>> +	{ "n25q064",     INFO(0x20ba17, 0, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
>> +	{ "n25q064a",    INFO(0x20bb17, 0, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
>> +	{ "n25q128a11",  INFO(0x20bb18, 0, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
>> +	{ "n25q128a13",  INFO(0x20ba18, 0, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
>> +	{ "n25q256a",    INFO(0x20ba19, 0, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
>> +	{ "n25q512a",    INFO(0x20bb20, 0, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>> +	{ "n25q512ax3",  INFO(0x20ba20, 0, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>> +	{ "n25q00",      INFO(0x20ba21, 0, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>> +	{ "n25q00a",     INFO(0x20bb21, 0, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>>  
>>  	/* PMC */
>> -	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
>> -	{ "pm25lv010",   INFO(0,        0, 32 * 1024,    4, SECT_4K_PMC) },
>> -	{ "pm25lq032",   INFO(0x7f9d46, 0, 64 * 1024,   64, SECT_4K) },
>> +	{ "pm25lv512",   INFO_NOID(32 * 1024,    2, 256, 0, SECT_4K_PMC) },
>> +	{ "pm25lv010",   INFO_NOID(32 * 1024,    4, 256, 0, SECT_4K_PMC) },
>> +	{ "pm25lq032",   INFO(0x7f9d46, 0, 0, 64 * 1024,   64, SECT_4K) },
>>  
>>  	/* Spansion -- single (large) sector size only, at least
>>  	 * for the chips listed here (without boot sectors).
>>  	 */
>> -	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>> -	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>> -	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, 0) },
>> -	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>> -	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>> -	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
>> -	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
>> -	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
>> -	{ "s25fl128s",	INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>> -	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>> -	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>> -	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
>> -	{ "s25sl008a",  INFO(0x010213,      0,  64 * 1024,  16, 0) },
>> -	{ "s25sl016a",  INFO(0x010214,      0,  64 * 1024,  32, 0) },
>> -	{ "s25sl032a",  INFO(0x010215,      0,  64 * 1024,  64, 0) },
>> -	{ "s25sl064a",  INFO(0x010216,      0,  64 * 1024, 128, 0) },
>> -	{ "s25fl004k",  INFO(0xef4013,      0,  64 * 1024,   8, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>> -	{ "s25fl008k",  INFO(0xef4014,      0,  64 * 1024,  16, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>> -	{ "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>> -	{ "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128, SECT_4K) },
>> -	{ "s25fl116k",  INFO(0x014015,      0,  64 * 1024,  32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>> -	{ "s25fl132k",  INFO(0x014016,      0,  64 * 1024,  64, SECT_4K) },
>> -	{ "s25fl164k",  INFO(0x014017,      0,  64 * 1024, 128, SECT_4K) },
>> -	{ "s25fl204k",  INFO(0x014013,      0,  64 * 1024,   8, SECT_4K | SPI_NOR_DUAL_READ) },
>> -	{ "s25fl208k",  INFO(0x014014,      0,  64 * 1024,  16, SECT_4K | SPI_NOR_DUAL_READ) },
>> +	{ "s25sl032p",  INFO(0x010215, 0x4d00, 2,  64 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>> +	{ "s25sl064p",  INFO(0x010216, 0x4d00, 2,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>> +	{ "s25fl256s0", INFO(0x010219, 0x4d00, 2, 256 * 1024, 128, 0) },
>> +	{ "s25fl256s1", INFO(0x010219, 0x4d01, 2,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>> +	{ "s25fl512s",  INFO_FULL(0x0102204d00uLL << 24, GENMASK_ULL(63, 24),
>> +				  256 * 1024, 256, 512, 0, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> 
> Hm, this syntax here could use some improvement ... ideas welcome.
> 
>> +	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 2, 256 * 1024, 256, 0) },
>> +	{ "s25sl12800", INFO(0x012018, 0x0300, 2, 256 * 1024,  64, 0) },
>> +	{ "s25sl12801", INFO(0x012018, 0x0301, 2,  64 * 1024, 256, 0) },
>> +	{ "s25fl128s",	INFO(0x012018, 0x4d0180, 3, 64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>> +	{ "s25fl129p0", INFO(0x012018, 0x4d00, 2, 256 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>> +	{ "s25fl129p1", INFO(0x012018, 0x4d01, 2,  64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>> +	{ "s25sl004a",  INFO(0x010212, 0, 0,  64 * 1024,   8, 0) },
>> +	{ "s25sl008a",  INFO(0x010213, 0, 0,  64 * 1024,  16, 0) },
>> +	{ "s25sl016a",  INFO(0x010214, 0, 0,  64 * 1024,  32, 0) },
>> +	{ "s25sl032a",  INFO(0x010215, 0, 0,  64 * 1024,  64, 0) },
>> +	{ "s25sl064a",  INFO(0x010216, 0, 0,  64 * 1024, 128, 0) },
>> +	{ "s25fl004k",  INFO(0xef4013, 0, 0,  64 * 1024,   8, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>> +	{ "s25fl008k",  INFO(0xef4014, 0, 0,  64 * 1024,  16, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>> +	{ "s25fl016k",  INFO(0xef4015, 0, 0,  64 * 1024,  32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>> +	{ "s25fl064k",  INFO(0xef4017, 0, 0,  64 * 1024, 128, SECT_4K) },
>> +	{ "s25fl116k",  INFO(0x014015, 0, 0,  64 * 1024,  32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>> +	{ "s25fl132k",  INFO(0x014016, 0, 0,  64 * 1024,  64, SECT_4K) },
>> +	{ "s25fl164k",  INFO(0x014017, 0, 0,  64 * 1024, 128, SECT_4K) },
>> +	{ "s25fl204k",  INFO(0x014013, 0, 0,  64 * 1024,   8, SECT_4K | SPI_NOR_DUAL_READ) },
>> +	{ "s25fl208k",  INFO(0x014014, 0, 0,  64 * 1024,  16, SECT_4K | SPI_NOR_DUAL_READ) },
>>  
>>  	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
>> -	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
>> -	{ "sst25vf080b", INFO(0xbf258e, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
>> -	{ "sst25vf016b", INFO(0xbf2541, 0, 64 * 1024, 32, SECT_4K | SST_WRITE) },
>> -	{ "sst25vf032b", INFO(0xbf254a, 0, 64 * 1024, 64, SECT_4K | SST_WRITE) },
>> -	{ "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128, SECT_4K) },
>> -	{ "sst25wf512",  INFO(0xbf2501, 0, 64 * 1024,  1, SECT_4K | SST_WRITE) },
>> -	{ "sst25wf010",  INFO(0xbf2502, 0, 64 * 1024,  2, SECT_4K | SST_WRITE) },
>> -	{ "sst25wf020",  INFO(0xbf2503, 0, 64 * 1024,  4, SECT_4K | SST_WRITE) },
>> -	{ "sst25wf020a", INFO(0x621612, 0, 64 * 1024,  4, SECT_4K) },
>> -	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K) },
>> -	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
>> -	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
>> +	{ "sst25vf040b", INFO(0xbf258d, 0, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
>> +	{ "sst25vf080b", INFO(0xbf258e, 0, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
>> +	{ "sst25vf016b", INFO(0xbf2541, 0, 0, 64 * 1024, 32, SECT_4K | SST_WRITE) },
>> +	{ "sst25vf032b", INFO(0xbf254a, 0, 0, 64 * 1024, 64, SECT_4K | SST_WRITE) },
>> +	{ "sst25vf064c", INFO(0xbf254b, 0, 0, 64 * 1024, 128, SECT_4K) },
>> +	{ "sst25wf512",  INFO(0xbf2501, 0, 0, 64 * 1024,  1, SECT_4K | SST_WRITE) },
>> +	{ "sst25wf010",  INFO(0xbf2502, 0, 0, 64 * 1024,  2, SECT_4K | SST_WRITE) },
>> +	{ "sst25wf020",  INFO(0xbf2503, 0, 0, 64 * 1024,  4, SECT_4K | SST_WRITE) },
>> +	{ "sst25wf020a", INFO(0x621612, 0, 0, 64 * 1024,  4, SECT_4K) },
>> +	{ "sst25wf040b", INFO(0x621613, 0, 0, 64 * 1024,  8, SECT_4K) },
>> +	{ "sst25wf040",  INFO(0xbf2504, 0, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
>> +	{ "sst25wf080",  INFO(0xbf2505, 0, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
>>  
>>  	/* ST Microelectronics -- newer production may have feature updates */
>> -	{ "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
>> -	{ "m25p10",  INFO(0x202011,  0,  32 * 1024,   4, 0) },
>> -	{ "m25p20",  INFO(0x202012,  0,  64 * 1024,   4, 0) },
>> -	{ "m25p40",  INFO(0x202013,  0,  64 * 1024,   8, 0) },
>> -	{ "m25p80",  INFO(0x202014,  0,  64 * 1024,  16, 0) },
>> -	{ "m25p16",  INFO(0x202015,  0,  64 * 1024,  32, 0) },
>> -	{ "m25p32",  INFO(0x202016,  0,  64 * 1024,  64, 0) },
>> -	{ "m25p64",  INFO(0x202017,  0,  64 * 1024, 128, 0) },
>> -	{ "m25p128", INFO(0x202018,  0, 256 * 1024,  64, 0) },
>> -
>> -	{ "m25p05-nonjedec",  INFO(0, 0,  32 * 1024,   2, 0) },
>> -	{ "m25p10-nonjedec",  INFO(0, 0,  32 * 1024,   4, 0) },
>> -	{ "m25p20-nonjedec",  INFO(0, 0,  64 * 1024,   4, 0) },
>> -	{ "m25p40-nonjedec",  INFO(0, 0,  64 * 1024,   8, 0) },
>> -	{ "m25p80-nonjedec",  INFO(0, 0,  64 * 1024,  16, 0) },
>> -	{ "m25p16-nonjedec",  INFO(0, 0,  64 * 1024,  32, 0) },
>> -	{ "m25p32-nonjedec",  INFO(0, 0,  64 * 1024,  64, 0) },
>> -	{ "m25p64-nonjedec",  INFO(0, 0,  64 * 1024, 128, 0) },
>> -	{ "m25p128-nonjedec", INFO(0, 0, 256 * 1024,  64, 0) },
>> -
>> -	{ "m45pe10", INFO(0x204011,  0, 64 * 1024,    2, 0) },
>> -	{ "m45pe80", INFO(0x204014,  0, 64 * 1024,   16, 0) },
>> -	{ "m45pe16", INFO(0x204015,  0, 64 * 1024,   32, 0) },
>> -
>> -	{ "m25pe20", INFO(0x208012,  0, 64 * 1024,  4,       0) },
>> -	{ "m25pe80", INFO(0x208014,  0, 64 * 1024, 16,       0) },
>> -	{ "m25pe16", INFO(0x208015,  0, 64 * 1024, 32, SECT_4K) },
>> -
>> -	{ "m25px16",    INFO(0x207115,  0, 64 * 1024, 32, SECT_4K) },
>> -	{ "m25px32",    INFO(0x207116,  0, 64 * 1024, 64, SECT_4K) },
>> -	{ "m25px32-s0", INFO(0x207316,  0, 64 * 1024, 64, SECT_4K) },
>> -	{ "m25px32-s1", INFO(0x206316,  0, 64 * 1024, 64, SECT_4K) },
>> -	{ "m25px64",    INFO(0x207117,  0, 64 * 1024, 128, 0) },
>> -	{ "m25px80",    INFO(0x207114,  0, 64 * 1024, 16, 0) },
>> +	{ "m25p05",  INFO(0x202010, 0, 0,  32 * 1024,   2, 0) },
>> +	{ "m25p10",  INFO(0x202011, 0, 0,  32 * 1024,   4, 0) },
>> +	{ "m25p20",  INFO(0x202012, 0, 0,  64 * 1024,   4, 0) },
>> +	{ "m25p40",  INFO(0x202013, 0, 0,  64 * 1024,   8, 0) },
>> +	{ "m25p80",  INFO(0x202014, 0, 0,  64 * 1024,  16, 0) },
>> +	{ "m25p16",  INFO(0x202015, 0, 0,  64 * 1024,  32, 0) },
>> +	{ "m25p32",  INFO(0x202016, 0, 0,  64 * 1024,  64, 0) },
>> +	{ "m25p64",  INFO(0x202017, 0, 0,  64 * 1024, 128, 0) },
>> +	{ "m25p128", INFO(0x202018, 0, 0, 256 * 1024,  64, 0) },
>> +
>> +	{ "m25p05-nonjedec",  INFO_NOID( 32 * 1024,   2, 256, 0, 0) },
>> +	{ "m25p10-nonjedec",  INFO_NOID( 32 * 1024,   4, 256, 0, 0) },
>> +	{ "m25p20-nonjedec",  INFO_NOID( 64 * 1024,   4, 256, 0, 0) },
>> +	{ "m25p40-nonjedec",  INFO_NOID( 64 * 1024,   8, 256, 0, 0) },
>> +	{ "m25p80-nonjedec",  INFO_NOID( 64 * 1024,  16, 256, 0, 0) },
>> +	{ "m25p16-nonjedec",  INFO_NOID( 64 * 1024,  32, 256, 0, 0) },
>> +	{ "m25p32-nonjedec",  INFO_NOID( 64 * 1024,  64, 256, 0, 0) },
>> +	{ "m25p64-nonjedec",  INFO_NOID( 64 * 1024, 128, 256, 0, 0) },
>> +	{ "m25p128-nonjedec", INFO_NOID(256 * 1024,  64, 256, 0, 0) },
>> +
>> +	{ "m45pe10", INFO(0x204011, 0, 0, 64 * 1024,    2, 0) },
>> +	{ "m45pe80", INFO(0x204014, 0, 0, 64 * 1024,   16, 0) },
>> +	{ "m45pe16", INFO(0x204015, 0, 0, 64 * 1024,   32, 0) },
>> +
>> +	{ "m25pe20", INFO(0x208012, 0, 0, 64 * 1024,  4,       0) },
>> +	{ "m25pe80", INFO(0x208014, 0, 0, 64 * 1024, 16,       0) },
>> +	{ "m25pe16", INFO(0x208015, 0, 0, 64 * 1024, 32, SECT_4K) },
>> +
>> +	{ "m25px16",    INFO(0x207115, 0, 0, 64 * 1024, 32, SECT_4K) },
>> +	{ "m25px32",    INFO(0x207116, 0, 0, 64 * 1024, 64, SECT_4K) },
>> +	{ "m25px32-s0", INFO(0x207316, 0, 0, 64 * 1024, 64, SECT_4K) },
>> +	{ "m25px32-s1", INFO(0x206316, 0, 0, 64 * 1024, 64, SECT_4K) },
>> +	{ "m25px64",    INFO(0x207117, 0, 0, 64 * 1024, 128, 0) },
>> +	{ "m25px80",    INFO(0x207114, 0, 0, 64 * 1024, 16, 0) },
>>  
>>  	/* Winbond -- w25x "blocks" are 64K, "sectors" are 4KiB */
>> -	{ "w25x05", INFO(0xef3010, 0, 64 * 1024,  1,  SECT_4K) },
>> -	{ "w25x10", INFO(0xef3011, 0, 64 * 1024,  2,  SECT_4K) },
>> -	{ "w25x20", INFO(0xef3012, 0, 64 * 1024,  4,  SECT_4K) },
>> -	{ "w25x40", INFO(0xef3013, 0, 64 * 1024,  8,  SECT_4K) },
>> -	{ "w25x80", INFO(0xef3014, 0, 64 * 1024,  16, SECT_4K) },
>> -	{ "w25x16", INFO(0xef3015, 0, 64 * 1024,  32, SECT_4K) },
>> -	{ "w25x32", INFO(0xef3016, 0, 64 * 1024,  64, SECT_4K) },
>> -	{ "w25q32", INFO(0xef4016, 0, 64 * 1024,  64, SECT_4K) },
>> +	{ "w25x05", INFO(0xef3010, 0, 0, 64 * 1024,  1,  SECT_4K) },
>> +	{ "w25x10", INFO(0xef3011, 0, 0, 64 * 1024,  2,  SECT_4K) },
>> +	{ "w25x20", INFO(0xef3012, 0, 0, 64 * 1024,  4,  SECT_4K) },
>> +	{ "w25x40", INFO(0xef3013, 0, 0, 64 * 1024,  8,  SECT_4K) },
>> +	{ "w25x80", INFO(0xef3014, 0, 0, 64 * 1024,  16, SECT_4K) },
>> +	{ "w25x16", INFO(0xef3015, 0, 0, 64 * 1024,  32, SECT_4K) },
>> +	{ "w25x32", INFO(0xef3016, 0, 0, 64 * 1024,  64, SECT_4K) },
>> +	{ "w25q32", INFO(0xef4016, 0, 0, 64 * 1024,  64, SECT_4K) },
>>  	{
>> -		"w25q32dw", INFO(0xef6016, 0, 64 * 1024,  64,
>> +		"w25q32dw", INFO(0xef6016, 0, 0, 64 * 1024,  64,
>>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>  			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>>  	},
>> -	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
>> -	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128, SECT_4K) },
>> +	{ "w25x64", INFO(0xef3017, 0, 0, 64 * 1024, 128, SECT_4K) },
>> +	{ "w25q64", INFO(0xef4017, 0, 0, 64 * 1024, 128, SECT_4K) },
>>  	{
>> -		"w25q64dw", INFO(0xef6017, 0, 64 * 1024, 128,
>> +		"w25q64dw", INFO(0xef6017, 0, 0, 64 * 1024, 128,
>>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>  			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>>  	},
>>  	{
>> -		"w25q128fw", INFO(0xef6018, 0, 64 * 1024, 256,
>> +		"w25q128fw", INFO(0xef6018, 0, 0, 64 * 1024, 256,
>>  			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>  			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>>  	},
>> -	{ "w25q80", INFO(0xef5014, 0, 64 * 1024,  16, SECT_4K) },
>> -	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
>> -	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
>> -	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K) },
>> +	{ "w25q80",   INFO(0xef5014, 0, 0, 64 * 1024,  16, SECT_4K) },
>> +	{ "w25q80bl", INFO(0xef4014, 0, 0, 64 * 1024,  16, SECT_4K) },
>> +	{ "w25q128",  INFO(0xef4018, 0, 0, 64 * 1024, 256, SECT_4K) },
>> +	{ "w25q256",  INFO(0xef4019, 0, 0, 64 * 1024, 512, SECT_4K) },
>>  
>>  	/* Catalyst / On Semiconductor -- non-JEDEC */
>> -	{ "cat25c11", CAT25_INFO(  16, 8, 16, 1, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>> -	{ "cat25c03", CAT25_INFO(  32, 8, 16, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>> -	{ "cat25c09", CAT25_INFO( 128, 8, 32, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>> -	{ "cat25c17", CAT25_INFO( 256, 8, 32, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>> -	{ "cat25128", CAT25_INFO(2048, 8, 64, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>> +	{ "cat25c11", INFO_NOID(  16, 8, 16, 1, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>> +	{ "cat25c03", INFO_NOID(  32, 8, 16, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>> +	{ "cat25c09", INFO_NOID( 128, 8, 32, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>> +	{ "cat25c17", INFO_NOID( 256, 8, 32, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>> +	{ "cat25128", INFO_NOID(2048, 8, 64, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>>  
>>  	/* Xilinx S3AN Internal Flash */
>> -	{ "3S50AN", S3AN_INFO(0x1f2200, 64, 264) },
>> -	{ "3S200AN", S3AN_INFO(0x1f2400, 256, 264) },
>> -	{ "3S400AN", S3AN_INFO(0x1f2400, 256, 264) },
>> -	{ "3S700AN", S3AN_INFO(0x1f2500, 512, 264) },
>> -	{ "3S1400AN", S3AN_INFO(0x1f2600, 512, 528) },
>> +	{ "3S50AN",   INFO_S3AN(0x1f2200, 64, 264) },
>> +	{ "3S200AN",  INFO_S3AN(0x1f2400, 256, 264) },
>> +	{ "3S400AN",  INFO_S3AN(0x1f2400, 256, 264) },
>> +	{ "3S700AN",  INFO_S3AN(0x1f2500, 512, 264) },
>> +	{ "3S1400AN", INFO_S3AN(0x1f2600, 512, 528) },
>>  	{ },
>>  };
>>  
>>  static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
>>  {
>>  	int			tmp;
>> -	u8			id[SPI_NOR_MAX_ID_LEN];
>> +	u8			id_bytes[sizeof(u64)];
>> +	u64			id;
>>  	const struct flash_info	*info;
>>  
>> -	tmp = nor->read_reg(nor, SPINOR_OP_RDID, id, SPI_NOR_MAX_ID_LEN);
>> +	BUILD_BUG_ON(SPI_NOR_MAX_ID_LEN > sizeof(u64));
>> +
>> +	memset(id_bytes, 0, sizeof(id_bytes));
>> +	tmp = nor->read_reg(nor, SPINOR_OP_RDID, id_bytes, SPI_NOR_MAX_ID_LEN);
>>  	if (tmp < 0) {
>>  		dev_dbg(nor->dev, "error %d reading JEDEC ID\n", tmp);
>>  		return ERR_PTR(tmp);
>>  	}
>>  
>> +	id = get_unaligned_be64(id_bytes);
>> +
>>  	for (tmp = 0; tmp < ARRAY_SIZE(spi_nor_ids) - 1; tmp++) {
>>  		info = &spi_nor_ids[tmp];
>> -		if (info->id_len) {
>> -			if (!memcmp(info->id, id, info->id_len))
>> -				return &spi_nor_ids[tmp];
>> -		}
>> +		if (info->id_mask && (id & info->id_mask) == info->id)
>> +			return info;
>>  	}
>> -	dev_err(nor->dev, "unrecognized JEDEC id bytes: %02x, %02x, %02x\n",
>> -		id[0], id[1], id[2]);
>> +	dev_err(nor->dev, "unrecognized JEDEC id bytes: %*ph\n",
>> +		SPI_NOR_MAX_ID_LEN, id_bytes);
>>  	return ERR_PTR(-ENODEV);
>>  }
>>  
>> @@ -1551,7 +1555,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>>  	 * If caller has specified name of flash model that can normally be
>>  	 * detected using JEDEC, let's verify it.
>>  	 */
>> -	if (name && info->id_len) {
>> +	if (name && info->id_mask) {
>>  		const struct flash_info *jinfo;
>>  
>>  		jinfo = spi_nor_read_id(nor);
>>
> 
> 
