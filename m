Received: from gateway.prograde.net ([66.92.163.78] helo=sol.prograde.net)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PmSi7-0000nM-Cs
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2011 15:09:04 +0000
Subject: Re: Numonyx NOR and chip->mutex bug?
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Type: text/plain; charset=us-ascii
From: Michael Cashwell <mboards@prograde.net>
In-Reply-To: <76241A6C-ECA0-46B1-B8B4-F3786FCBA339@prograde.net>
Date: Mon, 7 Feb 2011 10:10:03 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <8F3BC736-334E-41F2-96D3-7651B4B15766@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>
	<OF669CD6B0.87299771-ONC1257823.007EE3A7-C1257823.007F2FD2@transmode.se>
	<25631ED7-C6A0-44B1-B33D-F48DC48C812E@prograde.net>
	<OF695F4526.1DB1C212-ONC125782B.00602EFA-C125782B.006F0621@transmode.se>
	<626D0191-85FC-41E2-94C7-CBFF9D9629BE@prograde.net>
	<OFAEC8E64A.F4C40EA8-ONC125782C.002A10F5-C125782C.002D0641@transmode.se>
	<OF562F5C46.D2EDB17F-ONC125782C.00358774-C125782C.0036154D@transmode.se>
	<6FC0E416-EEBD-453F-AAB9-88BB6D90BFAB@prograde.net>
	<4D4AD9ED.8060104@keymile.com> <4D4B37D4.4050204@keymile.com>
	<OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>
	<4D4BDD48.6040600@keymile.com>
	<OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>
	<541E19B8-D428-4F59-B6BB-A3BD8F455AE4@prograde.net>
	<OF42EFA99A.95A8E75E-ONC125782E.00384CCF-C125782E.00399CFC@transmode.se>
	<76241A6C-ECA0-46B1-B8B4-F3786FCBA339@prograde.net>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Cc: linux-mtd@lists.infradead.org, Holger brunck <holger.brunck@keymile.com>,
	Stefan Bigler <stefan.bigler@keymile.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Feb 5, 2011, at 2:19 PM, Michael Cashwell wrote:

>> I won't worry about this until you test my patch and still have a =
problem :) Please test it.
>=20
> My plan is to retest your patch against a pristine copy of the file =
and report back. Unfortunately this has to wait until Monday as I don't =
have access to the hardware over the weekend.

OK, I retested Joakim's patch from 4-feb on a clean source file and it =
doesn't help my problem:

[cashwell@mec-fedora14 linux-2.6.35.7-arm-gum]$ cat ../joakim.patch | =
patch -p1
patching file drivers/mtd/chips/cfi_cmdset_0001.c
Hunk #1 succeeded at 1227 (offset -18 lines).
Hunk #2 succeeded at 1266 (offset -18 lines).

(The offsets are just that we're on slightly different kernel versions, =
I assume. It applies OK.)

#### Exporting kernel linux-2.6.35.7-arm-gum to netboot.
Image Name:   2.6.35.7-gum1
Created:      Mon Feb  7 08:22:31 2011
Image Type:   ARM Linux Kernel Image (uncompressed)
Data Size:    1919908 Bytes =3D 1874.91 kB =3D 1.83 MB
Load Address: 0xA1000000
Entry Point:  0xA1000000

Booted and then did ubiformat, mount, rsync of about 20MB, and then =
during the umount of that file system:

UBI error: ubi_io_write: error -30 while writing 1968 bytes to PEB =
17:37528, written 0 bytes
UBI warning: ubi_eba_write_leb: failed to write data to PEB 17
UBI warning: ubi_ro_mode: switch to read-only mode

which I'd previously traced to the -EROFS return in do_write_buffer =
because it thinks it got a block-locked error during write. I've also =
seen that sometimes see the bad Vpp error too. (Why one of those has a =
printk and not the other I don't know.)

-Mike
