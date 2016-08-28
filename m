Date: Sun, 28 Aug 2016 16:17:34 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Richard Weinberger <richard@nod.at>, openwrt-devel@lists.openwrt.org,
 Hauke Mehrtens <hauke@hauke-m.de>, lede-dev@lists.infradead.org,
 linux-mtd@lists.infradead.org, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Zoltan HERPAI <wigyori@uid0.hu>, Ralph
 Sennhauser <ralph.sennhauser@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: [PATCH/RFC 0/3] UBI: unify mouting rootfs based on cmdline
 parameter
Message-ID: <20160828161734.7ab94563@bbrezillon>
In-Reply-To: <20160828134756.GC1623@makrotopia.org>
References: <20160827194326.GA1817@makrotopia.org>
 <208b9297-9790-2b2f-6013-49aadb6970cf@nod.at>
 <20160828091017.06fc2312@gmail.com>
 <d150f68e-688f-0fff-1d4f-b768d6665ff1@nod.at>
 <20160828111931.6eb3a10d@gmail.com>
 <f7733dca-068a-38f4-f715-1abb439a71bc@nod.at>
 <20160828114445.GA1623@makrotopia.org>
 <c6400202-25a2-e9f7-77bf-d1819d6d181b@nod.at>
 <20160828134756.GC1623@makrotopia.org>
MIME-Version: 1.0
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

On Sun, 28 Aug 2016 15:47:56 +0200
Daniel Golle <daniel@makrotopia.org> wrote:

> Hi Richard,
>=20
> On Sun, Aug 28, 2016 at 01:57:40PM +0200, Richard Weinberger wrote:
> > Daniel,
> >=20
> > On 28.08.2016 13:44, Daniel Golle wrote: =20
> > > Hi Richard,
> > >=20
> > > On Sun, Aug 28, 2016 at 11:28:18AM +0200, Richard Weinberger wrote: =
=20
> > >> Ralph,
> > >>
> > >> On 28.08.2016 11:19, Ralph Sennhauser wrote: =20
> > >>>>> On the other hand an initramfs can carry the logic to figure out
> > >>>>> which to mount and is what I use for my self. The busybox based
> > >>>>> implementation I use adds a tad over 300Kb to the uImage, perfect=
ly
> > >>>>> acceptable in my case.   =20
> > >>>>
> > >>>> When your minimal initramfs consumes 300KiB you're doing something
> > >>>> wrong. As I said in another thread, for your special purpose you'd
> > >>>> need to create a minitmal userspace for initramfs, no fancy (eg)li=
bc,
> > >>>> just a bare minimum /init program which does the mount probing.
> > >>>> Shouldn=E2=80=99t be more than a few system calls. =20
> > >=20
> > > That would indeed be nice, however, I fail to see how this can work
> > > with little effort *before* having devtmpfs ready. Also, we'll need a
> > > non-standard kernel parameter (usually "real_root=3D") to pass the
> > > selected rootfs down to our to-be-implemented micro-sized initramfs. =
=20
> >=20
> > devtmpfs is available in initramfs. =20
>=20
> Yes, but you'll need to mount it (or tell the kernel to do so
> automatically, which will then again cause problems on non-initramfs
> systems where the init process is taking care of that).
> Once you use device from that devtmpfs, you'll no longer be able to
> umount it (because it's then busy), resulting in the whole initfamfs
> to eat up RAM even after the real rootfs has been mounted.
> As I said, I'm not generally against that, I just think it should not
> be mandatory for the most simple possible case.
>=20
> >  =20
> > >>>>
> > >>>> Thanks,
> > >>>> //richard =20
> > >>>
> > >>> Well, I use busybox because I'm lazy and still get away with only 3=
00Kb.
> > >>> And as I said there is plenty space on my device. (6M per uImage OEM
> > >>> firmware configuration) =20
> > >>
> > >> So, problem solved. Use an initramfs. :-) =20
> > >=20
> > > I agree this might be acceptable for some, but certainly not all
> > > cases. Unlike to your previous statement, I'm not generally opposed
> > > to having an initramfs included in the kernel as that can also provide
> > > other nice features such as recovery/failsafe methods.
> > > We've had this discussion before and my goal is, as I explained, to
> > > make the kernel as reusable as possible and even allow people to use
> > > OpenWrt/LEDE's kernel binary with other distributions. I'm sure
> > > this is also possible when using an initramfs, however, I still fail =
to
> > > see the necessity for that on simple devices.
> > > Imho, using an initramfs shouldn't be mandatory which is why there are
> > > patches (now down to about 80 LoC, resulting in probably less than 1kB
> > > in added binary size) to mount the rootfs without the need of an
> > > initramfs, simply because I do not consider that to be a
> > > "complex setup" if there is no less complex and yet generic way
> > > imaginable to boot on that platform at all.
> > > Hence I'm not buying the argument that ubiX_Y and ubiblockX_Y are two
> > > different devices and thus, this is a device selection problem and th=
us
> > > initramfs is the recommended way -- in fact, all other filesystems
> > > which do *not* build upon a block device provide some probing hacks in
> > > early userspace. Take MTD as an example: mtdblock devices are
> > > automagically provided and needed for block-based filesystems, no need
> > > for initramfs or kernel parameters to achieve that. For UBI, ubiblock
> > > (or gluebi...) is required to use UBI for anything else than UBIFS.
> > > Anyway, I'm afraid you have made your decission and additional
> > > arguments have no influence what-so-ever.
> > >  =20
> > >>
> > >> </discussion>, =20
> > >=20
> > > If that's the whole answer ("Use initramfs. End of story."), that's
> > > pretty disappointing. Dispite your previous invitation to discuss the
> > > matter and collaborate to address the needs of all parties involved,
> > > you are now offering only one option which is not agreeable by all
> > > parties (which is the obvious reason for those nasty patches to exist
> > > in first place). Carrying a few patches in our local overlay doesn't
> > > truly hurt in a technical sense, however, it'd be nicer to discuss how
> > > those features could be brought upstream or mitigate our local patches
> > > in other ways.
> > > In the case of not finding room for a debate and your answer is a
> > > straight "we don't want this feature upstream" this is never the less
> > > a good reference to remember when touching those patches in future:
> > > falls into "we tried, they didn't want it" and thus we'll keep carryi=
ng
> > > them around, at least as long as there are platforms needing them. =20
> >=20
> > Well, it is more a "use initramfs or cmdline via bootloader or cmdline =
via DT"
> > but you refuse to use *all* of these. =20
>=20
> I'll happily use cmdline if it would be possible in a filesystem-type
> agnostic way. The problem I see is that currently, when following that
> suggesting, I'll end up with information about the filesystem-type in
> either the bootloader or device-tree, which really shouldn't be. Hence
> my suggestion I was intending to discuss here.
>=20
> > I asked to discuss and explain your use case and patches on linux-mtd. =
You did.
> > We explained you how to solve your issues without the need of any kerne=
l hack.
> > You refused. =20
>=20
> I went through your suggestions and tried to follow them as closely as
> possible given the use-case. What I ended up with is a completely new
> and very different set of patches which is required to actually be able
> to do so.
>=20
> >=20
> > You bring over and over the same arguments and we showed you every sing=
le time
> > that your kernel hacks are not needed and everything can be solved perf=
ectly fine
> > using existing features. This is disappointing. =20
>=20
> All suggestions include the problem named above (needing to be aware
> of the rootfs-type in a place where I shouldn't). If I don't feel that
> this is being understood, repeating and explainign it more deeply is a
> quite natural reaction.
>=20
> > Discussing a patch to death does not get it merged. =20
>=20
> I'm also happy to come up with alternative implementations or accept
> any suggestions which would actually resolve the issue.
> Requirements:
>  - the bootloader may be proprietary, so we cannot require users to touch=
 it
>    (I feel that this was understood, no need to discuss again)
>  - run the exact same kernel + device-tree with different filesystems,
>    eg. UBIFS and SQUASHFS. This is intended in the kernel, ie. one can
>    specify a list of filesystems like rootfstype=3Dsquashfs,jffs2
>    or rootfstype=3Dsquashfs,ext4 (which is what we do on NOR-flash or
>    block-based devices)
>=20
> >=20
> > So it is not a thing of not finding room for a debate. We debated all a=
spects
> > multiple times and provided solutions. =20
>=20
> Have you actually looked into the patches rather than just replied
> to the cover-letter?
>=20
> Let's make a check-list:
>  OK   attach UBI during boot
>       -> use ubi.mtd=3Dubi in cmdline instead =20
>  OK   probe-mount UBIFS
>       -> patches merged upstream (MS_SILENT) =20
> HACK  move volume name parser from UBIFS to ubi_open_volume_str()
>       -> refused, no debate, no good alternative =20
> HACK  introduce ubiblock_create_dev() passing back dev_t of the created
>       ubiblock device
>       -> patch refused, no debate, no good alternative =20
> HACK  set ROOT_DEV for created ubiblock device
>       -> not discussed here, but that's ok :) =20

I'm just reacting at your implementation proposal, so don't take this
as a 'yes, Boris seems to accept the concept of trial-and-error FS probe
on top of UBI vol in the kernel'.

But wouldn't something like that [1] be both simpler and self-contained?
Don't know if that works, but I think it's better to have a single
place to change (here UBIFS), than touching core kernel code along with
UBI and UBIFS.

Of course, this does not solve the auto ubi-to-ubiblock attach, but
that can be done with another parameter, like
ubi.block=3Dattach_all_ro_vols.


[1]http://code.bulix.org/fkxrgt-105392
