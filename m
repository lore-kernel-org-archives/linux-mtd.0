Received: from mail-pb0-x22c.google.com ([2607:f8b0:400e:c01::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDUkN-0000Pp-3I
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2014 08:00:43 +0000
Received: by mail-pb0-f44.google.com with SMTP id rq2so8895982pbb.17
 for <linux-mtd@lists.infradead.org>; Wed, 12 Feb 2014 00:00:21 -0800 (PST)
Date: Wed, 12 Feb 2014 00:00:14 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [RFC/PATCH 1/1] mtd: nand: Add a devicetree binding for ECC
 strength and ECC step size
Message-ID: <20140212080014.GC3500@norris-Latitude-E6410>
References: <1389960820-18696-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1389960820-18696-2-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1389960820-18696-2-git-send-email-ezequiel.garcia@free-electrons.com>
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

Hi Ezequiel,

On Fri, Jan 17, 2014 at 09:13:40AM -0300, Ezequiel Garcia wrote:
> Some flashes can only be properly accessed when the ECC mode is
> specified, and a way to describe such mode is required.
> 
> Such ECC mode is completely driver-specific so instead of having one binding
> per compatible-string, let's add generic ECC strength and ECC step size.
> Driver's can choose the appropriate ECC mode, based on this specification.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  Documentation/devicetree/bindings/mtd/nand.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
> index 03855c8..683a310 100644
> --- a/Documentation/devicetree/bindings/mtd/nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/nand.txt
> @@ -3,5 +3,9 @@
>  - nand-ecc-mode : String, operation mode of the NAND ecc mode.
>    Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
>    "soft_bch".
> +- nand-ecc-strength : integer ECC required strength.
> +- nand-ecc-size : integer step size associated to the ECC strength.

Probably should be nand-ecc-step-size, to be clearer.

> +  The exact meaning of the ECC strength and ECC size parameters is completely
> +  driver-specific.

I think we can be much more specific than this. We need to at least
describe how the strength and size are related, and we need to mention
how this represents the ECC scheme to use, rather than the minimum
requirement of the flash.

I'd say something like this. Feel free to improve it, but it covers the
gist of what I think we can say in a generic document:

 - nand-ecc-strength: integer representing the number of bits to correct
   per ECC step
 - nand-ecc-step-size: integer representing the number of data bytes
   that are covered by a single ECC step

   Together, the ECC strength and step size define the correction
   capability, so that we say we will correct "X bit errors per Y
   bytes". The interpretation of these parameters is
   implementation-defined, but they often have ramifications on the
   formation, interpretation, and placement of correction metadata on
   the flash. Not all implementations must support all possible
   combinations. Implementations are encouraged to further define the
   value(s) they support.

>  - nand-bus-width : 8 or 16 bus width if not present 8
>  - nand-on-flash-bbt: boolean to enable on flash bbt option if not present false

Brian
