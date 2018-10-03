Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7nYg-00035K-A1
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 20:15:48 +0000
Received: by mail-it1-x141.google.com with SMTP id i76-v6so10828947ita.3
 for <linux-mtd@lists.infradead.org>; Wed, 03 Oct 2018 13:15:35 -0700 (PDT)
MIME-Version: 1.0
References: <20180810080526.27207-1-brgl@bgdev.pl>
 <20180831194643.GA62862@ban.mtv.corp.google.com>
In-Reply-To: <20180831194643.GA62862@ban.mtv.corp.google.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Oct 2018 22:15:23 +0200
Message-ID: <CAMRc=MejZLV1EQ7uAddsxLY0MTUF8WyiBn=F0ZhkWQJpET0EDQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/29] at24: remove at24_platform_data
To: Brian Norris <computersforpeace@gmail.com>,
 "David S . Miller" <davem@davemloft.net>
Cc: Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
 Kevin Hilman <khilman@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
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
 Andrew Lunn <andrew@lunn.ch>, linux-doc <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-i2c <linux-i2c@vger.kernel.org>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

pt., 31 sie 2018 o 21:46 Brian Norris <computersforpeace@gmail.com> napisa=
=C5=82(a):
>
> Hi,
>
> On Fri, Aug 10, 2018 at 10:04:57AM +0200, Bartosz Golaszewski wrote:
> > Most boards use the EEPROM to store the MAC address. This series adds
> > support for cell lookups to the nvmem framework, registers relevant
> > cells for all users, adds nvmem support to eth_platform_get_mac_address=
(),
> > converts davinci_emac driver to using it and replaces at24_platform_dat=
a
> > with device properties.
>
> We already have:
>
> of_get_nvmem_mac_address() (which does exactly what you're adding,
> except it's DT specific)
> of_get_mac_address()
> fwnode_get_mac_address()
> device_get_mac_address()
>
> and now you've taught me that this exists too:
>
> eth_platform_get_mac_address()
>
> These mostly don't share code, and with your series, they'll start to
> diverge even more as to what they support. Can you please help rectify
> that, instead of widening the gap?
>
> For instance, you can delete most of eth_platform_get_mac_address() and
> replace it with device_get_mac_address() [1]. And you could add your new
> stuff to fwnode_get_mac_address().
>
> And important part to note here is that you code isn't just useful for
> ethernet -- it could be useful for Wifi devices too. So IMO, sticking it
> only in an "eth" function is the wrong move.
>
> Brian
>
> [1] arch_get_platform_mac_address() is the only part I wouldn't want to
> replicate into a truly generic helper. The following should be a no-op
> refactor, AIUI:
>

The only user of arch_get_platform_mac_address() is sparc. It returns
an address that seems to be read from some kind of EEPROM. I'm not
familiar with this arch though. I'm wondering if we could somehow
seamlessly remove this call and then convert all users of
eth_platform_get_mac_address() to using device_get_mac_address()?

David: I couldn't find a place in sparc code where any ethernet device
would be registered, so is there a chance that nobody is using it?

Best regards,
Bartosz Golaszewski

> diff --git a/net/ethernet/eth.c b/net/ethernet/eth.c
> index ee28440f57c5..b738651f71e1 100644
> --- a/net/ethernet/eth.c
> +++ b/net/ethernet/eth.c
> @@ -47,12 +47,12 @@
>  #include <linux/inet.h>
>  #include <linux/ip.h>
>  #include <linux/netdevice.h>
> +#include <linux/property.h>
>  #include <linux/etherdevice.h>
>  #include <linux/skbuff.h>
>  #include <linux/errno.h>
>  #include <linux/init.h>
>  #include <linux/if_ether.h>
> -#include <linux/of_net.h>
>  #include <linux/pci.h>
>  #include <net/dst.h>
>  #include <net/arp.h>
> @@ -528,19 +528,11 @@ unsigned char * __weak arch_get_platform_mac_addres=
s(void)
>  int eth_platform_get_mac_address(struct device *dev, u8 *mac_addr)
>  {
>         const unsigned char *addr;
> -       struct device_node *dp;
>
> -       if (dev_is_pci(dev))
> -               dp =3D pci_device_to_OF_node(to_pci_dev(dev));
> -       else
> -               dp =3D dev->of_node;
> -
> -       addr =3D NULL;
> -       if (dp)
> -               addr =3D of_get_mac_address(dp);
> -       if (!addr)
> -               addr =3D arch_get_platform_mac_address();
> +       if (device_get_mac_address(dev, mac_addr, ETH_ALEN))
> +               return 0;
>
> +       addr =3D arch_get_platform_mac_address();
>         if (!addr)
>                 return -ENODEV;
>
