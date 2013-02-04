Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U2G4D-0001pu-9i
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2013 07:02:13 +0000
Message-ID: <1359961435.13791.4.camel@sauron.fi.intel.com>
Subject: Re: UBIFS space consumption
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vikram Narayanan <vikram186@gmail.com>
Date: Mon, 04 Feb 2013 09:03:55 +0200
In-Reply-To: <50F97E6C.7030201@gmail.com>
References: <50F97E6C.7030201@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-x/iJro56SP7PlwhZO7ru"
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


--=-x/iJro56SP7PlwhZO7ru
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2013-01-18 at 22:25 +0530, Vikram Narayanan wrote:
> But according to "df",  UBI volume 0 is sized 148.9 MiB. That's, 15.8=20
> MiB more in terms of consumption.

Df is not accurate with UBIFS by design, this is covered by this FAQ
entry:

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_df_report

--=20
Best Regards,
Artem Bityutskiy

--=-x/iJro56SP7PlwhZO7ru
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAABAgAGBQJRD11bAAoJECmIfjd9wqK0Ot8P+wWBbO6mY8KhC2Vn37W2DwVF
K34vHd6y9r+ywD1eTu6wl1NZgSz9dEd+T0thDnqeVecOEyxzT1EhyR+fLtI+TlI/
qx6U/1QRAI9QEhmbXOpMoEIm9y6BY4UFfGTBt+9muCeJfWSPYCmq0PGC7U7qtaoM
LCWAmPF5jrzCOMQ7QlwyGBTnAcDXxCYXfhnjjg7bDXFfOaVk7hp9eWOT5sU+jqP6
Dkx02YQ8vgmISOL7GkYoPrtUy85pXYV2mctY7YVN8yzy1OjwYrLhfmfhoMzGbTye
if+szlY1OE6CYylJ523uP7EwSNh0jozZssxjOiXJGvLkCMJp10jzo3qpCyJCdJ/G
wxBWJvj30PnI3A5g8LB2FWvi5oIFVBLDfckgS3RpS56q6PIRiGyBAcVVpSgC255I
bBVdd908MrbAhVfDN1faBcfX1X6Pb2zJxbQabS/EyDQL7xgjRTegCRjkx95GN85G
qbTL4cKgfajEWgEX129n+Se3canow+9ZSK61s45qvpGHhlFl+AL5lKiE3XJsQRut
dKXVoddbhvVGdTzQVTq9vrYxK+LlM8aCkBUYZuVV7PDcDW/s4y0Qb83MfZX3Kxop
D9+Zf0Z8O9DGSZTUNuWj3sX1csfZQTa49FBstbyvhJnw56x3j4o/BKFsyP9wf+YM
kPbLMOHikIQZPowCproF
=1U9b
-----END PGP SIGNATURE-----

--=-x/iJro56SP7PlwhZO7ru--
