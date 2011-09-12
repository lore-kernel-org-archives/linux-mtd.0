Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R30Kr-0005Vr-FU
	for linux-mtd@lists.infradead.org; Mon, 12 Sep 2011 06:49:42 +0000
Date: Mon, 12 Sep 2011 08:41:55 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: mtd-utils: ubiformat: writing images on flash with badblocks.
In-Reply-To: <1315738766.18731.9.camel@sauron>
Message-ID: <Pine.LNX.4.64.1109120840020.8150@lnxricardw.se.axis.com>
References: <CAMjE+nUOxOm4bBWKp1xAcVDjP-Pepd_GuJ=DcQ4jUcsohn-K=g@mail.gmail.com>
	<1315738766.18731.9.camel@sauron>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Anton Olofsson <anol.martinsson@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On Sun, 11 Sep 2011, Artem Bityutskiy wrote:
>=20
> This issue was reported and analyzed by
> Anton Olofsson <anol.martinsson@gmail.com>:
>=20
> when ubiformat encounters a write error while flashing the UBI image (whi=
ch may
> come from a file of from stdout), it correctly marks the faulty erasebloc=
k as
> bad and skips it. However, it also incorrectly drops the data buffer whic=
h was
> supposed to be written, and reads next block of data.

I'm just curious, how come this has gone unnoticed for so long? One would=
=20
think that someone would have tried to flash an image to a chip with bad=20
blocks a long time ago?

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
