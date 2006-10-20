Received: from mgw-ext14.nokia.com ([131.228.20.173])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GaweZ-0006tq-6Y
	for linux-mtd@lists.infradead.org; Fri, 20 Oct 2006 11:51:32 -0400
Subject: Re: [PATCH] [MTD] [NAND]: nand_default_mark_blockbad() doesn't
	work when flash-based bbt not enabled
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0610201728220.25906@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0610201728220.25906@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 20 Oct 2006 18:51:18 +0300
Message-Id: <1161359478.3260.155.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-10-20 at 17:36 +0200, Ricard Wanderlof wrote:
>   		ofs +=3D mtd->oobsize;
> -		chip->ops.len =3D 2;
> +		chip->ops.ooblen =3D 2;
>   		chip->ops.datbuf =3D NULL;
>   		chip->ops.oobbuf =3D buf;
>   		chip->ops.ooboffs =3D chip->badblockpos & ~0x01;

What is len and ooblen? Who initializes len then? I see len is used
later on.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
