Received: from host.buserror.net ([209.198.135.123])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1biC3W-0007I0-SQ
 for linux-mtd@lists.infradead.org; Fri, 09 Sep 2016 03:00:44 +0000
Message-ID: <1473390010.30217.137.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>, Ronak Desai
 <ronak.desai@rockwellcollins.com>, linux-mtd@lists.infradead.org,
 prabhakar.kushwaha@nxp.com, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Marc Gonzalez
 <marc_gonzalez@sigmadesigns.com>
Date: Thu, 08 Sep 2016 22:00:10 -0500
In-Reply-To: <20160908075708.4014aef3@bbrezillon>
References: <1473189197-45191-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20160906215003.1b6eb095@bbrezillon>
 <1473228233.30217.32.camel@buserror.net>
 <20160907092257.77915c23@bbrezillon>
 <1473290339.30217.78.camel@buserror.net>
 <20160908075708.4014aef3@bbrezillon>
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

On Thu, 2016-09-08 at 07:57 +0200, Boris Brezillon wrote:
> On Wed, 07 Sep 2016 18:18:59 -0500
> Scott Wood <oss@buserror.net> wrote:
> 
> > 
> > On Wed, 2016-09-07 at 09:22 +0200, Boris Brezillon wrote:
> > > 
> > > 
> > >  I was just complaining because I
> > > see more and more drivers implementing their own ->cmdfunc() and adding
> > > this kind of hacks.
> > > Most of them can implement ->cmd_ctrl() and rely on the default
> > > nand_command_lp(), but I agree that some controllers do not fit in this
> > > model.
> > > 
> > > For these ones, I was planning to provide a ->send_op(chip, nand_op)
> > > method, where nand_op would contain both the CMD, ADDR cycles and
> > > the data transfer.  
> > I was thinking more along the lines of specific operations (similar to
> > read_page but without the preceding cmdfunc)...
> I'm curious. What did you have in mind? Adding a new ->do_xxx() each
> time a NAND needs a new CMD/ADDR/DATA sequence? So we'll start with
> ->read_param_page(), which is rather generic. But what about all those
> private commands that are not generic at all. I don't think it's
> reasonable to ask the NAND controller to implement all these methods.

That's basically what I had in mind, and yes, it is a problem if we need to
support private commands.

> > A generic "send_op" might
> > work, though I'm curious about the details of how nand_op gets encoded,
> > and am
> > worried that it might still result in NAND drivers interpreting specific
> > commands rather than passing things through in a generic way (and then
> > things
> > can break if common code sends something new).
> If drivers end up doing that, this means we failed providing an
> interface that is suitable for everyone.
> But, from what I've seen in other drivers, it's usually just about
> setting the first and second cmd cyles, specifying the address cycles
> (and the number of cycles) and then the amount of data to transfer +
> the direction.

Timing is one area that could be problematic.  This patch is an example of a
situation where different timing was used for a particular command.  It seems
that RNDOUT doesn't use the R/B pin -- how would a generic send_op
implementation know whether it can use R/B to determine when to start the I/O
transfer?

> There are some controllers that only understand high level commands,
> and for these ones we are just screwed (the conversion from raw
> commands to high-level ones is inevitable).

A mixture of the approaches could help here.  Have replaceable do_xxx() that
cover the basic operations (with the default implementations calling send_op) 
and if a driver can't support send_op (or the current API) then private
commands and new features just won't work with that controller (but it would
be more obvious what does/doesn't work than sending an unrecognized command to
cmdfunc).

> > > 
> > > Now, I know that some controllers are not able to dissociate the
> > > CMD/ADDR cycles from the DATA transfers, which is why a new interface
> > > is needed.  
> > In theory we could separate them but not without dropping CE.  Some NAND
> > data
> > sheets I have indicate that support for that is an optional feature, and
> > we do
> > have some older NAND chips being used by this driver.  In any case we'd be
> > fighting against the way the controller was intended to be used, and we'd
> > be
> > adding more CPU overhead to wake up after the command has been issued but
> > before the transfer has begun.
> Well, as I said above, it's not about getting best perfs for this kind
> of operations. It's only happening once at init time.

Right, I was thinking of the impact on other operations if we rework the
driver to separate commands from I/O.  Removing the cmdfunc call from page
reads would help make that a special case without complicating the general
flow.

>  As I said, the
> whole NAND framework has become unmaintainable for this very reason.
> Say one solder a new NAND on a new board. It's not guaranteed to work,
> because the controller might not support some of important functions in
> its ->cmdfunc() implementation.
> And each time we want to add a new NAND operation, we have to go over
> all drivers and check if it's supported. That's really a pain.
> 
> I'd prefer to have all drivers implement a generic method to send any
> kind of CMD/ADDR/DATA sequence, and then have a few methods for
> operations where perfs really matters (read/write_page()).

We could avoid special cases in read_buf() by having read_page() not call it,
but the command sending is (currently) separate and thus would still need a
special case to delay read commands until read_page().

A bigger problem with separating the command from the I/O is the R/B pin.  If
the NAND chip asserts R/B when another (non-NAND) device's chipselect is
asserted, then it can corrupt that chip's activity.  We'd be undoing the fix
in commit 476459a6cf46d20e ("mtd: eLBC NAND: use recommended command
sequences").

IFC seems to be better about how it shares pins, but it's not clear that it's
completely OK in all configurations.

-Scott
