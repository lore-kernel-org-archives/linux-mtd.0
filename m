Message-ID: <4EFEB574.7060905@freescale.com>
Date: Sat, 31 Dec 2011 15:10:44 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] MTD/GPMI : select more modules for GPMI by default
References: <1325220337-23165-1-git-send-email-b32955@freescale.com>
 <20111231054432.GE12182@S2100-06.ap.freescale.net>
 <4EFEA210.30606@freescale.com> <201112310801.39019.marek.vasut@gmail.com>
In-Reply-To: <201112310801.39019.marek.vasut@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: shijie8@gmail.com, Artem.Bityutskiy@intel.com,
 linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2011=E5=B9=B412=E6=9C=8831=E6=97=A5 15:01, Marek Vasut =E5=86=99=
=E9=81=93:
>> =E4=BA=8E 2011=E5=B9=B412=E6=9C=8831=E6=97=A5 13:44, Shawn Guo =E5=86=99=
=E9=81=93:
>>> On Fri, Dec 30, 2011 at 12:45:37PM +0800, Huang Shijie wrote:
>>>> The gpmi-nand driver needs the mxs-dma driver. So select the
>>>> MXS_DMA by default. So does the MTD_CHAR.
>>>>
>>>> Signed-off-by: Huang Shijie<b32955@freescale.com>
>>>> ---
>>>>
>>>>    drivers/mtd/nand/Kconfig |    2 ++
>>>>    1 files changed, 2 insertions(+), 0 deletions(-)
>>>>
>>>> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
>>>> index 07c4774..1b14a3a 100644
>>>> --- a/drivers/mtd/nand/Kconfig
>>>> +++ b/drivers/mtd/nand/Kconfig
>>>> @@ -420,6 +420,8 @@ config MTD_NAND_NANDSIM
>>>>
>>>>    config MTD_NAND_GPMI_NAND
>>>>
>>>>            bool "GPMI NAND Flash Controller driver"
>>>>            depends on MTD_NAND&&   (SOC_IMX23 || SOC_IMX28)
>>>>
>>>> +	select MXS_DMA
>>> We should probably have it depend on MXS_DMA rather than select it.
>> IMHO, I think `select` is better. :)
>> The MXS_DMA not only service for NAND, but SD card, etc.
>> In logic, the GPMI does not depends on MXS_DMA, the GPMI may use SDMA
>> too(just in logically).
> And does it use that ? Technically, it's still dependent on MXS_DMA, ri=
ght ?
NO. Just assumption.

the GPMI driver will continue to depend on MXS_DMA in the following=20
chips, such as MX6Q.


> Also, why select mtd_char, it's totally unrelated.
The GPMI works with UBIFS, the UBIFS is based on /dev/mtd0..,



Huang Shijie
> M
>>
>> Best Regards
>> Huang Shijie
>>
>>> Regards,
>>> Shawn
>>>
>>>> +	select MTD_CHAR
>>>>
>>>>    	select MTD_PARTITIONS
>>>>    	select MTD_CMDLINE_PARTS
>>>>    =09
>>>>            help
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
