Received: from mail-qg0-x22e.google.com ([2607:f8b0:400d:c04::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ajt6t-0001Y9-A1
 for linux-mtd@lists.infradead.org; Sat, 26 Mar 2016 18:38:56 +0000
Received: by mail-qg0-x22e.google.com with SMTP id u110so81482759qge.3
 for <linux-mtd@lists.infradead.org>; Sat, 26 Mar 2016 11:38:34 -0700 (PDT)
Subject: Re: [RFCv2: PATCH 1/2] mtd: mediatek: device tree docs for MTK Smart
 Device Gen1 NAND
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1458653560-2679-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1458653560-2679-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160322145258.44945c64@bbrezillon>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, matthias.bgg@gmail.com,
 robh@kernel.org, linux-mtd@lists.infradead.org, xiaolei.li@mediatek.com,
 daniel.thompson@linaro.org, erin.lo@mediatek.com,
 linux-mediatek@lists.infradead.org
From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Message-ID: <56F6D727.8070001@linaro.org>
Date: Sat, 26 Mar 2016 14:38:31 -0400
MIME-Version: 1.0
In-Reply-To: <20160322145258.44945c64@bbrezillon>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/22/2016 09:52 AM, Boris Brezillon wrote:
>> > +		compatible = "mediatek,mt2701-nfc";
>> > +		reg = <0 0x1100d000 0 0x1000>;
>> > +		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_LOW>;
>> > +		clocks = <&pericfg CLK_PERI_NFI>,
>> > +			 <&pericfg CLK_PERI_NFI_PAD>;
>> > +		clock-names = "nfi_clk", "pad_clk";
>> > +		nand-on-flash-bbt;
>> > +		status = "disabled";
>> > +		mediatek,ecc-controller = <&bch>;
> Now that 2 different drivers use the same way to link the ECC engine
> and the NAND controller we can think about defining a generic property
> (ecc-engine ?), and provide a generic framework.
>
> The generic framework part is not something I'm asking right now, but I
> think we should start using a generic property here.
>

we have done all the changes required for v3 except this one.
so please let me check my understanding before going ahead: are you suggesting
that we replace "mediatek,ecc-controller" for "ecc-engine" (even though this
generic property doesn't exist yet)?

and then afterwards, generate another patch-set set to define and document
"ecc-engine"?
