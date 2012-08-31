Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T7QEd-0004Ge-Go
 for linux-mtd@lists.infradead.org; Fri, 31 Aug 2012 12:22:04 +0000
Message-ID: <1346416026.9709.47.camel@sauron.fi.intel.com>
Subject: Re: FW: UBIFS tools and latest 2.6.33 kernel from
 http://git.infradead.org/users/dedekind/ubifs-v2.6.33.git
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Clark <dclark@tantalus.com>
Date: Fri, 31 Aug 2012 15:27:06 +0300
In-Reply-To: <886EEBE3AFFFB144AA8169C199AB4E6AA7BC4D5FB8@BBMBX.backbone.local>
References: <886EEBE3AFFFB144AA8169C199AB4E6AA7BC4D5FB8@BBMBX.backbone.local>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-+xpOda9LWWRb5HSGS1AU"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-+xpOda9LWWRb5HSGS1AU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, 2012-08-24 at 12:39 -0700, David Clark wrote:
> UBI error: io_init: bad write buffer size 0 for 1 min. I/O unit

This means your NOR driver should be fixed and it should return
_correct_ write buffer size, not 0.


--=20
Best Regards,
Artem Bityutskiy

--=-+xpOda9LWWRb5HSGS1AU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQQK2aAAoJECmIfjd9wqK0jekQAJBmKKjCqUQSiiH0uxv60pL3
JKQwyRc5P1j+dhoFu5Yd0l/e4La3sWUAzdC0GqSPJh5b6qQ3gxkfGMI12+0nEd35
fc1IXqkKdxMgoBBxeEmCT1oL2Pp8hYCH9QfImSPw2kZsbpPPKGaevd2PLi0fpPTx
NQo78cWRk+CARKXBeM3MfAizKHaAxQnGi9a6j7yZ+ghgos7qB2ts45bHmMlqnAC4
VB4LMi8fTuEqqwvLuDW+U7SFLzEKkPaD7ohjqc2U2fsWf2yJzXxY6j5CNFLHbd9c
LvepCZZc5zF7uhK4vuAz6VYb7v95TlVsBO8TvQMfxuNbryEky04S/ZNnzO9Q+ASj
V29wYBOtan6xONAYvkfnyjMWcmEygaKVhDNXrVEXXVDLz/XcUHnoY6Zv+7AxqWOH
C8aQFTDP3KD4+QUArBPLZOIhAMXoUJriPSWIf8ik2/c6a9BeBAVKAZjzcVsjDg+r
ojyTE3PcUEV2m4681w5w/pVit8Qa/BGlKgT+rekLaFzzgVZqplv2YIZkQ3q2POgL
rdYHaWV39M+herk/V4FSErd+SR0ioCrLRQjT811O3eeZ0/8unIkt7SJxYA/+I3jj
C90cpC+iDb1X+BqOzpB1Fx2s4ouwevdeiNLVhp7tcb15JwzRGMg5BusKK3CJwene
SD/u86uTUfo5cqCxisvx
=dOyO
-----END PGP SIGNATURE-----

--=-+xpOda9LWWRb5HSGS1AU--
