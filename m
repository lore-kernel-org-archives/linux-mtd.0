Received: from mail.erinc.com ([216.158.10.5])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1899Ks-0000mB-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Nov 2002 19:26:03 +0000
Message-ID: <F4608F665DF5D311B231009027B70F700131DF9D@MAIL>
From: Junping Zhang <JZhang@erinc.com>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>,
	Junping Zhang <JZhang@erinc.com>
Cc: linux-mtd@lists.infradead.org
Subject: RE: seeking help on JFFS2
Date: Tue, 5 Nov 2002 14:56:56 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

J=F6rn,

   I just tested 2.4.19 with shared-zlib patch, same behavior. I could =
use
the JFFS2 system,
but it will eventually crash after a while.

   The flash chip is original from Motorola: 8M, 80 pin SIMM, SM73228. =
I
used Christian's
map file. Since JFFS works on it without any problem, should I safely =
assume
the MTD layer
is correct?

    I appreciate your thought, but my company won't let me give people
direct access. I will
check out the latest MTD from cvs tonight and give it a try tomorrow.

    Thanks

-   Junping

> -----Original Message-----
> From:	J=F6rn Engel [SMTP:joern@wohnheim.fh-wedel.de]
> Sent:	Tuesday, November 05, 2002 2:31 PM
> To:	Junping Zhang
> Cc:	linux-mtd@lists.infradead.org
> Subject:	Re: seeking help on JFFS2
>=20
> On Tue, 5 November 2002 12:39:31 -0500, Junping Zhang wrote:
> > Yes, the minor number is 2, and I checked mkfs.jffs2 source, hex is =
ok.
> I
> > also tried with
> > the method you mentioned, the crashed happened right away.
>=20
> Ok.
>=20
> > I just tried using the stock JFFS2 in 2.4.18 kernel. It actually =
got me
> > further than JFFS2
> > in my mtd-20021022 snapshot, I could use either image or direct =
mount to
> > create JFFS2,
> > but it still crashed under stress test. On the other hand, JFFS =
works
> quite
> > well.
>=20
> Ok.
>=20
> > Does stock 2.4.19 have a stable JFFS2 without patch? I downloaded a
> > shared-zlib patch
> > for 2.4.19-pre10 but am not sure it will fix my JFFS2 problem.
>=20
> 2.4.19 should have a stable jffs2, as should 2.4.18. You can try
> 2.4.19, but I don't expect any better behaviour.
>=20
> What flashes do you exactly use? And can you provide ssh login to the
> development host?
>=20
> J=F6rn
>=20
> --=20
> If you're willing to restrict the flexibility of your approach,
> you can almost always do something better.
> -- John Carmack
