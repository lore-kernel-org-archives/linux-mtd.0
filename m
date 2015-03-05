Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTOQJ-00048K-0J
 for linux-mtd@lists.infradead.org; Thu, 05 Mar 2015 05:34:15 +0000
Received: by pdbnh10 with SMTP id nh10so39871444pdb.3
 for <linux-mtd@lists.infradead.org>; Wed, 04 Mar 2015 21:33:52 -0800 (PST)
Date: Wed, 4 Mar 2015 21:33:48 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Daniel Ehrenberg <dehrenberg@google.com>
Subject: Re: [PATCH v2 1/3] mtdpart: Allow adding a partition of a partition
Message-ID: <20150305053348.GD12966@brian-ubuntu>
References: <1423609138-19321-1-git-send-email-dehrenberg@chromium.org>
 <20150304192310.GN18140@ld-irv-0074>
 <CAAK6Zt0e3+KG+GDUA=c=wuc54NB7e4Jt=WQY+V0o0MKtuXeWmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAK6Zt0e3+KG+GDUA=c=wuc54NB7e4Jt=WQY+V0o0MKtuXeWmQ@mail.gmail.com>
Cc: Gwendal Grignou <gwendal@chromium.org>, richard.weinberger@gmail.com,
 Nam Nguyen <namnguyen@chromium.org>, Grant Grundler <grundler@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@imgtec.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 04, 2015 at 05:50:25PM -0800, Daniel Ehrenberg wrote:
> On Wed, Mar 4, 2015 at 11:23 AM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > One of the problems here is the semantics. Do we really want to do this
> > offset computation when using the partition instead of the master? That
> > means if the original partitioning does not cover the early part of the
> > master MTD, then that piece is lost forever. e.g.,
> >
> >  master, size 0x1000000, with a single partition
> >  /dev/mtd0, 1st partition 0x20000 - 0x40000
> >
> > Then, ioctl(BLKPG, /dev/mtd0) can never create any partitions before
> > 0x20000. But it CAN create partitions after 0x4000! We'd have to support
> > negative offsets for this to work consistently. (Now that I mention it,
> > does MTD's BLKPG even do sanity checking on the arguments? I think it
> > might actually accept negative offsets...).
> >
> > Also, it's a bit odd that you can use one partition to delete either
> > another partition, or itself. e.g.,
> >
> >         flash_part del /dev/mtd1 0  # deletes mtd0
> >         flash_part del /dev/mtd1 1  # deletes mtd1
> >
> > This might be acceptable, if awkward. But the first problem looks like
> > it needs more thought.
> >
> > Brian
> 
> OK, how would you feel if I just added some stronger bounds checking
> for add?

That might be better. It at least would be consistent. But it still
kinda caters to a specific case, where all space you want to partition
is already available in some other partition.

> I'm not sure what to do about the delete case.

Maybe for the delete case, we'd only want to allow deleting the current
partition, when using a partition reference rather than a 'master'
reference?

> For my use case, I have one partition set up as mtd0 which spans over
> the whole device. I'll always be using this as my master.

FWIW, I do the same; I always have one "partition" that covers the whole
device, in addition to any sub-partitions I might actually use.

> It'd suit my
> purposes if we restricted these special add and removes to that sort
> of case, but I generalized it like this because I thought it would be
> cleaner. I'm open to more suggestions. It'd also work for me to make
> some sort of option (kernel commandline param?) to give a number to
> the master device and just refer to that directly (I haven't really
> thought this option through).

(I haven't worked this one out completely either, but...) you may be on
to something there. Personally, I'd prefer it if MTD always registered
the master as a separate device. It would certainly make things like
this easier, and it would eliminate the need for users like you and me
to artificially create entire-device partitions.

But we have this comment in mtdcore.c:

 * We don't register the master, or expect the caller to have done so,
 * for reasons of data integrity.

from ye olden days:

   commit 1f24b5a8ecbb2a3c7080f418974d40e3ffedb221
   Author: David Brownell <dbrownell@users.sourceforge.net>
   Date:   Thu Mar 26 00:42:41 2009 -0700

       [MTD] driver model updates

which answered this question, originating from prehistoric MTD:

 * (Q: should we register the master MTD object as well?)

IMO, the "data integrity" argument is pretty flimsy. Nobody complains
that the SCSI subsystem gives users the power to clobber partition
tables in /dev/sda, do they?

But alas, we probably can't really change the default registration
behavior here without massively breaking the #1 rule of kernel
programming.

Brian
