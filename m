From: =?iso-8859-1?Q?Cal=F2_Massimo?= <m.calo@ctsgroup.it>
To: <dedekind@yandex.ru>
Date: Tue, 26 Jul 2005 13:30:27 +0200
Message-ID: <001a01c591d5$6d2eeaa0$050213ac@MCaloMobile>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Cc: "ucLinux-Mtd@Lists. Infradead. Org" <Linux-Mtd@Lists.Infradead.Org>
Subject: I: Jffs2 space problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



-----Messaggio originale-----
Da: Cal=F2 Massimo [mailto:m.calo@ctsgroup.it]=20
Inviato: marted=EC 26 luglio 2005 12.23
A: 'Artem B. Bityuckiy'
Oggetto: R: Jffs2 space problem


Hi Artem,

>>Pardon, do you unmount JFFS2 before the erase :-) ?
=20
Yes I did.

I think my strange prblem with the space of the partition is connected =
to
the msg that I receive after the mount command :

	/>mount -t jffs2 /dev/mtdblock5 /mnt

I receive the following msg:

	Newly-erased block contained wod xxxx at offset xxxx
	Newly-erased block contained wod xxxx at offset xxxx

Can you help me on finding the rason of this msg?

Many thanks!


-----Messaggio originale-----
Da: Artem B. Bityuckiy [mailto:dedekind@yandex.ru]=20
Inviato: marted=EC 26 luglio 2005 12.06
A: Cal=F2 Massimo
Cc: ucLinux-Mtd@Lists. Infradead. Org
Oggetto: Re: Jffs2 space problem


Cal=F2 Massimo wrote:
> Hi all,
>=20
> 	I have a problem with my jffs2 partition.
> I'm using mtd5 (size =3D 64 x 8 =3D 512kb).
> I eraseall the partition but if I do the df command I see that it is
> 100% used ...?!?!?

Pardon, do you unmount JFFS2 before the erase :-) ?

--=20
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
