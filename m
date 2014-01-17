Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W4G78-00051R-B8
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2014 20:34:02 +0000
Date: Fri, 17 Jan 2014 17:33:48 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [RFC/PATCH 0/1] mtd: Add NAND ECC devicetree binding
Message-ID: <20140117203347.GC3843@localhost>
References: <1389960820-18696-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA66555@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA66555@DBDE04.ent.ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Seif Mazareeb <seif@marvell.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 17, 2014 at 05:58:13PM +0000, Gupta, Pekon wrote:
> Hi Ezequiel,
> 
> >From: Ezequiel Garcia [mailto:ezequiel.garcia@free-electrons.com]
> >
> >This patch is our first proposal to address the need for a suitable ECC
> >devicetree binding.
> >
> >NAND controllers have special ECC modes, raising per-driver ECC mode devicetree
> >binding. See for instance the binding for OMAP:
> >
> > - ti,nand-ecc-opt: A string setting the ECC layout to use. One of:
> >	"sw"		<deprecated> use "ham1" instead
> >	"hw"		<deprecated> use "ham1" instead
> >	"hw-romcode"	<deprecated> use "ham1" instead
> >	"ham1"		1-bit Hamming ecc code
> >	"bch4"		4-bit BCH ecc code
> >	"bch8"		8-bit BCH ecc code
> >
> >Other drivers (such as pxa3xx-nand) have similar requirements, with special
> >(controller-specific) ECC modes. Instead of adding a possibly different binding
> >per compatible-string, let's add generic ECC strength and ECC step size.
> >
> >This properties should describe completely the ECC mode and let drivers choose
> >the appropriate ECC mode.
> >
> Yes, this is good approach.
> It was found earlier that generic NAND DT bindings are not much use to other
> controllers as well, as different h/w engines have different interpretations.
> Brian Norris had similar comments giving example of his hardware.
> (hope following reference helps).
> 
> [1] http://lists.infradead.org/pipermail/linux-mtd/2013-September/048869.html
> 

Yes, Brian suggested this ecc-strength/ecc-size approach on IRC.

Pekon, do you think this binding proposal is good enough to describe OMAP NAND
ECC mode?

I'm not implying we should deprecate the recently added "ti-nand-ecc-opt",
but just want to know it's eventually possible.

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
