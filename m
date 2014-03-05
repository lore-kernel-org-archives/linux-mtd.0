Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WL747-0007Om-Nc
 for linux-mtd@lists.infradead.org; Wed, 05 Mar 2014 08:20:36 +0000
Received: by mail-pd0-f174.google.com with SMTP id y13so743364pdi.5
 for <linux-mtd@lists.infradead.org>; Wed, 05 Mar 2014 00:20:13 -0800 (PST)
Date: Wed, 5 Mar 2014 00:20:09 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v3 0/2] Add NAND ECC devicetree binding
Message-ID: <20140305082009.GQ13420@norris-Latitude-E6410>
References: <1393280689-24267-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140228145923.GB24805@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140228145923.GB24805@localhost>
Cc: Grant Likely <grant.likely@secretlab.ca>,
 Boris BREZILLON <b.brezillon.dev@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 28, 2014 at 11:59:24AM -0300, Ezequiel Garcia wrote:
> On Mon, Feb 24, 2014 at 07:24:47PM -0300, Ezequiel Garcia wrote:
> > Third round, fixing a stupid semi-colon miss.
> > 
> > NAND controllers have special ECC modes, raising per-driver ECC mode devicetree
> > binding. See for instance the binding for OMAP:
> > 
> >  - ti,nand-ecc-opt: A string setting the ECC layout to use. One of:
> > 	"sw"		<deprecated> use "ham1" instead
> > 	"hw"		<deprecated> use "ham1" instead
> > 	"hw-romcode"	<deprecated> use "ham1" instead
> > 	"ham1"		1-bit Hamming ecc code
> > 	"bch4"		4-bit BCH ecc code
> > 	"bch8"		8-bit BCH ecc code
> > 
> > Other drivers (such as pxa3xx-nand) have similar requirements, with special
> > (controller-specific) ECC modes. Instead of adding a possibly different
> > binding per compatible-string, let's add generic ECC strength and ECC step size.
> > 
> > This properties aim at providing a complete description of the required ECC
> > correction to let drivers choose the appropriate ECC mode.
> > 
[...]
> 
> Brian? Any chance this lands on v3.15?

Pushed to l2-mtd.git. Thanks!

Brian
