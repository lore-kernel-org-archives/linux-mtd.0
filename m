Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1ITFQh-0005jk-Hu
	for linux-mtd@lists.infradead.org; Thu, 06 Sep 2007 07:21:50 -0400
Subject: Re: General performance of NAND operations i.e mount and ls
From: Artem Bityutskiy <dedekind@infradead.org>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <20070906093735.GD2164@z1.synertronixx>
References: <20070906081215.GA5693@anita.doom>
	<1189067241.14370.23.camel@sauron>
	<20070906084418.GC2164@z1.synertronixx>
	<1189069864.14370.34.camel@sauron>
	<20070906093735.GD2164@z1.synertronixx>
Content-Type: text/plain; charset=utf-8
Date: Thu, 06 Sep 2007 14:21:33 +0300
Message-Id: <1189077693.14370.60.camel@sauron>
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

On Thu, 2007-09-06 at 11:37 +0200, Konstantin Kletschke wrote:
> Okay, what would I roughly excpect on this system?
>=20
> # time dd if=3D/dev/mtd4 of=3D/dev/null bs=3D4096 count=3D512
> 512+0 records in
> 512+0 records out
> real    0m 0.61s
> user    0m 0.01s
> sys     0m 0.61s
> # time dd if=3D/dev/zero of=3D/dev/mtd4 bs=3D4096 count=3D512
> 512+0 records in
> 512+0 records out
> real    0m 1.08s
> user    0m 0.00s
> sys     0m 1.08s

Not sure about your system, but the hardware I worked with was ~8 times
faster on read and ~3 times faster on write.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
