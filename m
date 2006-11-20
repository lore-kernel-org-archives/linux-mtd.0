Received: from mgw-ext13.nokia.com ([131.228.20.172])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Gm9O3-0005If-8k
	for linux-mtd@lists.infradead.org; Mon, 20 Nov 2006 08:40:44 -0500
Subject: Re: [PATCH] [MTD] BLOCK_RO: Readonly Block Device Layer Over MTD
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <4561A84A.9000807@ru.mvista.com>
References: <20061117184055.569da7ad@localhost.localdomain>
	<1163855713.5597.70.camel@sauron>
	<1163856784.20835.2.camel@zod.rchland.ibm.com>
	<1163856955.5597.71.camel@sauron>  <45619C60.7070400@ru.mvista.com>
	<1164026819.5597.88.camel@sauron>  <4561A84A.9000807@ru.mvista.com>
Content-Type: text/plain; charset=utf-8
Date: Mon, 20 Nov 2006 15:39:44 +0200
Message-Id: <1164029984.5597.100.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, kbaidarov <kbaidarov@dev.rtsoft.ru>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-11-20 at 16:06 +0300, Vitaly Wool wrote:
> Artem Bityutskiy wrote:
> > I am talking about something like this:
> >
> > http://lists.infradead.org/pipermail/linux-mtd/2004-May/009683.html
> >  =20
> This one unconditionally changes mtdblock, doesn't it?

Yes.

Basically speaking, mtdblock was designed for NOR flashes and there were
no bad eraseblocks at all. Now you want to utilize it on NANDs. So you
add BB-awareness functionality. And I still think you should changd
mtdblock_ro instead of adding new driver.

Why? Because if you change mtdblock_ro:

1. you do not change semantics at all. in case of old BB-less flashes
all stays the same old way. So I do not understand why you need a new
device number.

2. You make mtdblock_ro workable on NAND. You extend it. You have right
to slightly change the semantics. 1:1 mapping makes no sense in this
case, so it is logical to skip bad blocks. Instead you add a new driver.
Strange.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
