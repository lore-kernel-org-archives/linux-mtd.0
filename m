Received: from mail-qt0-x22d.google.com ([2607:f8b0:400d:c0d::22d])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1duaPg-0003fy-W2
 for linux-mtd@lists.infradead.org; Wed, 20 Sep 2017 08:31:23 +0000
Received: by mail-qt0-x22d.google.com with SMTP id o3so1005168qte.6
 for <linux-mtd@lists.infradead.org>; Wed, 20 Sep 2017 01:30:55 -0700 (PDT)
MIME-Version: 1.0
Sender: romain.izard@mobile-devices.fr
In-Reply-To: <20170919152504.nhp5i734u75gb5gq@dell>
References: <20170915140411.31716-1-romain.izard.pro@gmail.com>
 <20170915140411.31716-9-romain.izard.pro@gmail.com>
 <53aa7783-0ecf-1e68-1bf9-c470ba2f79eb@microchip.com>
 <20170919152504.nhp5i734u75gb5gq@dell>
From: Romain Izard <romain.izard.pro@gmail.com>
Date: Wed, 20 Sep 2017 10:30:31 +0200
Message-ID: <CAGkQfmM08UqpLoMegRGQwmamN=Z74fem9VWT5yGcSjkYdS5c=Q@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] atmel_flexcom: Support backup mode
To: Lee Jones <lee.jones@linaro.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Wenyou Yang <wenyou.yang@atmel.com>,
 Josh Wu <rainyfeeling@outlook.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Thierry Reding <thierry.reding@gmail.com>,
 Richard Genoud <richard.genoud@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-clk@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2017-09-19 17:25 GMT+02:00 Lee Jones <lee.jones@linaro.org>:
> On Tue, 19 Sep 2017, Nicolas Ferre wrote:
>
>> On 15/09/2017 at 16:04, Romain Izard wrote:
>> > The controller used by a flexcom module is configured at boot, and left
>> > alone after this. As the configuration will be lost after backup mode,
>> > restore the state of the flexcom driver on resume.
>> >
>> > Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
>>
>> Tested-by: Nicolas Ferre <nicolas.ferre@microchip.com>
>> On sama5d2 Xplained board (i2c0 from flexcom 4).
>> and obviously:
>> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
>>
>> Thanks Romain!
>>
>> Regards,
>>
>> > ---
>> >  drivers/mfd/atmel-flexcom.c | 65 ++++++++++++++++++++++++++++++++++-----------
>> >  1 file changed, 50 insertions(+), 15 deletions(-)
>
> This is the first time I've seen this patch.  Why's that?
>

As the patchset covers many subsystems, get_maintainers.pl provided a
very long list of both developpers and mailing lists (28). I thought it
was a good idea to shorten it a little. Bad idea. Sorry.

Best regards,
-- 
Romain Izard
