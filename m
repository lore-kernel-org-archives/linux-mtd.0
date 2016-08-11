Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bXp1D-0003Bx-Rh
 for linux-mtd@lists.infradead.org; Thu, 11 Aug 2016 12:23:30 +0000
Subject: Re: [LEDE-DEV] Older u-boot mangles UBI from ubinize 1.5.2
To: Daniel Golle <daniel@makrotopia.org>, J Mo <jmomo@jmomo.net>
References: <3e1a26f3-5539-01c5-0755-aea07c95d08a@jmomo.net>
 <CAFLxGvyfLdS3cBqoicS02NymT+BAq8B3tKsFzte7Am_4AW0qQA@mail.gmail.com>
 <20160811104049.GB1644@makrotopia.org>
 <477c00a0-fcdb-b302-d81f-42a58f401b29@jmomo.net>
 <20160811114904.GC1644@makrotopia.org>
Cc: lede-dev@lists.infradead.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "u-boot@lists.denx.de >> u-boot" <u-boot@lists.denx.de>
From: Richard Weinberger <richard@nod.at>
Message-ID: <57AC6E22.8010900@nod.at>
Date: Thu, 11 Aug 2016 14:22:58 +0200
MIME-Version: 1.0
In-Reply-To: <20160811114904.GC1644@makrotopia.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 11.08.2016 um 13:49 schrieb Daniel Golle:
> Hi!
> 
> On Thu, Aug 11, 2016 at 04:28:47AM -0700, J Mo wrote:
>>
>> I got that good old feeling... like I just jumped onto a bag of flaming poo.
>> Ha ha
>>
>>
>>
>> On 08/11/2016 03:40 AM, Daniel Golle wrote:
>>>
>>> Understandable. However, we also need to experiment and figure out the
>>> mess left behind by $vendor which often doesn't leave a lot of
>>> reasonable options for 3rd-party firmware to be installed.
>>> With regard to that specific hack, I never truly understood why it was
>>> needed in first place -- I'm not using it on any UBI-enabled device and
>>> believe it's some kind of work-around to allow ubinized images to be
>>> written via nandwrite, initially in order to support the vendor/stock
>>> sysupgrade-format of a specific device (NETGEAR WNDR4300). Please
>>> correct me or add the missing bits needed to understand the use-case.
>>> It was added to OpenWrt long ago in r38681...r38683 and by now needed
>>> to be fixed several times in r42940, r43287, r44658, r44801 and r44881.
>>> Later on it was re-used by a bunch of other devices, e.g.
>>> bcm4708-netgear-r6250, bcm4708-netgear-r6300-v2,
>>> bcm4708-buffalo-wzr-1750dhp, bcm47081-buffalo-wzr-600dhp2 and probably
>>> some more.
>>>
>>> Gabor and Rafal should know more about it and why exactly this is
>>> needed and supposedly cannot be solved without this hack.
>>>
>>
>> I'm also confused about WTF that patch does. If it was device-specific to
>> comply with OEM-hackery, why apply it generally?
> 
> I reckon because it's generic in the sense that it's used by more than
> one target (ar71xx, bcm47xx) and we don't do any device/board specific
> patching at all.
> 
>>
>> Hm, I just found another example. I don't know why this didn't turn up in my
>> searches yesterday since it's a perfect match with the EXACT error. This too
>> was on a QSDK AP148:
>>
>> https://patchwork.ozlabs.org/patch/509468/
>>
>> I think I'll go rip that patch out here in a bit, recompile my image, and
>> see what happens.
> 
> In the end, this will at least give you some consistency in terms
> of U-Boot's and the Kernel's UBI implementation. Ie. either both work
> or both fail (e.g. to attach a not entirely erased/formatted UBI device
> with left-overs from previous uses of the stock fw).
> In case you are flashing the firmware using ubiformat, this shouldn't
> be a problem anyway.
> 
>>
>>
>>
>>> [...]
>> Thanks for the insight.
>>
>> The idea was to have a UBI with three volumes: kernel, rootfs(squashfs), and
>> the rootfs_data overlay(ubifs).
>>
>> One of my problems is that someone thought it was a great idea to name the
>> SMEM NAND UBI partition "rootfs". There's a patch out there which is
>> supposed to fix that, (rename to "ubi") but it's apparently not working for
>> me. The auto rootfs selection method might be trying to use the smem/mtd
>> parition named "rootfs" instead of the UBI volume named "rootfs"?
> 
> No, these are two different things and it shouldn't matter. However, in
> order to have your UBI device auto-attached without any cmdline
> parameters it needs to be named 'ubi', so simply changing the name of
> the MTD partition in the device-tree should do the trick.
> 
>>
>> And yes, my DTS has:
>> bootargs = "console=ttyMSM0,115200n8 ubi.mtd=11 root=ubi0:rootfs
>> rootfstype=squashfs";
>>
>> Is that not valid? Looks right to me.
> 
> squashfs doesn't work on UBI character devices but rather likes block
> devices only, just like most filesystems.
> Thus, rootfs detection works automagically in OpenWrt/LEDE, just having
> a ubi volume named 'rootfs' should do the trick and automatically
> decide whether the volume is UBIFS and thus would be mounted similar to
> what you tried to do now -- or to create a ubiblock-device and select
> that to be mounted as rootfs. In any case, you shouldn't need any
> kernel command-line parameters for that, so simply drop everything past
> 'console=ttyMSM0,115200n8' (and btw, this can also be done nicer by
> setting stdout-path rather than hacking the cmdline).
> 
> 
>>
>>
>>
>>
>>> Right. Depending on whether U-Boot's UBI support or the kernel itself
>>> first touches the freshly-written UBI device things go wrong, becase
>>> only the hacked-up OpenWrt/LEDE kernel does the right magic on
>>> firstboot...
>>>
>>
>>
>> The kernel is in the UBI, so u-boot is going to attach it. I can't get
>> around that without doing major reconstructive surgery to how this thing was
>> designed to boot.
>>
>> The number of OpenWRT/LEDE devices that have KERNEL_IN_UBI set are tiny. I
>> think I only saw one or two others, and they were obscure or dev boards.
>> This is likely why the issue hasn't come up before, and it could have been a
>> problem for awhile and nobody noticed.
> 
> I do the excact same for all boards on the oxnas target and it works
> great. I even store U-Boot's environment inside UBI volumes.
> I reckon it really depends on how you flash the device in first place,
> ie. using raw nand-write (which may need the before mentioned hack to
> erase the remaining free-space) or using ubiformat (which shouldn't
> need that).
> 
>>
>>
>>
>> I don't know who's to blame. That's why I started this three-way cross
>> posting clusterfark.  =)
> 
> Not too bad, at least we get to discuss some forgotten uglyness now
> before it starts to affect more people...
> 
>>
>> I'm most tempted to blame the kernel rather than u-boot. After all, I can
>> change the kernel, and the old kernel worked fine.
>>
> 
> I reckon it's somewhere between the way the image was generated and
> written to the flash and then didn't get the right treatment on
> first-boot because U-Boot tried to access it before it got fixed-up.
> Again, if you just use ubiformat to write the image, you won't need
> any EOF-markers or other hacks (ie. thus you also shouldn't include
> them in the ubinized image!)

Did you intentional drop linux-mtd from the CC's after I offered you
to discuss your patches on linux-mtd? ;-)

Thanks
//richard
