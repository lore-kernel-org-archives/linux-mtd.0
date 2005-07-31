Message-ID: <42EC6AE7.6070507@yandex.ru>
Date: Sun, 31 Jul 2005 10:08:39 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Cal=F2_Massimo?= <m.calo@ctsgroup.it>
References: <000501c59390$435ae050$050213ac@MCaloMobile>
In-Reply-To: <000501c59390$435ae050$050213ac@MCaloMobile>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "ucLinux-Mtd@Lists. Infradead. Org" <Linux-Mtd@Lists.Infradead.Org>
Subject: Re: Newly-erased Block...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Cal=F2 Massimo wrote:
> I receive the following msg:
>=20
> 	Newly-erased block contained wod xxxx at offset xxxx
> 	Newly-erased block contained wod xxxx at offset xxxx
>=20

There is an extra check in JFFS2 which makes shure that the newly=20
earased flash eraseblock contains only 0xFF bytes. In fact, this is=20
overkill and I'd like to move that check into the JFFS2 debugging stuff.

JFFS2 issued the erase command then found that the block contains some=20
trash. That's not JFFS2's fault. Dig your flash driver/hardware.

--=20
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
