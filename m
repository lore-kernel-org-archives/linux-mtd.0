Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dvoWp-0007V8-6n
 for linux-mtd@lists.infradead.org; Sat, 23 Sep 2017 17:47:49 +0000
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com
 [209.85.161.174]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id v8NHl4ej029835
 for <linux-mtd@lists.infradead.org>; Sun, 24 Sep 2017 02:47:05 +0900
Received: by mail-yw0-f174.google.com with SMTP id p10so2534567ywh.8
 for <linux-mtd@lists.infradead.org>; Sat, 23 Sep 2017 10:47:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170922073456.t25jl34k4irl7g6w@pengutronix.de>
References: <25edd455-ad6c-f222-f552-2aa3d807112a@pengutronix.de>
 <CAK7LNASR_1OsR+Dp3J7=Mtii_Ysp72DhWFXSYoeFVLiFPXu2AA@mail.gmail.com>
 <20170922073456.t25jl34k4irl7g6w@pengutronix.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 24 Sep 2017 02:46:23 +0900
Message-ID: <CAK7LNARgSZkah=NO2CyiynrxjdBue2pGjkhv=rPqYr1-VKFp3Q@mail.gmail.com>
Subject: Re: nand: denali: issue with 4.13
To: Oleksij Rempel <ore@pengutronix.de>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2017-09-22 16:34 GMT+09:00 Oleksij Rempel <ore@pengutronix.de>:
> Hi,
>
> On Thu, Sep 21, 2017 at 08:00:34PM +0900, Masahiro Yamada wrote:
>> Hi.
>>
>> 2017-09-21 15:44 GMT+09:00 Oleksij Rempel <ore@pengutronix.de>:
>> > Hi Masahiro,
>> >
>> > you are probably the expert of denali nand driver.
>> > With kernel v4.13 i have following issue, it works on FPGASoC 5CSEBA5U...
>> > but is now working on FPGASoC 5CSXFC6C6U... both of them have same NAND
>> > chip, and seems to have similar IP core.
>> >
>> > FPGASoC 5CSXFC6C6U...:
>> > ====================================================================
>> > [    0.095899] console [ttyS0] disabled
>> > [    0.095941] ffc02000.serial0: ttyS0 at MMIO 0xffc02000 (irq = 38,
>> > base_baud = 6250000) is a 16550A
>> > [    0.702041] console [ttyS0] enabled
>> > [    0.706986] brd: module loaded
>> > [    0.716232] loop: module loaded
>> > [    0.720074] nand: device found, Manufacturer ID: 0x00, Chip ID: 0x2c
>>
>>
>> This line is strange.  It failed to read Manufacturer ID.
>> The 0x2c should be Manufacturer ID, not Chip ID.
>>
>>
>> I am guessing we need to wait a bit
>> after the NAND_CMD_READID.
>>
>> Please try the following ugly patch.
>
> Suddenly this patch makes no difference.



Does the following make difference?


@@ -3876,6 +3876,8 @@ static int nand_detect(struct nand_chip *chip,
struct nand_flash_dev *type)
        /* Select the device */
        chip->select_chip(mtd, 0);

+       udelay(1);
+
        /* Send the command for reading device ID */
        chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);






> the initial patch was describing an issue with interrupts:
> ============================================================================
> FogBugz #163905: Support Denali NAND driver on socfpga platform
>
> This patch addresses a few bugs and features in the Denali NAND
> driver on the socfpga platform.
>
> First the bugs:
>
> - Reading ONFI parameters would cause a timeout, because
> the code sent the wrong commands to the controller/device.  That was
> fixed, and in the process, code was added to wait for the appropriate interrupt.
> ============================================================================
>

I see nothing about time-out error in the log you sent.


I do not know what Altera guys did
in their local repositories.

The Denali NAND on SOCFPGA never worked
(even on _any_ SoCs)
with the mainline kernel before my re-work,
so "git bisect" is useless here.



-- 
Best Regards
Masahiro Yamada
