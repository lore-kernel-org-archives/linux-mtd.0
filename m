Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CMmZI-0002tU-Sl
	for linux-mtd@lists.infradead.org; Wed, 27 Oct 2004 08:06:22 -0400
Message-ID: <417F8F13.3050309@yandex.ru>
Date: Wed, 27 Oct 2004 16:05:39 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: Xin Li <xin123456.li@yahoo.com.cn>
References: <20041027112229.25654.qmail@web15609.mail.cnb.yahoo.com>
In-Reply-To: <20041027112229.25654.qmail@web15609.mail.cnb.yahoo.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Subject: Re: warning message "CLEANMARKER node ..." on mount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

Did you try to use --no-cleanmarkers mkfs.jffs2 option when you create
your image?

Xin Li wrote:
> Hi,
>=20
> I am trying to get JFFS2 running on my 2KB flash page
> Nand flash. My nand flash driver is working. When I
> mount an empty partition, I don't any mwarning message
> and JFFS2 is working fine. But if I copy a JFFS2 image
> to the partition and then mount it, I get many=20
> warning meassages regarding cleanmaker node and JFFS
> is also working fine. I have erased the partition with
>  "flash_eraseall -j" before I copy the image.
>=20
> I also checked the OOB contents. "19 85 20 03 00 00 00
> 08" is at offset 0x10. I also get the same content at
> offset 0x10 if I direct mount an empty partuition. The
> CPU on my board is PowerPC. =20
>=20
> CLEANMARKER node found at 0x00000000 has totlen 0xc !=3D
> normal 0x0
> CLEANMARKER node found at 0x00020000 has totlen 0xc !=3D
> normal 0x0
> CLEANMARKER node found at 0x00040000 has totlen 0xc !=3D
> normal 0x0
> CLEANMARKER node found at 0x00060000 has totlen 0xc !=3D
> normal 0x0
> CLEANMARKER node found at 0x00080000 has totlen 0xc !=3D
> normal 0x0
> CLEANMARKER node found at 0x000a0000 has totlen 0xc !=3D
> normal 0x0
> CLEANMARKER node found at 0x000c0000 has totlen 0xc !=3D
> normal 0x0
>=20
>=20
> _________________________________________________________
> Do You Yahoo!?
> 150=CD=F2=C7=FAMP3=B7=E8=BF=F1=CB=D1=A3=AC=B4=F8=C4=FA=B4=B3=C8=EB=D2=F4=
=C0=D6=B5=EE=CC=C3
> http://music.yisou.com/
> =C3=C0=C5=AE=C3=F7=D0=C7=D3=A6=D3=D0=BE=A1=D3=D0=A3=AC=CB=D1=B1=E9=C3=C0=
=CD=BC=A1=A2=D1=DE=CD=BC=BA=CD=BF=E1=CD=BC
> http://image.yisou.com
> 1G=BE=CD=CA=C71000=D5=D7=A3=AC=D1=C5=BB=A2=B5=E7=D3=CA=D7=D4=D6=FA=C0=A9=
=C8=DD=A3=A1
> http://cn.rd.yahoo.com/mail_cn/tag/1g/*http://cn.mail.yahoo.com/event/m=
ail_1g/
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20

--=20
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
