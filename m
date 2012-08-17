Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T2M2z-0006Ho-MC
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 12:53:06 +0000
Message-ID: <1345208270.27859.75.camel@sauron.fi.intel.com>
Subject: Re: UBIFS Recovery Issue: 'grab_empty_leb: could not find an empty
 LEB'
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brent Taylor <motobud@gmail.com>
Date: Fri, 17 Aug 2012 15:57:50 +0300
In-Reply-To: <loom.20120813T153641-586@post.gmane.org>
References: <CAP+RiCC1afVbKAZESMcZGd1G3+7aKuLTQGggOEFGZxQM6o+QQA@mail.gmail.com>
 <loom.20120813T153641-586@post.gmane.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-3epVIuSEtUNtRZ2T2Nzk"
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


--=-3epVIuSEtUNtRZ2T2Nzk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-08-13 at 13:41 +0000, Brent Taylor wrote:
> I've been running with the patched kernel for about a month now and I've =
seen
> this issue once since then.  Does anyone have any other ideas on how I ca=
n
> better track this down.  I've taken precautions to test if the external d=
ata
> partitions mounted properly, if not, then they are reformatted and initia=
lized.
>  I will have a problem if the issue occurs in the root filesystem.

What kind of test do you run?

--=20
Best Regards,
Artem Bityutskiy

--=-3epVIuSEtUNtRZ2T2Nzk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLj/OAAoJECmIfjd9wqK02xEP/Rgnk3hxHhC32g3Cv3UBfzcz
49Sk+fpml4bm9q1VX8DjOtC6d4obllg62S8TTHpx+6//BeirmLD05YIpiO54pDty
vrPW+aIrBfgDXpV1ExJxb8ReeoEVifjTm3wOD+0THqlV6FqGm5aKkLXb3fhsyo6K
gNr0YFx0xsGv6fxe0Ivhd7M/3dx44+4Ch2aUMTBIuPK/awE4NrkCK8XLDXD0SAJR
yl7xGSY9YfhFlvTrRzCELgqkmV4E+WqcJq6wqCb6SxcKuv1dfTn2zP5d4DucqZZN
C0AxjEkwCEUmbFhnq5Sz4pNsi/IPunTxjyyLAx52v5XTpd/Gfradvi4LwAx3QUH/
m1WgOBdBi2gHJWsy8FRuX4ecBNXecoXqB4tOj0hPH0UFFANZiDyqpEwmjT4hcjLx
I3blDrZVUxqmlvv4QD16fBdCHEhCs71jsWYiRAZI3KtELEApvtEaNb0kZuAbBFE3
p51W5VRfFAgEEphrrvA0pVj2TCBofdWLEZjaOOG213GRa8X0GPv+18gFYNx0nxSx
jHzt9lAqNcKB18Ut0iAUWX6K2uR87b24++yI4a1NL9q11cccg/mvGHSWEF6TiQbM
XxuHPK2YAibb6KrGcVM7zgCv/74r0PsYRbPhymB91+Y2JgMc5zcGvXtVtF6oQDJ7
RfBLZ+Vb1LJX+vLzHQKK
=h1LL
-----END PGP SIGNATURE-----

--=-3epVIuSEtUNtRZ2T2Nzk--
