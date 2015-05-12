Received: from mail-by2on0146.outbound.protection.outlook.com
 ([207.46.100.146] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsAfY-0001SG-3A
 for linux-mtd@lists.infradead.org; Tue, 12 May 2015 13:56:24 +0000
Message-ID: <1431438951.16357.490.camel@freescale.com>
Subject: Re: [PATCH 1/1] [RESEND] IFC: Change IO accessor based on endianness
From: Scott Wood <scottwood@freescale.com>
To: Bharat Bhushan <r65777@rhuath.am.freescale.net>
Date: Tue, 12 May 2015 08:55:51 -0500
In-Reply-To: <1431420591-20453-1-git-send-email-r65777@rhuath.am.freescale.net>
References: <1431420591-20453-1-git-send-email-r65777@rhuath.am.freescale.net>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: gregkh@linuxfoundation.org, linux-mtd@lists.infradead.org,
 prabhakar@freescale.com, arnd@arndb.de,
 Jaiprakash Singh <b44839@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2015-05-12 at 03:49 -0500, Bharat Bhushan wrote:
> From: Jaiprakash Singh <b44839@freescale.com>
> 
> IFC IO accressor are set at run time based
> on IFC IP registers endianness.IFC node in
> DTS file contains information about
> endianness.
> 
> Signed-off-by: Jaiprakash Singh <b44839@freescale.com>
> ---
>  Tested on T1040RDB, LS2085a, LS1
> 
>  .../bindings/memory-controllers/fsl/ifc.txt        |    3 +
>  drivers/memory/fsl_ifc.c                           |   43 +++-
>  drivers/mtd/nand/fsl_ifc_nand.c                    |  258 ++++++++++----------
>  include/linux/fsl_ifc.h                            |   50 ++++
>  4 files changed, 213 insertions(+), 141 deletions(-)

As before,
Acked-by: Scott Wood <scottwood@freescale.com>

This touches MTD as well as dependencies outside MTD -- which tree
should it go through?

-Scott
