Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IAiET-0007LA-Uz
	for linux-mtd@lists.infradead.org; Tue, 17 Jul 2007 04:16:38 -0400
Subject: Re: UBI: Can we handle -EINTR differently in erase/write path???
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vinit Agnihotri <vinit.agnihotri@gmail.com>
In-Reply-To: <9b52d64c0707122307j419d2d98xa771c2c09a280164@mail.gmail.com>
References: <9b52d64c0707122307j419d2d98xa771c2c09a280164@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 17 Jul 2007 11:16:15 +0300
Message-Id: <1184660175.3531.130.camel@sauron>
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

Yeah, you are right, feel free to send a patch. The only thing I am
curious about where, at what point the task can be interrupted?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
