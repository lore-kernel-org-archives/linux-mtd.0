Received: from mail-ob0-x231.google.com ([2607:f8b0:4003:c01::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YuQ92-0003Wm-LV
 for linux-mtd@lists.infradead.org; Mon, 18 May 2015 18:52:09 +0000
Received: by obfe9 with SMTP id e9so135809179obf.1
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2015 11:51:46 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20150518183442.GR11598@ld-irv-0074>
References: <1431624773-4165-1-git-send-email-computersforpeace@gmail.com>
 <20150515195541.GL11598@ld-irv-0074>
 <20150518104501.GD3551@leverpostej>
 <20150518183442.GR11598@ld-irv-0074>
Date: Mon, 18 May 2015 20:51:46 +0200
Message-ID: <CAMuHMdUCj2AXk_0mAgRfAStrveHPi=Rp2g-b177zO_ode8NaCw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: dt: mtd: replace "nor-jedec" binding with
 "jedec, spi-nor"
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Marek Vasut <marex@denx.de>, Pawel Moll <Pawel.Moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Stephen Warren <swarren@wwwdotorg.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Kumar Gala <galak@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Mon, May 18, 2015 at 8:34 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Mon, May 18, 2015 at 11:45:01AM +0100, Mark Rutland wrote:
>> On Fri, May 15, 2015 at 08:55:41PM +0100, Brian Norris wrote:
>> > It really helps if I test patches...
>> >
>> > On Thu, May 14, 2015 at 10:32:53AM -0700, Brian Norris wrote:
> [...]
>> > > @@ -305,7 +305,7 @@ static const struct spi_device_id m25p_ids[] = {
>> > >    * Generic support for SPI NOR that can be identified by the JEDEC READ
>> > >    * ID opcode (0x9F). Use this, if possible.
>> > >    */
>> > > - {"nor-jedec"},
>> > > + {"jedec,spi-nor"},
>> >
>> > So I forgot (again; we hit this before) that the SPI/OF framework strips
>> > everything before the first comma before binding devices. See
>> > of_modalias_node(). So I'll have to squash in the patch below to get a
>> > usable binding.
>>
>> Is it not possible to use the of_match_table on spi_driver::driver? If
>> not, we really should make it so.
>
> Hmm, it does look like spi.c supports multiple matching mechanisms, so I
> guess m25p80.c could match some with of_match_table and some with
> modalias/spi_driver.id_table. See:
>
> static int spi_match_device(struct device *dev, struct device_driver *drv)
> {
>         const struct spi_device *spi = to_spi_device(dev);
>         const struct spi_driver *sdrv = to_spi_driver(drv);
>
>         /* Attempt an OF style match */
>         if (of_driver_match_device(dev, drv))
>                 return 1;
>         // ^^^^ we aren't yet (but could be) using this
>
>         /* Then try ACPI */
>         if (acpi_driver_match_device(dev, drv))
>                 return 1;
>
>         if (sdrv->id_table)
>                 return !!spi_match_id(sdrv->id_table, spi);
>         // ^^^^ we're currently only using this
>
>         return strcmp(spi->modalias, drv->name) == 0;
> }
>
> I'll see about patching this for 4.2. We have a working solution for
> 4.1 at least.

When using DT:
  - spi_driver.id_table is used to match with vendor-stripped DT "compatible"
    entries.
  - spi_driver.driver.of_match_table is used to match with full DT "compatible"
    entries.

Note that stripping of vendor names from DT "compatible" entries is done
for the _first_ "compatible" entry in the device node only!
Hence

        compatible = "myvendor,m25p80";

will match against "m25p80" in m25p_ids[], while

        compatible = "myvendor,shinynewdevice", "st,m25p80";

will _not_ match against "m25p80" in m25p_ids[], and fail to probe in
the absence of a driver entry for the first (real) "compatible" entry.

I2c behaves similarly.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
