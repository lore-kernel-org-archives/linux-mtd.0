Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GsgA1-000570-Fv
	for linux-mtd@lists.infradead.org; Fri, 08 Dec 2006 08:53:15 -0500
Subject: Re: Eraseblocks torture: OneNAND results
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0612081405270.22217@lnxricardw.se.axis.com>
References: <19898399.377451165543227681.JavaMail.weblogic@ep_ml03>
	<1165558783.20337.112.camel@sauron>
	<Pine.LNX.4.64.0612081405270.22217@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 08 Dec 2006 15:52:30 +0200
Message-Id: <1165585950.3975.15.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Ricard,

On Fri, 2006-12-08 at 14:43 +0100, Ricard Wanderlof wrote:
> Isn't 100000 a figure quoted by the flash manufacturer to be the _minimum=
_=20
> number of erase cycles, a specification which all devices must meet, even=
=20
> at extreme operating conditions (e.g. high temperature and extreme supply=
=20
> voltages)? That would imply that during more ordinary conditions, a rando=
m=20
> sample of flash chip would very likely be erasable many more times.

Probably. Not sure. Need to carefully look to the manual. Do not have it
now handy. But probably you are right. Also HW guys say that such a very
frequent erase may matter.

> Another thing: Why implement it as a kernel module? Speed I would assume?
Yeah, wanted to make it quicker.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
