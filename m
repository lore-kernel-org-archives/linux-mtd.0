MIME-Version: 1.0
In-Reply-To: <201208101325.23075.marex@denx.de>
References: <1344568737-902-1-git-send-email-b32955@freescale.com>
 <201208101325.23075.marex@denx.de>
Date: Fri, 10 Aug 2012 10:15:01 -0400
Message-ID: <CAMiH66FAVVPLZ9hCyRcNCm1Le2JrCc+55CUw7UCtPjw+31w5gw@mail.gmail.com>
Subject: Re: [PATCH] mtd: gpmi: add NAND write verify support
From: Huang Shijie <shijie8@gmail.com>
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Cc: fabio.estevam@freescale.com, dedekind1@gmail.com,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 shawn.guo@linaro.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 10, 2012 at 7:25 AM, Marek Vasut <marex@denx.de> wrote:
> Dear Huang Shijie,
>
>> Add NAND write verify support in gpmi-nand driver.
>>
>> Signed-off-by: Huang Shijie <b32955@freescale.com>
>> ---
>>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   17 +++++++++++++++++
>>  1 files changed, 17 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>> b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c index 8c0d2f0..6394483 100644
>> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>> @@ -1488,6 +1488,22 @@ static int gpmi_set_geometry(struct gpmi_nand_data
>> *this) return gpmi_alloc_dma_buffer(this);
>>  }
>>
>> +#define MAX_PAGESIZE 8192
>
> Use NAND_MAX_PAGESIZE, see include/linux/mtd/nand.h .
>
>> +static uint8_t verify_buf[MAX_PAGESIZE];

ok, thanks.

>
> What will happen when you have two NANDs attached to GPMI controller and they
> hit this place both at once? Race condition, causing this function to fail for
> both?
>
Even there are two nand chips, there is only one gpmi controller.
And the current gpmi-nand does not support two nands now.
does the race occur with only one nand chip?


> Possibly devm_kmalloc() such buffer per-controller?
>
>> +static int gpmi_verify_buf(struct mtd_info *mtd, const uint8_t *buf, int
>> len) +{
>> +     struct nand_chip *nand = mtd->priv;
>> +     int ret;
>> +
>> +     ret = gpmi_ecc_read_page(mtd, nand, verify_buf, 0, 0);
>
> mtd->chip.ecc.read_page() ?
In actually, they are the same.


Best Regards
Huang Shijie
