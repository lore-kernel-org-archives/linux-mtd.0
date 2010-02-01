Received: from blu0-omc3-s10.blu0.hotmail.com ([65.55.116.85])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NbtUC-0002NE-IK
	for linux-mtd@lists.infradead.org; Mon, 01 Feb 2010 10:26:32 +0000
Message-ID: <BLU108-W25DE0DC220AD6F99A8C5879C580@phx.gbl>
From: d binderman <dcb314@hotmail.com>
To: <dwmw2@infradead.org>
Subject: mtd/maps/ceiva.c: possibly uninitialised local variable nr
Date: Mon, 1 Feb 2010 10:26:26 +0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Hello there=2C

I just ran the sourceforge tool cppcheck over the source code of the
new Linux kernel 2.6.33-rc6

It said

[./mtd/maps/ceiva.c:269]: (error) Uninitialized variable: nr

The source code is

static int __init clps_setup_flash(void)
{
=A0=A0=A0=A0=A0=A0=A0 int nr=3B

#ifdef CONFIG_ARCH_CEIVA
=A0=A0=A0=A0=A0=A0=A0 if (machine_is_ceiva()) {
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 info[0].base =3D CS0_PHYS_BAS=
E=3B
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 info[0].size =3D SZ_32M=3B
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 info[0].width =3D CEIVA_FLASH=
_WIDTH=3B
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 info[1].base =3D CS1_PHYS_BAS=
E=3B
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 info[1].size =3D SZ_32M=3B
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 info[1].width =3D CEIVA_FLASH=
_WIDTH=3B
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nr =3D 2=3B
=A0=A0=A0=A0=A0=A0=A0 }
#endif
=A0=A0=A0=A0=A0=A0=A0 return nr=3B
}

There is no code to cope with the case that function machine_is_ceiva() ret=
urns 0
or that CONFIG_ARCH_CEIVA is undefined.

Suggest new belt'n'braces code

static int __init clps_setup_flash(void)
{
=A0=A0=A0=A0=A0=A0=A0 int nr =3D 0=3B

#ifdef CONFIG_ARCH_CEIVA
=A0=A0=A0=A0=A0=A0=A0 if (machine_is_ceiva()) {
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 info[0].base =3D CS0_PHYS_BAS=
E=3B
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 info[0].size =3D SZ_32M=3B
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 info[0].width =3D CEIVA_FLASH=
_WIDTH=3B
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 info[1].base =3D CS1_PHYS_BAS=
E=3B
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 info[1].size =3D SZ_32M=3B
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 info[1].width =3D CEIVA_FLASH=
_WIDTH=3B
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nr =3D 2=3B
=A0=A0=A0=A0=A0=A0=A0 }
#endif
=A0=A0=A0=A0=A0=A0=A0 return nr=3B
}

Regards

David Binderman

 		 	   		 =20
_________________________________________________________________
Tell us your greatest=2C weirdest and funniest Hotmail stories
http://clk.atdmt.com/UKM/go/195013117/direct/01/=
