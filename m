Received: from mx1.prosoftsystems.ru ([212.23.72.203])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OEgdO-0007i9-78
	for linux-mtd@lists.infradead.org; Wed, 19 May 2010 10:36:19 +0000
From: Alexander Pazdnikov <pazdnikov@prosoft.ural.ru>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: ubifs became broken on contigous power-fails
Date: Wed, 19 May 2010 16:36:21 +0600
References: <E1OBqfw-0002Rs-00.pazdnikov-list-ru@f27.mail.ru>
	<201005121330.07802.pazdnikov@prosoft.ural.ru>
	<201005131408.01573.pazdnikov@prosoft.ural.ru>
In-Reply-To: <201005131408.01573.pazdnikov@prosoft.ural.ru>
MIME-Version: 1.0
Message-ID: <201005191636.21845.pazdnikov@prosoft.ural.ru>
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
Reply-To: pazdnikov@prosoftsystems.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =FE=C5=D4=D7=C5=D2=C7 13 =CD=C1=D1 2=
010 14:08:01 =C1=D7=D4=CF=D2 Alexander Pazdnikov =CE=C1=D0=C9=D3=C1=CC:
> We've separated EC and VID headers to different pages, setuped 4 devices =
on
> test run.

We've setuped 5 devices with EC and VID headers in one page (data offset =
=3D=20
2048) and 5 devices with EC and VID headers in separate pages (data offset =
=3D=20
4096).

On all devices the filesystem can became broken.

But a strange thing we've admited. If FS became broken then mounting it by=
=20
hand at boot time in RO mode and then remounting in RW mode repairs the=20
filesystem and an assertion and the following=20
error disappears:

UBIFS error (pid 462): ubifs_rcvry_gc_commit: could not find a dirty LEB

UBIFS error (pid 495): ubifs_leb_unmap: unmap LEB -1 failed, error -22


Any advices, please.

=2D-
Best regards,
Sasha
