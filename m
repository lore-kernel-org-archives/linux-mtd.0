Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16GO7G-0004if-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Dec 2001 17:33:22 +0000
Date: Tue, 18 Dec 2001 18:44:00 +0100 (MET)
From: Robert Kaiser <rob@sysgo.de>
To: David Woodhouse <dwmw2@infradead.org>
cc: linux-mtd@lists.infradead.org,
   =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Subject: Re: Map driver usage 
In-Reply-To: <16691.1008695901@redhat.com>
Message-ID: <Pine.LNX.4.21.0112181832140.3242-100000@dagobert.svc.sysgo.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


On Tue, 18 Dec 2001, David Woodhouse wrote:

>=20
> rob@sysgo.de said:
> >  OK, so if I implement the copy_from call to break the large transfer
> > into smaller ones if necessary, then I should be safe ?
>=20
> Depending on the flash chips you're using, maybe. Sometimes you need to=
=20
> access the chip with the correct address.

That doesn't sound very reassuring ....

I definitely want the driver to go into the MTD CVS when it's done,
so I guess you wouldn't accept it if I did it this way, right ?

> >  Yep. Only my problem here is, that I want some physically
> > non-contiguous blocks to form a single MTD partition. Is that possible
> > with the MTD partition API ?=20
>=20
> The MTD partitioning code is (currently) just a set of wrappers round the=
=20
> real MTD functions, which add an offset and call the real chip driver's=
=20
> methods. It's fairly simple to do your own such wrapper rather than using=
=20
> the ones in mtdpart.c.

OK, I'll look into that. It will probably mean to duplicate a bit of
stuff from mtdpart.c into my mapping driver, but I guess that's OK
since then I won't need to enable MTD partitioning support at all.
I'll also check Aleksander Sanochkin's code as J=F6rn suggested, maybe
I can keep my stuff compatible with it.

Thanks

Rob

----------------------------------------------------------------
Robert Kaiser                          email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany    fax:   (49) 6136 9948-10
