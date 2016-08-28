Date: Sun, 28 Aug 2016 09:10:17 +0200
From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Daniel Golle <daniel@makrotopia.org>, linux-mtd@lists.infradead.org,
 Zoltan HERPAI <wigyori@uid0.hu>, Hauke Mehrtens <hauke@hauke-m.de>,
 lede-dev@lists.infradead.org, openwrt-devel@lists.openwrt.org, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH/RFC 0/3] UBI: unify mouting rootfs based on cmdline
 parameter
Message-ID: <20160828091017.06fc2312@gmail.com>
In-Reply-To: <208b9297-9790-2b2f-6013-49aadb6970cf@nod.at>
References: <20160827194326.GA1817@makrotopia.org>
 <208b9297-9790-2b2f-6013-49aadb6970cf@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Sat, 27 Aug 2016 22:43:45 +0200
Richard Weinberger <richard@nod.at> wrote:

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
> > for squashfs: ubi.mtd=ubi ubiblock=0,1 root=/dev/ubiblock0_1
> > rootfstype=squashfs
> > 
> > The idea behind this patchset is to provide a single syntax which
> > allows mouting rootfs in both cases. To achieve that, the parsing of
> > the volume name string from UBIFS is moved to UBI, so it can be
> > reused by other in-kernel users. This is then used by
> > init/do_mounts.c to create a ubiblock device if the filesystem on
> > the device is non-UBIFS. To actually set this device to be
> > ROOT_DEV, ubiblock_create is extended to allow passing-back the
> > created ubiblock device.
> > 
> > With those changes, a single set of cmdline parameters is
> > sufficient to mount either UBIFS or any other block filesystem
> > by creating a ubiblock device:
> > ubi.mtd=ubi root=ubi0:rootfs rootfstype=ubifs,squashfs  
> 
> well, this all boils down to the point we have already been.
> I will tell you do set the cmdline correctly, either via bootloader
> or devicetree, or use an initramfs.
> 
> I can understand that OpenWrt/LEDE sometimes has to start from a
> hostile bootloader which doesn't let you changing the cmdline.
> But you can still set (and override) it either using CONFIG_CMDLINE or
> in your device tree.
> For advanced booting you can also use a inittamfs.
> 
> So, what do I miss?
> 
> Thanks,
> //richard

Using CONFIG_CMDLINE or the dtb isn't an option either for dual firmware
devices. You'd have to provide two images, one for each partition so
the rootfs belonging to the kernel gets mounted. Sounds like a recipe
for disaster.

On the other hand an initramfs can carry the logic to figure out which
to mount and is what I use for my self. The busybox based implementation
I use adds a tad over 300Kb to the uImage, perfectly acceptable in my
case.

Cheers
Ralph
