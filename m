Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LMVQX-0005ye-6d
	for linux-mtd@lists.infradead.org; Mon, 12 Jan 2009 22:38:35 +0000
Date: Mon, 12 Jan 2009 22:38:31 +0000
From: Jamie Lokier <jamie@shareable.org>
To: uClinux development list <uclinux-dev@uclinux.org>
Subject: Re: [uClinux-dev] Re: DQ5 Checks in mtd drivers
Message-ID: <20090112223831.GA26430@shareable.org>
References: <CCD96CEE-EA39-4B40-A26E-3B5ADE8B9802@logicaloutcome.ca>
	<FF3C6138-2FA3-440D-BCF3-0DF37826A00E@logicaloutcome.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FF3C6138-2FA3-440D-BCF3-0DF37826A00E@logicaloutcome.ca>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Glenn Henshaw wrote:
>   Since no one seems interested,

Sometimes you just have to post again.  People are too busy to respond
to every message, so some get missed.  It doesn't mean nobody cares.
This is normal on many mailing lists like this.

But note that 2.4 kernels are not supported by official MTD authors
any more, since they are way too old.  If the problem is still present
in current 2.6 kernels, then they may be interested in your fix.

> does this absolve me from my GPL obligation to submit the code
> upstream?

It doesn't change or absolve any obligations.

You haven't understood the GPL.  The GPL does not create any
obligation to submit the code upstream, or to make it public.

The GPL means when you give someone compiled code, you have to give
_those_ people the exact corresponding source code (i.e. with your
changes, exact same version etc.), or you must give them access to
that source code.  The GPL explains several different ways you can
do this.

So you do have an obligation, but it's not what you've implied, and it
doesn't have anything to do with upstream.

Publishing the changes publically and submitting the code upstream is
a good idea anyway, for many reasons, but it's not an obligation.

> > I have just managed to update a system from an older 2.4 kernel to
> >the most recent 2.4.34.5-uc0 version.

I know the feeling, as I'm just forward porting something using 2.4.26
right now, and I know someone doing the same for a device using 2.4.19
:-)

> >It looks like there were some checks added to the AMD FLASH drivers
> >that totally break SST FLASH devices.
> >
> > 1) Where is the best place to complain? Was the old functionality
> >hidden somewhere?
> > 2) Where is the best place to submit the patch to support SST
> >39VF320x and 39VF640x devices?

If the problem is present in current 2.6 kernels, it would be good to
post about it again, this time explaining that it's in 2.6 kernels.

The MTD authors have moved on from 2.4 kernels a long time ago and no
longer support them.

If the patch is reasonably clear and sane, and doesn't break anything
else (such as other flashes) you may submit it to the general Linux
2.4 maintainer, Willy Tarreau <w@1wt.eu> last time I looked.  I guess
if nobody reviews your patch but it's an important and well-contained
fix, that's the best you can do.

-- Jamie
