Received: from exprod7og110.obsmtp.com ([64.18.2.173])
	by bombadil.infradead.org with smtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JOxiR-000140-8h
	for linux-mtd@lists.infradead.org; Tue, 12 Feb 2008 16:10:46 +0000
Date: Tue, 12 Feb 2008 16:10:34 +0000
From: Stephane Chazelas <stephane.chazelas@emerson.com>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: [PATCH 2.6.24] block2mtd: removing a device and typo fixes
Message-ID: <chaz20080212161034.GJ30304@artesyncp.com>
References: <chaz20080212134751.GI30304@artesyncp.com>
	<20080212152124.GA21878@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080212152124.GA21878@lazybastard.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008-02-12 16:21:24 +0100, Jörn Engel:
> On Tue, 12 February 2008 13:47:51 +0000, Stephane Chazelas wrote:
> > 
> > this patch addresses a number of small issues mainly regarding
> > the output made by this driver to dmesg:
> >   - Some of the "blkmtd"'s had not been changed to "block2mtd"
> >     which caused display problem
> >   - the parse_err() macro was displaying "block2mtd: " twice
> 
> Fairly obvious fixes.
> 
> > Also, one can add a block2mtd mtd device with things like:
> > 
> > echo /dev/loop3,$((256*1024)) |
> >   sudo tee /sys/module/block2mtd/parameters/block2mtd
> > 
> > but individual mtds cannot be removed. You can only do a
> > modprobe -r block2mtd to remove *all* the block2mtd mtds.
> > 
> > This patch proposes to add the cabability with:
> > 
> > echo /dev/loop3,remove |
> >   sudo tee /sys/module/block2mtd/parameters/block2mtd
> 
> Sounds sane enough.  But I do have some reservations about the
> implementation.  It would be best if you split the patch in two.  One
> with the obvious stuff above and one for this.

Hi Jörn,

OK, I can do that. Would the "simple" fix go to the
trivial@kernel.org Trivial Patch Monkey?

> The core of remove_device_by_name() is shared with block2mtd_exit(),
> so a common helper would be good.  Your error handling is better, so
> let's keep that version.

Well, yes that raised a concern to me, the "exit" function
returns "void". If the del_mtd_device fails with EBUSY at the
moment (such as when a /dev/mtdblock<x> is mounted), we ignore
it and go on with freeing everything leaving a dangling mtd.

Is there a way around that?

Another problem is that it's not easy to check whether a mtd
creation was successful or not. Basically, you have to write to
a /sys file and then parse /proc/mtd to get the result.

What about having a /dev/block2mtd (with owner/permissions that
could allow non-root users to use it), with 2 ioctls:

- one to "link" a block dev to a mtd that would take as
  parameter a fd to an open block dev (again allowing for
  flexible permissions) and would return the number of the
  allocated mtd and success/failure in errno. Upon sucess it
  would increase the refcnt of block2mtd.

- and one to "release" the link. That would fail if the mtd is
  in use and decrease block2mtd's refcnt upon success.

A bit like the loop devices (or /dev/ptmx) actually. What do you
think?

(also, with the /sys interface, isn't there a potential problem
with chroots wrt the path given to the /sys file?)

> And independently of your patch a mutex protecting the device list from
> simultaneous modifications would be good to have.
> 
> Side note: I may not have internet access until 19th or so.
[...]

I'll dig a little deeper, but I think I'll need some advice/help
at some point, I'm not a Linux kernel expert.

Regards,
Stephane
