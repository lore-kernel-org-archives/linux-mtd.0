Received: from cpe-144-132-147-2.nsw.bigpond.net.au ([144.132.147.2] helo=fuego.linuxaus.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Mrs0-0000VV-00
	for <linux-mtd@lists.infradead.org>; Tue, 25 Jun 2002 16:04:41 +0100
Subject: Re: OpenSSH/OpenSSL is too big... any alternatives?
From: Gonzalo Servat <gonzalo@linuxaus.com>
To: Paul Jimenez <pj@place.org>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>,
	cfowler <cfowler@outpostsentinel.com>
In-Reply-To: <20020625145011.DB9EF6B3F4@zachs.place.org>
References: <1025014199.2220.3.camel@beamer.servat.com>
	<1025016211.25773.14.camel@moses.outpostsentinel.com>  
	<20020625145011.DB9EF6B3F4@zachs.place.org>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-pc7mJx3Cx2HJ3Fi6BhvH"
Date: 26 Jun 2002 01:04:36 +1000
Message-Id: <1025017476.2200.8.camel@beamer.servat.com>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--=-pc7mJx3Cx2HJ3Fi6BhvH
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I did have a look at LSH but I had other problems getting it to work so
I gave up on that one too :)

Now I'm down to using netkit
(ftp.uk.linux.org/pub/linux/Networking/netkit) but getting it to compile
vs uClibc is tricky. I still get errors to do with 'rpc'. I've decided
to just use telnet for the time being (until I can get a bigger DOC) but
even this task is looking doubtful :(

Has anyone had any success compiling netkit (inetd & telnet server)
against uClibc?

Thanks in advance!

Regards,
Gonzalo

On Wed, 2002-06-26 at 00:50, Paul Jimenez wrote:
>=20
> You might look at LSH, a smaller implementation, linked to off
> of the uclibc page ( http://www.uclibc.org/uClibc-apps.html )
> as being http://www.net.lut.ac.uk/psst/ .  No guarantees that it works..
> it looks to be SSH v2 protocol, but not updated very recently.
> My only connection with it is remembering that it existed on the above
> uclibc page :)  Have fun,
>=20
>   --pj
>=20
> On Tuesday, Jun 25, 2002, cfowler writes:
> >I got the same problem but I'm running off floppy.
> >
> >
> >On Tue, 2002-06-25 at 10:09, Gonzalo Servat wrote:
> >> Hi All
> >>=20
> >> I have a 2MiB DiskOnChip. After installing the kernel, BusyBox, iptabl=
es
> >> and a couple of libs from uClibc I only have 400k left of space.
> >> OpenSSH needs to link to OpenSSL and OpenSSL is well over 1MB on it's
> >> own. Is there any alternatives to OpenSSL/OpenSSH that will fit on 400=
k?
> >>=20
> >> Thanks in advance!
> >>=20
> >> Regards,
> >>=20
> >> Gonzalo.
> >>=20
> >>=20
> >
> >
> >
> >______________________________________________________
> >Linux MTD discussion mailing list
> >http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >
>=20


--=-pc7mJx3Cx2HJ3Fi6BhvH
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA9GIaEvTbSWKMx8O4RAg91AJ4wZ9DMZNor75RlhBp7oJEwfOf6mwCeJT/R
vBnownCuzomOH3Y7poluG3o=
=mt+G
-----END PGP SIGNATURE-----

--=-pc7mJx3Cx2HJ3Fi6BhvH--
