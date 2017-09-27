Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dxAmO-000209-IE
 for linux-mtd@lists.infradead.org; Wed, 27 Sep 2017 11:45:31 +0000
Date: Wed, 27 Sep 2017 13:44:56 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Genoud <richard.genoud@gmail.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, linux-mtd
 <linux-mtd@lists.infradead.org>, Linux Kernel
 <linux-kernel@vger.kernel.org>
Subject: Re: atmel_nand: kernel panic when ecc_strength==4
Message-ID: <20170927134456.6fd3241e@bbrezillon>
In-Reply-To: <CACQ1gAhZRjMHUv6f7dv28bwBYikdVVK8DsLHtOatcE_y8mBAAQ@mail.gmail.com>
References: <1506503157.3016.5.camel@gmail.com>
 <20170927120415.0bcdb1ca@bbrezillon>
 <CACQ1gAgsiDrhg=rn7Bf5UDg-R2mg5uughUgN0mExyd1YUiHXLg@mail.gmail.com>
 <CACQ1gAhZRjMHUv6f7dv28bwBYikdVVK8DsLHtOatcE_y8mBAAQ@mail.gmail.com>
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

On Wed, 27 Sep 2017 13:01:51 +0200
Richard Genoud <richard.genoud@gmail.com> wrote:

> 2017-09-27 12:15 GMT+02:00 Richard Genoud <richard.genoud@gmail.com>:
> > 2017-09-27 12:04 GMT+02:00 Boris Brezillon <boris.brezillon@free-electrons.com>:  
> >> On Wed, 27 Sep 2017 11:05:57 +0200
> >> Richard Genoud <richard.genoud@gmail.com> wrote:
> >>  
> >>> Hi Boris, Nicolas !
> >>>
> >>> Since commit f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
> >>> strange things happen when nand-ecc-strength = <4>; (previously atmel,pmecc-cap).
> >>>
> >>> I first saw that a NULL pointer dereference happened when "udevadm trigger" was launched.
> >>> With strace, I nailed it down to :
> >>>
> >>> sh-4.3# echo change > /sys/devices/virtual/bdi/mtd-1/uevent
> >>> [   86.696275] Unable to handle kernel NULL pointer dereference at virtual address 00000001
> >>> [   86.704285] pgd = c717c000
> >>> [   86.707072] [00000001] *pgd=c06d9a7000000000, *pte=00000000, *ppte=00000000
> >>> [   86.713979] Internal error: Oops: 17 [#3] ARM
> >>> [   86.718306] CPU: 0 PID: 1 Comm: sh Tainted: G      D W       4.11.0-rc1-00056-gf88fc122cc34-dirty #75
> >>> [   86.727443] Hardware name: Atmel AT91SAM9
> >>> [   86.731424] task: c7880b60 task.stack: c7884000
> >>> [   86.735926] PC is at strlen+0x14/0x2c
> >>> [   86.739556] LR is at kobject_get_path+0x34/0xac
> >>> [   86.744046] pc : [<c023bc08>]    lr : [<c0235020>]    psr: 20000013
> >>> [   86.744046] sp : c7885dc0  ip : c7885dd0  fp : c7885dcc
> >>> [   86.755439] r10: 00000002  r9 : 00000000  r8 : c7885f78
> >>> [   86.760627] r7 : 014000c0  r6 : c7ab2308  r5 : 00000001  r4 : c7ab2308
> >>> [   86.767106] r3 : 00000001  r2 : 00000001  r1 : 014000c0  r0 : 00000001
> >>> [   86.773588] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> >>> [   86.780672] Control: 0005317f  Table: 2717c000  DAC: 00000051
> >>> [   86.786372] Process sh (pid: 1, stack limit = 0xc7884190)
> >>> [   86.791730] Stack: (0xc7885dc0 to 0xc7886000)
> >>> [   86.796075] 5dc0: c7885df4 c7885dd0 c0235020 c023bc04 c0728bf8 c79f1000 c7ab2308 c78c2b00
> >>> [   86.804195] 5de0: c04f4610 c7885f78 c7885e44 c7885df8 c0236244 c0234ffc c00a53b4 00000074
> >>> [   86.812315] 5e00: 00107000 c7885ea8 c7885e64 c05d604b c717b420 c05b4aa8 0000081f 00000007
> >>> [   86.820438] 5e20: c7ab2300 c7199ea0 c79baae0 c7885f78 c7199eb0 00000007 c7885e54 c7885e48
> >>> [   86.828559] 5e40: c0236640 c0236188 c7885e74 c7885e58 c02a5834 c023663c c7885e9c 00000002
> >>> [   86.836681] 5e60: c7bf1f50 c79baae0 c7885e84 c7885e78 c02a37b8 c02a5800 c7885e9c c7885e88
> >>> [   86.844801] 5e80: c0128fc8 c02a37a0 00000000 00000000 c7885ed4 c7885ea0 c01281e4 c0128f8c
> >>> [   86.852922] 5ea0: 00000000 00000000 c7880b60 c01280b8 00106cf8 c7215c20 c7885f78 00000007
> >>> [   86.861045] 5ec0: c7884000 00106cf8 c7885f44 c7885ed8 c00caec0 c01280c8 0000081f 00107d00
> >>> [   86.869167] 5ee0: c06d0f7c c7885fb0 00053177 00001180 00000178 c7885fac c7885f04 c00091e4
> >>> [   86.877288] 5f00: c001128c c000e088 00000158 c00cb114 000012bc 00000000 bec504d0 b6e8bbec
> >>> [   86.885409] 5f20: c7215c20 c7215c20 00000000 00000007 00106cf8 c7885f78 c7885f74 c7885f48
> >>> [   86.893531] 5f40: c00cb160 c00cae94 c00e6e04 c00e6568 00000000 00000000 c7215c20 c7215c20
> >>> [   86.901652] 5f60: 00000007 00106cf8 c7885fa4 c7885f78 c00cb2dc c00cb0b0 00000000 00000000
> >>> [   86.909773] 5f80: 00000007 00106cf8 b6e8dd50 00000004 c000a544 00000000 00000000 c7885fa8
> >>> [   86.917895] 5fa0: c000a3a0 c00cb2a0 00000007 00106cf8 00000001 00106cf8 00000007 00000000
> >>> [   86.926015] 5fc0: 00000007 00106cf8 b6e8dd50 00000004 00000007 00000004 00000000 000e9124
> >>> [   86.934139] 5fe0: 00000000 bec50a3c b6db63d0 b6e107ac 60000010 00000001 ffffffff ffffffff
> >>> [   86.942277] [<c023bc08>] (strlen) from [<c0235020>] (kobject_get_path+0x34/0xac)
> >>> [   86.949620] [<c0235020>] (kobject_get_path) from [<c0236244>] (kobject_uevent_env+0xcc/0x4b4)
> >>> [   86.958083] [<c0236244>] (kobject_uevent_env) from [<c0236640>] (kobject_uevent+0x14/0x18)
> >>> [   86.966287] [<c0236640>] (kobject_uevent) from [<c02a5834>] (uevent_store+0x44/0x64)
> >>> [   86.973987] [<c02a5834>] (uevent_store) from [<c02a37b8>] (dev_attr_store+0x28/0x34)
> >>> [   86.981672] [<c02a37b8>] (dev_attr_store) from [<c0128fc8>] (sysfs_kf_write+0x4c/0x58)
> >>> [   86.989525] [<c0128fc8>] (sysfs_kf_write) from [<c01281e4>] (kernfs_fop_write+0x12c/0x1c4)
> >>> [   86.997737] [<c01281e4>] (kernfs_fop_write) from [<c00caec0>] (__vfs_write+0x3c/0x11c)
> >>> [   87.005596] [<c00caec0>] (__vfs_write) from [<c00cb160>] (vfs_write+0xc0/0x164)
> >>> [   87.012855] [<c00cb160>] (vfs_write) from [<c00cb2dc>] (SyS_write+0x4c/0x8c)
> >>> [   87.019854] [<c00cb2dc>] (SyS_write) from [<c000a3a0>] (ret_fast_syscall+0x0/0x38)
> >>> [   87.027364] Code: e92dd800 e24cb004 e1a03000 e1a02003 (e5d21000)
> >>> [   87.033544] ---[ end trace 29af93c3c072b1f4 ]---
> >>> [   87.039277] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> >>>
> >>> This is fun because it really doesn't seem to have anything to do with atmel-nand...
> >>>
> >>> I first found that on my custom board, built around an at91sam9g35-cm, but I managed to trigger it
> >>> on an at91sam9g35-ek board, with a 4.13.3 kernel.
> >>>
> >>> NB: I couldn't trigger this with ecc-strength = 2
> >>>
> >>> So, here is my configuration:
> >>> - at91sam9g35-ek board with the image ftp://www.at91.com/pub/demo/linux4sam_5.6/linux4sam-poky-at91sam9x5ek-5.6.zip
> >>> I flashed this image a first time as is, and then I flashed only the rfs with eccType 0xc0902405.
> >>>
> >>> - Kernel 4.13.3 with the quick'n dirty patch:
> >>> --- a/arch/arm/boot/dts/at91sam9x5cm.dtsi
> >>> +++ b/arch/arm/boot/dts/at91sam9x5cm.dtsi
> >>> @@ -56,7 +56,7 @@
> >>>                                       cs-gpios = <&pioD 4 GPIO_ACTIVE_HIGH>;
> >>>                                       nand-bus-width = <8>;
> >>>                                       nand-ecc-mode = "hw";
> >>> -                                     nand-ecc-strength = <2>;
> >>> +                                     nand-ecc-strength = <4>;
> >>>                                       nand-ecc-step-size = <512>;
> >>>                                       nand-on-flash-bbt;
> >>>                                       label = "atmel_nand";
> >>>
> >>> A minimal defconfig (attached)
> >>>
> >>> To trigger the kernel panic on a 4.13.3 kernel:
> >>>
> >>> At uboot:
> >>> setenv bootargs $bootargs init=/bin/sh
> >>> tftpboot 0x22000000 zImage ; tftpboot 0x21000000 at91sam9g35ek.dtb
> >>> bootz 0x22000000 - 0x21000000
> >>>
> >>> mount -tsysfs none /sys
> >>> mount -tproc none /proc
> >>>
> >>> echo "change" > /sys/devices/platform/leds/leds/pd21/uevent
> >>> [   21.130000] Unable to handle kernel NULL pointer dereference at virtual address 00000001
> >>> [   21.140000] pgd = c7170000
> >>> [   21.140000] [00000001] *pgd=c06f780000000000, *pte=60000013, *ppte=60000013
> >>> [   21.150000] Internal error: Oops: 17 [#1] ARM
> >>> [   21.150000] CPU: 0 PID: 1 Comm: sh Not tainted 4.13.3-dirty #77
> >>> [   21.150000] Hardware name: Atmel AT91SAM9
> >>> [   21.150000] task: c787c800 task.stack: c78c2000
> >>> [   21.150000] PC is at strlen+0x14/0x2c
> >>> [   21.150000] LR is at kobject_get_path+0x34/0xac
> >>> [   21.150000] pc : [<c04d172c>]    lr : [<c04c7444>]    psr: 20000013
> >>> [   21.150000] sp : c78c3d90  ip : c78c3da0  fp : c78c3d9c
> >>> [   21.150000] r10: 00000002  r9 : c78c3e28  r8 : c7bdd408
> >>> [   21.150000] r7 : 014000c0  r6 : c7bdd408  r5 : 00000001  r4 : c7bdd408
> >>> [   21.150000] r3 : 00000001  r2 : 00000001  r1 : 014000c0  r0 : 00000001
> >>> [   21.150000] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> >>> [   21.150000] Control: 0005317f  Table: 27170000  DAC: 00000051
> >>> [   21.150000] Process sh (pid: 1, stack limit = 0xc78c2190)
> >>> [   21.150000] Stack: (0xc78c3d90 to 0xc78c4000)
> >>> [   21.150000] 3d80:                                     c78c3dc4 c78c3da0 c04c7444 c04d1728
> >>> [   21.150000] 3da0: c0747de8 c7995000 c7bdd408 c787fac0 c05087c4 c7bdd408 c78c3e14 c78c3dc8
> >>> [   21.150000] 3dc0: c04c8630 c04c7420 c00b0ad8 c78c3e4c 0007c000 c78c3e28 c78c3e4c c05ee954
> >>> [   21.150000] 3de0: 27e1718f c05fbcf7 00000000 00000000 00000007 00000006 00000002 c7bdd408
> >>> [   21.150000] 3e00: c05ee954 c713d0c0 c78c3e5c c78c3e18 c04c8b08 c04c8574 c00c5d58 c00c5600
> >>> [   21.150000] 3e20: c78c3e2c c0521e9c c060f2f7 00000000 c00b6168 00000007 c7bdd400 c7160320
> >>> [   21.150000] 3e40: c713d0c0 c78c3f78 c7160330 00000007 c78c3e74 c78c3e60 c02a102c c04c8a44
> >>> [   21.150000] 3e60: c7034dc0 c713d0c0 c78c3e84 c78c3e78 c029efb8 c02a1010 c78c3e9c c78c3e88
> >>> [   21.150000] 3e80: c012b194 c029efa0 00000000 00000000 c78c3ed4 c78c3ea0 c012a3c8 c012b158
> >>> [   21.150000] 3ea0: 00000000 00000000 0000000f c012a27c 00100f40 c7b82ea0 c78c3f78 00000007
> >>> [   21.150000] 3ec0: c78c2000 00100f40 c78c3f44 c78c3ed8 c00cca24 c012a28c 00001000 00000000
> >>> [   21.150000] 3ee0: 00001000 00000000 00000000 00000000 00000015 07d4a7e8 00000015 0727b420
> >>> [   21.150000] 3f00: 00000015 0727b420 0000148c c00ccc8c be9854d0 b6f74bec c78c3fa4 c78c3f28
> >>> [   21.150000] 3f20: c7b82ea0 c7b82ea0 00000000 00000007 00100f40 c78c3f78 c78c3f74 c78c3f48
> >>> [   21.150000] 3f40: c00cccd8 c00cc9f8 c00e8e48 c00e85ac 00000000 00000000 c7b82ea0 c7b82ea0
> >>> [   21.150000] 3f60: 00000007 00100f40 c78c3fa4 c78c3f78 c00cce54 c00ccc28 00000000 00000000
> >>> [   21.150000] 3f80: 00000007 00100f40 b6f76d50 00000004 c000a544 00000000 00000000 c78c3fa8
> >>> [   21.150000] 3fa0: c000a3a0 c00cce18 00000007 00100f40 00000001 00100f40 00000007 00000000
> >>> [   21.150000] 3fc0: 00000007 00100f40 b6f76d50 00000004 00000007 00000004 00000000 000e9124
> >>> [   21.150000] 3fe0: 00000000 be985a3c b6e9f3d0 b6ef97ac 60000010 00000001 00000000 01010000
> >>> [   21.150000] [<c04d172c>] (strlen) from [<c04c7444>] (kobject_get_path+0x34/0xac)
> >>> [   21.150000] [<c04c7444>] (kobject_get_path) from [<c04c8630>] (kobject_uevent_env+0xcc/0x4b8)
> >>> [   21.150000] [<c04c8630>] (kobject_uevent_env) from [<c04c8b08>] (kobject_synth_uevent+0xd4/0x33c)
> >>> [   21.150000] [<c04c8b08>] (kobject_synth_uevent) from [<c02a102c>] (uevent_store+0x2c/0x4c)
> >>> [   21.150000] [<c02a102c>] (uevent_store) from [<c029efb8>] (dev_attr_store+0x28/0x34)
> >>> [   21.150000] [<c029efb8>] (dev_attr_store) from [<c012b194>] (sysfs_kf_write+0x4c/0x58)
> >>> [   21.150000] [<c012b194>] (sysfs_kf_write) from [<c012a3c8>] (kernfs_fop_write+0x14c/0x1bc)
> >>> [   21.150000] [<c012a3c8>] (kernfs_fop_write) from [<c00cca24>] (__vfs_write+0x3c/0x130)
> >>> [   21.150000] [<c00cca24>] (__vfs_write) from [<c00cccd8>] (vfs_write+0xc0/0x164)
> >>> [   21.150000] [<c00cccd8>] (vfs_write) from [<c00cce54>] (SyS_write+0x4c/0x8c)
> >>> [   21.150000] [<c00cce54>] (SyS_write) from [<c000a3a0>] (ret_fast_syscall+0x0/0x38)
> >>> [   21.150000] Code: e92dd800 e24cb004 e1a03000 e1a02003 (e5d21000)
> >>> [   21.480000] ---[ end trace 3cc39b52c074a44c ]---
> >>> [   21.490000] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> >>>
> >>>
> >>> Or, we can just launch udev:
> >>> udevd -d
> >>> udevadm trigger
> >>> (udevadm actually writes "changes" in uevent files).
> >>>
> >>> Now, a fun fact: If we add CONFIG_PM, there's no more kernel panic. (wtf?!)
> >>>
> >>> I also tried to boot with a nfs-root, echo changed > ".../uevent", no kernel panic.
> >>> Then, ubiattach the mtd partition, echo changed > ".../uevent" => PANIC !
> >>>
> >>> So, it really seems to be nand-related.
> >>>
> >>> Any idea ?
> >>>  
> >>
> >> Hm, it looks like a nasty buffer overflow. Can you try to double the
> >> size here [1] (size *= 2) and see if that still happens?  
> 
> It seems that in [1],  only the space for mu is allocated.
> according to [2], dmu is (req->ecc.strength + 1)*sizeof(s32) octets more
> and so is delta
> So, IMHO, the allocation should be :
> --- a/drivers/mtd/nand/atmel/pmecc.c
> +++ b/drivers/mtd/nand/atmel/pmecc.c
> @@ -363,7 +363,7 @@ atmel_pmecc_create_user(struct atmel_pmecc *pmecc,
>      size += (req->ecc.strength + 1) * sizeof(u16);
>      /* Reserve space for mu, dmu and delta. */
>      size = ALIGN(size, sizeof(s32));
> -    size += (req->ecc.strength + 1) * sizeof(s32);
> +    size += (req->ecc.strength + 1) * sizeof(s32) * 3;
> 
>      user = kzalloc(size, GFP_KERNEL);
>      if (!user)
> 
> 

LGTM. Can you send a patch with the CC-stable+Fixes tags. I'll queue it
for -rc3.

Thanks a lot for reporting and fixing this bug.

Boris
