Received: from mail-by2on0112.outbound.protection.outlook.com
 ([207.46.100.112] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMixm-0004Kl-3M
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2015 20:37:30 +0000
Message-ID: <1438720623.2097.95.camel@freescale.com>
Subject: Re: [v5,RESEND] IFC: Change IO accessor based on endianness
From: Scott Wood <scottwood@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linuxppc-dev@lists.ozlabs.org>,
 Jaiprakash Singh <b44839@freescale.com>
Date: Tue, 4 Aug 2015 15:37:03 -0500
In-Reply-To: <20150528011910.GA16716@home.buserror.net>
References: <1432174631-30091-1-git-send-email-scottwood@freescale.com>
 <20150528011910.GA16716@home.buserror.net>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2015-05-27 at 20:19 -0500, Scott Wood wrote:
> On Wed, May 20, 2015 at 09:17:11PM -0500, Scott Wood wrote:
> > From: Jaiprakash Singh <b44839@freescale.com>
> > 
> > IFC IO accressor are set at run time based
> > on IFC IP registers endianness.IFC node in
> > DTS file contains information about
> > endianness.
> > 
> > Signed-off-by: Jaiprakash Singh <b44839@freescale.com>
> > Signed-off-by: Scott Wood <scottwood@freescale.com>
> > ---
> > v5: I'm assuming it's the same as v4, but I didn't send v4, and this
> > comes from a versionless [RESEND] that never made it to the mailing list,
> > so bumping the version just in case.
> > 
> >  .../bindings/memory-controllers/fsl/ifc.txt        |   3 +
> >  drivers/memory/fsl_ifc.c                           |  43 ++--
> >  drivers/mtd/nand/fsl_ifc_nand.c                    | 258 +++++++++++-----
> > -----
> >  include/linux/fsl_ifc.h                            |  50 ++++
> >  4 files changed, 213 insertions(+), 141 deletions(-)
> 
> Brian, can I get an ack for this?

ping

-Scott
