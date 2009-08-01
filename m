Received: from mail-px0-f190.google.com ([209.85.216.190])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MXGq2-0002zX-0N
	for linux-mtd@lists.infradead.org; Sat, 01 Aug 2009 15:49:42 +0000
Received: by pxi28 with SMTP id 28so1502879pxi.28
	for <linux-mtd@lists.infradead.org>;
	Sat, 01 Aug 2009 08:49:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <110c8b2e0907311429k26d23f10jb220a4afdf89e949@mail.gmail.com>
References: <110c8b2e0907311429k26d23f10jb220a4afdf89e949@mail.gmail.com>
Date: Sat, 1 Aug 2009 08:49:36 -0700
Message-ID: <110c8b2e0908010849x7d6b524akc7cf94a86e24f6c9@mail.gmail.com>
Subject: Re: Trouble getting MTD to run -- permission denied messages
From: Subodh Nijsure <nijsure.subodh@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I enabled some of the debug macros and attached output below,
concerned about "Chip erase not supported" debug output. Is that
reason I am not able to write to NOR flash? But I also see " Program
after Erase Suspend: supported"


Primary Vendor Command Set: 0001 (Intel/Sharp Extended)
Primary Algorithm Table at 010A
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum:  1.7 V
Vcc Maximum:  2.0 V
Vpp Minimum:  8.5 V
Vpp Maximum:  9.5 V
Typical byte/word write timeout: 256 .s
Maximum byte/word write timeout: 512 .s
Typical full buffer write timeout: 512 .s
Maximum full buffer write timeout: 1024 .s
Typical block erase timeout: 1024 ms
Maximum block erase timeout: 4096 ms
Chip erase not supported
Device size: 0x2000000 bytes (32 MiB)
Flash Device Interface description: 0x0001
  - x16-only asynchronous interface
Max. bytes in buffer write: 0x40
Number of Erase Block Regions: 2
  Erase Region #0: BlockSize 0x8000 bytes, 4 blocks
  Erase Region #1: BlockSize 0x20000 bytes, 255 blocks

 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
Using buffer write method
Using auto-unlock on power-up/resume
  Extended Query version 1.4
  Feature/Command Support:      00E6
     - Chip Erase:              unsupported
     - Suspend Erase:           supported
     - Suspend Program:         supported
     - Legacy Lock/Unlock:      unsupported
     - Queued Erase:            unsupported
     - Instant block lock:      supported
     - Protection Bits:         supported
     - Page-mode read:          supported
     - Synchronous read:        unsupported
     - Simultaneous operations: unsupported
     - Extended Flash Array:    unsupported
  Supported functions after Suspend: 01
     - Program after Erase Suspend: supported
  Block Status Register Mask: 0003
     - Lock Bit Active:      yes
     - Lock-Down Bit Active: yes
     - EFA Lock Bit:         no
     - EFA Lock-Down Bit:    no
  Vcc Logic Supply Optimum Program/Erase Voltage: 1.8 V
  Vpp Programming Supply Optimum Program/Erase Voltage: 9.0 V
cfi_cmdset_0001: Erase suspend on write enabled


On Fri, Jul 31, 2009 at 2:29 PM, Subodh Nijsure<nijsure.subodh@gmail.com> w=
rote:
> I have defined my NOR flash layout as follows I am able to see the
> contents of the flash when I do
>
> dd=3D/dev/mtdblock1 of=3D/tmp/myflash
>
> However I created a jffs2 image on my workstation and tried to "burn"
> it to flash by executing following command =A0and I see messages "This
> doesn't seem to be valid MTD flash device.
>
> # ./flashcp /initrd.jffs2 /dev/mtdblock1
> mtdblock_open
> ok
> This doesn't seem to be a valid MTD flash device!
> mtdblock_release
> ok
>
> Also mtdinfo -a display following message
>
> # /mtd/mtdinfo -a
> Count of MTD devices: =A0 =A0 =A0 =A0 =A0 3
> MTD_open
> libmtd: error!: cannot open "/dev/mtd0"
> =A0 =A0 =A0 =A0error 13 (Permission denied)
> mtdinfo: error!: libmtd failed get MTD device 0 information
> =A0 =A0 =A0 =A0 error 13 (Permission denied)
>
> I must have missed some basic step in getting things setup for NOR
> flash, would appreciate a nudge in right direction...
>
>
>
> static struct mtd_partition my_flash_partitions[] =3D {
> =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =3D "Linux",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.offset =3D RW_PART2_OF,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.size =3D RW_PART2_SZ,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.mask_flags =3D MTD_WRITEABLE
> =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =3D "ramdisk",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.offset =3D RW_PART3_OF,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.size =3D RW_PART3_SZ,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.mask_flags =3D MTD_WRITEABLE
> =A0 =A0 =A0 =A0},
> };
>
>
> struct map_info my_flash_map =3D {
> =A0 =A0 =A0 =A0.name =3D "My device",
> =A0 =A0 =A0 =A0.size =3D WINDOW_SIZE,
> =A0 =A0 =A0 =A0.bankwidth =3D 2,
> =A0 =A0 =A0 =A0.phys =3D WINDOW_ADDR,
> };
>
>
> When I boot my board I see following messages :
>
> flash mapping: size 0600000 at 0xc1400000
> Found 1 x16 devices at 0x0 in 16-bit bank
> NOR chip too large to fit in mapping. Attempting to cope...
> =A0Intel/Sharp Extended Query Table at 0x010A
> =A0Intel/Sharp Extended Query Table at 0x010A
> =A0Intel/Sharp Extended Query Table at 0x010A
> =A0Intel/Sharp Extended Query Table at 0x010A
> =A0Intel/Sharp Extended Query Table at 0x010A
> Using buffer write method
> Using auto-unlock on power-up/resume
> cfi_cmdset_0001: Erase suspend on write enabled
> erase region 0: offset=3D0x0,size=3D0x8000,blocks=3D4
> erase region 1: offset=3D0x20000,size=3D0x20000,blocks=3D255
> Reducing visibility of 32768KiB chip to 6144KiB
> Creating 2 MTD partitions on "My Device":
> 0x00000000-0x00300000 : "Linux"
> mtd: Giving out device 0 to Linux
> 0x00300000-0x00600000 : "ramdisk"
> mtd: Giving out device 1 to ramdisk
>
>
> /Subodh
>
