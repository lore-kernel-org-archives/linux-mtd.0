Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ARv3h-0002kv-7k
	for <linux-mtd@lists.infradead.org>; Thu, 04 Dec 2003 15:06:25 +0000
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Joan Dyer <joandy@us.ibm.com>
In-Reply-To: <OF34791286.BF457C19-ON85256DF1.0068ECB2-85256DF1.006A57CA@us.ibm.com>
References: 
	<OF34791286.BF457C19-ON85256DF1.0068ECB2-85256DF1.006A57CA@us.ibm.com>
Message-Id: <1070549709.14277.227.camel@tubarao>
Mime-Version: 1.0
Date: 04 Dec 2003 07:55:09 -0700
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-L9ibaGvsJI0OXIfgUKNT"
cc: linux-mtd@lists.infradead.org
Subject: Re: Probs with port to 2.4.18
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-L9ibaGvsJI0OXIfgUKNT
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-12-03 at 12:23, Joan Dyer wrote:

> I had first asked about write failures (mtd/chips/cfi_cmdset_0002)

I can't find where you asked about cfi_cmdset_0002.c - only this thread:

http://lists.infradead.org/pipermail/linux-mtd/2003-November/008843.html

It looks like it might be a reply to another thread, but it isn't
connected.  Mailer breaking In-Reply-To?

>  and=20
> took the current, updated, version of this file.

Which version is "current?"

>   I get a timeout on the=20
> write (timeout vals increased) with the "Wacky" message (unable to decode=
=20
> failure state).=20
>=20
> However what seems to be the underlying problem is a non-coordinated=20
> write, while/during erase.

Does the device you are using support erase suspend?

>    With my port, wbuf.c (which references the=20
> erase_completion lock) is not used.=20
>=20
> Should I protect the write in writev.c with a call on the lock?

I can't comment on this, unfortunately.  I do not have applications that
do concurrent erase/writes and so I can't test this.  There was a rather
large restructuring of cfi_cmdset_0002.c in version 1.92.  It is
possible that some of the erase suspend/write logic isn't sound.

> Is there any output or information that I can provide?   Here is a portio=
n=20
> of dmesg:
>=20
> inocache for ino #29631 is all gone now. Freeing
> Removed nodes in range 0x00190000-0x001a0000 from ino #29632
> inocache for ino #29632 is all gone now. Freeing
> Removed nodes in range 0x00190000-0x001a0000 from ino #29633
> inocache for ino #29633 is all gone now. Freeing
> Removed nodes in range 0x00190000-0x001a0000 from ino #29634
> inocache for ino #29634 is all gone now. Freeing
> Removed nodes in range 0x00190000-0x001a0000 from ino #29635
> Erase completed successfully at 0x00190000
> MTD do_write_oneword(): Wacky!  Unable to decode failure status=20
> uWriteTimeout=3D1001  GUESSDELAYT=3D100
> MTD do_write_oneword(): 0x00186524(0x00001985): 0x0000ffff 0x0000ffff=20
> 0x0000ffff  0x0000ffff

0x1985 was supposed to be written to 0x186524.  do_write_oneword()
likely thought the operation was complete because it didn't see the
status bit toggle.  The problem is detected because 0xffff !=3D 0x1985.=20
In fact the last four times that the location was read the value was
0xffff (which is an erase value and the four values being identical
indicate the status was not toggling).

> Write3 of 48 bytes at 0x00186524 failed. returned -5, retlen 0
> jffs2_write_dirent returning node at c3803970
> Write4: Not marking the space at 0x00186524 as dirty because the flash=20
> driver returned retlen zero
> raw: next_in_ino=3Dc3803980, nextphys=3D00000000, flashoff=3D186524, totl=
en=3D30
> Verifying erase at 0x00190000
> Writing erased marker to block at 0x00190000
> jffs2_erase_pending_blocks completed
>=20
> In order to produce this I've run an app that keeps writing to flash, ver=
y=20
> small files, writing a temp then renaming it.

More information would be helpful (a patch even better =3D).  Right now
the best I can do is read through the code and think real hard about
where it might not work - something that doesn't always have good
results.  I just don't have a test case that I can exam with the
hardware/applications I have at my disposal 8-(.

--=20
Thayne Harbaugh
Linux Networx

--=-L9ibaGvsJI0OXIfgUKNT
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA/z0rNfsBPTKE6HMkRArZFAJ4r11si9oqiLjE6UwtofX/ihGUHUgCePYZt
kH+iweVyIu+oL2CAIqYeiQw=
=djkm
-----END PGP SIGNATURE-----

--=-L9ibaGvsJI0OXIfgUKNT--
