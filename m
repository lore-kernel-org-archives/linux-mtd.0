Received: from zeus.vortex.is ([193.4.145.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1556vl-0007yf-00
	for <linux-mtd@lists.infradead.org>; Wed, 30 May 2001 15:26:37 +0100
Received: from froskur.flaga.is (mail.flaga.is [193.4.144.1])
          by zeus.vortex.is (Post.Office MTA v3.5.3 release 223
          ID# 0-71211U5000L1850S0V35) with ESMTP id is
          for <linux-mtd@lists.infradead.org>;
          Wed, 30 May 2001 14:30:51 +0000
Received: from kolkrabbi.flaga.is ([192.168.145.6]) by froskur.flaga.is
          (Post.Office MTA v3.5.3 release 223 ID# 0-0U10L2S100V35)
          with ESMTP id is for <linux-mtd@lists.infradead.org>;
          Wed, 30 May 2001 14:30:50 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: RE: HOWTO add jffs2 support in Kernel Configuration xconfig
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 May 2001 14:30:50 -0000
Message-ID: <EADB10BAC266A14A85ECBF8686A73E31459191@kolkrabbi.flaga.is>
From: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: "Frederic Giasson" <fgiasson@mediatrix.com>
Cc: <linux-mtd@lists.infradead.org>
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

And add links from fs/jffs2 to the mtd directory in the same way as for
jffs.
see patching.sh

K.D.

> -----Original Message-----
> From: Xavier DEBREUIL [mailto:xde@inventel.fr]
> Sent: 30. ma=ED 2001 14:13
> To: Frederic Giasson
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: HOWTO add jffs2 support in Kernel Configuration xconfig
>=20
>=20
> add some lines equivalent to JFFS line in Config.in file
> Xavier
>=20
> Frederic Giasson a =E9crit :
> >=20
> > Hi,
> >=20
> >         I downloaded lastest MTD and JFFS1-2 from MTD's CVS=20
> site and no
> > options as added to my file system menu in xconfig to=20
> support JFFS2.  Can
> > someone tell me why?
> >=20
> > Thanks!
> >=20
> > Fr=E9d=E9ric Giasson
> >=20
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20
