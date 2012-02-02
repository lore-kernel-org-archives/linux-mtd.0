Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rsuz4-0005Yo-32
 for linux-mtd@lists.infradead.org; Thu, 02 Feb 2012 11:37:46 +0000
Received: by dakp5 with SMTP id p5so2114784dak.36
 for <linux-mtd@lists.infradead.org>; Thu, 02 Feb 2012 03:37:43 -0800 (PST)
Message-ID: <1328182782.28171.162.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: mtdcore: remove unnecessary mtd->resume check
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 02 Feb 2012 13:39:42 +0200
In-Reply-To: <1327696772-18081-1-git-send-email-computersforpeace@gmail.com>
References: <1327696772-18081-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-TNuJbcpCohgchoM+Yr2J"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-TNuJbcpCohgchoM+Yr2J
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-01-27 at 12:39 -0800, Brian Norris wrote:
> We don't need to to check for mtd->resume before calling mtd_resume().
> mtd_resume() should take care of that.
>=20
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-TNuJbcpCohgchoM+Yr2J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPKnX+AAoJECmIfjd9wqK010MP/RfbdJ96B8tPq+8yypXUIqMB
AE4X2xqxU4GZTy8dBjflohYH4zBVXWwvB+gwie3dZAkedZSXJoREr4NkFKsGv+zn
SHdVe/YYIiiSQOR00st3NgIk2v+jj+6oDio6KYNrhrboLeMxTghlLVvF3Nfgvxv4
bG6VyIYFMd9va+ntBQ7rgaZjnksdvIib+NArZdcbBVnvrmZtHcvhSFFii/O6qyE2
2VZeg6tPuGiSTzWnrFJB4HIgcYpRZ0Q1gvysVMm26kjdEJVcXouOQ4y/vow5gpa7
3npw2djO3xgQuekZv6fcIwgUWFSK9/5LVwdUn13RrjTMpIrJ8W4rcfYzTjCp292O
zVoslScdNX2ivbhaGJTMVWhMrcn6CTC/v4u4JysPvq3acbfNKi5EpRkXNxL9xOcR
D7tDHqdqjPEpsQyIFTlBwoAAajHhffVUDd3XUi3fPJcBcUnvjbYSy6ucWQ5C2bpV
vR6kX4OgdhvwhbsQJNsS5tIcZ6bA4mpOEsmxVjMeHwSyYwlg6TEH6g9whzU2RuCL
eCJ44SCNynyvgXY3DzNsSxI5umYLMXUyu1RLL/D2p5Rm6DLN8+tb8lR8SNFjOHiQ
eoqOjxh+FBkAtkGx6LGLvSunhR8748syKVkZG9YWDjRzcRK+k4MiWYr887NfcEQS
sGZD4mKe+H59VUUW2xJ9
=oTjw
-----END PGP SIGNATURE-----

--=-TNuJbcpCohgchoM+Yr2J--
