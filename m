Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3z5f-0006wq-27
 for linux-mtd@lists.infradead.org; Thu, 05 Apr 2018 07:13:49 +0000
Date: Thu, 5 Apr 2018 09:13:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Steve deRosier <derosier@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND ECC on Marvell Armada SoC
Message-ID: <20180405091323.3ece362b@xps13>
In-Reply-To: <CALLGbR+8j6R=Bxe46-3OF-Ksfhc-2rC69rbyKLOyr2k=DchWmQ@mail.gmail.com>
References: <CALLGbR+8j6R=Bxe46-3OF-Ksfhc-2rC69rbyKLOyr2k=DchWmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Steve,

On Tue, 3 Apr 2018 16:18:33 -0700, Steve deRosier <derosier@gmail.com>
wrote:

> Hi All,
>=20
> I'm working on a platform I haven't worked on before and I'm getting
> some conflicting readings from the hardware and having trouble getting
> UBI-based images to run correctly and I was hoping someone here might
> have some experience that can point me the right direction.
>=20
> Before going into the details, here's my questions:
>=20
> * Does this controller store the ECC bits somewhere other than the OOB
> in the flash?

It depends on the ECC algorithm but if you use hardware BCH, then most
probably, yes. If you are using Hamming, then no.

> * Is it possible/likely for the vendor to have modified u-boot to not
> tell me the ECC bits in the OOB?  Or a u-boot bug on this platform
> where it would've not shown the OOB?

I don't think it has been modified to hide something. U-Boot might
simply not support it.

> * Is there a way to force a particular ECC configuration (including
> disabled) for this driver via the DTS and have it ignore the ONFI
> configuration? (I figure I could explore different configurations
> until I got something that matched).

You can ask for a particular couple of ECC strength/chunk size in the
DT, have a look at all the generic properties in [1]. I suggest you to
use these:
- nand-ecc-strength
- nand-ecc-step-size

Ignoring the ONFI configuration is probably not what you want though.
ONFI compliant chips are well supported.

[1] Documentation/devicetree/bindings/mtd/nand.txt

>=20
>=20
> The device is running a MV88F6820 SoC, with the NFC running via the
> pxa3xx-nand driver. I've got two versions of the hardware, one with a
> AMD/Spansion S34ML02G2 SLC NAND (let's call this Unit1), the other
> with a  Winbond W29N02GV SLC NAND (Unit2). The platform is a
> third-party platform. I'm running OpenWRT/LEDE on it.
>=20
> When I tried to replace the stock images on Unit2, either with stock
> LEDE or my own built OpenWRT images, it would boot the kernel and then
> UBI would spew ECC errors, resulting in an eventual rootfs not found
> panic. I don't think it's terribly interesting, but if you want to see
> the exact errors, I've attached the relevant chunk as a text file.
> Note that I was able to try flashing from both a running system as
> well as from u-boot with similar results.
>=20
> On Unit2 I was able to get it to boot via an initramfs, ignoring the
> UBI errors, so later information about a running Unit2 refers to this
> configuration.
>=20
> With Unit1, we were able to upgrade the stock image to a stock LEDE
> and it booted just fine.
>=20
> My operating theory is that something's fishy with the flash ECC setup
> on Unit2. It's notable that the stock images (kernel 3.10.70) are

Kernel 3.10 is very (and I mean *VERY*) old, particularly for the NAND
subsystem which has moved a lot. Plenty of bugs have been fixed and the
pxa3xx-nand.c driver does not exist anymore, it has been replaced by
the marvell_nand.c driver. I strongly suggest you to jump to this one
(4.16) and check if you still have these issues.

> unable to recognize the Windbond flash and have this:
>     [    1.967295] armada-nand f10d0000.nand: Initialize HAL based NFC
> in 8bit mode with DMA Disabled using BCH 4bit ECC
>     [    1.981683] NAND device: Manufacturer ID: 0xef, Chip ID: 0xda
> (Unknown NAND 256MiB 3,3V 8-bit), 256MiB, page size: 2048, OOB size:
> 64
>=20
> With the LEDE images (kernel  4.9.82) on Unit2, do recognize the
> flash chip: [    1.041804] nand: device found, Manufacturer ID: 0xef,
> Chip ID: 0xda [    1.048181] nand: Winbond W29N02GV
>     [    1.051604] nand: 256 MiB, SLC, erase size: 128 KiB, page size:
> 2048, OOB size: 64
>     [    1.059204] pxa3xx-nand f10d0000.flash: ECC strength 1, ECC
> step size 512
>=20
> And on Unit1 which is working fine, and which seems to be the original
> hardware rev, and running a 4.4.92 kernel:
>     [    1.008510] nand: device found, Manufacturer ID: 0x01, Chip
> ID: 0xda [    1.014899] nand: AMD/Spansion S34ML02G2
>     [    1.018836] nand: 256 MiB, SLC, erase size: 128 KiB, page size:
> 2048, OOB size: 128
>     [    1.026527] pxa3xx-nand f10d0000.flash: ECC strength 16, ECC
> step size 2048
>=20
> It's also interesting to note the U-Boot versions are different on the
> two different hardware revisions.
>=20
> My usual debugging for this sort of thing involves looking at the ECC
> bits in the OOB. This is where things seriously diverge from my
> expectations. In all cases, a u-boot `nand dump 0x...` results in
> showing OOB data of 0xff.  On Unit1, on the Linux command-line, a
> `nanddump -o -c ` shows no data in the OOB in any mtd device. On
> Unit2, once I was able to boot it via an initramfs, it does show data
> in the OOB in the kernel and rootfs areas that I flashed (but none in
> the boot partitions).
>=20
> What I strongly suspect is u-boot is defaulting to a particular ECC
> configuration and writing the OOB in a particular way, in a way that
> is in conflict with the ECC configuration the kernel is using because
> the newer kernel is choosing to configure based on the ONFI
> parameters. Also, at first I suspected that u-boot wasn't writing any
> ECC data because it didn't recognize the chip and the `nand dump `
> commands were showing erased OOBs.

For what I have seen, a strong effort has been done by the community to
keep these two in sync. Also, you are using the 1b/512B Hamming scheme
on 2kiB pages, which is a very simple and straightforward layout (4*512
B of data, 4*6B of ECC).

I don't get the "configure based on the ONFI parameters" part. This
just helps recognizing the chip and its requirements in terms of ECC
strength. The configuration chosen based on the ONFI parameters is
probably the good one.

>=20
> On another platform (an Atmel) with kernel 3.8, if the OOB was blank,
> the NAND driver would ignore ECC errors.

If by "OOB" you mean "all the ECC bytes plus spare bytes", then this
was a bug.

> I understand that's no longer
> the case in more current kernels, and might not be the case with the
> pxa3xx-nand driver anyway, but if it is that way on 3.10, it could
> explain why the manufacturer could have changed the flash, U-boot
> would write no ECC, and the system would boot fine; but with the
> upgraded kernel the system drops ECC errors on the UBIFS rootfs mount.
>=20
> I don't know this platform very well yet, nor do I have full control
> over it yet, so any hints by someone who does know this NFC and driver
> would be helpful.  Here's the first handful of questions I have:
>=20
> * Does this controller store the ECC bits somewhere other than the OOB
> in the flash?
> * Is it possible/likely for the vendor to have modified u-boot to not
> tell me the ECC bits in the OOB?  Or a u-boot bug on this platform
> where it would've not shown the OOB?
> * Is there a way to force a particular ECC configuration (including
> disabled) for this driver via the DTS and have it ignore the ONFI
> configuration? (I figure I could explore different configurations
> until I got something that matched).

See above.

> * Does anyone have any other ideas?

You really should not use such an old kernel. If you can, please move
to a much recent one; you'll avoid yourself painful hours :)

Good luck,
Miqu=C3=A8l


--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
