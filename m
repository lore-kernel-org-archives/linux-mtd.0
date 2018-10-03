Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7p5g-0001SL-E2
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 21:53:58 +0000
Received: by mail-lj1-x244.google.com with SMTP id r8-v6so6500230ljc.10
 for <linux-mtd@lists.infradead.org>; Wed, 03 Oct 2018 14:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20181003193859.23928-1-ricardo.ribalda@gmail.com>
 <20181003193859.23928-7-ricardo.ribalda@gmail.com>
 <20181003232702.4c18e725@bbrezillon>
In-Reply-To: <20181003232702.4c18e725@bbrezillon>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 3 Oct 2018 23:53:27 +0200
Message-ID: <CAPybu_3M75E9c+JmR7MVKsyv3vYPOrZ6qBABtvEF317KA+roBg@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] dt-binding: mtd: Document gpio-addr-flash
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Zhouyang Jia <jiazhouyang09@gmail.com>, linux-mtd@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
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
On Wed, Oct 3, 2018 at 11:27 PM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
>
> On Wed,  3 Oct 2018 21:38:58 +0200
> Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:
>
> > Add documentation for gpio-addr-flash. This binding allow creating
> > flash devices that are paged using GPIOs.
> >
> > Cc: devicetree@vger.kernel.org
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > ---
> >  .../bindings/mtd/gpio-addr-flash.txt          | 54 +++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/gpio-addr-flash.txt
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/gpio-addr-flash.txt b/Documentation/devicetree/bindings/mtd/gpio-addr-flash.txt
> > new file mode 100644
> > index 000000000000..5006a26e1753
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/gpio-addr-flash.txt
> > @@ -0,0 +1,54 @@
> > +Memory Mapped flash with some address lines addressed using GPIOs
> > +
> > +Handle the case where a flash device is mostly addressed using physical
> > +line and supplemented by GPIOs.  This way you can hook up say a 8MiB flash
> > +to a 2MiB memory range and use the GPIOs to select a particular range.
> > +
> > + - compatible : "cfi-gpio-addr-flash"
> > + - reg : Address range of the mtd chip that is memory mapped, this is,
> > +   on the previous example 2MiB.
> > + - bank-width : Width (in bytes) of the bank.  Equal to the
> > +   device width times the number of interleaved chips.
> > + - gpios: List of GPIO specifiers that will be used to address the MSBs address
> > +   lines. The order goes from LSB to MSB.
> > + - probe-type : (optional) "cfi_probe", "jedec_probe". How the mtd chip
> > +   is going to be probed. If omitted, assumed to be equal to "cfi_probe".
>
> Looks like other bindings are encoding the probe type in the
> compatible [1][2], and we should probably follow what's been done by
> others.

If I understood it right, they are special cases of physmap_of_core.c
https://elixir.bootlin.com/linux/v4.18.11/source/drivers/mtd/maps/physmap_of_core.c#L242

The driver that handles the compatible is physmap_of_core.c, and afaik
multiple drivers with the same
compatible string is a very bad idea.

We can convert the driver to something like Versatile or gemini, but
then we will not support platform devices

btw, the binding that I am used is used by:
https://elixir.bootlin.com/linux/v4.18.11/source/drivers/mtd/maps/physmap_of_core.c#L91

Yes, I know is obsolete

Tomorrow morning I will try to address your comments, test in hw and resend

Thanks




>
> > + - #address-cells, #size-cells : Must be present if the device has
> > +   sub-nodes representing partitions (see below).  In this case
> > +   both #address-cells and #size-cells must be equal to 1.
> > +
> > +The device tree may optionally contain sub-nodes describing partitions of the
> > +address space. Check partition.txt for more details.
> > +
> > +Example:
> > +
> > +     flash@300000 {
> > +             #address-cells = <1>;
> > +             #size-cells = <1>;
>
> You should not have the #address-cells and #size-cells props defined at
> this level, it's done in the partitions node already.
>
> > +             compatible = "cfi-gpio-addr-flash";
> > +             bank-width = <2>;
> > +             reg = < 0x00300000 0x00200000 >;
> > +             gpios = <&gpio_0 3 0>, <&gpio_0 4 0>;
> > +             partitions {
> > +                     compatible = "fixed-partitions";
> > +                     #address-cells = <1>;
> > +                     #size-cells = <1>;
> > +
> > +                     partition@0 {
> > +                             reg = < 0x0 0x200000 >;
> > +                             label = "Golden Bitstream";
> > +                     };
> > +                     partition@200000 {
> > +                             reg = < 0x200000 0x200000 >;
> > +                             label = "User Bitstream";
> > +                     };
> > +                     partition@400000 {
> > +                             reg = < 0x400000 0x200000 >;
> > +                             label = "V4L Controls";
> > +                     };
> > +                     partition@600000 {
> > +                             reg = < 0x600000 0x200000 >;
> > +                             label = "Production Data";
> > +                     };
> > +             }
> > +     } ;
>
> [1]https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt
> [2]https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/mtd/arm-versatile.txt



-- 
Ricardo Ribalda
