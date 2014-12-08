Received: from mail-bn1bon0137.outbound.protection.outlook.com
 ([157.56.111.137] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xy7Ea-0002Oz-S8
 for linux-mtd@lists.infradead.org; Mon, 08 Dec 2014 22:56:53 +0000
Message-ID: <1418079383.5581.14.camel@freescale.com>
Subject: Re: [PATCH 1/1][v4] IFC: Change IO accessor based on endianness
From: Scott Wood <scottwood@freescale.com>
To: Jaiprakash Singh <b44839@freescale.com>
Date: Mon, 8 Dec 2014 16:56:23 -0600
In-Reply-To: <1418017580-2749-1-git-send-email-b44839@freescale.com>
References: <1418017580-2749-1-git-send-email-b44839@freescale.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: B07421@freescale.com, B32579@freescale.com, linux-mtd@lists.infradead.org,
 arnd@arndb.de, gregkh@linuxfoundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-12-08 at 11:16 +0530, Jaiprakash Singh wrote:
> From: Jaiprakash Singh <b44839@freescale.com>
> 
> IFC IO accressor are set at run time based
> on IFC IP registers endianness.IFC node in
> DTS file contains information about
> endianness.
> 
> Signed-off-by: Jaiprakash Singh <b44839@freescale.com>
> ---
> Changes for v4
> 	- Review rework as per Scott's comments
> 	- Tested on B4860QDS board
> ---
>  .../bindings/memory-controllers/fsl/ifc.txt        |    3 +
>  drivers/memory/fsl_ifc.c                           |   34 ++-
>  drivers/mtd/nand/fsl_ifc_nand.c                    |  260 ++++++++++----------
>  include/linux/fsl_ifc.h                            |   50 ++++
>  4 files changed, 205 insertions(+), 142 deletions(-)

Acked-by: Scott Wood <scottwood@freescale.com>

-Scott
