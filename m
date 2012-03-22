Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SAePM-00075n-FZ
 for linux-mtd@lists.infradead.org; Thu, 22 Mar 2012 09:34:13 +0000
Message-ID: <1332409022.18717.5.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: add documentation about locking context of MTD API
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Thu, 22 Mar 2012 11:37:02 +0200
In-Reply-To: <87mx79905h.fsf@free.fr>
References: <1332195985-21043-1-git-send-email-robert.jarzmik@free.fr>
 <4F67B3B8.7090909@nod.at> <87r4wo8arp.fsf@free.fr>
 <1332243871.11468.23.camel@sauron.fi.intel.com> <87mx79905h.fsf@free.fr>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-zVnRNaD41IBpr2nTPqcU"
Mime-Version: 1.0
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-zVnRNaD41IBpr2nTPqcU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-03-21 at 21:20 +0100, Robert Jarzmik wrote:
> Do you want me to take my patch and do a simple 's/in a sleeping context/=
and may
> sleep/g', or is it more complicated ?

Yes, I guess you can put just a short comment like "these all may
sleep".

WRT to 'might_sleep()' - you can put these to the _code_, to the mtd
wrappers like 'mtd_write()', I suppose.

--=20
Best Regards,
Artem Bityutskiy

--=-zVnRNaD41IBpr2nTPqcU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIbBAABAgAGBQJPavK+AAoJECmIfjd9wqK058gP+JlIHMGjg2lOna0gzxR749b+
4TPG12AJcuFxjNHIlszfuVCVwqsemtOgnx3lnqRXd4z5RlQmYS9Oj4dK3j9wqwdf
/WQjrNyReq9GiMfITaY673JTeQ8O0e7ASHLJnVGEc8uyF/+gVmqaEYKrIMZcehX0
2TXMtHF+34Qmx6KrxKd0EhrBQTdhJVuP9EtASYT03ynzfAWpXx//xN5ShvUGjSW/
k/bWvVSIkxYOnbWd0FHLJDULZhriaE/PwkwxaV7dLHcqwhblWzjMWDDi7Dab1oST
WtDMxoKWw6JUDNoUcnodkL7IxdBDl4VuaGQEsgEwBrBnAUx3tO3zx/tNgmjbaAqJ
uEjKMJqvRnHDjguK0n8IBOa6go/V2IePd5RPcak3Z+9LU0xVtqJYcDTCoc8VbH0R
YRkVM9gguDafI56ipRJiZrDPZeu904Lpezpdaou3WpOk5BN9cRFI+dkh16gpemCR
/EJ6sGpPlCigq3Q/ROoRxUWtEUo2jq7/Cx9QRySG1hKmuG/XIta1b4H9BMOe8RqF
V5M7WNuGBvW7/kldZbNic+O+3/9MSZ9NIOfwOJYMlnxCSGFStVenmJeMWyRIJIXo
YW345i+xgk0ce5nQZwAAICyoB3khRfN7GkrFM5E1BbrSM9CAYnOjhEfKwicx9tBY
EEcAilbpj5FnuX8FEhU=
=VaVZ
-----END PGP SIGNATURE-----

--=-zVnRNaD41IBpr2nTPqcU--
