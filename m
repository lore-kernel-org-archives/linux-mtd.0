Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fzL3r-0003zU-99
 for linux-mtd@lists.infradead.org; Mon, 10 Sep 2018 12:13:08 +0000
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 39B5B20880
 for <linux-mtd@lists.infradead.org>; Mon, 10 Sep 2018 12:12:48 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id d15-v6so14183541qkc.1
 for <linux-mtd@lists.infradead.org>; Mon, 10 Sep 2018 05:12:48 -0700 (PDT)
MIME-Version: 1.0
References: <20180828111944.5956-1-jonas.gorski@gmail.com>
 <20180828111944.5956-5-jonas.gorski@gmail.com>
 <5b8e8a58.1c69fb81.12eaa.f292@mx.google.com>
 <CAOiHx=koYJR_m1RdxxSjxQH-8MuWBw18YfNDun3OWnca=CoT_g@mail.gmail.com>
 <CAOiHx=n+m7je_syF0-606N9foPBibjTUMvpaDstywit5GUO5cA@mail.gmail.com>
In-Reply-To: <CAOiHx=n+m7je_syF0-606N9foPBibjTUMvpaDstywit5GUO5cA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 10 Sep 2018 07:12:35 -0500
Message-ID: <CAL_JsqK-+pMt30-WnsJAGuhYTRU6-76Ge5GBeuPOjw28yXY+_A@mail.gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: mtd: describe BCM963XX ImageTag format
 and usage
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>, devicetree@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Mark Rutland <mark.rutland@arm.com>,
 Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 10, 2018 at 4:09 AM Jonas Gorski <jonas.gorski@gmail.com> wrote:
>
> On 10 September 2018 at 11:02, Jonas Gorski <jonas.gorski@gmail.com> wrote:
> > On 4 September 2018 at 02:30, Rob Herring <robh@kernel.org> wrote:
> >> On Tue, Aug 28, 2018 at 01:19:43PM +0200, Jonas Gorski wrote:
> >>> Describe how to use the BCM963XX ImageTag format in a mixed flash layout
> >>> environment.
> >>>
> >>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> >>> ---
> >>>  .../mtd/partitions/brcm,bcm963xx-imagetag.txt      | 78 ++++++++++++++++++++++
> >>>  1 file changed, 78 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-imagetag.txt
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-imagetag.txt b/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-imagetag.txt
> >>> new file mode 100644
> >>> index 000000000000..f4a444d69d9a
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-imagetag.txt
> >>> @@ -0,0 +1,78 @@
> >>> +Broadcom BCM963XX ImageTag Partition Container
> >>> +==============================================
> >>> +
> >>> +Some Broadcom BCM63XX SoC based devices contain additional, non discoverable
> >>> +partitions or non standard bootloader partition sizes. For these a mixed layout
> >>> +needs to be used with an explicit firmware partition.
> >>> +
> >>> +The BCM963XX ImageTag is a simple firmware header describing the offsets and
> >>> +sizes of the rootfs and kernel parts contained in the firmware.
> >>> +
> >>> +Required properties:
> >>> +- compatible : must be "brcm,bcm963xx-imagetag"
> >>> +
> >>> +Examples:
> >>> +
> >>> +flash@1e000000 {
> >>> +     compatible = "cfi-flash";
> >>> +     reg = <0x1e000000 0x2000000>;
> >>> +     bank-width = <2>;
> >>> +
> >>> +     partitions {
> >>> +             compatible = "fixed-partitions";
> >>> +             #address-cells = <1>;
> >>> +             #size-cells = <1>;
> >>> +
> >>> +             cfe@0 {
> >>> +                     reg = <0x0 0x10000>;
> >>> +                     read-only;
> >>> +             };
> >>> +
> >>> +             firmware@10000 {
> >>> +                     reg = <0x10000 0x7d0000>;
> >>> +                     compatible = "brcm,bcm963xx-imagetag";
> >>> +             };
> >>> +
> >>> +             caldata@7e0000 {
> >>> +                     reg = <0x7e0000 0x10000>;
> >>> +                     read-only;
> >>> +             };
> >>> +
> >>> +             nvram@7f0000 {
> >>> +                     reg = <0x7f0000 0x10000>;
> >>> +             };
> >>> +     };
> >>> +};
> >>> +
> >>> +
> >>> +flash@1e000000 {
> >>> +     compatible = "cfi-flash";
> >>> +     reg = <0x1e000000 0x2000000>;
> >>> +     bank-width = <2>;
> >>> +
> >>> +     partitions {
> >>> +             compatible = "fixed-partitions";
> >>> +             #address-cells = <1>;
> >>> +             #size-cells = <1>;
> >>> +
> >>> +             /*
> >>> +              * Some devices use a flash chip with 64k erase blocks, some
> >>> +              * use one with 128k erase blocks, so the vendor decided to
> >>> +              * always use 128k as the firmware offset.
> >>> +              */
> >>
> >> That's a interesting piece of info, but not really a reason to have a
> >> second example.
> >
> > Generally, I'd rather have one example too many than one too few, but
> > I can drop it if you think it's unnecessary. If I do that, can I add
> > your Ack then here as well for the v2?
>
> Of course a reviewed-by, not an Ack.

Yes.

Rob
