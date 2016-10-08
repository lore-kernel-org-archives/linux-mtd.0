Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bshDB-0000T7-IJ
 for linux-mtd@lists.infradead.org; Sat, 08 Oct 2016 02:18:07 +0000
Received: by mail-pa0-x241.google.com with SMTP id hh10so3495653pac.0
 for <linux-mtd@lists.infradead.org>; Fri, 07 Oct 2016 19:17:44 -0700 (PDT)
Subject: Re: [PATCH 00/10] Introduce Juniper PTXPMB CPLD driver
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
 Lee Jones <lee.jones@linaro.org>
References: <1475853451-22121-1-git-send-email-pantelis.antoniou@konsulko.com>
 <57F8324C.2040804@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Wolfram Sang <wsa@the-dreams.de>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Wim Van Sebroeck
 <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>,
 Peter Rosin <peda@axentia.se>, Debjit Ghosh <dghosh@juniper.net>,
 Georgi Vlaev <gvlaev@juniper.net>, Guenter Roeck <groeck@juniper.net>,
 JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>,
 Rajat Jain <rajatjain@juniper.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-watchdog@vger.kernel.org
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <57F85724.4000706@gmail.com>
Date: Fri, 7 Oct 2016 19:17:08 -0700
MIME-Version: 1.0
In-Reply-To: <57F8324C.2040804@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/07/16 16:39, Frank Rowand wrote:
> On 10/07/16 08:17, Pantelis Antoniou wrote:
>> Add Juniper's PTXPMB FPGA CPLD driver. Those FPGAs
>> are present in Juniper's PTX series of routers.
>>
>> The MFD driver provices watchdog/i2c/gpio/mtd devices.
>>
>> There are full device tree binding documents for the
>> master mfd driver and for all slave drivers.
>>
>> This patchset is against mainline as of today: v4.8-9431-g3477d16
>> and is dependent on the "Juniper prerequisites" and
>> "Juniper infrastructure" patchsets sent earlier.
> 
> Pointers to the patchsets please.
> 

Nevermind.  Found them.

-Frank
