Message-ID: <4E0D7CE9.2030209@freescale.com>
Date: Fri, 1 Jul 2011 15:53:13 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH v5 1/3] ARM: mxs: add GPMI-NFC support for imx23/imx28
References: <1309406028-2924-1-git-send-email-b32955@freescale.com>
	<201106301555.19440.arnd@arndb.de>
	<19980.36638.134045.743619@ipc1.ka-ro>
	<201107010022.26597.arnd@arndb.de>
	<20110701060356.GA27039@pengutronix.de>
In-Reply-To: <20110701060356.GA27039@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Arnd Bergmann <arnd@arndb.de>, s.hauer@pengutronix.de,
	thierry.nolf.barco@gmail.com, linux-mtd@lists.infradead.org,
	u.kleine-koenig@pengutronix.de, Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi:
> Hi Arnd,
>
>> If you really want to call out obsceneties, how about the fact that this
>> driver comes with an 805 line patch to add a HAL for a single chip!
>>
>> Such abstractions should not be introduced as long as there is only
>> a single instance of the hardware.
> If I understood correctly, most if not all upcoming i.MX will have the GPMI
> (mx50, mx6). Huang, do you already have a draft for the mx50-hal?
>
I have finished the code for mx50's GPMI.
And I am coding for the MX6's GPMI recently.

I need a separate mx50-hal (or mx60-hal) to make the code tidy.
The MX50 and mx60 support ONFI NAND and TOGGLE nand(which mx23/mx28 do 
not support),
they need a long code to initialize the TIMING register. What's more, 
the READ/WRITE functions
are different from the mx23/mx28.

Frankly speaking, I can merge the mxs-hal.c file to the gpmi-nfc.c, but 
don't you think it too
messy?


Best Regards
Huang Shijie





> Regards,
>
>     Wolfram
>
