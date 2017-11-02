Received: from mail-lf0-x229.google.com ([2a00:1450:4010:c07::229])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eAHQ6-00023w-VH
 for linux-mtd@lists.infradead.org; Thu, 02 Nov 2017 15:28:39 +0000
Received: by mail-lf0-x229.google.com with SMTP id e143so6974598lfg.12
 for <linux-mtd@lists.infradead.org>; Thu, 02 Nov 2017 08:28:16 -0700 (PDT)
Message-ID: <1509636493.16695.9.camel@gmail.com>
Subject: Re: sam9x5: MTD numbering changed
From: Richard Genoud <richard.genoud@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Peter Rosin
 <peda@axentia.se>, linux-mtd <linux-mtd@lists.infradead.org>,
 devicetree@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>
Date: Thu, 02 Nov 2017 16:28:13 +0100
In-Reply-To: <20171102160909.6eee6289@bbrezillon>
References: <1509621436.16695.3.camel@gmail.com>
 <20171102133954.055ce285@bbrezillon> <1509632027.16695.5.camel@gmail.com>
 <20171102160909.6eee6289@bbrezillon>
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

+Nicolas
[its email got lost somehow]
Le jeudi 02 novembre 2017 à 16:09 +0100, Boris Brezillon a écrit :
> On Thu, 02 Nov 2017 15:13:47 +0100
> Richard Genoud <richard.genoud@gmail.com> wrote:
> 
> > Le jeudi 02 novembre 2017 à 13:39 +0100, Boris Brezillon a écrit :
> > > +Nicolas
> > > 
> > > Hi Richard,
> > > 
> > > On Thu, 02 Nov 2017 12:17:16 +0100
> > > Richard Genoud <richard.genoud@gmail.com> wrote:
> > >   
> > > > Hi,
> > > > 
> > > > I've got an at91sam9g35-cm based board, with 4 partition on the
> > > > spi-
> > > > dataflas and 5 partitions on the NAND flash.
> > > > Before commit 1004a2977bdc ("ARM: dts: at91: Switch to the new
> > > > NAND
> > > > bindings"),
> > > > the NAND partitions were mtd0-4 and spi-dataflash partitions
> > > > mtd5-
> > > > 8.
> > > > 
> > > > Since commit 1004a2977bdc ("ARM: dts: at91: Switch to the new
> > > > NAND
> > > > bindings"),
> > > > the spi-dataflash partitions are discovered before the NAND
> > > > partitions.
> > > > So NAND partition became mtd4-8 and spi-dataflash partition
> > > > mtd0-3.
> > > > 
> > > > This broke some script that relied on the mtd numbering.
> > > > 
> > > > Updating those scripts to rely on the mtd device name instead
> > > > of
> > > > number is not really a problem. The real problem is when an
> > > > older
> > > > script using mtd numbering is run on the new system : I expect
> > > > dead
> > > > kittens everywhere !  
> > > 
> > > Crap! That was one of the thing I was afraid of when changing the
> > > binding: probe order has an impact on ids assigned to MTD devs,
> > > and
> > > since things are not defined at the same place in the DT, it
> > > changes
> > > the probe order.
> > >   
> > > > 
> > > > So, I'd like to know if there's a way to force the older
> > > > numbering
> > > > ?  
> > > 
> > > Reverting the patches is probably the easiest way (and it's
> > > easily
> > > backportable). Now, if we want to switch to the new bindings at
> > > some
> > > point we'll need to support DT aliases for mtd devs:
> > > 
> > > aliases {
> > > 	mtdX = &flashpartN;
> > > 	mtdY = &flashdevM;
> > > };
> > > 
> > > The problem with this solution is that it only works if all
> > > partitions
> > > are defined in the DT, which is not always the case (they can be
> > > defined
> > > on the command line with mtdparts=).  
> > 
> > Yes, and if they are different from the ones declared in
> > at91sam9x5cm.dtsi, they are likely defined with mtdparts=, since
> > AFAIK,
> > we can't remove a declared partitionning.
> > 
> > I'll disable the ebi and switch back to the old binding in my dts
> > for
> > now.
> > >   
> > > > (I tried poking around the DTS without succès).
> > > > 
> > > > any idea ?  
> > > 
> > > I don't have a perfect solution, but the problem you report
> > > clearly
> > > shows that relying on MTD numbering is unsafe and should be
> > > avoided.  
> > 
> > Clearly, but who doesn't ? ;)
> > 
> 
> Just had a lengthy discussion with Alexandre, and he brought a valid
> point: there has never been any guarantee on MTD numbering. Not only
> the order of DT nodes have an impact on the probe order, but also the
> order in which drivers are linked when creating the kernel image. Yes
> these things usually don't change, but I'm not sure it's a good idea
> to let user-space apps think it will never change in the future.
> 
> How about fixing the scripts you were referring to instead of
> reverting
> the change? What's the blocking point?

I already fixed the user-space scripts (and actually, they predate the
device-tree era, so at that time, relying on MTD numbering wasn't so
bad :)).
Anyway, here's the blocking point :

We have firmwares with an embedded script to update our boards. (more
or less a FW + script in a zip file).
Those old firmwares are already in the wild and rely on the old MTD
numbering (yes, that's bad).


So, even if all new scripts are corrected in the new firmwares,
downgrading a board with an old firmware/old script will brick the
board.
So I'll have to detect that and forbid downgrading.

That's not the end of the world, but if I can find a trick to prevent
it, I'll be happier !


Regards,

Richard


> 
> Regards,
> 
> Boris
