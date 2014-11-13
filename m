Received: from mail-bn1bon0136.outbound.protection.outlook.com
 ([157.56.111.136] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xonjm-0001Pl-Gb
 for linux-mtd@lists.infradead.org; Thu, 13 Nov 2014 06:18:35 +0000
Message-ID: <1415859483.15957.49.camel@freescale.com>
Subject: Re: [PATCH 1/1][v2] IFC: Change IO accessor based on endianness
From: Scott Wood <scottwood@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 13 Nov 2014 00:18:03 -0600
In-Reply-To: <20141112070737.GC29070@brian-ubuntu>
References: <1413785506-443-1-git-send-email-b44839@freescale.com>
 <1415056966.23458.305.camel@snotra.buserror.net>
 <20141112070737.GC29070@brian-ubuntu>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: B07421@freescale.com, linux-mtd@lists.infradead.org,
 gregkh@linuxfoundation.org, arnd@arndb.de,
 Jaiprakash Singh <b44839@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-11-11 at 23:07 -0800, Brian Norris wrote:
> On Mon, Nov 03, 2014 at 05:22:46PM -0600, Scott Wood wrote:
> > On Mon, 2014-10-20 at 11:41 +0530, Jaiprakash Singh wrote:
> > > From: Jaiprakash Singh <b44839@freescale.com>
> > > 
> > > IFC registers can be of type Little Endian
> > > or big Endian depending upon Freescale SoC.
> > > Here SoC defines the register type of
> > > IFC IP.So update accessors functions with
> > > common IFC accessors functions to take
> > > care both type of endianness.
> > > 
> > > IFC IO accressor are set at run time based
> > > on IFC IP registers endianness.IFC node in
> > > DTS file contains information about
> > > endianness.
> > > 
> > > Signed-off-by: Jaiprakash Singh <b44839@freescale.com>
> > > ---
> > > Changes for v2
> > > 	- Moved IFC accessor function to fsl_ifc.h
> > > 	from fsl_ifc.c and make them inline static
> > > 
> > > .../bindings/memory-controllers/fsl/ifc.txt        |    2 +
> > >  drivers/memory/fsl_ifc.c                           |   72 ++++++----
> > >  drivers/mtd/nand/fsl_ifc_nand.c                    |  151 +++++++++++---------
> > >  include/linux/fsl_ifc.h                            |   42 ++++++
> > >  4 files changed, 167 insertions(+), 100 deletions(-)
> > 
> > Given that this spans MTD and non-MTD files, whose tree should this go
> > through?
> 
> I already have one patch that touches these same files:
> 
>   http://git.infradead.org/l2-mtd.git/commitdiff/096916610f415e07cfe71d71a391011c617be5ed
> 
> I don't actually see a MAINTAINERS entry for most of drivers/memory/, so
> I didn't think that was a problem. If the (fixed) full patch can be
> based on l2-mtd.git and submitted with linux-mtd@infradead.org in CC, I
> can consider taking it, pending proper review.

OK.

-Scott
