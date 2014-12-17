Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y13Nr-00042U-MK
 for linux-mtd@lists.infradead.org; Wed, 17 Dec 2014 01:26:36 +0000
Received: by mail-pd0-f177.google.com with SMTP id ft15so14973275pdb.36
 for <linux-mtd@lists.infradead.org>; Tue, 16 Dec 2014 17:26:13 -0800 (PST)
Date: Tue, 16 Dec 2014 17:26:10 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH 1/1][v4] IFC: Change IO accessor based on endianness
Message-ID: <20141217012610.GP9759@ld-irv-0074>
References: <1418017580-2749-1-git-send-email-b44839@freescale.com>
 <1418079383.5581.14.camel@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1418079383.5581.14.camel@freescale.com>
Cc: B07421@freescale.com, arnd@arndb.de, gregkh@linuxfoundation.org,
 linux-mtd@lists.infradead.org, B32579@freescale.com,
 Jaiprakash Singh <b44839@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 08, 2014 at 04:56:23PM -0600, Scott Wood wrote:
> On Mon, 2014-12-08 at 11:16 +0530, Jaiprakash Singh wrote:
> > From: Jaiprakash Singh <b44839@freescale.com>
> > 
> > IFC IO accressor are set at run time based
> > on IFC IP registers endianness.IFC node in
> > DTS file contains information about
> > endianness.
> > 
> > Signed-off-by: Jaiprakash Singh <b44839@freescale.com>
> > ---
> > Changes for v4
> > 	- Review rework as per Scott's comments
> > 	- Tested on B4860QDS board
> > ---
> >  .../bindings/memory-controllers/fsl/ifc.txt        |    3 +
> >  drivers/memory/fsl_ifc.c                           |   34 ++-
> >  drivers/mtd/nand/fsl_ifc_nand.c                    |  260 ++++++++++----------
> >  include/linux/fsl_ifc.h                            |   50 ++++
> >  4 files changed, 205 insertions(+), 142 deletions(-)
> 
> Acked-by: Scott Wood <scottwood@freescale.com>

I can't locate a patch for this. Did linux-mtd get CC'd? (Or, did any
mailing list get CC'd? I don't see it on any search engines.)

Brian
