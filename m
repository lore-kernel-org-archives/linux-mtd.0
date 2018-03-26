Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0YPb-0005SC-9h
 for linux-mtd@lists.infradead.org; Mon, 26 Mar 2018 20:08:13 +0000
From: Richard Weinberger <richard@nod.at>
To: Olivier Schonken <olivier.schonken@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: Re: Atmel Nand PMECC UBI ECC issue
Date: Mon, 26 Mar 2018 22:07:49 +0200
Message-ID: <1849050.lXIvJB3S2I@blindfold>
In-Reply-To: <CALdGskLaHrZGa7u4_jmJjq1VPRv6AYgRpSsYcNy+-EtgWR0H=Q@mail.gmail.com>
References: <CALdGskLaHrZGa7u4_jmJjq1VPRv6AYgRpSsYcNy+-EtgWR0H=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Oliver,

Am Montag, 26. M=E4rz 2018, 16:56:17 CEST schrieb Olivier Schonken:
> Sorry for the resend, seems my gmail editor was in HTML mode which got
> rejected by the mailing list.  Humble apologies.
>=20
> I have run into an issue with the Atmel nand controller on the
> SAMA5D36, which I am struggling to debug.
>=20
> We are using custom hardware based on the SAMA5D36. With Micron
> MT29F8G08ABBCAH4 NAND flash.  Kernel version is 4.14.29 - mainline
> from kernel.org.  ECC strength is 24 bits with 1024 byte sector size.
> The PMECC settings was calculated as per
> https://www.at91.com/linux4sam/bin/view/Linux4SAM/PmeccConfigure, with
> the nand HEADER value at 0xc0e18e05.
>=20
> The system works, and only some units present the error, the baffling
> part of it, is that a unit can work properly for a long while, and
> then suddenly the error presents itself. (Once traced it to a glibc
> library file, which means it isn't even due to heavy writing on the
> filesystem.) I have noticed that most of the time the PEB in which the
> error occurs is the same.  Even after reprogramming the device via
> ubiformat, or SAM-BA.
>=20
> In the attached log output, you will see that there is a UBIFS error,
> where it detects a bitflip, which I confirmed by comparing the binary
> sequence to the Buildroot generated ubi file.
>=20
> Using Atmel's SAM-BA to read back the contents of the NAND flash,
> yields the correct contents for the page causing the ECC error.
>=20
> 31 18 10 06 00 FE A2 74 FB CF 00 00 00 00 00 00 C5 05 00 00 01 00 00
> 00 AB 0C 00 00

At which offset it this?

> Starting up linux again results in the same issue.
> This extract shows the ubifs magic number with the bitflip. The rest
> of the binary sequence matches a unique part of the ubi image.
>=20
> [   75.140000] 7fe0: b6f8f8e4 becf7a40 b6be5788 b6e9c000 60000010 ffffffff
> [   75.150000] UBIFS error (ubi0:0 pid 1): ubifs_check_node: bad magic
> 0x6101830, expected 0x6101831
> [   75.160000] UBIFS error (ubi0:0 pid 1): ubifs_check_node: bad node
> at LEB 325:216208
> [   75.160000] Not a node, first 24 bytes:
> [   75.160000] 00000000: 30 18 10 06 00 fe a2 74 fb cf 00 00 00 00 00
> 00 c5 05 00 00 01 00 00 00
> 0......t................
> [   75.180000] CPU: 0 PID: 1 Comm: systemd Not tainted 4.14.29+ #706
>=20
> mtdinfo for the partition in question
> Type:                           nand
> Eraseblock size:                262144 bytes, 256.0 KiB
> Amount of eraseblocks:          2048 (536870912 bytes, 512.0 MiB)
> Minimum input/output unit size: 4096 bytes
> Sub-page size:                  4096 bytes
> OOB size:                       224 bytes
> Character device major/minor:   90:10
> Bad blocks are allowed:         true
> Device is writable:             true
>=20
> Device tree entry:
>         nand_controller: nand-controller {
>                 status =3D "okay";
>=20
>                 nand@3 {
>                     reg =3D <0x3 0x0 0x800000>;
>                     atmel,rb =3D <0>;
>                     nand-bus-width =3D <8>;
>                     nand-ecc-mode =3D "hw";
>                     nand-ecc-strength =3D <24>;
>                     nand-ecc-step-size =3D <1024>;
>                     nand-on-flash-bbt;
>                     label =3D "atmel_nand";
>                 };
>             };
>=20
> Attached are the dmesg traces with the ECC issue.  A nanddump of the
> block with the ECC error, including OOB contents as per "nanddump -f
> nandblock-withoob.ubi /dev/mtd5 -s 0x51c0000 -o -l 262144 &>
> nanddump-cmdline-output.txt"

Can you please share the dump without OOB?
UBI does not use OOB, so we don't need it and can use offsets as seen by UB=
I=20
and UBIFS as-is. :)

Thanks,
//richard
