Received: from baldur.buserror.net ([165.227.176.147])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eKdgE-00060q-75
 for linux-mtd@lists.infradead.org; Fri, 01 Dec 2017 05:16:08 +0000
Message-ID: <1512105209.10062.1.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 linux-mtd@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: dedekind1@gmail.com, computersforpeace@gmail.com
Date: Thu, 30 Nov 2017 23:13:29 -0600
In-Reply-To: <1511954855-8593-1-git-send-email-prabhakar.kushwaha@nxp.com>
References: <1511954855-8593-1-git-send-email-prabhakar.kushwaha@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Documentation: binding: Update endianness usage
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2017-11-29 at 16:57 +0530, Prabhakar Kushwaha wrote:
> IFC controller version < 2.0 support IFC register access as
> big endian. These controller version also require IFC NOR signals to
> be connected in reverse order with NOR flash.
> 
> IFC >= 2.0 is other way around.
> 
> So updating IFC binding to take care of both using endianness field.
> 
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> ---
>  Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-
> controllers/fsl/ifc.txt b/Documentation/devicetree/bindings/memory-
> controllers/fsl/ifc.txt
> index 89427b0..824a2ca 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
> @@ -18,8 +18,10 @@ Properties:
>                interrupt (NAND_EVTER_STAT).  If there is only one,
>                that interrupt reports both types of event.
>  
> -- little-endian : If this property is absent, the big-endian mode will
> -                  be in use as default for registers.
> +- little-endian or big-endin : It represents how IFC registers  to be
> accessed.
> +			It also represents connection between controller
> and
> +			NOR flash. If this property is absent, the big-
> endian
> +			mode will be in use as default.

"endin"?

If big endian is the default, is this change really necessary?  Particularly
since the big endian chips are older and thus have existing device trees.

-Scott
