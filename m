Date: Thu, 11 Aug 2016 14:31:27 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: J Mo <jmomo@jmomo.net>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 rjangi@codeaurora.org, Gabor Juhos <juhosg@openwrt.org>,
 lede-dev@lists.infradead.org,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 John Crispin <john@phrozen.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 openwrt-devel@lists.openwrt.org
Subject: Re: [LEDE-DEV] Older u-boot mangles UBI from ubinize 1.5.2
Message-ID: <20160811123126.GE1644@makrotopia.org>
References: <3e1a26f3-5539-01c5-0755-aea07c95d08a@jmomo.net>
 <CAFLxGvyfLdS3cBqoicS02NymT+BAq8B3tKsFzte7Am_4AW0qQA@mail.gmail.com>
 <20160811104049.GB1644@makrotopia.org>
 <477c00a0-fcdb-b302-d81f-42a58f401b29@jmomo.net>
 <6797ac7a-5eda-2844-e538-163a8e2e665f@jmomo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6797ac7a-5eda-2844-e538-163a8e2e665f@jmomo.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, Aug 11, 2016 at 05:18:08AM -0700, J Mo wrote:
> 
> 
> On 08/11/2016 04:28 AM, J Mo wrote:
> > 
> > Hm, I just found another example. I don't know why this didn't turn up
> > in my searches yesterday since it's a perfect match with the EXACT
> > error. This too was on a QSDK AP148:
> > 
> > https://patchwork.ozlabs.org/patch/509468/
> > 
> > I think I'll go rip that patch out here in a bit, recompile my image,
> > and see what happens.
> 
> 
> Yep, I just ripped out that patch, rebuilt, and the UBI is working
> correctly-ish now:
> 
> [    3.781400] ubi0: attaching mtd11
> [    4.475744] ubi0: scanning is finished
> [    4.490924] ubi0 warning: print_rsvd_warning: cannot reserve enough PEBs
> for bad PEB handling, reserved 5, need 40
> [    4.492040] ubi0: attached mtd11 (name "rootfs", size 64 MiB)
> [    4.500155] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976
> bytes
> [    4.506033] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
> [    4.512808] ubi0: VID header offset: 2048 (aligned 2048), data offset:
> 4096
> [    4.519603] ubi0: good PEBs: 512, bad PEBs: 0, corrupted PEBs: 0
> [    4.526430] ubi0: user volume: 3, internal volumes: 1, max. volumes
> count: 128
> [    4.532680] ubi0: max/mean erase counter: 1/0, WL threshold: 4096, image
> sequence number: 1454555262
> [    4.539660] ubi0: available PEBs: 0, total reserved PEBs: 512, PEBs
> reserved for bad PEB handling: 5
> [    4.549141] ubi0: background thread "ubi_bgt0d" started, PID 54
> [    4.558711] block ubiblock0_1: created from ubi0:1(rootfs)
> [    4.563771] hctosys: unable to open rtc device (rtc0)
> [    4.576690] VFS: Cannot open root device "ubi0:rootfs" or
> unknown-block(31,11): error -2
> [    4.576718] Please append a correct "root=" boot option; here are the
> available partitions:
> [    4.583956] 1f00             256 mtdblock0  (driver?)
> [    4.596076] 1f01            1280 mtdblock1  (driver?)
> [    4.601109] 1f02            1280 mtdblock2  (driver?)
> [    4.606144] 1f03            2560 mtdblock3  (driver?)
> [    4.611178] 1f04            1152 mtdblock4  (driver?)
> [    4.616214] 1f05            1152 mtdblock5  (driver?)
> [    4.621249] 1f06            2560 mtdblock6  (driver?)
> [    4.626283] 1f07            2560 mtdblock7  (driver?)
> [    4.631319] 1f08            5120 mtdblock8  (driver?)
> [    4.636352] 1f09             512 mtdblock9  (driver?)
> [    4.641387] 1f0a             512 mtdblock10  (driver?)
> [    4.646423] 1f0b           65536 mtdblock11  (driver?)
> [    4.651544] 1f0c             384 mtdblock12  (driver?)
> [    4.656666] 1f0d            5120 mtdblock13  (driver?)
> [    4.661786] 1f0e           65536 mtdblock14  (driver?)
> [    4.666909] fe00            2728 ubiblock0_1  (driver?)
> [    4.672103] Kernel panic - not syncing: VFS: Unable to mount root fs on
> unknown-block(31,11)
> 
> 
> My squashfs root isn't mounting but that's another patch/issue.

That's what I told you in the previous mail, removing the rootfs=
parameter from the dts should do the trick, because you just cannot
mount a ubi device (which is a character device in Linux) with a
block-based filesystem (like squashfs). This cannot and won't ever
work and you could either leave it to OpenWrt/LEDE's auto-probing to
figure out what to do based on the rootfs type (non-ubifs vs. ubifs)
or append even more board- and filesystem-specific crap to your cmdline
such as ubiblock=... root=/dev/ubiblock0_1 (however, that then won't
work for ubifs, thus the auto-probing patches).

> 
> So that 494-mtd-ubi-add-EOF-marker-support.patch has gotta go or get fixed.

I agree, however, once again, it depends on how you write the ubinized
image to the flash in first place.

> It's almost certainly been fking stuff up for a long time and just nobody
> noticed before now because almost nobody has a kernel in their UBI. It

Not true. As I said, I'm using KERNEL_IN_UBI on all oxnas based targets
and also got U-Boot 2014.10 with UBI support touching the flash before
the kernel would fixup anything. Have a look at
target/linux/oxnas/image/Makefile for a 100% working example.

> wasn't in OpenWRT AA/12.09, so it wasn't in the QSDK which my device is
> based on.


Please read my previous email (I hope you actually received it?) for
more details.



Cheers


Daniel

> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
