Received: from mgw-ext14.nokia.com ([131.228.20.173])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GdR0T-0000pN-W7
	for linux-mtd@lists.infradead.org; Fri, 27 Oct 2006 08:40:24 -0400
Subject: Re: mtd-utils/flash_erase modifications
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0610261052070.25906@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0610261052070.25906@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 27 Oct 2006 15:39:56 +0300
Message-Id: <1161952796.3080.8.camel@sauron>
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

Hello Ricard,

On Fri, 2006-10-27 at 14:30 +0200, Ricard Wanderlof wrote:
> 1.
> Looking at the mtd-utils/flash_erase application (mtd-utils 1.0.1), and=20
> considering its use for nand flashes, there is no bad block management,
> i.e. if flash_erase hits a bad block, it exits with an error message.
> I would like to see (perhaps governed by an option) that it simply
> skips bad blocks.

Never used this utility, but granted you are saying the truth, you are
obviously right :-))

> 2.
> Furthermore, it would be nice to be able to disable the output of the=20
> program. As it stands, it outputs a line for each block/sector it erases.=
=20
> I would suggest a --verbose or -v option in order to enable this output.

Err, are you talking about flash_erase?

> 3.
> And finally, by default, the program only erases the first block, unless=20
> some options are given. If one wants to erase a whole mtd device or=20
> partition, the number of blocks must be known and given to flash_erase. I=
t=20
> would be nice to have a default behavior, or perhaps using an option for=20
> backwards compatibility's sake, to simply erase the whole device.

There is flash_eraseall utility for this, isn't it? Although it may be
reasonable to have all this functionality in one utility/

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
