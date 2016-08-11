Subject: Re: [LEDE-DEV] Older u-boot mangles UBI from ubinize 1.5.2
To: Daniel Golle <daniel@makrotopia.org>,
 Richard Weinberger <richard.weinberger@gmail.com>
References: <3e1a26f3-5539-01c5-0755-aea07c95d08a@jmomo.net>
 <CAFLxGvyfLdS3cBqoicS02NymT+BAq8B3tKsFzte7Am_4AW0qQA@mail.gmail.com>
 <20160811104049.GB1644@makrotopia.org>
Cc: Gabor Juhos <juhosg@openwrt.org>, lede-dev@lists.infradead.org,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 John Crispin <john@phrozen.org>, openwrt-devel@lists.openwrt.org
From: J Mo <jmomo@jmomo.net>
Message-ID: <477c00a0-fcdb-b302-d81f-42a58f401b29@jmomo.net>
Date: Thu, 11 Aug 2016 04:28:47 -0700
MIME-Version: 1.0
In-Reply-To: <20160811104049.GB1644@makrotopia.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I got that good old feeling... like I just jumped onto a bag of flaming 
poo.  Ha ha



On 08/11/2016 03:40 AM, Daniel Golle wrote:
>
> Understandable. However, we also need to experiment and figure out the
> mess left behind by $vendor which often doesn't leave a lot of
> reasonable options for 3rd-party firmware to be installed.
> With regard to that specific hack, I never truly understood why it was
> needed in first place -- I'm not using it on any UBI-enabled device and
> believe it's some kind of work-around to allow ubinized images to be
> written via nandwrite, initially in order to support the vendor/stock
> sysupgrade-format of a specific device (NETGEAR WNDR4300). Please
> correct me or add the missing bits needed to understand the use-case.
> It was added to OpenWrt long ago in r38681...r38683 and by now needed
> to be fixed several times in r42940, r43287, r44658, r44801 and r44881.
> Later on it was re-used by a bunch of other devices, e.g.
> bcm4708-netgear-r6250, bcm4708-netgear-r6300-v2,
> bcm4708-buffalo-wzr-1750dhp, bcm47081-buffalo-wzr-600dhp2 and probably
> some more.
>
> Gabor and Rafal should know more about it and why exactly this is
> needed and supposedly cannot be solved without this hack.
>

I'm also confused about WTF that patch does. If it was device-specific 
to comply with OEM-hackery, why apply it generally?

Hm, I just found another example. I don't know why this didn't turn up 
in my searches yesterday since it's a perfect match with the EXACT 
error. This too was on a QSDK AP148:

https://patchwork.ozlabs.org/patch/509468/

I think I'll go rip that patch out here in a bit, recompile my image, 
and see what happens.




>>>      [    3.826638] ubi0: scanning is finished
>>>      [    3.872936] ubi0: volume 2 ("rootfs_data") re-sized from 9 to 430
>>> LEBs
>>>      [    3.873734] ubi0: attached mtd11 (name "rootfs", size 64 MiB)
>>>      [    3.878347] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976
>>> bytes
>>>      [    3.884234] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size
>>> 2048
>>>      [    3.890936] ubi0: VID header offset: 2048 (aligned 2048), data
>>> offset: 4096
>>>      [    3.897849] ubi0: good PEBs: 512, bad PEBs: 0, corrupted PEBs: 0
>>>      [    3.904627] ubi0: user volume: 3, internal volumes: 1, max. volumes
>>> count: 128
>>>      [    3.910815] ubi0: max/mean erase counter: 1/0, WL threshold: 4096,
>>> image sequence number: 2142265782
>>>      [    3.917902] ubi0: available PEBs: 0, total reserved PEBs: 512, PEBs
>>> reserved for bad PEB handling: 40
>>>      [    3.927275] ubi0: background thread "ubi_bgt0d" started, PID 54
>>>      [    3.937007] block ubiblock0_1: created from ubi0:1(rootfs)
> This line hints that the rootfs is non-UBIFS and thus a ubiblock device
> has been created.
>


>>>      [    3.942096] hctosys: unable to open rtc device (rtc0)
>>>      [    3.956528] VFS: Cannot open root device "ubi0:rootfs" or
>>> unknown-block(31,11): error -2
> That lack of a line like
> [    3.937296] ubiblock: device ubiblock0_3 (rootfs) set to be root filesystem
> indicates that ROOT_DEV is already set, e.g. via the kernel's cmdline
> using the "rootfs=ubi0:rootfs" parameter. As the rootfs isn't UBIFS,
> this won't work. Check your bootloader's environment or any other
> sources for kernel cmdline fragments (various OpenWrt/LEDE specific
> hacks but also the device-tree for things like
> chosen { bootargs = "..." }
> which try to hard-code the rootfs to ubi0:rootfs.
>

Thanks for the insight.

The idea was to have a UBI with three volumes: kernel, rootfs(squashfs), 
and the rootfs_data overlay(ubifs).

One of my problems is that someone thought it was a great idea to name 
the SMEM NAND UBI partition "rootfs". There's a patch out there which is 
supposed to fix that, (rename to "ubi") but it's apparently not working 
for me. The auto rootfs selection method might be trying to use the 
smem/mtd parition named "rootfs" instead of the UBI volume named "rootfs"?

And yes, my DTS has:
bootargs = "console=ttyMSM0,115200n8 ubi.mtd=11 root=ubi0:rootfs 
rootfstype=squashfs";

Is that not valid? Looks right to me.




> Right. Depending on whether U-Boot's UBI support or the kernel itself
> first touches the freshly-written UBI device things go wrong, becase
> only the hacked-up OpenWrt/LEDE kernel does the right magic on
> firstboot...
>


The kernel is in the UBI, so u-boot is going to attach it. I can't get 
around that without doing major reconstructive surgery to how this thing 
was designed to boot.

The number of OpenWRT/LEDE devices that have KERNEL_IN_UBI set are tiny. 
I think I only saw one or two others, and they were obscure or dev 
boards. This is likely why the issue hasn't come up before, and it could 
have been a problem for awhile and nobody noticed.



I don't know who's to blame. That's why I started this three-way cross 
posting clusterfark.  =)

I'm most tempted to blame the kernel rather than u-boot. After all, I 
can change the kernel, and the old kernel worked fine.
