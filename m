Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eAGG3-000348-6Y
 for linux-mtd@lists.infradead.org; Thu, 02 Nov 2017 14:14:15 +0000
Received: by mail-lf0-x243.google.com with SMTP id a2so6666498lfh.11
 for <linux-mtd@lists.infradead.org>; Thu, 02 Nov 2017 07:13:50 -0700 (PDT)
Message-ID: <1509632027.16695.5.camel@gmail.com>
Subject: Re: sam9x5: MTD numbering changed
From: Richard Genoud <richard.genoud@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Peter Rosin
 <peda@axentia.se>, linux-mtd <linux-mtd@lists.infradead.org>,
 devicetree@vger.kernel.org
Date: Thu, 02 Nov 2017 15:13:47 +0100
In-Reply-To: <20171102133954.055ce285@bbrezillon>
References: <1509621436.16695.3.camel@gmail.com>
 <20171102133954.055ce285@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le jeudi 02 novembre 2017 à 13:39 +0100, Boris Brezillon a écrit :
> +Nicolas
> 
> Hi Richard,
> 
> On Thu, 02 Nov 2017 12:17:16 +0100
> Richard Genoud <richard.genoud@gmail.com> wrote:
> 
> > Hi,
> > 
> > I've got an at91sam9g35-cm based board, with 4 partition on the
> > spi-
> > dataflas and 5 partitions on the NAND flash.
> > Before commit 1004a2977bdc ("ARM: dts: at91: Switch to the new NAND
> > bindings"),
> > the NAND partitions were mtd0-4 and spi-dataflash partitions mtd5-
> > 8.
> > 
> > Since commit 1004a2977bdc ("ARM: dts: at91: Switch to the new NAND
> > bindings"),
> > the spi-dataflash partitions are discovered before the NAND
> > partitions.
> > So NAND partition became mtd4-8 and spi-dataflash partition mtd0-3.
> > 
> > This broke some script that relied on the mtd numbering.
> > 
> > Updating those scripts to rely on the mtd device name instead of
> > number is not really a problem. The real problem is when an older
> > script using mtd numbering is run on the new system : I expect dead
> > kittens everywhere !
> 
> Crap! That was one of the thing I was afraid of when changing the
> binding: probe order has an impact on ids assigned to MTD devs, and
> since things are not defined at the same place in the DT, it changes
> the probe order.
> 
> > 
> > So, I'd like to know if there's a way to force the older numbering
> > ?
> 
> Reverting the patches is probably the easiest way (and it's easily
> backportable). Now, if we want to switch to the new bindings at some
> point we'll need to support DT aliases for mtd devs:
> 
> aliases {
> 	mtdX = &flashpartN;
> 	mtdY = &flashdevM;
> };
> 
> The problem with this solution is that it only works if all
> partitions
> are defined in the DT, which is not always the case (they can be
> defined
> on the command line with mtdparts=).
Yes, and if they are different from the ones declared in
at91sam9x5cm.dtsi, they are likely defined with mtdparts=, since AFAIK,
we can't remove a declared partitionning.

I'll disable the ebi and switch back to the old binding in my dts for
now.
> 
> > (I tried poking around the DTS without succès).
> > 
> > any idea ?
> 
> I don't have a perfect solution, but the problem you report clearly
> shows that relying on MTD numbering is unsafe and should be avoided.
Clearly, but who doesn't ? ;)


Thanks !

Richard.
> 
> Regards,
> 
> Boris
> 
> > 
> > regards,
> > Richard.
