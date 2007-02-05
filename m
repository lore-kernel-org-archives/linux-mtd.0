Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HDzTn-0007eD-0Q
	for linux-mtd@lists.infradead.org; Mon, 05 Feb 2007 03:45:58 -0500
Subject: Re: Failed to mount jffs2 on mtd device
From: Artem Bityutskiy <dedekind@infradead.org>
To: axel.lin@mitac-mtc.com.tw
In-Reply-To: <427d64720702041910o2cc7c5d2q32e467be6a1ae5fd@mail.gmail.com>
References: <427d64720702041910o2cc7c5d2q32e467be6a1ae5fd@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Mon, 05 Feb 2007 10:45:22 +0200
Message-Id: <1170665122.3628.80.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-02-05 at 11:10 +0800, axel lin wrote:
> Uncompressing Linux......................................................=
...................................................
> done, booting the kernel.
> Linux version 2.6.14-intc1 (axel@kdc.example.com) (gcc version 3.4.3)

Quite old kernel...

> Relocation table recognized, totally 57 block relocated
> Block 0x1 relocate to Block 0x:3ff
> Block 0x2 relocate to Block 0x:3fe

Hmm, interesting, what is this relocation table? You relocate bad
blocks?

> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00000000
> OOB at 00000000 was ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> e3 6b a8 ad 4f 0f fd 21 3f 2a 9d 0a dc 89 e5 88 9d 06 0d a3 70 c3 28
> 0c

Something unknown in OOB instead of a clean marker - JFFS2 yells but it
is harmless. How do you flash your image on the device?

> JFFS2: Erase block at 0x00fe0000 is not formatted. It will be erased
> VFS: Mounted root (jffs2 filesystem).

So you mounted it, everything is OK.
> nand_erase: Device is write protected!!!
> Erase at 0x008c0000 failed immediately: errno -5

This is your problem. Realize why your device is read-only. I guess this
relocation stuff is something simple and RO.

You seems to have standard flash but use some strange drivers which make
it RO. I am not sure, just guess. If so, use standard drivers and be
happy!

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
