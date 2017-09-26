Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dwr7Z-0005BD-Dn
 for linux-mtd@lists.infradead.org; Tue, 26 Sep 2017 14:46:03 +0000
Received: by mail-wm0-x242.google.com with SMTP id m72so8779970wmc.1
 for <linux-mtd@lists.infradead.org>; Tue, 26 Sep 2017 07:45:40 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Issue with Micron QSPI flash in 4.14-rc1
From: Andras Szemzo <szemzo.andras@gmail.com>
In-Reply-To: <51b9af85-1712-7386-293d-1cfb69510f4f@wedev4u.fr>
Date: Tue, 26 Sep 2017 16:45:36 +0200
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, Richard Weinberger <richard@nod.at>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D05CE75F-8724-42A4-8A75-86A4B8358088@gmail.com>
References: <E36A7C66-EC4D-46FF-A6E1-835E1C466E55@gmail.com>
 <51b9af85-1712-7386-293d-1cfb69510f4f@wedev4u.fr>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>=20
> This driver was developed and tested for the QSPI controller of =
SAMA5D2
> and I think the controller (IP version) is not quite the same on =
SAMV7.
>=20
> I would be surprised that SPI 1-4-4 doesn't work with the Atmel QSPI
> controller of SAMV7 but let's verify it.
>=20

One more addition, I quickly ported the new ASF driver to my bootloader, =
which also use
SFDP and shares some logic. Seems it works with SPI 1-4-4 mode on SAMV7 =
too:

xboot v1.0
QSPI boot selected
SPI 4-4-4 opcode=3D66h=20
SPI 4-4-4 opcode=3D99h=20
SPI 1-1-1 opcode=3D66h=20
qspi_exec timeout reached
SPI 1-1-1 opcode=3D9Fh RX (6 bytes): 0x20 0xBA 0x20 0x10 ...=20
SF: Got Manufacturer and Device ID: 20ba20
SPI 1-1-1 opcode=3D5Ah address=3D0x00000000 (3-bytes) dummy=3D8 RX (16 =
bytes): 0x53 0x46 0x44 0x50 ...=20
SPI 1-1-1 opcode=3D5Ah address=3D0x00000030 (3-bytes) dummy=3D8 RX (36 =
bytes): 0xE5 0x20 0xFB 0xFF ...=20
SF: WARNING: can't read above 16MiB
SPI 1-4-4 opcode=3DEBh address=3D0x00400000 (3-bytes) mode=3D1 (FFh) =
dummy=3D9 RX (40 bytes): 0xD0 0x0D 0xFE 0xED ...=20
QSPI: dt blob: Read from 0x400000 to 0x71000000 size: 24572 bytes
SPI 1-4-4 opcode=3DEBh address=3D0x00400000 (3-bytes) mode=3D1 (FFh) =
dummy=3D9 RX (24572 bytes): 0xD0 0x0D 0xFE 0xED ...=20
SPI 1-4-4 opcode=3DEBh address=3D0x00000000 (3-bytes) mode=3D1 (FFh) =
dummy=3D9 RX (64 bytes): 0x27 0x05 0x19 0x56 ...=20
QSPI: Image: Read from 0x00 to 0x70007FC0, size: 3252864 bytes
SPI 1-4-4 opcode=3DEBh address=3D0x00000000 (3-bytes) mode=3D1 (FFh) =
dummy=3D9 RX (3252864 bytes): 0x27 0x05 0x19 0x56 ...=20
starting kernel 0x70008001

Booting Linux on physical CPU 0x0
Linux version 4.14.0-rc1 (root@devel) (gcc version 4.9.2 ( 4.9.2-10)) =
#49 Tue Sep 26 15:24:42 CEST 2017
CPU: ARMv7-M [410fc271] revision 1 (ARMv7M), cr=3D00000000
CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
...=
