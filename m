Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dwmIZ-0007Ss-Ix
 for linux-mtd@lists.infradead.org; Tue, 26 Sep 2017 09:37:10 +0000
Subject: Re: nand: denali: issue with 4.13
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>
References: <25edd455-ad6c-f222-f552-2aa3d807112a@pengutronix.de>
 <CAK7LNASR_1OsR+Dp3J7=Mtii_Ysp72DhWFXSYoeFVLiFPXu2AA@mail.gmail.com>
 <20170922073456.t25jl34k4irl7g6w@pengutronix.de>
 <CAK7LNARgSZkah=NO2CyiynrxjdBue2pGjkhv=rPqYr1-VKFp3Q@mail.gmail.com>
From: Oleksij Rempel <ore@pengutronix.de>
Message-ID: <1ef95752-f9eb-14f3-e131-825fb7ffce25@pengutronix.de>
Date: Tue, 26 Sep 2017 11:36:40 +0200
MIME-Version: 1.0
In-Reply-To: <CAK7LNARgSZkah=NO2CyiynrxjdBue2pGjkhv=rPqYr1-VKFp3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 23.09.2017 19:46, Masahiro Yamada wrote:
> 2017-09-22 16:34 GMT+09:00 Oleksij Rempel <ore@pengutronix.de>:
>> Hi,
>>
>> On Thu, Sep 21, 2017 at 08:00:34PM +0900, Masahiro Yamada wrote:
>>> Hi.
>>>
>>> 2017-09-21 15:44 GMT+09:00 Oleksij Rempel <ore@pengutronix.de>:
>>>> Hi Masahiro,
>>>>
>>>> you are probably the expert of denali nand driver.
>>>> With kernel v4.13 i have following issue, it works on FPGASoC 5CSEBA5U...
>>>> but is now working on FPGASoC 5CSXFC6C6U... both of them have same NAND
>>>> chip, and seems to have similar IP core.
>>>>
>>>> FPGASoC 5CSXFC6C6U...:
>>>> ====================================================================
>>>> [    0.095899] console [ttyS0] disabled
>>>> [    0.095941] ffc02000.serial0: ttyS0 at MMIO 0xffc02000 (irq = 38,
>>>> base_baud = 6250000) is a 16550A
>>>> [    0.702041] console [ttyS0] enabled
>>>> [    0.706986] brd: module loaded
>>>> [    0.716232] loop: module loaded
>>>> [    0.720074] nand: device found, Manufacturer ID: 0x00, Chip ID: 0x2c
>>>
>>>
>>> This line is strange.  It failed to read Manufacturer ID.
>>> The 0x2c should be Manufacturer ID, not Chip ID.
>>>
>>>
>>> I am guessing we need to wait a bit
>>> after the NAND_CMD_READID.
>>>
>>> Please try the following ugly patch.
>>
>> Suddenly this patch makes no difference.
> 
> 
> 
> Does the following make difference?
> 
> 
> @@ -3876,6 +3876,8 @@ static int nand_detect(struct nand_chip *chip,
> struct nand_flash_dev *type)
>          /* Select the device */
>          chip->select_chip(mtd, 0);
> 
> +       udelay(1);
> +
>          /* Send the command for reading device ID */
>          chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);

We did more tests, so now i can confirm that issue was caused but not 
properly configured clock for NAND controller.
After fixing the configuration provided with altera handoff files for 
bootloader, the NAND on Altera 5CSXFC6C6U seems to work properly with 
mainline kernel v4.13.

Masahiro Yamada, thank you for work and time! :)

Regards,
Oleksij
