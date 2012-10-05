Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TK3Zv-00075m-4z
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2012 08:48:16 +0000
Message-ID: <1349426906.20373.77.camel@sauron.fi.intel.com>
Subject: Re: Problem with verify-ing patch (error: arch/m68k/Kconfig.cpu:
 patch does not apply)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Fri, 05 Oct 2012 11:48:26 +0300
In-Reply-To: <1348574785.20474.15.camel@sauron.fi.intel.com>
References: <CACna6rwju0g+sq+vBAfCqFJm=EBLg79G2XoGEKs5n1Y=PcmKBg@mail.gmail.com>
 <1348499094.4880.65.camel@sauron.fi.intel.com>
 <CACna6ryu06qsgX99kdkeDaB+XJv4XwC0-O+5ysNFa1iOMEgNow@mail.gmail.com>
 <1348574785.20474.15.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-e7cyUpvIYh1lNTF1Cd6n"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-e7cyUpvIYh1lNTF1Cd6n
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-09-25 at 15:06 +0300, Artem Bityutskiy wrote:
> I'll do the fixes as soon as I have some time, please, keep bugging me
> and thanks for your feed-back!

I've just pushed a change which should improve user-friendliness. Now I
check for dependencies in many places and try to inform the user if a
program is missing, plus give some suggestions where to take it from.
E.g., for cross-tools I print the URL where one can download pre-built
cross-tools.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-e7cyUpvIYh1lNTF1Cd6n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQbp7aAAoJECmIfjd9wqK0gQAP/1QbvMw/r+oWPO00hoGZ2pNF
/rtQVMxmp58L8KyK1uMvAgxlkpRStlho7//OzdtaZ81nyQpLi4UT4919tsy2Hc+Y
YpJykGJCkRjpCBFphFl1aRDxUgW3JpX/J2gikB3xrnKL12GSPBEa5kglA65BOM09
5GX7ZDXED4MZACMy+BWWOYQzbynCYS2lrk+/eg+vKA8Zyp/k7dlQPQIq8PFRs8He
ZKjmlGNQE1DmiJiblicSPe2I8y/01zi7FAEv5ggBpH8mtnlmRjGQv5Ihkini44aN
cWlrTPbjbvC19Hr2fzP//46KiphXxkr8nIFxoQDzHt6DKWEGaNq59OmRMQt6AEY2
NAicr1R+OvTrHx4M3JcumGqF9fixMoc+W18als/04nbMU8klaccdTaDraTkguJIZ
wkHSb8ZyHrleqDIk3KXXwXJiTbrt6i0wmQsEuNVC0BmTA4AmG2IHNYjeOKwPqpBU
SQnGvp5QuAQnO0WS0s78Lb1LaHtauvE1NPhJl8RpcLVQfc57Qqdik658OlzJQkzu
Q+2HDPzRbh0CQukSeecGW8hcAU8DQDLkFKNSvpAj4gzpBqnXbYEiPcAG83dTLdjI
dS52zuMMpjad2wYz5I/4xwip1mh8kklLWfMEWRPSbKIpxhaKVKaquP8v0cWMCiQg
uADjjf49GZUf7WEkNK8/
=+GX9
-----END PGP SIGNATURE-----

--=-e7cyUpvIYh1lNTF1Cd6n--
