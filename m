Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bdl4z-0006pn-Py
 for linux-mtd@lists.infradead.org; Sat, 27 Aug 2016 21:23:54 +0000
Subject: Re: [PATCH/RFC 0/3] UBI: unify mouting rootfs based on cmdline
 parameter
To: Daniel Golle <daniel@makrotopia.org>
References: <20160827194326.GA1817@makrotopia.org>
 <208b9297-9790-2b2f-6013-49aadb6970cf@nod.at>
 <20160827210656.GB1734@makrotopia.org>
Cc: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Hauke Mehrtens
 <hauke@hauke-m.de>, lede-dev@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Zoltan HERPAI <wigyori@uid0.hu>,
 Ralph Sennhauser <ralph.sennhauser@gmail.com>,
 openwrt-devel@lists.openwrt.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <09121b9d-9902-ae12-4aaa-8f9e170909ee@nod.at>
Date: Sat, 27 Aug 2016 23:23:14 +0200
MIME-Version: 1.0
In-Reply-To: <20160827210656.GB1734@makrotopia.org>
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

On 27.08.2016 23:06, Daniel Golle wrote:
> Hi Richard,
> 
> thanks for the quick reply!
> 
> On Sat, Aug 27, 2016 at 10:43:45PM +0200, Richard Weinberger wrote:
>> Daniel,
>>
>> On 27.08.2016 21:43, Daniel Golle wrote:
>>> Hi!
>>>
>>> In an attempts to fix the flaws of the current set of UBI-related
>>> patches we are carrying in OpenWrt, I re-wrote the way mounting the
>>> rootfs from UBI in OpenWrt/LEDE works. The main requirement I face
>>> which cannot be easily addressed using other means which are already
>>> available in the kernel is the fact that UBIFS and squashfs-on-UBI
>>> require different parameters to be set on the cmdline, e.g.
>>> for UBIFS: ubi.mtd=ubi root=ubi0:rootfs rootfstype=ubifs
>>> for squashfs: ubi.mtd=ubi ubiblock=0,1 root=/dev/ubiblock0_1 rootfstype=squashfs
>>>
>>> The idea behind this patchset is to provide a single syntax which
>>> allows mouting rootfs in both cases. To achieve that, the parsing of
>>> the volume name string from UBIFS is moved to UBI, so it can be
>>> reused by other in-kernel users. This is then used by init/do_mounts.c
>>> to create a ubiblock device if the filesystem on the device is
>>> non-UBIFS. To actually set this device to be ROOT_DEV, ubiblock_create
>>> is extended to allow passing-back the created ubiblock device.
>>>
>>> With those changes, a single set of cmdline parameters is
>>> sufficient to mount either UBIFS or any other block filesystem
>>> by creating a ubiblock device:
>>> ubi.mtd=ubi root=ubi0:rootfs rootfstype=ubifs,squashfs
>>
>> well, this all boils down to the point we have already been.
>> I will tell you do set the cmdline correctly, either via bootloader
>> or devicetree, or use an initramfs.
> 
> I got that points and this patchset is meant to made exactly that
> possible -- using the kernel cmdline to specify the rootfs.
> However, usually the filesystem type doesn't need to be explicitely
> taken into account by the bootloader.
> 
>>
>> I can understand that OpenWrt/LEDE sometimes has to start from a hostile
>> bootloader which doesn't let you changing the cmdline.
> 
> On most systems, *users* do not have bootloader access. Surely, our
> build-system could generate images with different built-in cmdlines
> depending on the bundled filesystem types.

Since you have to provide anyways per-device images because the flash
type/geometric of each device are different it wouldn't hurt having
a per device cmdline too, right?

>> But you can still set (and override) it either using CONFIG_CMDLINE or
>> in your device tree.
>> For advanced booting you can also use a inittamfs.
>>
>> So, what do I miss?
> 
> On block devices, GRUB doesn't need to set any parameters differently
> depending on the rootfstype being squashfs, xfs or ext4, right?

No, this works only for trivial storage stacks on x86 when booting from a
disk.
For squashfs you need an initramfs anyways on most setups
since squashfs is stored as regular file.

For everything non-trivial, may it RAID, LVM or iSCSI, it won't work
automagically.

> On UBI, this assumption no longer holds true, which imho is the
> remaining core of the problem, which I meant to illustrate using the
> example in the previous message I've sent.

Having squashfs on top of ubiblock which is ont op of UBI is something
non-trivial IMHO.

> Do you really explect that the bootloader should probe the rootfs-type
> and based on that, re-write the cmdline parameters?

No, the bootloader should *know* on what device it runs on and has to set
the cmdline correctly. Exactly as we do on every embedded system for ever.
I don't think OpenWrt/LEDE is so special.

> Just having "ubi.mtd=ubi root=ubi0:rootfs rootfstype=squashfs,ubifs"
> looks nicer than that, doesn't it?

I don't agree. Adding more auto probe hacks to the kernel for the sake
of looking nice are not worth it.
Since you have to have *at least* a per device device tree it is perfectly
fine adding the correct rootfs cmdline to it.
You also have to specify per device in your device tree the correct MTD
layout for each device.

Thanks,
//richard
