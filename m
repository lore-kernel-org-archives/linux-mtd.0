Received: from ash.lnxi.com ([207.88.130.242])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Clc5-0003OC-HI
	for <linux-mtd@lists.infradead.org>; Mon, 05 May 2003 20:27:01 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Michael Moedt <xemc@yahoo.com>
In-Reply-To: <20030505190359.52930.qmail@web13905.mail.yahoo.com>
References: <20030505190359.52930.qmail@web13905.mail.yahoo.com>
Message-Id: <1052162831.1172.11269.camel@tubarao>
Mime-Version: 1.0
Date: 05 May 2003 13:27:11 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-kd7r19jbbren2ECTcdgj"
cc: linux-mtd@lists.infradead.org
Subject: Re: Error: Wacky! Unable to decode failure status
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-kd7r19jbbren2ECTcdgj
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-05-05 at 13:03, Michael Moedt wrote:
> Hi.
> I'm having trouble using the 'erase' and 'eraseall'
> utilities on my flash device.  It's an AMD29LV640ML,
> which supports CFI and uses command set #2.

I'm looking at the data sheet right now.

> I'm getting the error message "Wacky! Unable to decode
> failure status".  See below: (with minor modifications
> to make it more readable)

My guess is that you are using divers/mtd/chips/cfi_cmdset_0002.c with a
revision earlier than 1.68 - please update to that version.  If you
still have problems then send another email and I'll look a bit closer.

Thanks for the bug report.


> Thanks!
>=20
> Mike
>=20
> __________________________________
> Do you Yahoo!?
> The New Yahoo! Search - Faster. Easier. Bingo.
> http://search.yahoo.com

--=20
Thayne Harbaugh
Linux Networx

--=-kd7r19jbbren2ECTcdgj
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+trsOfsBPTKE6HMkRAhaYAJ4pNTdiW/NvP9KLdk0Nhchzai2M1ACeKho9
K7ygZyw/P8QWg2At6Nys2yk=
=STpx
-----END PGP SIGNATURE-----

--=-kd7r19jbbren2ECTcdgj--
