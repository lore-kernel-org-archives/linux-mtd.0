Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dX0Mm-00081b-UB
 for linux-mtd@lists.infradead.org; Mon, 17 Jul 2017 07:22:54 +0000
Date: Mon, 17 Jul 2017 09:22:34 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Archit Taneja <architt@codeaurora.org>, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 andy.gross@linaro.org, sricharan@codeaurora.org
Subject: Re: [PATCH 01/14] qcom: mtd: nand: Add driver data for QPIC DMA
Message-ID: <20170717092234.001fb765@bbrezillon>
In-Reply-To: <bfb3d3c466e60fa08f969ea485870ba4@codeaurora.org>
References: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
 <1498720566-20782-2-git-send-email-absahu@codeaurora.org>
 <bd6add74-4f42-5036-3513-2e672ef97b15@codeaurora.org>
 <20170703214150.6a7b3f38@bbrezillon>
 <bfb3d3c466e60fa08f969ea485870ba4@codeaurora.org>
MIME-Version: 1.0
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

On Mon, 17 Jul 2017 11:41:01 +0530
Abhishek Sahu <absahu@codeaurora.org> wrote:

> >> > +
> >> > +nand@79b0000 {  
> > 
> > nand-controller@xxxx {
> > 
> > BTW, glad to see another driver moving to the new DT representation 
> > :-).
> >   
> >> > +	compatible = "qcom,qpic-nandc-v1.4.0";
> >> > +	reg = <0x79b0000 0x1000>;
> >> > +
> >> > +	clocks = <&gcc GCC_QPIC_CLK>,
> >> > +		<&gcc GCC_QPIC_AHB_CLK>;
> >> > +	clock-names = "core", "aon";
> >> > +
> >> > +	#address-cells = <1>;
> >> > +	#size-cells = <0>;
> >> > +
> >> > +	nandcs@0 {  
> > 
> > 	nand@0 {
> >   
> >> > +		compatible = "qcom,nandcs";  
> > 
> > Why do you need a compatible here?  
> It is the part of original driver. We can connect multiple
> NAND devices in the same bus and qcom,nandcs is being used
> for each connected NAND device. Each NAND device can use
> different  chip select, ecc strength etc which we can specify
> under this sub node.


Still don't understand why you need a compatible? Is this a memory bus
where you can connect other kind of memories (parallel NORs,
SRAMs, ...)?

If that's not the case, then considering all subnodes of the
nand-controller node containing a reg property as NAND devices is fine,
you don't need this compatible = "nand,cs" (see sunxi-nand bindings
[1]).

If the bus is generic and can be attached non-NAND devices, I'd
recommend looking at atmel's binding [2], because you're likely to
have one instance of the NAND controller logic for all NAND devices
connected on this bus.
And more importantly, if the bus a generic, the node should not be
named nand or nand-controller, and the compatible should not contain
'nandc' in it.

[1]http://elixir.free-electrons.com/linux/latest/source/Documentation/devicetree/bindings/mtd/sunxi-nand.txt#L34
[2]http://elixir.free-electrons.com/linux/latest/source/Documentation/devicetree/bindings/mtd/atmel-nand.txt#L70
