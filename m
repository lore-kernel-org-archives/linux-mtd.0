Date: Thu, 11 Aug 2016 12:40:49 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: J Mo <jmomo@jmomo.net>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 lede-dev@lists.infradead.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Gabor Juhos <juhosg@openwrt.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 John Crispin <john@phrozen.org>, openwrt-devel@lists.openwrt.org
Subject: Re: [LEDE-DEV] Older u-boot mangles UBI from ubinize 1.5.2
Message-ID: <20160811104049.GB1644@makrotopia.org>
References: <3e1a26f3-5539-01c5-0755-aea07c95d08a@jmomo.net>
 <CAFLxGvyfLdS3cBqoicS02NymT+BAq8B3tKsFzte7Am_4AW0qQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLxGvyfLdS3cBqoicS02NymT+BAq8B3tKsFzte7Am_4AW0qQA@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Thu, Aug 11, 2016 at 11:51:10AM +0200, Richard Weinberger wrote:
> Hi!
> 
> On Thu, Aug 11, 2016 at 4:26 AM, J Mo <jmomo@jmomo.net> wrote:
> > I tried re-flashing my UBI and tftpbooting my kernel before u-boot could
> > ever get a chance to mangle it, and now I get much further, though I'm still
> > not able to mount my rootfs for unknown reasons:
> >
> >     [    3.772502] ubi0: attaching mtd11
> >     [    3.826477] UBI: EOF marker found, PEBs from 40 will be erased
> 
> WTF is this?
> Reading the corresponding patch makes me very sad.

Understandable. However, we also need to experiment and figure out the
mess left behind by $vendor which often doesn't leave a lot of
reasonable options for 3rd-party firmware to be installed.
With regard to that specific hack, I never truly understood why it was
needed in first place -- I'm not using it on any UBI-enabled device and
believe it's some kind of work-around to allow ubinized images to be
written via nandwrite, initially in order to support the vendor/stock
sysupgrade-format of a specific device (NETGEAR WNDR4300). Please
correct me or add the missing bits needed to understand the use-case.
It was added to OpenWrt long ago in r38681...r38683 and by now needed
to be fixed several times in r42940, r43287, r44658, r44801 and r44881.
Later on it was re-used by a bunch of other devices, e.g.
bcm4708-netgear-r6250, bcm4708-netgear-r6300-v2,
bcm4708-buffalo-wzr-1750dhp, bcm47081-buffalo-wzr-600dhp2 and probably
some more.

Gabor and Rafal should know more about it and why exactly this is
needed and supposedly cannot be solved without this hack.


> 
> >     [    3.826638] ubi0: scanning is finished
> >     [    3.872936] ubi0: volume 2 ("rootfs_data") re-sized from 9 to 430
> > LEBs
> >     [    3.873734] ubi0: attached mtd11 (name "rootfs", size 64 MiB)
> >     [    3.878347] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976
> > bytes
> >     [    3.884234] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size
> > 2048
> >     [    3.890936] ubi0: VID header offset: 2048 (aligned 2048), data
> > offset: 4096
> >     [    3.897849] ubi0: good PEBs: 512, bad PEBs: 0, corrupted PEBs: 0
> >     [    3.904627] ubi0: user volume: 3, internal volumes: 1, max. volumes
> > count: 128
> >     [    3.910815] ubi0: max/mean erase counter: 1/0, WL threshold: 4096,
> > image sequence number: 2142265782
> >     [    3.917902] ubi0: available PEBs: 0, total reserved PEBs: 512, PEBs
> > reserved for bad PEB handling: 40
> >     [    3.927275] ubi0: background thread "ubi_bgt0d" started, PID 54
> >     [    3.937007] block ubiblock0_1: created from ubi0:1(rootfs)

This line hints that the rootfs is non-UBIFS and thus a ubiblock device
has been created.

> >     [    3.942096] hctosys: unable to open rtc device (rtc0)
> >     [    3.956528] VFS: Cannot open root device "ubi0:rootfs" or
> > unknown-block(31,11): error -2

That lack of a line like
[    3.937296] ubiblock: device ubiblock0_3 (rootfs) set to be root filesystem
indicates that ROOT_DEV is already set, e.g. via the kernel's cmdline
using the "rootfs=ubi0:rootfs" parameter. As the rootfs isn't UBIFS,
this won't work. Check your bootloader's environment or any other
sources for kernel cmdline fragments (various OpenWrt/LEDE specific
hacks but also the device-tree for things like
chosen { bootargs = "..." }
which try to hard-code the rootfs to ubi0:rootfs.


> >     [    3.956556] Please append a correct "root=" boot option; here are the
> > available partitions:


> >
> >
> >
> > Any advice on this? Any background information that I can read up on? My
> > google searches have not come up with much. Ram knew about this, but I don't
> > know if it's otherwise a known issue.

Right. Depending on whether U-Boot's UBI support or the kernel itself
first touches the freshly-written UBI device things go wrong, becase
only the hacked-up OpenWrt/LEDE kernel does the right magic on
firstboot...


Cheers


Daniel

> >
> > The process works fine on the OEM system, so I assume this is some ubinize
> > format change which is incompatible with the older u-boot. Or, the newer
> > kernel code doesn't know how to deal with the UBI once the older u-boot has
> > mangled/attached it.
> >
> > Seems like a backwards incompatibility issue.
> 
> Since OpenWRT/LEDE folks did more or less a hard fork of UBI I'm
> ignoring this issue.
> If you encounter something like that using vanilla UBI I'm all ears.
> 
> That said, I kind of understand that you, OpenWRT/LEDE, have a pile of
> patches for auto probing rootfs
> and other runtime stuff but touching the UBI on-flash format is beyond funny.
> Doing so opens a can of worms and is painful for all parties. There
> are customers which build their
> products using OpenWrt and when they change the kernel at some point
> it will get nasty.
> 
> This situation needs to be improved now. I invite you to discuss this
> changes here on linux-mtd.
> Especially the stuff where you change the on-flash format.
> If UBI, or MTD in general, can do a better job in some areas, please
> tell such that a decent solution can be found.
> But your ad-hoc hacks need to stop.



> 
> -- 
> Thanks,
> //richard
> 
> _______________________________________________
> Lede-dev mailing list
> Lede-dev@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/lede-dev
