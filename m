Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkqKj-0006qt-51
 for linux-mtd@lists.infradead.org; Wed, 01 Aug 2018 12:34:32 +0000
Date: Wed, 1 Aug 2018 14:34:17 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Ofer Heifetz <oferh@marvell.com>
Subject: Re: [PATCH] mtd: nand: use regmap_update_bits() in marvell_nand for
 syscon access
Message-ID: <20180801143417.34600a30@windsurf>
In-Reply-To: <20180801142741.66102538@xps13>
References: <20180801102505.18383-1-thomas.petazzoni@bootlin.com>
 <20180801142741.66102538@xps13>
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

Hello,

On Wed, 1 Aug 2018 14:27:41 +0200, Miquel Raynal wrote:

> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote on Wed,  1 Aug
> 2018 12:25:05 +0200:
> 
> > The marvell_nfc_init() function fiddles with some bits of a system
> > controller on Armada 7K/8K. However:
> > 
> >  - It does a regmap_write() on GENCONF_SOC_DEVICE_MUX, potentially
> >    losing other bits that might have been set by other drivers.  
> 
> AFAIR, this was done on purpose. In the aim of being as independent as
> possible from the earlier stages, we set here the full configuration of
> register 0xF2440208 "SoC Device Multiplex Register". Bits are either
> reserved or NAND controller related, nobody else is supposed to poke
> here. I'm not sure using regmap_update_bits() here is relevant?

Well, using regmap_update_bits() still makes you "independent from the
earlier stages", as long as you set/clear all the bits that you think
should be set/clear. I'm not sure it's very wise to ruthlessly
overwrite those reserved bits.

> > -		regmap_read(sysctrl_base, GENCONF_ND_CLK_CTRL, &reg);
> > -		reg |= GENCONF_ND_CLK_CTRL_EN;
> > -		regmap_write(sysctrl_base, GENCONF_ND_CLK_CTRL, reg);
> > +		mask = GENCONF_SOC_DEVICE_MUX_NFC_EN |
> > +			GENCONF_SOC_DEVICE_MUX_ECC_CLK_RST |
> > +			GENCONF_SOC_DEVICE_MUX_ECC_CORE_RST |
> > +			GENCONF_SOC_DEVICE_MUX_NFC_INT_EN;  
> 
> Minor nit: indentation looks wrong here?

This is what Emacs did, so it must be correct ? :-)

I'll fix up in v2, once we agree about the GENCONF_SOC_DEVICE_MUX
register situation.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
