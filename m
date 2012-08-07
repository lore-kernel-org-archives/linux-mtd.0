Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SyouA-0005uU-K7
 for linux-mtd@lists.infradead.org; Tue, 07 Aug 2012 18:53:23 +0000
Received: by bkcji2 with SMTP id ji2so1796432bkc.36
 for <linux-mtd@lists.infradead.org>; Tue, 07 Aug 2012 11:53:19 -0700 (PDT)
Message-ID: <1344365587.2036.7.camel@kyv>
Subject: Re: UBI fastmap updates
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Tue, 07 Aug 2012 21:53:07 +0300
In-Reply-To: <5020C3EA.7010009@nod.at>
References: <1341836323-43916-1-git-send-email-richard@nod.at>
 <1343919530.25013.116.camel@sauron.fi.intel.com> <50200096.1070002@nod.at>
 <1344313269.1865.2.camel@kyv> <5020C3EA.7010009@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Eaqkt0rp2K25zoJVOiL0"
Mime-Version: 1.0
Cc: nyoushchenko@mvista.com, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, thomas.wucher@linutronix.de,
 linux-mtd@lists.infradead.org, shmulik.ladkani@gmail.com, tglx@linutronix.de,
 Marius.Mazarel@ugal.ro, tim.bird@am.sony.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Eaqkt0rp2K25zoJVOiL0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-08-07 at 09:29 +0200, Richard Weinberger wrote:
> Am 07.08.2012 06:21, schrieb Artem Bityutskiy:
> > On Mon, 2012-08-06 at 19:36 +0200, Richard Weinberger wrote:
> >> I think we enable fastmap only if a MTD device has more than
> >> UBI_FM_MAX_START*2 PEBs.
> >> Any comments?
> >=20
> > With double space one can make it power-cut tolerant, because you shoul=
d
> > be able to have either old or new fastmap at any point of time.
>=20
> UBI_FM_MAX_START*2 has nothing do to with the Fastmap size.
> IMHO we need a threshold where Fastmap makes sense.
> Technically Fastmap can only be used if a MTD device has >=3D UBI_FM_MAX_=
START
> PEBs.
> But does this makes sense? Fastmap was invented to speedup attaching on *=
large* MTDs,
> The benefit in small MTDs is very little.

You may measure when it starts being reasonable to have fastmap enabled,
or interpolate the data you already have (everything is roughly linear,
should be rather easy).

But of course small flashes do not need fastmap.

Also, did you say in the past that you are going to come up with a
document describing the design, its cons and pros, limitations, and some
numbers. It would help a lot. Even a limited document would be better
than none.

Speaking about numbers, how long does it take to re-write fastmap on a
given flash (say, 1GiB or larger, depending on what HW you have)? How
big is fastmap for a given partitions size? I'd really prefer to see
this information in a document, e.g., a text file, rather than spread
over many e-mails.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-Eaqkt0rp2K25zoJVOiL0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQIWQTAAoJECmIfjd9wqK0yfEQAMZFe3fqKuzkcwDwR/v3vzpN
bbHg43pOQeR0jgVIqljdPYnd3bCxIPgFDc5YJ10r9UdPPniEQma9R2ts4H6nO3+h
+SL3g7R5U4LfmOAoIEhtB+iY7ETKjc9d8G9WG35b5PCXZ4Js9bkZsDzQPmbD/Zdf
q3K5ZDfpK1D8H+2ZVf+DjczXyESgIuOSo+F6WxFW8sSX4uA4amzdWOiwFDMaJg52
GfY3ksBFaqM2iU+6qDprixIxKl5ieiDWXTOVkTIuhtByh2Xi6CLOkvvq8KQx5/D/
m6ZTmKTwimU2giS9qT0BdJ3J6v98yJ+qoZZNv1F76deJl+zD80ZFRbtAjoez1A/L
t/nXD5Uqfa/shwuxaMirOz6+eMG6OKR+4c9H0/hqvEls85XTgyMnXySNNljz4S6g
s0XoYZhPwgm677boN6DWOWo32PT3kPlRa92nUib3k/rLBYinXAyALdPrYSzkJiuA
+CbDLTZxYPzrH2GQThBcQmwLDptihZw7DGR6xAo8+RL1f32nGEFogbNNZAFljfvK
Sd1q564MF9XkpWsR+EiwEhYBLjxIlyOWTDs494Re5nNA/Fehg/ttjOyRibddVSSp
EICuobOoT3u/Nc8TssxLJukw3V3OJ9yJqVJxj68DeTwouf/4r4QgvXMMy0uytlHx
CICbZ+qtBEkZN4DBC40N
=PUZZ
-----END PGP SIGNATURE-----

--=-Eaqkt0rp2K25zoJVOiL0--
