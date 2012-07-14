Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SpuE7-0006Gf-Mh
 for linux-mtd@lists.infradead.org; Sat, 14 Jul 2012 04:45:09 +0000
Received: by lbbgg6 with SMTP id gg6so5729939lbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2012 21:45:01 -0700 (PDT)
Message-ID: <1342240778.3209.12.camel@brekeke>
Subject: RE: UBIFS fails to mount on second boot
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
Date: Sat, 14 Jul 2012 07:39:38 +0300
In-Reply-To: <6871BC8982B258468985EE735D2C575243C0F088B7@ntcex01.corp.netcomm.com.au>
References: <CAEZtdFU1cET8=kViUsR0Oq3q0ckcFLuKsd_Hc5WHo_uhFiKVBw@mail.gmail.com>
 ,<1340806219.3070.23.camel@sauron.fi.intel.com>
 <6871BC8982B258468985EE735D2C575243C0F0889A@ntcex01.corp.netcomm.com.au>
 ,<1340977577.3070.207.camel@sauron.fi.intel.com>
 ,<6871BC8982B258468985EE735D2C575243C0F088B6@ntcex01.corp.netcomm.com.au>
 <6871BC8982B258468985EE735D2C575243C0F088B7@ntcex01.corp.netcomm.com.au>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-2dJm+l4VNElAVarP0Jf2"
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


--=-2dJm+l4VNElAVarP0Jf2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-07-03 at 11:16 +1000, Iwo Mergler wrote:
> Thanks for the hint, I have. Turns out it's fairly simple, just pass
> ddebug_query=3D"module ubifs +p" on the command line. Unfortunately,
> the way ddebug parses the line, you can only have one rule there.

Iwo, if you send more logs, please, include function names because
otherwise the logs are very difficult to follow. I think it wold be +pf.
>=20
> I think there may be a change in newer kernels that allows to use
> a semicolon as a separator between rules, but my kernel doesn't
> allow that.
>=20
> So I had to make two debug runs, one each for ubi and ubifs debugging
> enabled.
>=20
> The attached archive contains 4 log files:
>=20
> konsole_ubi_1.txt   =3D first (successful) boot with UBI debug enabled
> konsole_ubi_2.txt   =3D second (failed) boot with UBI debug enabled
> konsole_ubifs_1.txt =3D first (successful) boot with UBIFS debug enabled
> konsole_ubifs_2.txt =3D second (failed) boot with UBIFS debug enabled=20

I suspect this is a bug in the free space fixup code - my level of
confidence on this is 80%. Could you please verify this by removing the
-F mkfs.ubifs parameter or using the patch below. Thanks!

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 5862dd9..3398114 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1295,11 +1295,13 @@ static int mount_ubifs(struct ubifs_info *c)
 	if (err)
 		goto out_master;
=20
+#if 0
 	if (!c->ro_mount && c->space_fixup) {
 		err =3D ubifs_fixup_free_space(c);
 		if (err)
 			goto out_lpt;
 	}
+#endif
=20
 	if (!c->ro_mount) {
 		/*

--=20
Best Regards,
Artem Bityutskiy

--=-2dJm+l4VNElAVarP0Jf2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQAPgKAAoJECmIfjd9wqK0YH0QAKiUV34Dj0f5H3I9/thPS1Ut
1J8US2WWRQP5arNHCO2oID1vuK7yHn1EwA7jKYqMTEWKnuNRTIwCf1WUhBDXApx5
Hfq+l7WituuZ4Clhf1YxzL9unKwcfmoFe8MvVjHCjNBvLhEMIcE257HsOB1irW4Y
eDGIDzlJcKIpggiRQzYLk9CXx6/xDySIH63wZ+SOWZ7BS+ELT51KXFRh2nCflhZs
VR9qpjoBKHY6HSHgLGIuXDj4Lm5mQtEjVOeiwWSY06SK8DHN1VZFOlIKgD861O32
OTHhoEde1C2nJE+4+2k+fgfhgxjYhN+xzGYTvit0TYBO/LNoneTlZm5PxosELay6
/nkVvI+odz1KVD0Kj11VN2iEZDvQVJVgF3Vhq/kq2gBNX7o9RKeHkRP+IDlfcwCO
GbRAVZp1N3uC+uCtYFNhDRftTJ5pxdw5GaRFg1l73ScRWFAZcCXi/R1HNUCfsvwq
34bBbG4CPIJYoG6W7zNAvEM+jiau7cMX7wO/Lpp5mmMu95YNSTBUJyDtvfydunTE
UmTOts/sT4f2uMbWYqGEFcHfoYqTSTuisF+2yXNAiCWy5UfyPdBJE0ibZn6NtjZq
7ib0yOXpmAHeNDVSrX5Kb0OK9eFOlL1fhUHH6banXg+lI24TLscMq8KMscpYvMtx
/ZTQK9FhCGgAHaASFRFv
=sIRN
-----END PGP SIGNATURE-----

--=-2dJm+l4VNElAVarP0Jf2--
