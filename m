Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fnisF-0005wo-J4
 for linux-mtd@lists.infradead.org; Thu, 09 Aug 2018 11:13:01 +0000
Received: by mail-it0-x241.google.com with SMTP id v71-v6so1999829itb.3
 for <linux-mtd@lists.infradead.org>; Thu, 09 Aug 2018 04:12:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHp75VfxVOPzAtBgTe4RSax1Ki+323WDBTSmh=j7LV_c+vsXDA@mail.gmail.com>
References: <20180808153150.23444-1-brgl@bgdev.pl>
 <20180808153150.23444-15-brgl@bgdev.pl>
 <CAHp75VfxVOPzAtBgTe4RSax1Ki+323WDBTSmh=j7LV_c+vsXDA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 9 Aug 2018 13:12:47 +0200
Message-ID: <CAMRc=MfgoCt1BvRx1jJrYp_258_Z9NTNs7waEiOCvdTsK+KWFg@mail.gmail.com>
Subject: Re: [PATCH 14/28] net: split eth_platform_get_mac_address() into
 subroutines
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
 Kevin Hilman <khilman@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 "David S . Miller" <davem@davemloft.net>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Naren <naren.kernel@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lukas Wunner <lukas@wunner.de>, Dan Carpenter <dan.carpenter@oracle.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
 Sven Van Asbroeck <svendev@arcx.com>, Paolo Abeni <pabeni@redhat.com>,
 Alban Bedel <albeu@free.fr>,
 Rob Herring <robh@kernel.org>, David Lechner <david@lechnology.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Linux Documentation List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 linux-i2c <linux-i2c@vger.kernel.org>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2018-08-08 19:50 GMT+02:00 Andy Shevchenko <andy.shevchenko@gmail.com>:
> On Wed, Aug 8, 2018 at 6:31 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> We want do add more sources from which to read the MAC address. In
>> order to avoid bloating this function too much, start by splitting it
>> into subroutines, each of which takes care of reading the MAC from
>> one source.
>
>> +static int mac_address_from_of(struct device *dev, u8 *mac_addr)
>>  {
>>         const unsigned char *addr;
>> +       struct device_node *np;
>>
>
>> +       np = dev_is_pci(dev) ? pci_device_to_OF_node(to_pci_dev(dev))
>> +                            : dev->of_node;
>
> I didn't get these manipulations.
>
> What the scenario when pci_dev->dev.of_node != dev->of_node?
>
> --
> With Best Regards,
> Andy Shevchenko

I'll add an additional patch that addresses it.

Bart
