Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOJNR-0004rW-73
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2016 06:14:50 +0000
From: "Wilcox, Matthew R" <matthew.r.wilcox@intel.com>
To: Jared Hulbert <jaredeh@gmail.com>
CC: linux-mtd <linux-mtd@lists.infradead.org>, David Woodhouse
 <dwmw2@infradead.org>, "ross.zwisler@linux.intel.com"
 <ross.zwisler@linux.intel.com>, Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: PMEM, DAX, MTD, and the quest for the Theory of Everything
Date: Wed, 27 Jan 2016 06:14:27 +0000
Message-ID: <100D68C7BA14664A8938383216E40DE04217BDF6@FMSMSX114.amr.corp.intel.com>
References: <CA+ZsKJ53E33rWmwv-v=_b8OjHT_20UW7WqD9XhhHJ0aYxJc=cA@mail.gmail.com>
 <100D68C7BA14664A8938383216E40DE04217A0C1@FMSMSX114.amr.corp.intel.com>,
 <CA+ZsKJ7Q8uBS6M4UV3Jvq19m-bowGCcqkp7AVtpJmnaOz+XfVg@mail.gmail.com>
In-Reply-To: <CA+ZsKJ7Q8uBS6M4UV3Jvq19m-bowGCcqkp7AVtpJmnaOz+XfVg@mail.gmail.com>
Content-Language: en-CA
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm under lawyerly advice not to look at patents; sorry.=0A=
=0A=
Now that you explain there was a design goal to support MTD devices, I unde=
rstand why ->get_xip_mem() was an address space operation.  The problem was=
 that none of the MTD filesystems were ever merged!  The only implementatio=
n of get_xip_mem was in ext2.  So it felt like an unnecessary and awful pie=
ce of layering, and I took great delight in getting rid of it.=0A=
=0A=
I'm interested in seeing what you come up with!=0A=
=0A=
________________________________________=0A=
From: Jared Hulbert [jaredeh@gmail.com]=0A=
Sent: January 26, 2016 7:33 PM=0A=
To: Wilcox, Matthew R=0A=
Cc: linux-mtd; David Woodhouse; ross.zwisler@linux.intel.com; Chris Brandt=
=0A=
Subject: Re: PMEM, DAX, MTD, and the quest for the Theory of Everything=0A=
=0A=
On Tue, Jan 26, 2016 at 7:53 AM, Wilcox, Matthew R=0A=
<matthew.r.wilcox@intel.com> wrote:=0A=
> No, we haven't been considering the MTD code at all with DAX.  We leapt o=
nto the S/390 filemap_xip code, and took it for a wild ride.  I did look at=
 the MTD code a bit, but that was two or more years ago.  I vaguely remembe=
r thinking that it could be made to support DAX, but it really wasn't (and =
isn't) my focus.=0A=
=0A=
Funny, we did the same thing.  Just a little calmer ride I suppose.  I=0A=
worked with Carsten and Nick several years ago to enable the=0A=
originally very S/390 centric code to make it more embedded friendly.=0A=
The solution was the raw pfn enablement of the VM_MIXEDMAP stuff.  It=0A=
was immediately commercially usable with NOR devices my then employer=0A=
sold into embedded apps.  For example, I know for a fact Sony used it=0A=
in some DSLR type cameras.  But we had big plans I can't talk about,=0A=
but I will point to the public record...=0A=
https://www.google.com/patents/US8626997=0A=
=0A=
> I don't think I'd be terribly upset by the appearance of patches which ma=
de DAX sit on top of an MTD device instead of a block device, but I don't h=
ave a good feel for where embedded systems are these days.  Is it still wor=
th configuring out the block subsystem?=0A=
=0A=
=0A=
Thanks.  I'll be honest.  I was a little bummed to find parts of DAX=0A=
are so block centric, I didn't see that coming given how the=0A=
filemap_xip.c was abstracted.  I get it, what you did makes sense=0A=
given how the  was merged, and I blame myself for not paying=0A=
attention.  Ya'll did a nice clean job with DAX, it's going feel like=0A=
ripping up brand new and beautifully done kitchen remodel because I=0A=
don't like the color of the countertops.  Would have been easier to=0A=
speak up earlier...=0A=
=0A=
I'll dive into the DAX code and try to propose some stuff, please be=0A=
patient.  I've been out of it for a while messing with other stuff.=0A=
I'm going to be a little ignorant about some simple stuff.  If anybody=0A=
has any ideas... please help.=0A=
=0A=
> In your last sentence you talk about 'EXT4 on ROM/NOR devices' -- have yo=
u divorced ext4 from the block layer?  Or are you talking about ext4 on mtd=
block?=0A=
=0A=
Blockless and EXT4 were two different examples...=0A=
=0A=
For example, AXFS and PRAMFS both used filemap_xip.c primitives, but=0A=
didn't need block.=0A=
=0A=
I'm not advocating EXT4 get divorced.  I'm just thinking it would be=0A=
easy enough to have DAX EXT4 run without a _proper_ block device.=0A=
Maybe a RO BRD, DAX enabled mtdblock, or a merging of the two on top=0A=
of a NOR or other ROM like device in RO mode.=0A=
=0A=
I totally agree with Mr. Pitre about the cost advantage of blockless=0A=
deep embedded stuff.  I also acknowledge sometimes it's nice to use=0A=
what you're familiar with if it's a good enough solution.  EXT4 might=0A=
be used in DAX embedded sometimes, especially read-only.=0A=
=0A=
So I CC:ed Chris Brandt because he's been working on AXFS with me=0A=
lately on a very cool set of deep embedded applications where RAM is=0A=
scarce, but there is some onchip Flash that can be played with to=0A=
relieve the RAM pressure with XIP.  XIP/DAX is perfect for what he's=0A=
doing.  But we do need a little more embedded friendly tweaks to get=0A=
there on 4.0+.=0A=
=0A=
> -----Original Message-----=0A=
> From: Jared Hulbert [mailto:jaredeh@gmail.com]=0A=
> Sent: Monday, January 25, 2016 5:10 PM=0A=
> To: linux-mtd; David Woodhouse; Wilcox, Matthew R; ross.zwisler@linux.int=
el.com; Chris Brandt=0A=
> Subject: PMEM, DAX, MTD, and the quest for the Theory of Everything=0A=
>=0A=
> I'm not seeing any traffic connecting MTD, PMEM, and DAX.  Any=0A=
> discussions I should be aware of?=0A=
>=0A=
> MTD devices like SPI-NOR and the inevitable spillover into the=0A=
> embedded market of 3D Xpoint and similar technologies are excluded=0A=
> from the DAX game.  Considering all the years we spent playing with=0A=
> XIP in MTD...   well that's what happens when you disengage for=0A=
> several years.=0A=
>=0A=
> A few thoughts...=0A=
>=0A=
> #1 - MTD provides various ways to partition memory semantic devices as=0A=
> reprogramable ROMs for storage of bootloaders, kernel, rootfs images,=0A=
> etc.  Does PMEM have anything to learn from this?  Or does the MTD=0A=
> layer have an opportunity to gain something by using PMEM standards?=0A=
>=0A=
> #2 - MTD has had an API that allowed direct access (see point() in=0A=
> struct mtd_info) and block-ish semantic access of persistent memory=0A=
> devices since, I dunno, before bitkeeper?  Can we hook this up with=0A=
> DAX?  Read Only should be "trivial" especially if someone else does=0A=
> it. :)=0A=
>=0A=
> #3 - There has long been a desire to merge MTD with the block=0A=
> subsystem with some members of the MTD community.  PMEM seems to=0A=
> create a precedent for a block interface on a device that isn't=0A=
> fundamentally block based.  Also the direct_access() in block has been=0A=
> legitimized with the recent DAX stuff.   Is it time now?=0A=
>=0A=
> My vision here is to enable Read-Only DAX images of EXT4, AXFS, PRAMFS=0A=
> on ROM/NOR devices in a standard DAX way.=0A=
>=0A=
> Thoughts?=0A=
