Date: Sun, 28 Aug 2016 15:24:15 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Richard Weinberger <richard@nod.at>, Ralph Sennhauser
 <ralph.sennhauser@gmail.com>, linux-mtd@lists.infradead.org, Zoltan HERPAI
 <wigyori@uid0.hu>, Hauke Mehrtens <hauke@hauke-m.de>,
 lede-dev@lists.infradead.org, openwrt-devel@lists.openwrt.org, Brian Norris
 <computersforpeace@gmail.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH/RFC 0/3] UBI: unify mouting rootfs based on cmdline
 parameter
Message-ID: <20160828152415.3d338e35@bbrezillon>
In-Reply-To: <20160828114445.GA1623@makrotopia.org>
References: <20160827194326.GA1817@makrotopia.org>
 <208b9297-9790-2b2f-6013-49aadb6970cf@nod.at>
 <20160828091017.06fc2312@gmail.com>
 <d150f68e-688f-0fff-1d4f-b768d6665ff1@nod.at>
 <20160828111931.6eb3a10d@gmail.com>
 <f7733dca-068a-38f4-f715-1abb439a71bc@nod.at>
 <20160828114445.GA1623@makrotopia.org>
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

On Sun, 28 Aug 2016 13:44:48 +0200
Daniel Golle <daniel@makrotopia.org> wrote:

> Hi Richard,
>=20
> On Sun, Aug 28, 2016 at 11:28:18AM +0200, Richard Weinberger wrote:
> > Ralph,
> >=20
> > On 28.08.2016 11:19, Ralph Sennhauser wrote: =20
> > >>> On the other hand an initramfs can carry the logic to figure out
> > >>> which to mount and is what I use for my self. The busybox based
> > >>> implementation I use adds a tad over 300Kb to the uImage, perfectly
> > >>> acceptable in my case.   =20
> > >>
> > >> When your minimal initramfs consumes 300KiB you're doing something
> > >> wrong. As I said in another thread, for your special purpose you'd
> > >> need to create a minitmal userspace for initramfs, no fancy (eg)libc,
> > >> just a bare minimum /init program which does the mount probing.
> > >> Shouldn=E2=80=99t be more than a few system calls. =20
>=20
> That would indeed be nice, however, I fail to see how this can work
> with little effort *before* having devtmpfs ready. Also, we'll need a
> non-standard kernel parameter (usually "real_root=3D") to pass the
> selected rootfs down to our to-be-implemented micro-sized initramfs.

Sorry, but I don't get this argument? AFAICT, devtmpfs can definitely be
enabled in an initramfs, all you need is a /dev directory.
And for the extra kernel parameters, I fail to see why it's required at
all: your initramfs should contain scripts/binaries that know which
config should be tested (for example, first try to create a ubiblock
dev on ubi0:rootfs, if it fails, fallback to ubifs).

So really, I think you're making a big deal of something that is not so
complicated to setup.

>=20
> > >>
> > >> Thanks,
> > >> //richard =20
> > >=20
> > > Well, I use busybox because I'm lazy and still get away with only 300=
Kb.
> > > And as I said there is plenty space on my device. (6M per uImage OEM
> > > firmware configuration) =20
> >=20
> > So, problem solved. Use an initramfs. :-) =20
>=20
> I agree this might be acceptable for some, but certainly not all
> cases. Unlike to your previous statement, I'm not generally opposed
> to having an initramfs included in the kernel as that can also provide
> other nice features such as recovery/failsafe methods.
> We've had this discussion before and my goal is, as I explained, to
> make the kernel as reusable as possible and even allow people to use
> OpenWrt/LEDE's kernel binary with other distributions. I'm sure
> this is also possible when using an initramfs, however, I still fail to
> see the necessity for that on simple devices.
> Imho, using an initramfs shouldn't be mandatory which is why there are
> patches (now down to about 80 LoC, resulting in probably less than 1kB
> in added binary size) to mount the rootfs without the need of an
> initramfs, simply because I do not consider that to be a
> "complex setup" if there is no less complex and yet generic way
> imaginable to boot on that platform at all.
> Hence I'm not buying the argument that ubiX_Y and ubiblockX_Y are two
> different devices and thus, this is a device selection problem and thus
> initramfs is the recommended way -- in fact, all other filesystems
> which do *not* build upon a block device provide some probing hacks in
> early userspace. Take MTD as an example: mtdblock devices are
> automagically provided and needed for block-based filesystems, no need
> for initramfs or kernel parameters to achieve that. For UBI, ubiblock
> (or gluebi...) is required to use UBI for anything else than UBIFS.
> Anyway, I'm afraid you have made your decission and additional
> arguments have no influence what-so-ever.

Except you're making a big mistake here: UBI is not a FS, it's an
intermediate layer which only purpose is to take care of wear-leveling
(and other nasty stuff that have to be handled on unreliable devices
such as NANDs). UBIFS is the de-facto FS used on top of UBIFS right
now, but it will not necessarily be the case in the future. Other FS
that are usually used on top of UBI are all the RO block filesystems
(like squashfs), and this can only work thanks to the ubiblock (and
before it exists, gluebi) layer, which is emulating a block device on
top of a UBI volume.

ITOH, JFFS2 is a FS, and as such can directly register itself to the VFS
layer, and be called by do_mount().

Now, the ubi volume vs ubiblock device difference is real, and even if
you're not buying the argument, there's nothing much we can do, because
UBI volumes are not (and will never) directly expose a bdev interface.

So now, let's suppose we provide a way to automagically bind all RO UBI
volumes to ubiblock, so that ubiblock devices are automatically
populated. It wouldn't solve your problem: 'how to ask the kernel to try
booting from ubiX_Y and fallback to ubiblockX_Y?'. Because those devices
are really not the same (the latter can be manipulated using standard
blockdev I/O requests, while the former needs to be accessed through
the in kernel UBI API (see include/linux/mtd/ubi.h)).

The last option would be to provide a hack in UBIFS to be able to turn
a block device rootfs name (ubiblockX_Y) into a ubi one (ubiX_Y).
Definitely doable, but why is this hack more legitimate than the
previous ones.

You have to accept this fact, a UBI volume is one thing, a UBIBLOCK
device is a different thing, and Linux does not allow you to pass
several devices to your root=3D argument (see this attempt to add rootfs
recovery mechanism [1]). So, either you know in advanced where your
rootfs is hosted, or you have to used advanced mechanisms to do the
'trial-and-error' probing.

>=20
> >=20
> > </discussion>, =20
>=20
> If that's the whole answer ("Use initramfs. End of story."), that's
> pretty disappointing. Dispite your previous invitation to discuss the
> matter and collaborate to address the needs of all parties involved,
> you are now offering only one option which is not agreeable by all
> parties (which is the obvious reason for those nasty patches to exist
> in first place). Carrying a few patches in our local overlay doesn't
> truly hurt in a technical sense, however, it'd be nicer to discuss how
> those features could be brought upstream or mitigate our local patches
> in other ways.
> In the case of not finding room for a debate and your answer is a
> straight "we don't want this feature upstream" this is never the less
> a good reference to remember when touching those patches in future:
> falls into "we tried, they didn't want it" and thus we'll keep carrying
> them around, at least as long as there are platforms needing them.

That's clearly not what's happening here. Richard proposed several
solutions, but you decided that they were not appropriate without
giving enough convincing arguments to make us change our mind.

That's how things work: if you come with a real use case that can't be
solved using command-line tweaking or initramfs Richard may reconsider
adding a hack to the UBI/UBIFS layer to do what you need to do. Until
then, it's a status quo.

Regards,

Boris

[1]https://lkml.org/lkml/2016/8/16/77
