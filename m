Received: from ptb-relay02.plus.net ([212.159.14.213])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CflVX-0006ku-5m
	for linux-mtd@lists.infradead.org; Sat, 18 Dec 2004 15:48:56 -0500
From: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20041218181100.GD4147@wohnheim.fh-wedel.de>
References: <1103152743.15913.33.camel@squizzey.bult.co.uk>
	<41C0D3AC.3050801@us.ibm.com>
	<1103158974.15929.37.camel@squizzey.bult.co.uk>
	<1103201631.25765.7.camel@weaponx.rchland.ibm.com>
	<1103232128.15927.70.camel@squizzey.bult.co.uk>
	<41C1FDFF.3020308@us.ibm.com>
	<1103233669.15929.81.camel@squizzey.bult.co.uk>
	<20041218161923.GD1083@wohnheim.fh-wedel.de>
	<1103391155.10788.13.camel@squizzey.bult.co.uk>
	<20041218175222.GB4147@wohnheim.fh-wedel.de>
	<20041218181100.GD4147@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Sat, 18 Dec 2004 20:48:50 +0000
Message-Id: <1103402930.10792.20.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Like I said, hacked to work [for me] and not to look pretty.

To be honest what's there will do me for now .. although I'd like to
clean it up a little when I get time.

fyi; don't confuse the old and new code.

> o Coding style (Lindent?)

Whatever was there already.

> o Function length

My functions are shorter than the ones that were there, lots can be
cleaned up here.

> o #ifdef MODULE

.. ? I only use it as a module, not of this code was touched.

> o parameters have an insane interface

.. again , parameters and interfaces are all from the original with the
exception of a couple of new routines which mirror existing parameter
lists.

> o ro-devices.  the same can be achieved with chmod.

Again, not touched this.

Gareth.

On Sat, 2004-12-18 at 19:11 +0100, J=F6rn Engel wrote:
> On Sat, 18 December 2004 18:52:22 +0100, J=F6rn Engel wrote:
> > On Sat, 18 December 2004 17:32:35 +0000, Gareth Bult (Encryptec) wrot=
e:
> > >=20
> > > There's a public health warning attached to this code ..
> > >=20
> > > I've not cleaned it up and I've not added any comments ..
> >=20
> > I'll wear protective gloves then.  Thanks!
>=20
> Not a pretty.  Looks like quite a few cleanups from phram.c can be
> applied to this one as well.  From a first glance:
> o Coding style (Lindent?)
> o Function length
> o #ifdef MODULE
> o parameters have an insane interface
> o ro-devices.  the same can be achieved with chmod.
>=20
> But you started the work, which is a good thing.
>=20
> J=F6rn
>=20
