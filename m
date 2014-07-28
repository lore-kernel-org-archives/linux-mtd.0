Received: from mail-ig0-x22f.google.com ([2607:f8b0:4001:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XBp1s-00061z-Ni
 for linux-mtd@lists.infradead.org; Mon, 28 Jul 2014 17:48:09 +0000
Received: by mail-ig0-f175.google.com with SMTP id uq10so4033341igb.2
 for <linux-mtd@lists.infradead.org>; Mon, 28 Jul 2014 10:47:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1406566449.23376.61.camel@sauron.fi.intel.com>
References: <CAAK6Zt03J=0=tv5rPvZH0pTZWM8ha5eu0gqFbZ6P_FgSrgwW-A@mail.gmail.com>
 <1406566449.23376.61.camel@sauron.fi.intel.com>
Date: Mon, 28 Jul 2014 10:47:47 -0700
Message-ID: <CAAK6Zt0NHgyiRCGxpdbFgJ49P2bd8nKhqm13uP8pzHCFmjNgJQ@mail.gmail.com>
Subject: Re: Using UBIFS as an FTL
From: Daniel Ehrenberg <dehrenberg@google.com>
To: artem.bityutskiy@linux.intel.com
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 28, 2014 at 9:54 AM, Artem Bityutskiy
<artem.bityutskiy@linux.intel.com> wrote:
>
> On Fri, 2014-07-25 at 11:21 -0700, Daniel Ehrenberg wrote:
> > Hi Artem, others,
> >
> > For my project, I'm looking into using ext4 on top of NAND flash, in
> > order to use some fancy ext4 features. For this, I need an FTL in the
> > middle. I'm wondering which would be good to use. Options that I've
> > looked at are:
> > - ubiblock--the read-modify-write sounds unacceptable to me, even if
> > wear leveling and atomicity are handled.
>
> This may not give you the optimal performance.

My understanding of ubiblock is that, when you do 4k writes scattered
around the device, they will magnify into block-sized
read-modify-writes. This causes ~64x as much wear (depending on the
device type) and goes at 1/64th the speed. I don't think I could
change ubiblock to not have this property because that wouldn't be
backwards-compatible--I'd need an extra layer of indirection to
separate logical pages from logical erase blocks. Isn't ubiblock
usable for, say, copying off or on a ubifs filesystem image? I
wouldn't want to remove that functionality (and maybe I'll end up
using it). It just seems like ubiblock and a real FTL need totally
different pieces of software.
>
> > - Some coworkers have suggested a new effort to build a new block
> > device, but that that's a huge project and takes a long time to get
> > right.
>
> Yes.
>
> > - loopback-mounting a file on ubifs--From skimming the code, it looks
> > to me like ubifs uses some nice datastructures to handle writes within
> > a file without doing read-modify-writes all the time as ubiblock
> > forces. ubifs authors/maintainers, do you see any downside to using
> > ubifs this way?
>
> I never tried loopback over UBIFS. Should work in theory.
> Synchronization (as in 'fsync()') is something which comes to mind.
>
> What I mean is that when ext4 handles an fsync(), or a commit, it
> eventually needs to make sure the data goes to the underlying media. It
> sends REQ_FLUSH bios, and it seems that the loopback driver will map
> that to UBIFS's 'vfs_fsync()'. That should be fine, but may be too
> coarse? You could just write the right pages instead, to gain better
> performance?
>
> Then ext4 commit has various ordering requirements, and I do not know
> how this works with loopback.
>
> This all matters if you need to have some kind of power-cut tolerance.
>
> Thanks!
>
> --
> Best Regards,
> Artem Bityutskiy
>
These are good points that I hadn't thought about. I'm also worrying
about the overhead of loopback, but that's really outside of the scope
of UBIFS.

Thanks a lot everyone for this help! I think I'll push back on the
application requirements and just use UBIFS for now, and then in a
year or two if the requirements push back, either try to optimize
loopback and handle the issues Artem raises, or implement an FTL, or
port the fancy ext4 features to UBIFS. It's good to know that I'm not
missing some big piece of code here that would solve my problems.

Thanks,
Dan
