Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sgip7-0001VX-2y
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 20:45:21 +0000
Received: by bkwj4 with SMTP id j4so5102414bkw.36
 for <linux-mtd@lists.infradead.org>; Mon, 18 Jun 2012 13:45:19 -0700 (PDT)
Message-ID: <1340052317.1971.14.camel@koala>
Subject: Re: ubifs error : read_znode: bad indexing node
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Date: Mon, 18 Jun 2012 23:45:17 +0300
In-Reply-To: <4FD5F9D6.9020800@parrot.com>
References: <4FD5F9D6.9020800@parrot.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-dUdVUu2HkwlmTYfsiJmx"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-dUdVUu2HkwlmTYfsiJmx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 2012-06-11 at 15:59 +0200, Matthieu CASTET wrote:
> we have products where rw ubifs partition are corrupted.
> They all failed with the "read_znode: bad indexing node at LEB 558:22056,=
 error
> 6" or "read_znode: bad indexing node at LEB 446:62888, error 2".

So we read the indexing node, and its CRC is correct, but then we
validate it by checking that various fields are withing possible limits,
and we see that there is some garbage.

This smells more like memory corruption somewhere - we write garbage or
corrupted buffers to the media.

I guess it would be a good improvement to UBIFS if we validated when we
write, not only read, then we could catch issues earlier.

> The last ubifs stable commit we have is
> http://git.infradead.org/users/dedekind/ubifs-v2.6.32.git/commit/7eb3b6c0=
999bd2cbc37adb2bd0fb8127f98240ea

Does not look like something which could cause those errors. Is that
problem reproducible? Only on these devices or on other too?


> Do you know if the bug is known ?
> Google doesn't provide any info on this and looking at ubifs new commits =
don't
> provide explicit bug fix.

No, this is the first time I see such a problem.

> Are there any document that explain how znode works ?

Well, Adrian's PDF file may give some insight. znode is just an in-RAM
representation of an indexing node on the flash.

--=20
Best Regards,
Artem Bityutskiy

--=-dUdVUu2HkwlmTYfsiJmx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP35NdAAoJECmIfjd9wqK05wgQAL8dDyVA3Mm0IWZNqvK/TDia
YQ2oq2hE4UWvH2j41VPIvYtkYzSyFXyU+vGPKVYyVhNXwcdhdwhvLbHvSObJDoGu
OuLxfnoA01cAMNihIx25D0ONdDNsVoggorZT1Rq8tL7Qw/CUUoXKGlocRfJ84wDk
o07tTILM37y2QCf4mlFQwgYdgP2OUnKWgPxMjKH9x6yU5n65i5pT51PG6yviIUNR
nRO3nqGMInWDLRE6GMwCcD73QNNaObvEm7alTWx4RrG/ix9C1ZeSHbl4TV4FNFP4
mdN28QVoootARYPBBSvs8Z4rdFJ4nEL2V/8sXA35ThJVb4KEHQQBHYuTF+hSYa9I
gIs4hIjlCBPnWgM5rfrcanmcPlXgtABMfDHxiWSttD3qJfoEx1cSZSsrS7bHUfn3
DgHjbdFDygPGE205aApXuX9CLAZk5O3yLkhqpnPlyXsZ1ttILS2DCf2zC64WaOti
H+h+illhWMWiHW4pbFL47cD8NJOMn2uBnnIoafAhoSqmYOfq1IBTIAET47vltxvW
Zt4vA/Tf9/V6giiEq4lrd87FqFo4dOgak5OyLWZXtxYKxhWLem9JlFSFWd7t21Bf
Jsj3IW8gOGnsCPQaA/6gsoBoRIRcq5f4jHZt3xJzFEaioUXcn51nBYYZHqLwYk6g
FRFJNITiSRti4iznUGTh
=HkRw
-----END PGP SIGNATURE-----

--=-dUdVUu2HkwlmTYfsiJmx--
