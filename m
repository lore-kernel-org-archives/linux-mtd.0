Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8OrB-0005qI-A0
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2018 12:05:24 +0000
Received: by mail-lf1-x144.google.com with SMTP id y10-v6so9180079lfj.1
 for <linux-mtd@lists.infradead.org>; Fri, 05 Oct 2018 05:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20181004142942.11887-1-ricardo.ribalda@gmail.com>
 <20181004142942.11887-2-ricardo.ribalda@gmail.com>
 <20181005002125.12fd229f@bbrezillon>
 <CAPybu_26HST5xGfhE6MoVTRZok_gfDqN=ZOAesuEMVskdrCpLA@mail.gmail.com>
 <20181005090811.6b7e9957@bbrezillon>
 <CAPybu_38xH2Cv+eONQmEJ1i6k=oiQM=WrcwOFR29LbtRvWfKXA@mail.gmail.com>
 <20181005103730.57d52e3c@bbrezillon>
 <CAPybu_1RMcro3xLNW5mbybYdObCTq=QwXgk+RT6hcmRGTh6s7A@mail.gmail.com>
 <20181005121235.7e64b64a@bbrezillon>
In-Reply-To: <20181005121235.7e64b64a@bbrezillon>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 5 Oct 2018 14:04:52 +0200
Message-ID: <CAPybu_0TbeN+-F6zwN8XOMuY1EpgE6GRi=ExDx6O3Yun9kXjYQ@mail.gmail.com>
Subject: Re: [PATCH v10 10/10] mtd: maps: gpio-addr-flash: Add support for
 device-tree devices
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Zhouyang Jia <jiazhouyang09@gmail.com>, linux-mtd@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris
On Fri, Oct 5, 2018 at 12:12 PM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
>
> On Fri, 5 Oct 2018 11:54:18 +0200
> Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:
>
> > Hi Boris
> >
> > Just seen that  you already did the rebase at
> > https://github.com/bbrezillon/linux-0day/commits/mtd/physmap-cleanup
> >
> > Thanks for that.
> >
> > I am about to test it in real hw (unless you want me wait)
>
> Sure, go ahead and test it.
>
> Thanks,
>
> Boris
I had to change this on your patchset to have it working on hw:
https://pastebin.com/78A7yhJ9

If you send the patchset to the mailing list I can review it patch by patch.

Also
mtd: maps: Prepare merging of physmap and physmap_of

I do not think that can be bisected. (Not sure, I have to test it)

I add the diff to the mail, but gmail will probably scramble the
lines(yes I know I have to use other mail client)

Thanks!



diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index 2e236ef60e04..d7a902afc9a7 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -69,8 +69,6 @@ static int physmap_flash_remove(struct platform_device *dev)
  if (!info)
  return 0;

- physmap_data = dev_get_platdata(&dev->dev);
-
  if (info->cmtd) {
  err = mtd_device_unregister(info->cmtd);
  if (err)
@@ -80,12 +78,12 @@ static int physmap_flash_remove(struct platform_device *dev)
  mtd_concat_destroy(info->cmtd);
  }

- for (i = 0; i < info->nmaps; i++) {
- if (!info->mtds[i])
+ for (i = 0; i < info->nmaps; i++)
+ if (info->mtds[i])
  map_destroy(info->mtds[i]);
- }

- if (physmap_data->exit)
+ physmap_data = dev_get_platdata(&dev->dev);
+ if (physmap_data && physmap_data->exit)
  physmap_data->exit(dev);

  return 0;
@@ -456,18 +454,18 @@ static int physmap_flash_probe(struct
platform_device *dev)
  info->maps = devm_kzalloc(&dev->dev,
    sizeof(*info->maps) * info->nmaps,
    GFP_KERNEL);
- if (info->maps)
+ if (!info->maps)
  return -ENOMEM;

  info->mtds = devm_kzalloc(&dev->dev,
    sizeof(*info->mtds) * info->nmaps,
    GFP_KERNEL);
- if (info->mtds)
+ if (!info->mtds)
  return -ENOMEM;

  platform_set_drvdata(dev, info);

- info->gpios = devm_gpiod_get_array_optional(&dev->dev, "addr-gpios",
+ info->gpios = devm_gpiod_get_array_optional(&dev->dev, "addr",
      GPIOD_OUT_LOW);
  if (IS_ERR(info->gpios))
  return PTR_ERR(info->gpios);
@@ -480,14 +478,6 @@ static int physmap_flash_probe(struct platform_device *dev)
  err = physmap_flash_of_init(dev);
  if (err)
  err = physmap_flash_pdata_init(dev);
-
- if (err)
- return err;
-
- err = physmap_flash_of_init(dev);
- if (err)
- err = physmap_flash_pdata_init(dev);
-
  if (err)
  return err;

@@ -509,7 +499,6 @@ static int physmap_flash_probe(struct platform_device *dev)
  if (!info->maps[i].phys)
  info->maps[i].phys = res->start;

- info->maps[i].size = resource_size(res);
  info->win_order = get_bitmask_order(resource_size(res)) - 1;
  info->maps[i].size = BIT(info->win_order +
  (info->gpios ?





-- 
Ricardo Ribalda
