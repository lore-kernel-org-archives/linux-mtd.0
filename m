Date: Thu, 9 Jun 2016 11:11:00 +0300
From: Aleksei Mamlin <mamlinav@gmail.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 7/7] ARM: dts: sun7i: Enable NAND on Wexler TAB7200
Message-Id: <20160609111100.38931fbe05fda9be7a355836@gmail.com>
In-Reply-To: <20160608220314.GL14179@lukather>
References: <1465208664-9366-1-git-send-email-mamlinav@gmail.com>
 <1465208664-9366-8-git-send-email-mamlinav@gmail.com>
 <20160608220314.GL14179@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 9 Jun 2016 00:03:14 +0200
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> Hi,
> 
> On Mon, Jun 06, 2016 at 01:24:24PM +0300, Aleksei Mamlin wrote:
> > Enable the NFC and describe the NAND flash connected to this controller.
> > 
> > Signed-off-by: Aleksei Mamlin <mamlinav@gmail.com>
> > ---
> >  arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts | 41 ++++++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
> > index 2f6b21a..42aff91 100644
> > --- a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
> > +++ b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
> > @@ -159,6 +159,47 @@
> >  	status = "okay";
> >  };
> >  
> > +&nfc {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&nand_pins_a>, <&nand_cs0_pins_a>, <&nand_rb0_pins_a>;
> > +	status = "okay";
> > +
> > +	nand@0 {
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		reg = <0>;
> > +		allwinner,rb = <0>;
> > +
> > +		nand-ecc-mode = "hw";
> > +		nand-on-flash-bbt;
> > +
> > +		boot0@0 {
> > +			label = "boot0";
> > +			reg = /bits/ 64 <0x0 0x200000>;
> > +		};
> > +
> > +		boot0-rescue@200000 {
> > +			label = "boot0-rescue";
> > +			reg = /bits/ 64 <0x200000 0x200000>;
> > +		};
> > +
> > +		uboot@400000 {
> > +			label = "uboot";
> > +			reg = /bits/ 64 <0x400000 0x200000>;
> > +		};
> > +
> > +		uboot-rescue@600000 {
> > +			label = "uboot-rescue";
> > +			reg = /bits/ 64 <0x600000 0x200000>;
> > +		};
> > +
> > +		main@800000 {
> > +			label = "main";
> > +			reg = /bits/ 64 <0x800000 0xff800000>;
> > +		};
> > +	};
> > +};
> 
> This feels a bit premature. The two boards you're using have an MLC
> NAND which is not supported yet. Until there's proper MLC support in
> the kernel, I'm not sure we want to enable that for end-users when we
> know that things will get wrong.
> 
> However, after discussing this with Boris, I appreciate that we don't
> have any example available because of this policy for people that want
> to opt-in anyway.
> 
> What we could do is to still mark the status as disabled in the DTS,
> with a big fat warning as comment just before, so that it requires
> user action, and that user will have been warned.
> 
> Would that work for you?
> Maxime
> 

Let's drop this two patches with boards dts changes until we get proper MLC
support in kernel.

As for examples - I'll update linux-sunxi wiki with how to enable NAND 
controller and describe NAND chips in DTS. People who want to add NAND support 
to their boards will be warned that it is risky for now.

>
> -- 
> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com


-- 
Thanks and regards,
Aleksei Mamlin
