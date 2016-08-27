Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bdn76-00071h-AB
 for linux-mtd@lists.infradead.org; Sat, 27 Aug 2016 23:34:13 +0000
Subject: Re: [PATCH/RFC 0/3] UBI: unify mouting rootfs based on cmdline
 parameter
To: Daniel Golle <daniel@makrotopia.org>
References: <20160827194326.GA1817@makrotopia.org>
 <208b9297-9790-2b2f-6013-49aadb6970cf@nod.at>
 <20160827210656.GB1734@makrotopia.org>
 <09121b9d-9902-ae12-4aaa-8f9e170909ee@nod.at>
 <20160827231328.GC1734@makrotopia.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 openwrt-devel@lists.openwrt.org, Hauke Mehrtens <hauke@hauke-m.de>,
 lede-dev@lists.infradead.org, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Zoltan HERPAI <wigyori@uid0.hu>,
 Ralph Sennhauser <ralph.sennhauser@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <4ce986f2-1a7c-c46e-f104-7282585dbe49@nod.at>
Date: Sun, 28 Aug 2016 01:33:28 +0200
MIME-Version: 1.0
In-Reply-To: <20160827231328.GC1734@makrotopia.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Daniel,

On 28.08.2016 01:13, Daniel Golle wrote:
>> Since you have to provide anyways per-device images because the flash
>> type/geometric of each device are different it wouldn't hurt having
>> a per device cmdline too, right?
> 
> Right, but on the same device using the same kernel you might have
> ubifs or squashfs as rootfs when using OpenWrt/LEDE and the like.
> Why should the bootloader (or even the device-tree) contain any
> knowledge about that?

At some point you have to tell the kernel from where it has to obtain
the rootfs from.
Yes, for basic stuff we have auto probing but on a decent system you
always have to specify exactly what the rootfs is.

>> No, this works only for trivial storage stacks on x86 when booting from a
>> disk.
>> For squashfs you need an initramfs anyways on most setups
>> since squashfs is stored as regular file.
> 
> I've never seen that (squashfs loaded from a filesystem which was
> mounted by what's running on the initramfs) on any small embedded
> device in my life. *That's* a very complex setup.

It all depends on the use case.

> Most commonly, squashfs is mounted by the kernel from /dev/mtdblock*.
> In the past, most people who were force to use UBI then ended up using
> gluebi and then mounting squashfs off the gluebi mtdblock device -- I
> understood that ubiblock is intended to replace those legacy hacks and
> meant to be the official way to mount non-UBIFS read-only filesystems
> store on UBI volumes, right?

Yes. But not for magic autoprobing.

>>
>> For everything non-trivial, may it RAID, LVM or iSCSI, it won't work
>> automagically.
> 
> With that in mind, why should a simple system which anyway stores the
> kernel and filesystem on the same physical media have an initramfs?

You seem to hate initramfs, that's your problem, not mine :-)
But you don't depend on initramfs. It is just one more option to
solve your issue.

>>> Do you really explect that the bootloader should probe the rootfs-type
>>> and based on that, re-write the cmdline parameters?
>>
>> No, the bootloader should *know* on what device it runs on and has to set
>> the cmdline correctly. Exactly as we do on every embedded system for ever.
>> I don't think OpenWrt/LEDE is so special.
> 
> I certainly agree about that. However, depending on the use-case and
> stage of development (!), one might choose to use UBIFS as read-write
> rootfs or to use squashfs and have a overlay on-top. Thus, the rootfs-
> type used on the exact same device may vary, also during the device's
> lifecycle.
> Using UBIFS as rootfs allows granular rolling-release-style updates
> and makes prototyping easy. On more robust production firmware, a
> read-only image with either a read-write overlay or just some plain
> configuration allows easily reverting to the factory-defaults and
> updating the whole system with a replacement image.

I'll not accept such patches for the sake of supporting lazy development
style. Fix your buildsystem to produce the correct image for your target
device and the correct mode.
Development and production images are a common thing in embedded
world.

> All that being said, I agree that none of the other patches are truely
> needed. However, if the cmdline cannot be rootfstype-agnostic, I'll
> have to work my way around that. I'll happily work on making that
> possible and improve things where needed. I'm still hoping for
> constructive criticism on how a generic and thus also rootfstype-
> agnostic kernel can truly be achieved *without* using an initramfs on
> simple devices.

For your use case you are not forced to have an initramfs.
All you need is setting cmdline correctly. Either via DT, bootloader
or kernel .config.

So, yes, your patches are not needed at all.
They may support your current style of development but it does not
justify a kernel change.

Thanks,
//richard
