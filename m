From: Bryan Evenson <bevenson@melinkcorp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Date: Thu, 21 Nov 2013 06:27:17 -0500
Subject: RE: at91: ubi: UBIFS error (pid 1): ubifs_iget: failed to read
 inode 1, error -2
Message-ID: <91586D499ADFD74FBCFB8425266A5DE40153BB5351DE@pluto.melinkcorp.local>
References: <91586D499ADFD74FBCFB8425266A5DE40153BB2BE545@pluto.melinkcorp.local>
 <91586D499ADFD74FBCFB8425266A5DE40153BB2BE711@pluto.melinkcorp.local>
 <528DB706.3070901@intel.com>
In-Reply-To: <528DB706.3070901@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adrian,

> -----Original Message-----
> From: Adrian Hunter [mailto:adrian.hunter@intel.com]
> Sent: Thursday, November 21, 2013 2:32 AM
> To: Bryan Evenson
> Cc: linux-arm-kernel@lists.infradead.org; Artem Bityutskiy; linux-
> mtd@lists.infradead.org
> Subject: Re: at91: ubi: UBIFS error (pid 1): ubifs_iget: failed to read
> inode 1, error -2
>=20
> On 20/11/13 16:04, Bryan Evenson wrote:
> > Adding appropriate UBIFS maintainers and the mtd mailing list to the
> thread as this deals with the UBIFS.
> >
> >> -----Original Message-----
> >> From: linux-arm-kernel [mailto:linux-arm-kernel-
> >> bounces@lists.infradead.org] On Behalf Of Bryan Evenson
> >> Sent: Tuesday, November 19, 2013 2:46 PM
> >> To: linux-arm-kernel@lists.infradead.org
> >> Subject: at91: ubi: UBIFS error (pid 1): ubifs_iget: failed to read
> >> inode 1, error -2
>=20
> Sounds the same as the error reported here:
>=20
> 	http://lists.infradead.org/pipermail/linux-mtd/2013-
> May/047083.html

That does sound very similar to what I'm seeing.  It looks like the 3.10.y =
longterm release has features I need for our hardware and our application, =
so I think I'll work on switching over to that release.

Thanks,
Bryan

>=20
> >>
> >> I am using an Atmel AT91SAM9G25 board with Micron's MT29F2G08ABAEAWP
> >> NAND flash.  I am on Atmel's variant of the 3.6.9 kernel.
> >> Specifically, I'm using https://github.com/linux4sam/linux-
> >> at91/tree/linux-3.6.9-at91 commit
> >> 5fe012d4aee98ef82df66e6763882c735902ed0f.   I have several boards in
> >> which I see the error message shown in the message subject when the
> >> device is reset due to a power cycle and the device fails to
> continue
> >> to load the filesystem.  On one board I erased and re-wrote the
> >> filesystem and the device is working just fine through multiple
> power
> >> cycles.  My questions are:
> >>
> >> 1. Is this a known issue with the version of the kernel that I am
> >> using?  I've searched this mailing list and the latest mainline
> >> kernel commits, and I didn't see anything directly related to this
> issue.
> >> 2. If so, is there a fix in a later kernel version?
> >> 3. If not, what would be helpful in figuring out what is going on?
> I
> >> still have a bad device that I haven't touched the flash on.
> >>
> >
> > I took a deeper look at the commit history of the kernel I am using,
> and the last UBI/UBIFS patches to my kernel that I found in the
> mainline kernel are:
> >
> > UBIFS: fix mounting problems after power cuts
> > UBIFS: introduce categorized lprops counter
> >
> > which were merged into the mainline kernel on 2012-11-15.  I don't
> see any UBI/UBIFS related patches since then that specifically mention
> the error I'm seeing.  However, there are a few notable bugs that have
> been fixed since then such as:
> >
> > UBIFS: fix use of freed ubifs_orphan objects
> > UBIFS: fix double free of ubifs_orphan objects
> > ubifs: wait for page writeback to provide stable pages
> > UBIFS: prepare to fix a horrid bug
> > UBIFS: fix a horrid bug
> > UBI: Fix PEB leak in wear_leveling_worker()
> >
> > Could not having these fixes in place lead to the issue I'm seeing if
> there is a power cut?  The kernel I am using does not yet have support
> for fastmap and I am using the default UBI/UBIFS configuration (4096
> wear-leveling, 2% reserved eraseblocks for bad eraseblock handling).
> The boards on which I am having an issue are test boards that have been
> in use long enough that wear-leveling should be occurring.  And as
> previously noted, I still have at least one board in its broken state
> if the flash image would be useful for someone (or if someone knows
> what I should be looking for to figure out what happened).
>=20
> If it is the same problem as above you need the first 2 at least.
>=20
> >
> > Thanks,
> > Bryan
> >
> >> Thanks,
> >> Bryan
> >>
> >>
> >>
> >>
> >> _______________________________________________
> >> linux-arm-kernel mailing list
> >> linux-arm-kernel@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> >
> >
