Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16bmDO-0005uk-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Feb 2002 17:32:06 +0000
Date: Fri, 15 Feb 2002 18:43:15 +0100 (MET)
From: Robert Kaiser <rob@sysgo.de>
To: David Woodhouse <dwmw2@infradead.org>
cc: linux-mtd@lists.infradead.org, J?rn Engel <joern@wohnheim.fh-wedel.de>
Subject: Re: MTD concat layer 
In-Reply-To: <3402.1013788700@redhat.com>
Message-ID: <Pine.LNX.4.21.0202151806180.9629-100000@dagobert.svc.sysgo.de>
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


On Fri, 15 Feb 2002, David Woodhouse wrote:

>=20
> > +#if defined(CONFIG_MTD_CONCAT) || defined(CONFIG_MTD_CONCAT_MODULE)=20
>=20
> Don't ever do that. Modules should be, well, modular - don't make other=
=20
> stuff depend on whether you happened to build a particular module today o=
r=20
> not.
>=20

OK, I'll change it.

> It doesn't look like you have the concat_erase code right. An erase which=
=20
> covers more than one subdev will only get partially done.

OK, will look into this. I stole that part from Aleksander Sanochkin's
patch. I did test it, BTW (with erase/eraseall), and it worked.
Apparently, these tools erase the device block by block. Is it
legal/supported at all to make erase calls covering multiple blocks or
partial blocks ?

>=20
> I think the best way to do this would be to merge it with the existing
> partition code.


Hmm, I agreed with you about this before I actually attempted coding it
this way, but the code turned out to be a mess. IMHO, it is _much_ cleaner
as a seperate layer. What would be the advantage of merging it into the
partition code ?

Disadvantages are:

- more overhead for parties requiring only partitioning or only
  concatenating.
- significant effort, specifically since the current partitioning
  code is scheduled for replacement by J=F6rn's code, so I'd have to
  do it twice.

Cheers

Rob

----------------------------------------------------------------
Robert Kaiser                          email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany    fax:   (49) 6136 9948-10
