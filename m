Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IYFPQ-0008Bc-Gm
	for linux-mtd@lists.infradead.org; Thu, 20 Sep 2007 02:21:11 -0400
Subject: Re: mkfs.jffs2 and mksum
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0709192310080.28990@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0709191538050.1701@assari.cc.tut.fi>
	<1190206217.14370.155.camel@sauron> <46F12C4D.9060204@tut.fi>
	<1190211192.14370.166.camel@sauron> <46F13100.9020705@tut.fi>
	<1190213260.14370.188.camel@sauron> <46F1586D.7030605@tut.fi>
	<Pine.LNX.4.64.0709192310080.28990@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 20 Sep 2007 09:20:23 +0300
Message-Id: <1190269223.14370.191.camel@sauron>
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

On Wed, 2007-09-19 at 23:12 +0200, Ricard Wanderlof wrote:
> When creating an image for NAND flash, you normally don't want=20
> cleanmarkers in the image, as the cleanmarkers end up in the OOB anyway=20
> (which is not part of the image). Do this by specifying --no-cleanmarkers=
=20
> to mkfs.jffs2.

Oh my, right, I missed this, yeah.


--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
