Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IB5HI-0005Ad-DN
	for linux-mtd@lists.infradead.org; Wed, 18 Jul 2007 04:53:02 -0400
Subject: Re: UBI: Can we handle -EINTR differently in erase/write path???
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vinit Agnihotri <vinit.agnihotri@gmail.com>
In-Reply-To: <9b52d64c0707122307j419d2d98xa771c2c09a280164@mail.gmail.com>
References: <9b52d64c0707122307j419d2d98xa771c2c09a280164@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 18 Jul 2007 11:52:44 +0300
Message-Id: <1184748764.3531.158.camel@sauron>
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

On Fri, 2007-07-13 at 11:37 +0530, Vinit Agnihotri wrote:
> Hi heres few code snip from erase_worker(); from wl.c
> if (err !=3D -EIO) {
>         /*
>          * If this is not %-EIO, we have no idea what to do. Scheduling
>          * this physical eraseblock for erasure again would cause
>          * errors again and again. Well, lets switch to RO mode.
>          */
>         ubi_ro_mode(ubi);
>         return err;
>     }
>=20
> Suppose while erasure in progress & someone pressed "Ctrl+C" then UBI
> straight way marks entire device as Read only & its really painful
> because then you cant even delete that volume as UBI is read only.
> Which I guess its not good way. If use cases are considered it is
> highly likely that user can hit "Ctrl+c" , like he want to cancel
> erase at that time or something like that. So we can handle -EINTR
> differently by following way

I've fixed this in the erase worker. Please, check.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
