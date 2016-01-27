Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOGrp-0005Nw-4w
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2016 03:34:02 +0000
Received: by mail-wm0-x22d.google.com with SMTP id n5so6704053wmn.0
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jan 2016 19:33:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <100D68C7BA14664A8938383216E40DE04217A0C1@FMSMSX114.amr.corp.intel.com>
References: <CA+ZsKJ53E33rWmwv-v=_b8OjHT_20UW7WqD9XhhHJ0aYxJc=cA@mail.gmail.com>
 <100D68C7BA14664A8938383216E40DE04217A0C1@FMSMSX114.amr.corp.intel.com>
Date: Tue, 26 Jan 2016 19:33:39 -0800
Message-ID: <CA+ZsKJ7Q8uBS6M4UV3Jvq19m-bowGCcqkp7AVtpJmnaOz+XfVg@mail.gmail.com>
Subject: Re: PMEM, DAX, MTD, and the quest for the Theory of Everything
From: Jared Hulbert <jaredeh@gmail.com>
To: "Wilcox, Matthew R" <matthew.r.wilcox@intel.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "ross.zwisler@linux.intel.com" <ross.zwisler@linux.intel.com>,
 Chris Brandt <Chris.Brandt@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 26, 2016 at 7:53 AM, Wilcox, Matthew R
<matthew.r.wilcox@intel.com> wrote:
> No, we haven't been considering the MTD code at all with DAX.  We leapt o=
nto the S/390 filemap_xip code, and took it for a wild ride.  I did look at=
 the MTD code a bit, but that was two or more years ago.  I vaguely remembe=
r thinking that it could be made to support DAX, but it really wasn't (and =
isn't) my focus.

Funny, we did the same thing.  Just a little calmer ride I suppose.  I
worked with Carsten and Nick several years ago to enable the
originally very S/390 centric code to make it more embedded friendly.
The solution was the raw pfn enablement of the VM_MIXEDMAP stuff.  It
was immediately commercially usable with NOR devices my then employer
sold into embedded apps.  For example, I know for a fact Sony used it
in some DSLR type cameras.  But we had big plans I can't talk about,
but I will point to the public record...
https://www.google.com/patents/US8626997

> I don't think I'd be terribly upset by the appearance of patches which ma=
de DAX sit on top of an MTD device instead of a block device, but I don't h=
ave a good feel for where embedded systems are these days.  Is it still wor=
th configuring out the block subsystem?


Thanks.  I'll be honest.  I was a little bummed to find parts of DAX
are so block centric, I didn't see that coming given how the
filemap_xip.c was abstracted.  I get it, what you did makes sense
given how the  was merged, and I blame myself for not paying
attention.  Ya'll did a nice clean job with DAX, it's going feel like
ripping up brand new and beautifully done kitchen remodel because I
don't like the color of the countertops.  Would have been easier to
speak up earlier...

I'll dive into the DAX code and try to propose some stuff, please be
patient.  I've been out of it for a while messing with other stuff.
I'm going to be a little ignorant about some simple stuff.  If anybody
has any ideas... please help.

> In your last sentence you talk about 'EXT4 on ROM/NOR devices' -- have yo=
u divorced ext4 from the block layer?  Or are you talking about ext4 on mtd=
block?

Blockless and EXT4 were two different examples...

For example, AXFS and PRAMFS both used filemap_xip.c primitives, but
didn't need block.

I'm not advocating EXT4 get divorced.  I'm just thinking it would be
easy enough to have DAX EXT4 run without a _proper_ block device.
Maybe a RO BRD, DAX enabled mtdblock, or a merging of the two on top
of a NOR or other ROM like device in RO mode.

I totally agree with Mr. Pitre about the cost advantage of blockless
deep embedded stuff.  I also acknowledge sometimes it's nice to use
what you're familiar with if it's a good enough solution.  EXT4 might
be used in DAX embedded sometimes, especially read-only.

So I CC:ed Chris Brandt because he's been working on AXFS with me
lately on a very cool set of deep embedded applications where RAM is
scarce, but there is some onchip Flash that can be played with to
relieve the RAM pressure with XIP.  XIP/DAX is perfect for what he's
doing.  But we do need a little more embedded friendly tweaks to get
there on 4.0+.

> -----Original Message-----
> From: Jared Hulbert [mailto:jaredeh@gmail.com]
> Sent: Monday, January 25, 2016 5:10 PM
> To: linux-mtd; David Woodhouse; Wilcox, Matthew R; ross.zwisler@linux.int=
el.com; Chris Brandt
> Subject: PMEM, DAX, MTD, and the quest for the Theory of Everything
>
> I'm not seeing any traffic connecting MTD, PMEM, and DAX.  Any
> discussions I should be aware of?
>
> MTD devices like SPI-NOR and the inevitable spillover into the
> embedded market of 3D Xpoint and similar technologies are excluded
> from the DAX game.  Considering all the years we spent playing with
> XIP in MTD...   well that's what happens when you disengage for
> several years.
>
> A few thoughts...
>
> #1 - MTD provides various ways to partition memory semantic devices as
> reprogramable ROMs for storage of bootloaders, kernel, rootfs images,
> etc.  Does PMEM have anything to learn from this?  Or does the MTD
> layer have an opportunity to gain something by using PMEM standards?
>
> #2 - MTD has had an API that allowed direct access (see point() in
> struct mtd_info) and block-ish semantic access of persistent memory
> devices since, I dunno, before bitkeeper?  Can we hook this up with
> DAX?  Read Only should be "trivial" especially if someone else does
> it. :)
>
> #3 - There has long been a desire to merge MTD with the block
> subsystem with some members of the MTD community.  PMEM seems to
> create a precedent for a block interface on a device that isn't
> fundamentally block based.  Also the direct_access() in block has been
> legitimized with the recent DAX stuff.   Is it time now?
>
> My vision here is to enable Read-Only DAX images of EXT4, AXFS, PRAMFS
> on ROM/NOR devices in a standard DAX way.
>
> Thoughts?
