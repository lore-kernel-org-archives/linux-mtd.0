Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cv3Gp-0002Lw-9f
 for linux-mtd@lists.infradead.org; Mon, 03 Apr 2017 14:47:53 +0000
Received: from mail.kernel.org (localhost [127.0.0.1])
 by mail.kernel.org (Postfix) with ESMTP id B716920149
 for <linux-mtd@lists.infradead.org>; Mon,  3 Apr 2017 14:47:29 +0000 (UTC)
Received: from mail-yb0-f176.google.com (mail-yb0-f176.google.com
 [209.85.213.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B3D8820160
 for <linux-mtd@lists.infradead.org>; Mon,  3 Apr 2017 14:47:26 +0000 (UTC)
Received: by mail-yb0-f176.google.com with SMTP id i124so34930800ybc.3
 for <linux-mtd@lists.infradead.org>; Mon, 03 Apr 2017 07:47:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170403143840.GA23698@hardcore>
References: <20170327160524.29019-1-jglauber@cavium.com>
 <20170327160524.29019-2-jglauber@cavium.com>
 <20170403132937.z5mxksabo6kmo4jy@rob-hp-laptop>
 <20170403143840.GA23698@hardcore>
From: Rob Herring <robh@kernel.org>
Date: Mon, 3 Apr 2017 09:47:05 -0500
Message-ID: <CAL_JsqJ2VgF_Lp-vpdn6VL71K4z6Mu7DWYSaLZ_N0U+jaTuPsQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: mtd: Add Cavium SOCs NAND bindings
To: Jan Glauber <jan.glauber@caviumnetworks.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 3, 2017 at 9:38 AM, Jan Glauber
<jan.glauber@caviumnetworks.com> wrote:
> On Mon, Apr 03, 2017 at 08:29:37AM -0500, Rob Herring wrote:
>> On Mon, Mar 27, 2017 at 06:05:23PM +0200, Jan Glauber wrote:
>> > Add device tree binding description for Cavium SOC nand flash controller.
>> >
>> > CC: Rob Herring <robh+dt@kernel.org>
>> > CC: Mark Rutland <mark.rutland@arm.com>
>> > CC: devicetree@vger.kernel.org
>> >
>> > Signed-off-by: Jan Glauber <jglauber@cavium.com>
>> > ---
>> >  .../devicetree/bindings/mtd/cavium_nand.txt        | 32 ++++++++++++++++++++++
>> >  1 file changed, 32 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/mtd/cavium_nand.txt
>> >
>> > diff --git a/Documentation/devicetree/bindings/mtd/cavium_nand.txt b/Documentation/devicetree/bindings/mtd/cavium_nand.txt
>> > new file mode 100644
>> > index 0000000..4698d1f
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/mtd/cavium_nand.txt
>> > @@ -0,0 +1,32 @@
>> > +* Cavium NAND controller
>> > +
>> > +Required properties:
>> > +
>> > +- compatible:              should be "cavium,cn8xxx-nand"
>>
>> Don't use wildcards in compatible strings. For PCI devices, this should
>> be based on the PCI vendor and device IDs.
>>
>
> Is there a syntax for compatible PCI devices? I'm afraid I've not seen
> this yet, can you give an example?

www.o3one.org/hwdocs/openfirmware/pci_supplement_2_1.pdf

> Most of Cavium's devices are PCI devices, we just added the compatible
> as convenience and usually it is not parsed.

Linux doesn't parse it, but it's still required in the binding.

Rob
