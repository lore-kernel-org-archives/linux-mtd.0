Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GuR5o-0005VG-BM
	for linux-mtd@lists.infradead.org; Wed, 13 Dec 2006 05:12:08 -0500
Subject: Re: copy data to nandflash problem with jffs2 filesystem
From: Artem Bityutskiy <dedekind@infradead.org>
To: li jie <cqdxlijie@hotmail.com>
In-Reply-To: <BAY20-F68D041081ABC327FF435DA2D60@phx.gbl>
References: <BAY20-F68D041081ABC327FF435DA2D60@phx.gbl>
Content-Type: text/plain; charset=utf-8
Date: Wed, 13 Dec 2006 12:11:51 +0200
Message-Id: <1166004711.16396.8.camel@sauron>
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

On Wed, 2006-12-13 at 17:36 +0800, li jie wrote:
>  =E2=96=B22. using the tools "flash_eraseall -j /dev/mtd6 " //,passed
> =20
>  =E2=96=B23. # mount -tjffs2 /dev/mtdblock3 /mnt/ ,         // passed  =20
>      =20
>     # mount -tjffs2 /dev/mtdblock4 /mnt4/          //warning=20
>      jffs2: Erase block size too small (16KiB). Using virtual blocks size=
=20
> (32KiB) instead
>    =20
>     when i copy data to /mn4 or /mnt ,   I got the error messagesat the=20
> end:

Something wrong with your flash driver. Also, try to use newer JFFS2.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
