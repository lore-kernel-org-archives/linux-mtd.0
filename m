Date: Sun, 28 Aug 2016 01:13:28 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Richard Weinberger <richard@nod.at>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 openwrt-devel@lists.openwrt.org, Hauke Mehrtens <hauke@hauke-m.de>,
 lede-dev@lists.infradead.org, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Zoltan HERPAI <wigyori@uid0.hu>,
 Ralph Sennhauser <ralph.sennhauser@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH/RFC 0/3] UBI: unify mouting rootfs based on cmdline
 parameter
Message-ID: <20160827231328.GC1734@makrotopia.org>
References: <20160827194326.GA1817@makrotopia.org>
 <208b9297-9790-2b2f-6013-49aadb6970cf@nod.at>
 <20160827210656.GB1734@makrotopia.org>
 <09121b9d-9902-ae12-4aaa-8f9e170909ee@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09121b9d-9902-ae12-4aaa-8f9e170909ee@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Sat, Aug 27, 2016 at 11:23:14PM +0200, Richard Weinberger wrote:
> Daniel,
> 
> On 27.08.2016 23:06, Daniel Golle wrote:
> > Hi Richard,
> > 
> > thanks for the quick reply!
> > 
> > On Sat, Aug 27, 2016 at 10:43:45PM +0200, Richard Weinberger wrote:
> >> Daniel,
> >>
> >> On 27.08.2016 21:43, Daniel Golle wrote:
> >>> Hi!
> >>>
> >>> In an attempts to fix the flaws of the current set of UBI-related
> >>> patches we are carrying in OpenWrt, I re-wrote the way mounting the
> >>> rootfs from UBI in OpenWrt/LEDE works. The main requirement I face
> >>> which cannot be easily addressed using other means which are already
> >>> available in the kernel is the fact that UBIFS and squashfs-on-UBI
> >>> require different parameters to be set on the cmdline, e.g.
> >>> for UBIFS: ubi.mtd=ubi root=ubi0:rootfs rootfstype=ubifs
> >>> for squashfs: ubi.mtd=ubi ubiblock=0,1 root=/dev/ubiblock0_1 rootfstype=squashfs
> >>>
> >>> The idea behind this patchset is to provide a single syntax which
> >>> allows mouting rootfs in both cases. To achieve that, the parsing of
> >>> the volume name string from UBIFS is moved to UBI, so it can be
> >>> reused by other in-kernel users. This is then used by init/do_mounts.c
> >>> to create a ubiblock device if the filesystem on the device is
> >>> non-UBIFS. To actually set this device to be ROOT_DEV, ubiblock_create
> >>> is extended to allow passing-back the created ubiblock device.
> >>>
> >>> With those changes, a single set of cmdline parameters is
> >>> sufficient to mount either UBIFS or any other block filesystem
> >>> by creating a ubiblock device:
> >>> ubi.mtd=ubi root=ubi0:rootfs rootfstype=ubifs,squashfs
> >>
> >> well, this all boils down to the point we have already been.
> >> I will tell you do set the cmdline correctly, either via bootloader
> >> or devicetree, or use an initramfs.
> > 
> > I got that points and this patchset is meant to made exactly that
> > possible -- using the kernel cmdline to specify the rootfs.
> > However, usually the filesystem type doesn't need to be explicitely
> > taken into account by the bootloader.
> > 
> >>
> >> I can understand that OpenWrt/LEDE sometimes has to start from a hostile
> >> bootloader which doesn't let you changing the cmdline.
> > 
> > On most systems, *users* do not have bootloader access. Surely, our
> > build-system could generate images with different built-in cmdlines
> > depending on the bundled filesystem types.
> 
> Since you have to provide anyways per-device images because the flash
> type/geometric of each device are different it wouldn't hurt having
> a per device cmdline too, right?

Right, but on the same device using the same kernel you might have
ubifs or squashfs as rootfs when using OpenWrt/LEDE and the like.
Why should the bootloader (or even the device-tree) contain any
knowledge about that?
I reckon we are both aware that re-installing or modifying the
bootloader is far less common on non-x86 targets and is usually avoided
to minimize risks and added complexity to OS installers.

> 
> >> But you can still set (and override) it either using CONFIG_CMDLINE or
> >> in your device tree.
> >> For advanced booting you can also use a inittamfs.
> >>
> >> So, what do I miss?
> > 
> > On block devices, GRUB doesn't need to set any parameters differently
> > depending on the rootfstype being squashfs, xfs or ext4, right?
> 
> No, this works only for trivial storage stacks on x86 when booting from a
> disk.
> For squashfs you need an initramfs anyways on most setups
> since squashfs is stored as regular file.

I've never seen that (squashfs loaded from a filesystem which was
mounted by what's running on the initramfs) on any small embedded
device in my life. *That's* a very complex setup.
Most commonly, squashfs is mounted by the kernel from /dev/mtdblock*.
In the past, most people who were force to use UBI then ended up using
gluebi and then mounting squashfs off the gluebi mtdblock device -- I
understood that ubiblock is intended to replace those legacy hacks and
meant to be the official way to mount non-UBIFS read-only filesystems
store on UBI volumes, right?

> 
> For everything non-trivial, may it RAID, LVM or iSCSI, it won't work
> automagically.

With that in mind, why should a simple system which anyway stores the
kernel and filesystem on the same physical media have an initramfs?

> 
> > On UBI, this assumption no longer holds true, which imho is the
> > remaining core of the problem, which I meant to illustrate using the
> > example in the previous message I've sent.
> 
> Having squashfs on top of ubiblock which is ont op of UBI is something
> non-trivial IMHO.

Ok, so that seems to be the essence of our disagreement. From my
perspective, this setup seems to be the most trivial possible on small
embeeded devices which come with NAND flash and thus do benefit from
using UBI.

> 
> > Do you really explect that the bootloader should probe the rootfs-type
> > and based on that, re-write the cmdline parameters?
> 
> No, the bootloader should *know* on what device it runs on and has to set
> the cmdline correctly. Exactly as we do on every embedded system for ever.
> I don't think OpenWrt/LEDE is so special.

I certainly agree about that. However, depending on the use-case and
stage of development (!), one might choose to use UBIFS as read-write
rootfs or to use squashfs and have a overlay on-top. Thus, the rootfs-
type used on the exact same device may vary, also during the device's
lifecycle.
Using UBIFS as rootfs allows granular rolling-release-style updates
and makes prototyping easy. On more robust production firmware, a
read-only image with either a read-write overlay or just some plain
configuration allows easily reverting to the factory-defaults and
updating the whole system with a replacement image.

> 
> > Just having "ubi.mtd=ubi root=ubi0:rootfs rootfstype=squashfs,ubifs"
> > looks nicer than that, doesn't it?
> 
> I don't agree. Adding more auto probe hacks to the kernel for the sake
> of looking nice are not worth it.

The value I advertise is functional, not just esthetical.
By the end of the day, probing the rootfs-type will to live somewhere.
I agree that for complex setups, an initramfs should be used. However,
an easy an generic way to boot also without mandatory initramfs should
still be possible, even on boards having NAND flash.
In the current (whacky) way we roll UBI support in the kernel, it also
allows the same binary kernel to be used for other distributions (eg.
Debian or archlinux with an UBIFS rootfs on hardware not officially
supported by those distributions)
This added value of having a universal kernel would be lost if high-
level decissions such as the filesystem type would be dictated by
either built-in kernel parameters, the device-tree or the bootloader.
My intention is to preserve that feature in a way which still shouldn't
hard-code the rootfs volume name (which it does, forcing more complex
bootloader setups to come up with a great variety of vendor-specific
implementations).

> Since you have to have *at least* a per device device tree it is perfectly
> fine adding the correct rootfs cmdline to it.
> You also have to specify per device in your device tree the correct MTD
> layout for each device.

Same argument as above: this doesn't imply that the filesystem type
used as a rootfs is the same for all use-cases (and even more so, all
other distributions to run on the same board, ideally without
modifications to the bootloader, it's evironment or the device-tree).

All that being said, I agree that none of the other patches are truely
needed. However, if the cmdline cannot be rootfstype-agnostic, I'll
have to work my way around that. I'll happily work on making that
possible and improve things where needed. I'm still hoping for
constructive criticism on how a generic and thus also rootfstype-
agnostic kernel can truly be achieved *without* using an initramfs on
simple devices.


Cheers


Daniel


> 
> Thanks,
> //richard
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
