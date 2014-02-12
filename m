Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDdg1-0002zD-ID
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2014 17:32:50 +0000
Date: Wed, 12 Feb 2014 14:32:22 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [RFC/PATCH 1/1] mtd: nand: =?utf-8?Q?A?=
 =?utf-8?Q?dd_a_devicetree_binding_for_ECC_strength_and_ECC_step_size?=
 =?utf-8?B?w6c=?=
Message-ID: <20140212173221.GA2964@localhost>
References: <1389960820-18696-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1389960820-18696-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140212080014.GC3500@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140212080014.GC3500@norris-Latitude-E6410>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 devicetree@vger.kernel.org, Seif Mazareeb <seif@marvell.com>,
 Lior Amsalem <alior@marvell.com>, linux-mtd@lists.infradead.org,
 Pekon Gupta <pekon@ti.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 12, 2014 at 12:00:14AM -0800, Brian Norris wrote:
> Hi Ezequiel,
> 
> On Fri, Jan 17, 2014 at 09:13:40AM -0300, Ezequiel Garcia wrote:
> > Some flashes can only be properly accessed when the ECC mode is
> > specified, and a way to describe such mode is required.
> > 
> > Such ECC mode is completely driver-specific so instead of having one binding
> > per compatible-string, let's add generic ECC strength and ECC step size.
> > Driver's can choose the appropriate ECC mode, based on this specification.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > ---
> >  Documentation/devicetree/bindings/mtd/nand.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
> > index 03855c8..683a310 100644
> > --- a/Documentation/devicetree/bindings/mtd/nand.txt
> > +++ b/Documentation/devicetree/bindings/mtd/nand.txt
> > @@ -3,5 +3,9 @@
> >  - nand-ecc-mode : String, operation mode of the NAND ecc mode.
> >    Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
> >    "soft_bch".
> > +- nand-ecc-strength : integer ECC required strength.
> > +- nand-ecc-size : integer step size associated to the ECC strength.
> 
> Probably should be nand-ecc-step-size, to be clearer.
> 

No problem.

> > +  The exact meaning of the ECC strength and ECC size parameters is completely
> > +  driver-specific.
> 
> I think we can be much more specific than this. We need to at least
> describe how the strength and size are related, and we need to mention
> how this represents the ECC scheme to use, rather than the minimum
> requirement of the flash.
> 
> I'd say something like this. Feel free to improve it, but it covers the
> gist of what I think we can say in a generic document:
> 
>  - nand-ecc-strength: integer representing the number of bits to correct
>    per ECC step
>  - nand-ecc-step-size: integer representing the number of data bytes
>    that are covered by a single ECC step
> 
>    Together, the ECC strength and step size define the correction
>    capability, so that we say we will correct "X bit errors per Y
>    bytes". The interpretation of these parameters is
>    implementation-defined, but they often have ramifications on the
>    formation, interpretation, and placement of correction metadata on
>    the flash. Not all implementations must support all possible
>    combinations. Implementations are encouraged to further define the
>    value(s) they support.
> 

Much better, thanks!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
