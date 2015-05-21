Message-ID: <1432172966.27761.153.camel@freescale.com>
Subject: Re: [PATCH 1/1] [RESEND] IFC: Change IO accessor based on endianness
From: Scott Wood <scottwood@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 20 May 2015 20:49:26 -0500
In-Reply-To: <20150519220124.GA11598@ld-irv-0074>
References: <1431420591-20453-1-git-send-email-r65777@rhuath.am.freescale.net>
 <1431438951.16357.490.camel@freescale.com>
 <20150519220124.GA11598@ld-irv-0074>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: arnd@arndb.de, gregkh@linuxfoundation.org,
 Bharat Bhushan <Bharat.Bhushan@freescale.com>, mailman@lists.infradead.org,
 linux-mtd@lists.infradead.org, prabhakar@freescale.com,
 Jaiprakash Singh <b44839@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2015-05-19 at 15:01 -0700, Brian Norris wrote:
> On Tue, May 12, 2015 at 08:55:51AM -0500, Scott Wood wrote:
> > On Tue, 2015-05-12 at 03:49 -0500, Bharat Bhushan wrote:
> > > From: Jaiprakash Singh <b44839@freescale.com>
> > > 
> > > IFC IO accressor are set at run time based
> > > on IFC IP registers endianness.IFC node in
> > > DTS file contains information about
> > > endianness.
> > > 
> > > Signed-off-by: Jaiprakash Singh <b44839@freescale.com>
> > > ---
> > >  Tested on T1040RDB, LS2085a, LS1
> > > 
> > >  .../bindings/memory-controllers/fsl/ifc.txt        |    3 +
> > >  drivers/memory/fsl_ifc.c                           |   43 +++-
> > >  drivers/mtd/nand/fsl_ifc_nand.c                    |  258 ++++++++++----------
> > >  include/linux/fsl_ifc.h                            |   50 ++++
> > >  4 files changed, 213 insertions(+), 141 deletions(-)
> > 
> > As before,
> > Acked-by: Scott Wood <scottwood@freescale.com>
> > 
> > This touches MTD as well as dependencies outside MTD -- which tree
> > should it go through?
> 
> I haven't actually seen the patch on linux-mtd. Were we CC'd? If not,
> please resend, and CC linux-mtd@lists.infradead.org. (Try
> scripts/get_maintainer.pl to find the right people/lists.)

linux-mtd@lists.infradead.org was in the To: header.

One possible problem is that Bharat sent the patch with a bad
(intranet) e-mail address (I've corrected in this e-mail); this may
have gotten the patch spam filtered by the maillist server.  Bharat,
please fix your git send-mail configuration (and don't use rhuath as a
development machine).

...though, the previous postings were made by Jaiprakesh with a valid
e-mail address, so maybe something else about the patch is hitting a
filter.  CCing mailman@lists.infradead.org; can someone check logs to
see if the list received these e-mails (e.g. v4 sent on December 8th by
Jaiprakesh, message id
<1418017580-2749-1-git-send-email-b44839@freescale.com>)?

> And is this the previous version?
> 
> http://lists.infradead.org/pipermail/linux-mtd/2014-November/056249.html

It's a previous version, though the current version was previously sent
as v4.

> I don't mind either tree. I don't think fsl_ifc_nand.c will have
> anything noisy in linux-mtd for this release cycle.

OK.  I'll resend the patch, as my e-mails seem to get through; please
either ack or apply (assuming no problems with it).

-Scott
