Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOSEL-0006lB-E8
 for linux-mtd@lists.infradead.org; Tue, 24 Sep 2013 13:00:43 +0000
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MTM00FLRS47DH30@mailout1.w1.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 24 Sep 2013 14:00:13 +0100 (BST)
From: Tomasz Figa <t.figa@samsung.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2] MTD: Onenand: Add device tree support for samsung
 onenand
Date: Tue, 24 Sep 2013 15:00:01 +0200
Message-id: <2086340.RrXQX9ib0T@amdc1227>
In-reply-to: <20130923140823.GC16069@e106331-lin.cambridge.arm.com>
References: <1379941608-5068-1-git-send-email-m.krawczuk@partner.samsung.com>
 <20130923140823.GC16069@e106331-lin.cambridge.arm.com>
MIME-version: 1.0
Content-transfer-encoding: 7Bit
Content-type: text/plain; charset=us-ascii
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Pawel Moll <Pawel.Moll@arm.com>,
 Mateusz Krawczuk <m.krawczuk@partner.samsung.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rob.herring@calxeda.com" <rob.herring@calxeda.com>,
 "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "rob@landley.net" <rob@landley.net>,
 "grant.likely@linaro.org" <grant.likely@linaro.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mateusz, Mark,

On Monday 23 of September 2013 15:08:23 Mark Rutland wrote:
> On Mon, Sep 23, 2013 at 02:06:48PM +0100, Mateusz Krawczuk wrote:
> > +
> > +Required properties:
> > +  - compatible: value should be either of the following.
> > +      (a) "samsung,s3c6400-onenand",
> > +		for onenand controller compatible with s3c6400.
> > +      (b) "samsung,s3c6410-onenand",
> > +		for onenand controller compatible with s3c6410.
> > +      (c) "samsung,s5pc100-onenand",
> > +		for onenand controller compatible with s5pc100.
> > +      (d) "samsung,s5pc110-onenand",
> > +      for s5pc100-like onenand controller used on s5pc110 which supports DMA.
> > +
> 
> As I asked on the last posting, what are the differences between these
> implementations?

(d) is a completely different controller than (a), (b) and (c). They
have completely different register layouts. Also see below.

> > +Required properties for s5pc110:
> > +
> > + - reg: the offset and length of the control registers. First region describes
> > +	OneNAND interface, second control registers.
> 
> Also, the complete reg description is a bit confusing. How about
> something like:
> 
>  - reg: two register specifiers:
>         [0] - The OneNAND interface
> 	[1] - The control registers

This looks much better, although I wouldn't be afraid of using words
instead of symbols to write this as follows instead:

  - reg: two memory mapped register regions:
    - first entry: memory mapped OneNAND chip,
    - second entry: control registers.

But... The controller in theory supports more than one OneNAND chip, each
mapped at different, so I'd suggest reordering the entries:

  - reg: memory mapped register regions:
    - first entry: control registers.
    - second entry: memory mapped OneNAND chip 0,
    - ...
    - Nth entry: memory mapped OneNAND chip (N-2).

> Do we expect future OneNAND devices which may require more reg entries
> to describe?

Nope. In age of eMMC I wouldn't even expect any new OneNAND controller
to be handled by these bindings.

> > + - interrupt-parent, interrupts		Onenand memory interrupts
> 
> As it's a common property, I don't think interrupt-parent needs to
> be described.
> 
> Is there more than one interrupt? What's it called on the manual?

There is one interrupt per OneNAND chip, so this is what should be
represented in the binding.

> > +
> > +Required properties for others:
> > +
> > + - reg: the offset and length of the control registers. First region describes
> > +	control registers, second OneNAND interface.
> 
> Why does the s5pc110 OneNAND binding take its registers in the opposite
> order to the rest of these? Can we not fix up the driver first to make
> it consistent? Then we only need to describe this once and it's going to
> be far less of a headache to support.

Both areas in both "major" hardware variants have completely different
meaning:
 - in case of SoCs earlier or equal to S5PC100, first entry represents
   controller registers that are used to control various operating
   parameters, while second entry is a command/data interface, which is
   used to trigger read/write/etc. operations in the controller and
   push/pull data through it. In this variant there is no direct mapping
   of OneNAND chip in CPU address space. This variant supports only
   one memory chip per controller instance,
 - in case of S5PC110, each OneNAND chip is directly mapped into CPU
   address space. In addition there is a block of control registers that
   are used to configure the interface and control internal DMA engine
   (which is not present in <= S5PC100 variants). This variant supports
   multiple memory chips per controller instance (2 in case of S5PV210,
   but current driver handles only one AFAIK).

> > +
> > +Clocks:
> > + - gate - clock which output is supplied to external OneNAND flash memory.
> 
> How about the following (without the Clocks header):
> 
> - clocks: clock-specifiers for the clocks named in clock-names, per the
>           common clock bindings.
> 
> - clock-names: should contain "gate" for the clock to the OneNAND flash
>                memory.
> 
> Is this the only clock that might be necessary on all platforms?

S3C64xx SoCs have only one OneNAND gate clock per controller.
S5PC100 SoC has one IP gate clock and one memory chip gate clock.
S5PC110 SoC has one gate that gates both IP and all memory chips.

Best regards,
Tomasz
