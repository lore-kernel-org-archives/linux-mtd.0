Received: from mail-la0-x22c.google.com ([2a00:1450:4010:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xljwq-0006KD-Bb
 for linux-mtd@lists.infradead.org; Tue, 04 Nov 2014 19:39:25 +0000
Received: by mail-la0-f44.google.com with SMTP id gf13so1547249lab.3
 for <linux-mtd@lists.infradead.org>; Tue, 04 Nov 2014 11:39:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAOMZO5DdkB1VeSpO0S+Fos1Ct31GqC7CTD7C350BW3xBSH_jhw@mail.gmail.com>
References: <1407804896-1808-1-git-send-email-shijie.huang@intel.com>
 <1407804896-1808-3-git-send-email-shijie.huang@intel.com>
 <CAOMZO5DdkB1VeSpO0S+Fos1Ct31GqC7CTD7C350BW3xBSH_jhw@mail.gmail.com>
Date: Tue, 4 Nov 2014 17:39:07 -0200
Message-ID: <CAOMZO5BggK+QvcXOmjTYQgNPxMFxg8-SarbR03gmwhuzxHwRJA@mail.gmail.com>
Subject: Re: [PATCH 3/3] mtd: spi-nor: add support for s25fl128s
From: Fabio Estevam <festevam@gmail.com>
To: Huang Shijie <shijie.huang@intel.com>
Content-Type: text/plain; charset=UTF-8
Cc: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang/Brian,

On Fri, Oct 17, 2014 at 3:42 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Brian,
>
> On Mon, Aug 11, 2014 at 9:54 PM, Huang Shijie <shijie.huang@intel.com> wrote:
>> We need to store the six bytes ID for s25fl128s, since it shares the same
>> five bytes with s25fl129p1.
>>
>> This patch adds a macro INFO6 which is used for the six bytes ID flash, and adds
>> a new item for the s25fl128s.
>>
>> Signed-off-by: Huang Shijie <shijie.huang@intel.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c |   18 ++++++++++++++++++
>>  1 files changed, 18 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index a0923b0..c130bf7 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -471,6 +471,23 @@ err:
>>                 .flags = (_flags),                                      \
>>         })
>>
>> +#define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)    \
>> +       ((kernel_ulong_t)&(struct flash_info) {                         \
>> +               .id = {                                                 \
>> +                       ((_jedec_id) >> 16) & 0xff,                     \
>> +                       ((_jedec_id) >> 8) & 0xff,                      \
>> +                       (_jedec_id) & 0xff,                             \
>> +                       ((_ext_id) >> 16) & 0xff,                       \
>> +                       ((_ext_id) >> 8) & 0xff,                        \
>> +                       (_ext_id) & 0xff,                               \
>> +                       },                                              \
>> +               .id_len = 6,                                            \
>> +               .sector_size = (_sector_size),                          \
>> +               .n_sectors = (_n_sectors),                              \
>> +               .page_size = 256,                                       \
>> +               .flags = (_flags),                                      \
>> +       })
>> +
>>  #define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_width, _flags)  \
>>         ((kernel_ulong_t)&(struct flash_info) {                         \
>>                 .sector_size = (_sector_size),                          \
>> @@ -565,6 +582,7 @@ const struct spi_device_id spi_nor_ids[] = {
>>         { "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
>>         { "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
>>         { "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
>> +       { "s25fl128s",  INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_QUAD_READ) },
>>         { "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, 0) },
>>         { "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, 0) },
>>         { "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
>
> We have a s25fl128s flash on imx6sx-sdb board and this patch would be helpful.
>
> Do you see any issues with it?

Is there still issues preventing this patch to be merged?

I would like to make use of it on a mx6sx-sdb board.

Regards,

Fabio Estevam
