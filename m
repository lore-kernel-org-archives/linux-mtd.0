Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TfW11-00060G-4Y
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2012 13:24:55 +0000
Message-ID: <1354541151.11583.8.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] ubi-tests: fix pthreads linking
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 03 Dec 2012 15:25:51 +0200
In-Reply-To: <1353828369-14493-1-git-send-email-computersforpeace@gmail.com>
References: <1353828369-14493-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-pQBk6jLcnTXEQ9j5QKDc"
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


--=-pQBk6jLcnTXEQ9j5QKDc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-11-24 at 23:26 -0800, Brian Norris wrote:
> Technically, '-l' linker options should be included only after the
> objects which must link to the library. So when we include '-lpthread'
> in the LDFLAGS variable, it gets placed too early (i.e., before the
> io_paral.o object), and so the pthread linkage never occurs. The
> following error probably only shows up with linkers that don't link
> pthreads by default.

Pushed to mtd-utils, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-pQBk6jLcnTXEQ9j5QKDc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQvKhfAAoJECmIfjd9wqK0sCoP/1bXyN/C5gRl6Q38KBpj62pL
GBvnvTXPR518Fwrxd2k2hdqs4qe/V2lWWXzfp7usTqrS6NvROlus+Kl1q4pYpedQ
a7TzgiJXfVQRES48eQuggV28NTd9M2inrRoG3Z5caC6d73+QRIhmlsF2uZ0s2afm
cPR8ejSfatqyAFks/jMFtPxdgUAEZjizVTH12nqyLLiD2aspkZZHX+ViByoj0ket
ANZdEz7GwDnn+gKI6eFfDVQu8lT8EqpW5ablK7KAsPXbS/II0tO4+TSqLvB43YW/
fs7EdBalvsS848apUgGWOqt5hdJhohqdaMQjr6xc30kz85+UABV4mDQChpm5FPW/
Rbr0c1tETRV6dFmaBkSbyAEJbYPUJGjpnR05XgWJxr6UHCNf3qmdQW/Wojyduw4h
F/cgG1bSivAUThF85eYekjwAmlNTTib6BGag5nnhCs0aGmJbYBuheImanVdUzqK4
/WjpWXoIhgiMZWjuohXxX3nQAbklrsNKgUtVMPNneWsrKxvWNiPUiaLuovGluNqL
K2kP1RvzL6IxwMPiLpzcgXaAVw1vWbClnQiEvsZrnnwccGPshZpZtyd+oon5qg97
QtjKle05ZQjE2evXUe4w1rZbU08gaTpv9OB8LsxmrHDF75ACDyigE85917Omj+gi
CJLE1giNLqfpFoolaKng
=AMxS
-----END PGP SIGNATURE-----

--=-pQBk6jLcnTXEQ9j5QKDc--
