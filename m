Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Skvmn-0006pu-58
 for linux-mtd@lists.infradead.org; Sat, 30 Jun 2012 11:24:21 +0000
Received: by wibhm11 with SMTP id hm11so1391459wib.0
 for <linux-mtd@lists.infradead.org>; Sat, 30 Jun 2012 04:24:18 -0700 (PDT)
Message-ID: <1341055455.2115.4.camel@koala>
Subject: Re: UBI fastmap updates
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Sat, 30 Jun 2012 14:24:15 +0300
In-Reply-To: <4FEEDAA4.30105@nod.at>
References: <1340982869-77042-1-git-send-email-richard@nod.at>
 <1341052998.2115.3.camel@koala> <4FEEDAA4.30105@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-HKLAUO7/oJ1H6MZ4yjFY"
Mime-Version: 1.0
Cc: nyoushchenko@mvista.com, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, thomas.wucher@linutronix.de,
 linux-mtd@lists.infradead.org, shmulik.ladkani@gmail.com, tglx@linutronix.de,
 Marius.Mazarel@ugal.ro, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-HKLAUO7/oJ1H6MZ4yjFY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-06-30 at 12:53 +0200, Richard Weinberger wrote:
> So basically you want me to get rid of any vmalloc()'ed buffer?
> That's not easy.

How big is the buffer. What is its maximum possible size?

--=20
Best Regards,
Artem Bityutskiy

--=-HKLAUO7/oJ1H6MZ4yjFY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP7uHfAAoJECmIfjd9wqK0EAkQAKPiyG29WZQbYty8VDI94PS7
s+Ys//OUPmA9tSjg5lg6rQIfYuKGzUHiGwetXnKRc/fKoy2j3r1b+UAOalWJ6KSL
Ir93piIfrXWwaPb85xIOhPaLTwt3NBNcbVUpMO0Restk7MqBna58G8E6dh9h07lF
pwA3HuKYV+Dd8tqbYcn3UatpPZ1aASZQQH4+ShxLt1j/zuJej226TBf8HtKiz+b8
/Sq1kTx2VZsvVxIuBqLFELZ34rwqoKhoD8ugyGviA9BTwO4Wj5+mLmAa7Ys0gMw2
NXXuIaA6vH2RAZB200RHdqDgnQw/vYtiuYUqZESpzdWADXa2uKFFyZXEH4xbaLHF
XiP0VTtqlbZI/XnHBP3vmDQFmUrXIhnJogIJXZ/6CIMtdpX5QAhsb6iQVlkUbXu3
GhmxW9uHZ08K3L07Y9/0Zj9Ug6Peh7BY8H2gcj9e2++kvomAbBHhpv+MA7LW6V8Y
VoWvpIgzaXsrnQHgDgs/0XwGhThW4CjAUhXZF+3LAKoZtnvpjqDLhrlk/TNUd5Wu
/mbxSzFLcqfnjJo9TMA6bpkJMGRCYG2E/oXQRk5HThtWriZckWtFOWeJ9fImAcQq
+twRhKDJefzLc3qJ08kiSU76pa8WJsXRNRQAZfTdpy/uB6Ce1uNdMb9dhaq719v+
uocddw5SjqTeAwwb8OLi
=rstz
-----END PGP SIGNATURE-----

--=-HKLAUO7/oJ1H6MZ4yjFY--
