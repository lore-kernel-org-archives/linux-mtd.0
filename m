Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cpLRA-0003jE-8I
 for linux-mtd@lists.infradead.org; Sat, 18 Mar 2017 20:58:58 +0000
Received: from mail.kernel.org (localhost [127.0.0.1])
 by mail.kernel.org (Postfix) with ESMTP id 910EF2049C
 for <linux-mtd@lists.infradead.org>; Sat, 18 Mar 2017 20:58:34 +0000 (UTC)
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
 [209.85.161.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3CDD92042A
 for <linux-mtd@lists.infradead.org>; Sat, 18 Mar 2017 20:58:32 +0000 (UTC)
Received: by mail-yw0-f173.google.com with SMTP id o4so71448158ywd.3
 for <linux-mtd@lists.infradead.org>; Sat, 18 Mar 2017 13:58:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170315204141.1381cd01@tock>
References: <1488875164-30440-1-git-send-email-albeu@free.fr>
 <1488875164-30440-2-git-send-email-albeu@free.fr>
 <20170315172401.35b5owbme4scqfgn@rob-hp-laptop>
 <20170315204141.1381cd01@tock>
From: Rob Herring <robh@kernel.org>
Date: Sat, 18 Mar 2017 15:58:11 -0500
Message-ID: <CAL_JsqJ=P++NeNCzikBfLy3R_XSX1wzbuuSVinYuD3QkW_Vjqg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] doc: bindings: Add bindings documentation for mtd
 nvmem
To: Alban <albeu@free.fr>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Moritz Fischer <moritz.fischer@ettus.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 15, 2017 at 2:41 PM, Alban <albeu@free.fr> wrote:
> On Wed, 15 Mar 2017 12:24:01 -0500
> Rob Herring <robh@kernel.org> wrote:
>
>> On Tue, Mar 07, 2017 at 09:26:03AM +0100, Alban wrote:
>> > Config data for drivers, like MAC addresses, is often stored in MTD.
>> > Add a binding that define how such data storage can be represented in
>> > device tree.
>> >
>> > Signed-off-by: Alban <albeu@free.fr>
>> > ---
>> > Changelog:
>> > v2: * Added a "Required properties" section with the nvmem-provider
>> >       property
>> > ---
>> >  .../devicetree/bindings/nvmem/mtd-nvmem.txt        | 33 ++++++++++++++++++++++
>> >  1 file changed, 33 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
>> >
>> > diff --git a/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
>> > new file mode 100644
>> > index 0000000..8ed25e6
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
>> > @@ -0,0 +1,33 @@
>> > += NVMEM in MTD =
>> > +
>> > +Config data for drivers, like MAC addresses, is often stored in MTD.
>> > +This binding define how such data storage can be represented in device tree.
>> > +
>> > +An MTD can be defined as an NVMEM provider by adding the `nvmem-provider`
>> > +property to their node. Data cells can then be defined as child nodes
>> > +of the partition as defined in nvmem.txt.
>> > +
>> > +Required properties:
>> > +nvmem-provider:    Indicate that the device should be registered as
>> > +           NVMEM provider
>>
>> I think we should use a compatible string here (perhaps with a
>> generic fallback), and that can imply it is an nvmem provider. The
>> reason is then the compatible can also imply other information that
>> isn't defined in DT.
>
> That would work for partitions but not for unpartitioned MTD as these
> will already have a compatible string for the MTD hardware. I was also
> under the impression that capabilities/services provided by devices
> were represented with such properties, like interrupt-controller or
> gpio-controller, and not with compatible strings.
>
> There is also another problem with unpartitioned MTD, earlier MTD
> partitions binding allowed to have partitions as direct child nodes
> without any compatible strings. The current nvmem binding do the same
> for the nvmem cells, so it wouldn't be clear if a child node of the MTD
> is a partition using the old binding or an nvmem cell.

Perhaps a sign we should not repeat that.

> As I think this problem could happen with some other device types I
> suggested to re-work the nvmem binding to be more like the current MTD
> partitions. See these threads[1][2], but a short example would look like
> this:
>
> flash {
>         compatible = "vendor,flash-device-model";
>         ...
>         nvmem-provider;
>         nvmem-cells {
>                 compatible = "nvmem-cells";

Isn't the node name or compatible here enough to imply this is a nvmem provider?

>                 #address-cells = <1>;
>                 #size-cells = <1>;
>
>                 cell@100 {
>                         label = "mac-address";
>                         reg = <0x100 0x6>;
>                 };
>         };
> };
