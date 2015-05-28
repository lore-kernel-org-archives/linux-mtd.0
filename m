Received: from mail-bn1on0111.outbound.protection.outlook.com
 ([157.56.110.111] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxmU4-00011G-PJ
 for linux-mtd@lists.infradead.org; Thu, 28 May 2015 01:19:45 +0000
Date: Wed, 27 May 2015 20:19:10 -0500
From: Scott Wood <scottwood@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [v5,RESEND] IFC: Change IO accessor based on endianness
Message-ID: <20150528011910.GA16716@home.buserror.net>
References: <1432174631-30091-1-git-send-email-scottwood@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1432174631-30091-1-git-send-email-scottwood@freescale.com>
Cc: linuxppc-dev@lists.ozlabs.org, Jaiprakash Singh <b44839@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 20, 2015 at 09:17:11PM -0500, Scott Wood wrote:
> From: Jaiprakash Singh <b44839@freescale.com>
> 
> IFC IO accressor are set at run time based
> on IFC IP registers endianness.IFC node in
> DTS file contains information about
> endianness.
> 
> Signed-off-by: Jaiprakash Singh <b44839@freescale.com>
> Signed-off-by: Scott Wood <scottwood@freescale.com>
> ---
> v5: I'm assuming it's the same as v4, but I didn't send v4, and this
> comes from a versionless [RESEND] that never made it to the mailing list,
> so bumping the version just in case.
> 
>  .../bindings/memory-controllers/fsl/ifc.txt        |   3 +
>  drivers/memory/fsl_ifc.c                           |  43 ++--
>  drivers/mtd/nand/fsl_ifc_nand.c                    | 258 +++++++++++----------
>  include/linux/fsl_ifc.h                            |  50 ++++
>  4 files changed, 213 insertions(+), 141 deletions(-)

Brian, can I get an ack for this?

-Scott
