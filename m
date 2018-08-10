MIME-Version: 1.0
In-Reply-To: <20180810080526.27207-15-brgl@bgdev.pl>
References: <20180810080526.27207-1-brgl@bgdev.pl>
 <20180810080526.27207-15-brgl@bgdev.pl>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 Aug 2018 17:39:17 +0300
Message-ID: <CAHp75Ve28aNe+FCK3p4OLsDf7dNo-iJ1VR=pyx+Y9OUn3sjYBw@mail.gmail.com>
Subject: Re: [PATCH v2 14/29] net: simplify eth_platform_get_mac_address()
To: Bartosz Golaszewski <brgl@bgdev.pl>
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

On Fri, Aug 10, 2018 at 11:05 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> We don't need to use pci_device_to_OF_node() - we can retrieve
> dev->of_node directly even for pci devices.
>

>         struct device_node *dp;
>
> -       if (dev_is_pci(dev))
> -               dp = pci_device_to_OF_node(to_pci_dev(dev));
> -       else
> -               dp = dev->of_node;
> -
> +       dp = dev->of_node;
>         addr = NULL;
>         if (dp)
>                 addr = of_get_mac_address(dp);

Looking more at this I could even propose to change all above by

addr = device_get_mac_address(dev, mac_addr, ETH_ALEN);

Thoughts?

-- 
With Best Regards,
Andy Shevchenko
