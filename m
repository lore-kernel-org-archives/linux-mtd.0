Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H4xVb-0004Rp-2x
	for linux-mtd@lists.infradead.org; Thu, 11 Jan 2007 05:50:14 -0500
Subject: Re: max_ec value is shown as 1
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sandeep Kumar <sandeepksinha@gmail.com>
In-Reply-To: <37d33d830701110244m58afec33hcf77323e4dc550f3@mail.gmail.com>
References: <37d33d830701110244m58afec33hcf77323e4dc550f3@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jan 2007 12:49:41 +0200
Message-Id: <1168512581.26936.33.camel@sauron>
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

Hello Sandeep,

On Thu, 2007-01-11 at 10:44 +0000, Sandeep Kumar wrote:
> [root@localhost ubi]#cd /sys/class/ubi/ubi0/
> [root@localhost ubi0]# cat max_ec
> 1
>=20
> Well, Can anyone help me in determining that why the max_ec is shown as 1=
.

What did you expect instead?

You fed empty flash to UBI, UBI erased each eraseblock once and put
erase counter header to each eraseblock, with erase counter =3D 1, because
there was one erase.

And max_ec which means maximum erase counter value is 1.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
