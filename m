Received: from 15.mo4.mail-out.ovh.net ([91.121.62.11]
 helo=mo4.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U3rHk-0001Zd-Dp
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2013 16:58:49 +0000
Received: from mail177.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo4.mail-out.ovh.net (Postfix) with SMTP id 9A0131050B04
 for <linux-mtd@lists.infradead.org>; Fri,  8 Feb 2013 18:09:02 +0100 (CET)
Date: Fri, 8 Feb 2013 17:57:36 +0100
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH 0/5 v3] at91: PMECC: enable PMECC in dt for
 at91sam9x5ek, at91sam9n12ek
Message-ID: <20130208165736.GH30595@game.jcrosoft.org>
References: <1358945232-2282-1-git-send-email-josh.wu@atmel.com>
 <5113D347.8050409@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5113D347.8050409@atmel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Artem Bityutskiy <dedekind1@gmail.com>,
 Josh Wu <josh.wu@atmel.com>, linux-mtd@lists.infradead.org,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 17:16 Thu 07 Feb     , Nicolas Ferre wrote:
> On 01/23/2013 01:47 PM, Josh Wu :
> > Those patches will enable PMECC in dt parameters for at91sam9x5ek and 
> > at91sam9n12ek.
> > 
> > The PMECC driver will check minimum required ecc on ONFI parameter from NAND 
> > flash.
> > 
> > If pmecc-cap, pmecc-sector-size in dts file is specified, use those two.
> > otherwise, set those according to NAND flash ONFI parameters.
> > 
> > If the pmecc-cap, pmecc-sector-size in dts are different with ecc requirement
> > in ONFI, print out a warning.
> > 
> > 
> > For the following compile error:
> >   ERROR (phandle_references): Reference to non-existent node or label "pinctrl_ssc0_tx"
> > 
> >   ERROR: Input tree has errors, aborting (use -f to force output)
> >   make[2]: *** [arch/arm/boot/dts/at91sam9g20ek.dtb] Error 2
> > 
> > the fixes are already merged in Linux mainline in v3.8-rc4.
> > you can find in: 
> >  544ae6b2e676c3c37fb8c93ef9327932fc2e5bc2 (ARM: at91/dts: add pinctrl support for SSC peripheral)
> >  ea03c81521bde526570e1dec96eaa21fe5ac84a2 (ASoC: atmel-ssc: add pinctrl selection to driver) 
> 
> Artem,
> 
> I propose to take patches 2 and 3/5 of this series via arm-soc git tree.
> I will specify to merge them at the end of the merge-window so that the
> Device Tree properties will not be out-of-sync with driver modifications
> (may not cause big issues anyway).
> 
> If it is needed, you can add my:
> 
> Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>
Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>

too
> 
> On the whole patch series.
> 
> Tell me if I have to rebase it for removing the 2nd and 3rd patches or
> if you can deal with this yourself.
> 
> Thanks for your help. best regards,
> 
> 
> > Change logs:
> > v2: rebase to v3.8-rc3. And wrapped the commit message.
> > 
> > v3: big chages:
> >   1. reduce the PMECC lookup table mapping. Just the lookup table not whole
> >      ROM code according to J.C's suggestion.
> >   2. use simpler strategy to handle pmecc-cap, pmecc-sector-size:
> >      * make pmecc-cap, pmecc-sector-size optional.
> >      * If pmecc-cap, pmecc-sector-size are not set, use ONFI ecc parameters.
> >        otherwise, use those in DTS file.
> >      * print out a warning if PMECC use different ecc bits or sector size 
> >        from ONFI ecc parameters.
> > 
> > Josh Wu (5):
> >   MTD: atmel_nand: avoid to report an error when lookup table offset is
> >     0.
> >   ARM: at91: at91sam9x5: add DT parameters to enable PMECC
> >   ARM: at91: at91sam9n12: add DT parameters to enable PMECC
> >   MTD: atmel_nand: make pmecc-cap, pmecc-sector-size in dts is
> >     optional.
> >   MTD: at91: atmel_nand: for PMECC, add code to check the ONFI
> >     parameter ECC requirement.
> > 
> >  arch/arm/boot/dts/at91sam9n12.dtsi  |    3 +-
> >  arch/arm/boot/dts/at91sam9n12ek.dts |    5 +-
> >  arch/arm/boot/dts/at91sam9x5.dtsi   |    4 +
> >  arch/arm/boot/dts/at91sam9x5cm.dtsi |    5 +-
> >  drivers/mtd/nand/atmel_nand.c       |  141 +++++++++++++++++++++++++++++------
> >  5 files changed, 131 insertions(+), 27 deletions(-)
> > 
> 
> 
> -- 
> Nicolas Ferre
