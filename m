Received: from mail-yw0-x243.google.com ([2607:f8b0:4002:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dBXQu-0005Bh-Lz
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 02:14:26 +0000
Received: by mail-yw0-x243.google.com with SMTP id 17so4104234ywk.1
 for <linux-mtd@lists.infradead.org>; Thu, 18 May 2017 19:14:04 -0700 (PDT)
Date: Thu, 18 May 2017 22:13:55 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 08/30] isa.txt: standardize document format
Message-ID: <20170519021355.GA24556@sophia>
References: <cover.1495156975.git.mchehab@s-opensource.com>
 <3cfb5ad6db86330e07c6d0f833bbdb2788d99fa7.1495156975.git.mchehab@s-opensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3cfb5ad6db86330e07c6d0f833bbdb2788d99fa7.1495156975.git.mchehab@s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 18, 2017 at 10:24:00PM -0300, Mauro Carvalho Chehab wrote:
>Each text file under Documentation follows a different
>format. Some doesn't even have titles!
>
>Change its representation to follow the adopted standard,
>using ReST markups for it to be parseable by Sphinx:
>
>- Use the main title standard for this document;
>- replace _foo_ by **foo** for emphasis;
>- mark literal blocks as such.
>
>Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>

I'm all right with this patch, but there's just one minor nitpick about
the title that I've inlined.

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

>---
> Documentation/isa.txt | 53 ++++++++++++++++++++++++++-------------------------
> 1 file changed, 27 insertions(+), 26 deletions(-)
>
>diff --git a/Documentation/isa.txt b/Documentation/isa.txt
>index f232c26a40be..def4a7b690b5 100644
>--- a/Documentation/isa.txt
>+++ b/Documentation/isa.txt
>@@ -1,5 +1,6 @@
>+===========
> ISA Drivers
>------------

There's no need for this single-dashed line now so just remove it.

>+===========
> 
> The following text is adapted from the commit message of the initial
> commit of the ISA bus driver authored by Rene Herman.
>@@ -23,17 +24,17 @@ that all device creation has been made internal as well.
> 
> The usage model this provides is nice, and has been acked from the ALSA
> side by Takashi Iwai and Jaroslav Kysela. The ALSA driver module_init's
>-now (for oldisa-only drivers) become:
>+now (for oldisa-only drivers) become::
> 
>-static int __init alsa_card_foo_init(void)
>-{
>-	return isa_register_driver(&snd_foo_isa_driver, SNDRV_CARDS);
>-}
>+	static int __init alsa_card_foo_init(void)
>+	{
>+		return isa_register_driver(&snd_foo_isa_driver, SNDRV_CARDS);
>+	}
> 
>-static void __exit alsa_card_foo_exit(void)
>-{
>-	isa_unregister_driver(&snd_foo_isa_driver);
>-}
>+	static void __exit alsa_card_foo_exit(void)
>+	{
>+		isa_unregister_driver(&snd_foo_isa_driver);
>+	}
> 
> Quite like the other bus models therefore. This removes a lot of
> duplicated init code from the ALSA ISA drivers.
>@@ -47,11 +48,11 @@ parameter, indicating how many devices to create and call our methods
> with.
> 
> The platform_driver callbacks are called with a platform_device param;
>-the isa_driver callbacks are being called with a "struct device *dev,
>-unsigned int id" pair directly -- with the device creation completely
>+the isa_driver callbacks are being called with a ``struct device *dev,
>+unsigned int id`` pair directly -- with the device creation completely
> internal to the bus it's much cleaner to not leak isa_dev's by passing
> them in at all. The id is the only thing we ever want other then the
>-struct device * anyways, and it makes for nicer code in the callbacks as
>+struct device anyways, and it makes for nicer code in the callbacks as
> well.
> 
> With this additional .match() callback ISA drivers have all options. If
>@@ -75,20 +76,20 @@ This exports only two functions; isa_{,un}register_driver().
> 
> isa_register_driver() register's the struct device_driver, and then
> loops over the passed in ndev creating devices and registering them.
>-This causes the bus match method to be called for them, which is:
>+This causes the bus match method to be called for them, which is::
> 
>-int isa_bus_match(struct device *dev, struct device_driver *driver)
>-{
>-          struct isa_driver *isa_driver = to_isa_driver(driver);
>+	int isa_bus_match(struct device *dev, struct device_driver *driver)
>+	{
>+		struct isa_driver *isa_driver = to_isa_driver(driver);
> 
>-          if (dev->platform_data == isa_driver) {
>-                  if (!isa_driver->match ||
>-                          isa_driver->match(dev, to_isa_dev(dev)->id))
>-                          return 1;
>-                  dev->platform_data = NULL;
>-          }
>-          return 0;
>-}
>+		if (dev->platform_data == isa_driver) {
>+			if (!isa_driver->match ||
>+				isa_driver->match(dev, to_isa_dev(dev)->id))
>+				return 1;
>+			dev->platform_data = NULL;
>+		}
>+		return 0;
>+	}
> 
> The first thing this does is check if this device is in fact one of this
> driver's devices by seeing if the device's platform_data pointer is set
>@@ -102,7 +103,7 @@ well.
> Then, if the the driver did not provide a .match, it matches. If it did,
> the driver match() method is called to determine a match.
> 
>-If it did _not_ match, dev->platform_data is reset to indicate this to
>+If it did **not** match, dev->platform_data is reset to indicate this to
> isa_register_driver which can then unregister the device again.
> 
> If during all this, there's any error, or no devices matched at all
>-- 
>2.9.4
>
