Received: from host.buserror.net ([209.198.135.123])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1biQa1-0004U0-0v
 for linux-mtd@lists.infradead.org; Fri, 09 Sep 2016 18:31:13 +0000
Message-ID: <1473445841.30217.175.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>, Ronak Desai
 <ronak.desai@rockwellcollins.com>, linux-mtd@lists.infradead.org,
 prabhakar.kushwaha@nxp.com, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Marc Gonzalez
 <marc_gonzalez@sigmadesigns.com>
Date: Fri, 09 Sep 2016 13:30:41 -0500
In-Reply-To: <20160909094037.263f362d@bbrezillon>
References: <1473189197-45191-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20160906215003.1b6eb095@bbrezillon>
 <1473228233.30217.32.camel@buserror.net>
 <20160907092257.77915c23@bbrezillon>
 <1473290339.30217.78.camel@buserror.net>
 <20160908075708.4014aef3@bbrezillon>
 <1473390010.30217.137.camel@buserror.net>
 <20160909094037.263f362d@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] fsl_ifc_nand: Added random output enable cmd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2016-09-09 at 09:40 +0200, Boris Brezillon wrote:
> > > 


> On Thu, 08 Sep 2016 22:00:10 -0500
> Scott Wood <oss@buserror.net> wrote:
> 
> > 
> > On Thu, 2016-09-08 at 07:57 +0200, Boris Brezillon wrote:
> > > 
> > > On Wed, 07 Sep 2016 18:18:59 -0500
> > > Scott Wood <oss@buserror.net> wrote:
> > > 
> > > > 
> > > > A generic "send_op" might
> > > > work, though I'm curious about the details of how nand_op gets
> > > > encoded,
> > > > and am
> > > > worried that it might still result in NAND drivers interpreting
> > > > specific
> > > > commands rather than passing things through in a generic way (and then
> > > > things
> > > > can break if common code sends something new).  
> > > If drivers end up doing that, this means we failed providing an
> > > interface that is suitable for everyone.
> > > But, from what I've seen in other drivers, it's usually just about
> > > setting the first and second cmd cyles, specifying the address cycles
> > > (and the number of cycles) and then the amount of data to transfer +
> > > the direction.  
> > Timing is one area that could be problematic.  This patch is an example of
> > a
> > situation where different timing was used for a particular command.  It
> > seems
> > that RNDOUT doesn't use the R/B pin -- how would a generic send_op
> > implementation know whether it can use R/B to determine when to start the
> > I/O
> > transfer?
> Well, the plan was to specify in the nand operation whether it should
> wait for the chip to be ready or not.

OK.  Is there a more detailed description of send_op ready yet?

> > A bigger problem with separating the command from the I/O is the R/B pin.
> >  If
> > the NAND chip asserts R/B when another (non-NAND) device's chipselect is
> > asserted, then it can corrupt that chip's activity.  We'd be undoing the
> > fix
> > in commit 476459a6cf46d20e ("mtd: eLBC NAND: use recommended command
> > sequences").
> The ->send_op() method we're discussing would solve this problem, right?

Yes.

-Scott
