Received: from host.kingdommedia.net ([209.239.36.136] helo=host2.fw2.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17IXXE-0002Xc-00
	for <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2002 17:33:20 +0100
Received: from localhost (CPE0080c8df51b7.cpe.net.cable.rogers.com [24.112.28.188])
	by host2.fw2.com (8.10.2/8.10.2) with ESMTP id g5DGXJY06654
	for <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2002 12:33:19 -0400
Received: from [10.0.0.20] (helo=localhost.localdomain ident=slayne)
	by localhost with esmtp (Exim 3.12 #1 (Debian))
	id 17IXX9-0007O0-00
	for <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2002 12:33:15 -0400
Subject: Re: JFFS2 on 2.2.18
From: Chris AtLee <catlee@canada.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <4337.1023746200@redhat.com>
References: <1023727479.20089.26.camel@geb>   <4337.1023746200@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-GeyQa+SEjckPHMhYiVSo"
Date: 13 Jun 2002 12:33:15 -0400
Message-Id: <1023985995.2224.59.camel@geb>
Mime-Version: 1.0
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

--=-GeyQa+SEjckPHMhYiVSo
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Ok cool, I ditched the page-based write and make a jffs2_file_write
using jffs2_commit_write as a template and it works!

Now I can go back and try to figure out what's going wrong with
reading...The kernel seems able to read files just fine (except device
files...), except every time I access a new file to read I get some
warnings about page locking / unlocking:

The !PageLocked(pg) test at the top of jffs2_readpage_nolock fails and
generates a warning

and

UnlockPage(pg) in jffs2_do_readpage_unlock also generates a warning

This only happens the first time I access a file.  Could it have
something to do with differences between generic_file_read in the 2.2
and 2.4 kernels?

Thanks,
Chris


On Mon, 2002-06-10 at 17:56, David Woodhouse wrote:
>=20
> catlee@canada.com said:
> > I've had some success getting MTD and JFFS (v1) working on my 2.2.18
> > system.  I've been trying over the past few weeks to get JFFS2 up and
> > running.  I've got it to the point where the kernel can read a jffs2
> > partition, but I really have no idea how to get writing to work.  The
> > mechanism for writing seems completely different in 2.2.x than in
> > 2.4.x
>=20
> > Any pointers?  Is anyone else working on this?=20
>=20
> I know of nobody else working on a 2.2 backport. Worst case, you should b=
e=20
> able to ditch the page-based write code and call jffs2_write_file_range()=
=20
> from a jffs2_file_write() which you provide instead of=20
> generic_file_write(), surely?
>=20
> --
> dwmw2
>=20
>=20
>=20


--=-GeyQa+SEjckPHMhYiVSo
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA9CMlLoOgacgDd/cQRAkkpAJ4w1jssnr/yXrMwSXtqYL4m1e+GhQCglrxq
jOTmmf/NW7M19pl6Wp97x0U=
=wNj/
-----END PGP SIGNATURE-----

--=-GeyQa+SEjckPHMhYiVSo--
