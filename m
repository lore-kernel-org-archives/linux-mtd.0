Date: Sat, 27 Aug 2016 23:06:57 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, lede-dev@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Zoltan HERPAI <wigyori@uid0.hu>,
 Ralph Sennhauser <ralph.sennhauser@gmail.com>,
 openwrt-devel@lists.openwrt.org
Subject: Re: [PATCH/RFC 0/3] UBI: unify mouting rootfs based on cmdline
 parameter
Message-ID: <20160827210656.GB1734@makrotopia.org>
References: <20160827194326.GA1817@makrotopia.org>
 <208b9297-9790-2b2f-6013-49aadb6970cf@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <208b9297-9790-2b2f-6013-49aadb6970cf@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

thanks for the quick reply!

On Sat, Aug 27, 2016 at 10:43:45PM +0200, Richard Weinberger wrote:
> Daniel,
> 
> On 27.08.2016 21:43, Daniel Golle wrote:
> > Hi!
> > 
> > In an attempts to fix the flaws of the current set of UBI-related
> > patches we are carrying in OpenWrt, I re-wrote the way mounting the
> > rootfs from UBI in OpenWrt/LEDE works. The main requirement I face
> > which cannot be easily addressed using other means which are already
> > available in the kernel is the fact that UBIFS and squashfs-on-UBI
> > require different parameters to be set on the cmdline, e.g.
> > for UBIFS: ubi.mtd=ubi root=ubi0:rootfs rootfstype=ubifs
> > for squashfs: ubi.mtd=ubi ubiblock=0,1 root=/dev/ubiblock0_1 rootfstype=squashfs
> > 
> > The idea behind this patchset is to provide a single syntax which
> > allows mouting rootfs in both cases. To achieve that, the parsing of
> > the volume name string from UBIFS is moved to UBI, so it can be
> > reused by other in-kernel users. This is then used by init/do_mounts.c
> > to create a ubiblock device if the filesystem on the device is
> > non-UBIFS. To actually set this device to be ROOT_DEV, ubiblock_create
> > is extended to allow passing-back the created ubiblock device.
> > 
> > With those changes, a single set of cmdline parameters is
> > sufficient to mount either UBIFS or any other block filesystem
> > by creating a ubiblock device:
> > ubi.mtd=ubi root=ubi0:rootfs rootfstype=ubifs,squashfs
> 
> well, this all boils down to the point we have already been.
> I will tell you do set the cmdline correctly, either via bootloader
> or devicetree, or use an initramfs.

I got that points and this patchset is meant to made exactly that
possible -- using the kernel cmdline to specify the rootfs.
However, usually the filesystem type doesn't need to be explicitely
taken into account by the bootloader.

> 
> I can understand that OpenWrt/LEDE sometimes has to start from a hostile
> bootloader which doesn't let you changing the cmdline.

On most systems, *users* do not have bootloader access. Surely, our
build-system could generate images with different built-in cmdlines
depending on the bundled filesystem types.

> But you can still set (and override) it either using CONFIG_CMDLINE or
> in your device tree.
> For advanced booting you can also use a inittamfs.
> 
> So, what do I miss?

On block devices, GRUB doesn't need to set any parameters differently
depending on the rootfstype being squashfs, xfs or ext4, right?
On UBI, this assumption no longer holds true, which imho is the
remaining core of the problem, which I meant to illustrate using the
example in the previous message I've sent.
Do you really explect that the bootloader should probe the rootfs-type
and based on that, re-write the cmdline parameters?
Having the option to mount other filesystems and transparently create
a ubiblock device using the same syntax as used for ubifs allows to
overcome that.
Also note the nasty details when using the current syntax which alone
should be a good reason to unify things:
ubi.mtd=ubi ubiblock=0,rootfs root=/dev/ubiblock0_1 rootfstype=squashfs
                       ^^^^^^                   ^^^
ubiblock allows creating a block device by volume name. However, in
order to specify the root= parameter, one would need to know the
vol_id of the volume previously addressed by its name.
Just having "ubi.mtd=ubi root=ubi0:rootfs rootfstype=squashfs,ubifs"
looks nicer than that, doesn't it?

> 
> Thanks,
> //richard
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
