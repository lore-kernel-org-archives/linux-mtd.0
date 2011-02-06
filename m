Received: from cc-smtpout1.netcologne.de ([89.1.8.211])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm9X2-0002YA-TJ
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 18:40:21 +0000
Date: Sun, 06 Feb 2011 19:40:10 +0100
From: Albrecht =?iso-8859-1?b?RHJl3w==?= <albrecht.dress@arcor.de>
Subject: Re: JFFS2: truncated files after power loss scenario
To: dedekind1@gmail.com
In-Reply-To: <1297013977.4460.78.camel@localhost> (from dedekind1@gmail.com
	on Sun Feb  6 18:39:37 2011)
Message-Id: <1297017610.1854.3@antares>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=PGP-SHA1; boundary="=-FgjZZg5HsST8EB6WHZH+"
Cc: Sven <svenjaborek@gmx.de>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=-FgjZZg5HsST8EB6WHZH+
Content-Type: text/plain; charset=us-ascii; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 06.02.11 18:39 schrieb(en) Artem Bityutskiy:
> Well, there was a huge debate about this. Rename does not ensure sync in =
many file-systems, and posix does not require this. But user-spaces relies =
on this and many people believe this should obviously be guaranteed. So ext=
4 and may be some other FSes adjusted accordingly. I wrote about this in UB=
IFS FAQ:
>=20
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_sync_exceptions
>=20
> You'll find all the relevant links there.

Thanks a lot for the pointers!

Unfortunately, they are more more about ubi & ext4, but I am in particular =
interested in JFFS2's behaviour, so please excuse my questions, but it's a =
really critical point...  Currently, I use the following sequence to write =
my configs to jffs2 (both NOR flash and mtd-ram):

open(scratch, O_RDWR | O_CREAT | O_TRUNC, perms);
write();
fsync();
close();
sync();		// #1
rename(scratch, realname);
sync();		// #2

As far as I understand the information you cited, this should be safe under=
 all circumstances for jffs2.  Is that assumption correct?

As calling sync() might be a lot more expensive than fsync() if other file =
systems are used simultaneously (I have a vfat fs on a CF card open), my qu=
estion is now if I can safely omit either sync() #1 or #2 or both?

When reading, I first try realname, and if that fails scratch, as to cover =
the case that rename() was killed in mid-air so realname has already been r=
emoved from the directory, but scratch is still there.  Can this case happe=
n at all for jffs2?

Thanks in advance,
Albrecht.

--=-FgjZZg5HsST8EB6WHZH+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.14 (GNU/Linux)

iD8DBQBNTusKn/9unNAn/9ERAitDAJ4ryCDNQegBxpcxsXFG2RwWqn0qxQCfe2C3
jHYKWPmIAkldYccNqRqEhKg=
=+9t+
-----END PGP SIGNATURE-----

--=-FgjZZg5HsST8EB6WHZH+--
