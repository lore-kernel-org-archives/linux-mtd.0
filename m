Message-ID: <4F2671C3.6000809@freescale.com>
Date: Mon, 30 Jan 2012 18:32:35 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH] mtd/gpmi : add BBT support
References: <1327898174-13656-1-git-send-email-b32955@freescale.com>
 <20120130094610.GA15596@pengutronix.de>
In-Reply-To: <20120130094610.GA15596@pengutronix.de>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: artem.bityutskiy@intel.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2012=C4=EA01=D4=C230=C8=D5 17:46, Wolfram Sang =D0=B4=B5=C0:
> On Mon, Jan 30, 2012 at 12:36:14PM +0800, Huang Shijie wrote:
>> add the BBT support to the gpmi nand driver.
>> Signed-off-by: Huang Shijie <b32955@freescale.com>
>> ---
>>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    1 +
>>  1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand=
/gpmi-nand/gpmi-nand.c
>> index 493ec2f..4fbb341 100644
>> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>> @@ -1493,6 +1493,7 @@ static int __devinit gpmi_nfc_init(struct gpmi_n=
and_data *this)
>>  	chip->ecc.mode		=3D NAND_ECC_HW;
>>  	chip->ecc.size		=3D 1;
>>  	chip->ecc.layout	=3D &gpmi_hw_ecclayout;
>> +	chip->bbt_options	=3D NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;
> You are making this default. Is there a bootloader which supports that
> on MXS?
>
The bootloader usually is burned on /dev/mtd0, while the BBT is placed
at the end
of the NAND chip.

I tested the NAND boot mode too.

What's your concern?

Huang Shijie
