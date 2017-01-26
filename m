Received: from mail-wj0-f194.google.com ([209.85.210.194])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWlWX-0003g3-Dc
 for linux-mtd@lists.infradead.org; Thu, 26 Jan 2017 14:59:44 +0000
Received: by mail-wj0-f194.google.com with SMTP id ip10so4844968wjb.1
 for <linux-mtd@lists.infradead.org>; Thu, 26 Jan 2017 06:59:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <d87415ed-8e34-8330-d340-9e33a7abb695@gmail.com>
References: <1485265929-24020-1-git-send-email-mark.marshall@omicronenergy.com>
 <d87415ed-8e34-8330-d340-9e33a7abb695@gmail.com>
From: Mark Marshall <markmarshall14@gmail.com>
Date: Thu, 26 Jan 2017 15:58:18 +0100
Message-ID: <CAD4b4W+SFWh9XfBOSY622=r35VXM5c8s=bb9G_2LCoFxbYzucQ@mail.gmail.com>
Subject: Re: [PATCH] m25p80: Use a 512 byte page size for Spansion flash
 s25fl512s
To: Marek Vasut <marek.vasut@gmail.com>
Cc: mark.marshall@omicronenergy.com, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, cyrille.pitchen@atmel.com,
 David Woodhouse <dwmw2@infradead.org>, boris.brezillon@free-electrons.com,
 richard@nod.at
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 24 January 2017 at 17:48, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 01/24/2017 02:52 PM, mark.marshall@omicronenergy.com wrote:
>> From: Mark Marshall <mark.marshall@omicronenergy.com>
>>
>> The s25fl512s flash from Spansion has a 512 byte write page size,
>> which means that we can write 512 bytes at a time (instead of 256).
>>
>> This single change makes writing to the flash about 2x faster.
>>
>> Signed-off-by: Mark Marshall <mark.marshall@omicronenergy.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 17 ++++++++++++++++-
>>  1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index da7cd69..c9ac0bf 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -775,6 +775,21 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>>               .page_size = 256,                                       \
>>               .flags = (_flags),
>>
>> +/* Used to set a custom (non 256) page_size */
>> +#define INFOP(_jedec_id, _ext_id, _sector_size, _n_sectors, _pg_sz, _flags) \
>> +             .id = {                                                 \
>> +                     ((_jedec_id) >> 16) & 0xff,                     \
>> +                     ((_jedec_id) >> 8) & 0xff,                      \
>> +                     (_jedec_id) & 0xff,                             \
>> +                     ((_ext_id) >> 8) & 0xff,                        \
>> +                     (_ext_id) & 0xff,                               \
>> +                     },                                              \
>> +             .id_len = (!(_jedec_id) ? 0 : (3 + ((_ext_id) ? 2 : 0))), \
>> +             .sector_size = (_sector_size),                          \
>> +             .n_sectors = (_n_sectors),                              \
>> +             .page_size = (_pg_sz),                                  \
>> +             .flags = (_flags),                                      \
>> +
>
> Maybe it's time to introduce INFO_FULL() instead, where you could
> specify the page size and ID length. Adding more and more custom INFOx()
> doesn't scale. The INFOx() could then be easily converted
> over to INFO_FULL().
>
> One minor bit which could be slightly problematic is the .id_len
> field, which is precomputed now, but maybe there is a way to handle
> that too.
>
> Thoughts ?

I had a go at this, and my preferred method would be to use some token
pasting, but I'm not sure how popular this will be?  Below is the macro's I
came up with and a few representative lines of the table.  If no one objects
I'll prepare a complete patch.  (I've done this on a branch, and the table has
changed slightly, where should I be basing a patch like this from?).

I've checked by building the file both before and after my change, and the
table doesn't change.

#define _ID_NONE                \
    .id = {},                \
    .id_len = 0

#define _ID_JEDEC(_jedec_id)                        \
    .id = {                                \
        ((_jedec_id) >> 16) & 0xff,                \
        ((_jedec_id) >> 8) & 0xff,                \
        (_jedec_id) & 0xff,                    \
    },                                \
    .id_len = 3

#define _ID_JEDEC_EXT2(_jedec_id, _ext_id)                \
    .id = {                                \
        ((_jedec_id) >> 16) & 0xff,                \
        ((_jedec_id) >> 8) & 0xff,                \
        (_jedec_id) & 0xff,                    \
        ((_ext_id) >> 8) & 0xff,                \
        (_ext_id) & 0xff,                    \
    },                                \
    .id_len = 5

#define _ID_JEDEC_EXT3(_jedec_id, _ext_id)                \
    .id = {                                \
        ((_jedec_id) >> 16) & 0xff,                \
        ((_jedec_id) >> 8) & 0xff,                \
        (_jedec_id) & 0xff,                    \
        ((_ext_id) >> 16) & 0xff,                \
        ((_ext_id) >> 8) & 0xff,                \
        (_ext_id) & 0xff,                    \
    },                                \
    .id_len = 6

#define INFO_FULL(_id, _sector_size, _n_sectors, _pg_sz, _addr_width, _flags) \
    _ID_ ## _id,                            \
    .sector_size = (_sector_size),                    \
    .n_sectors = (_n_sectors),                    \
    .page_size = (_pg_sz),                        \
    .addr_width = (_addr_width),                    \
    .flags = (_flags),

#define INFO(_id, _sector_size, _n_sectors, _flags)    \
    INFO_FULL(_id, _sector_size, _n_sectors, 256, 0, _flags)

static const struct flash_info spi_nor_ids[] = {
    { "at25fs010",  INFO(JEDEC(0x1f6601), 32 * 1024,   4, SECT_4K) },
    { "at25fs040",  INFO(JEDEC(0x1f6604), 64 * 1024,   8, SECT_4K) },
    { "mr25h256", INFO_FULL(NONE,  32 * 1024, 1, 256, 2,
SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
    { "s25sl032p",  INFO(JEDEC_EXT2(0x010215, 0x4d00),  64 * 1024,
64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
    { "s25fl512s",  INFO_FULL(JEDEC_EXT2(0x010220, 0x4d00), 256 *
1024, 256, 256, 0, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
    { "s25fl128s",    INFO(JEDEC_EXT3(0x012018, 0x4d0180), 64 * 1024,
256, SECT_4K | SPI_NOR_QUAD_READ) },
    { "cat25c11", INFO_FULL(NONE,   16, 8, 16, 1, SPI_NOR_NO_ERASE |
SPI_NOR_NO_FR) },

Regards,

Mark
