Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CUnt8-0004vP-SG
	for linux-mtd@lists.infradead.org; Thu, 18 Nov 2004 10:08:00 -0500
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Alexander Hoffmann <ahoffmann@sysgo.de>
In-Reply-To: <419C7E72.8040005@sysgo.de>
References: <418F5E68.3010200@sysgo.de>
	<20041108120624.GE13105@home.fluff.org>  <418F6CA7.6000808@sysgo.de>
	<1099943453.10812.16.camel@tubarao>  <4194D39A.9000700@sysgo.de>
	<1100274921.3549.13.camel@justakiss>  <4194E233.70902@sysgo.de>
	<1100277677.3549.22.camel@justakiss>  <419C7E72.8040005@sysgo.de>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-HKUoHkTcxBF+V2YdzCae"
Date: Thu, 18 Nov 2004 07:44:13 -0700
Message-Id: <1100789053.3171.96.camel@tubarao>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Erwin Authried <eauth@softsys.co.at>
Subject: Re: Usage of MTD_UADDR_UNNECESSARY broken?
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-HKUoHkTcxBF+V2YdzCae
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-11-18 at 11:50 +0100, Alexander Hoffmann wrote:

> Then I guess that there is really the bug I described in my first mail.
> I would recommend a check for MTD_UADDR_UNNECESSARY in the=20
> cfi_jedec_setup(), before
> the unlock_addrs[] array is  referenced:
>=20
> if ( uaddr !=3D MTD_UADDR_UNNECESSARY ) {
>                 p_cfi->addr_unlock1 =3D unlock_addrs[uaddr].addr1 & mask;
>                 p_cfi->addr_unlock2 =3D unlock_addrs[uaddr].addr2 & mask;
> }
> return 1;

Apparently the "& mask" is not done anymore - you must be using an older
version of jedec_probe.c.

It looks like your suggestion might be appropriate after the window
check in jedec_setup() and before the finfo_uaddr() lookup.

I'm still trying to sort the test at the top of jedec_probe_chip():

 retry:
	if (!cfi->numchips) {
		uaddr_idx++;

		if (MTD_UADDR_UNNECESSARY =3D=3D uaddr_idx)
			return 0;

		cfi->addr_unlock1 =3D unlock_addrs[uaddr_idx].addr1;
		cfi->addr_unlock2 =3D unlock_addrs[uaddr_idx].addr2;
	}


I'm thinking that the MTD_UADDR_UNNECESSARY test (which checks for the
end-of-loop condition) should be *prior* to the uaddr_idx++.  The way it
is, chips that are MTD_UADDR_UNNECESSARY will *never* be tested and will
*always* fail.

> Furthermore I dont understand the following code in the finfo_uaddr()=20
> function:
>=20
> if (uaddr !=3D MTD_UADDR_NOT_SUPPORTED ) {
>                 /* ASSERT("The unlock addresses for non-8-bit mode
>                    are bollocks. We don't really need an array."); */
>                 uaddr =3D finfo->uaddr[0];
>         }

I don't necessarily understand it either.  I have chip documentation
that shows that the unlock addresses of a chip are different for
different modes.  Unfortunately, I don't have a chip to test.

> In my opinion this can't work, because there are a lot of  entries in=20
> the jedec_table[] where uaddr[0]
> is not defined ?

C specifications require that structures with static initializers always
have uninitialized members set to 0.  That means that entries in
jedec_table[] that don't have a specific uaddr[0] initializer then it is
0 - which is MTD_UADDR_UNSUPPORTED.  What it buys us is that there's
less typing and any width that isn't explicitly stated as supported is
not supported.

Considering the above WRT the code logic, it means that if a width for a
chip is not supported (MTD_UADDR_NOT_SUPPORTED) then it will return
whatever the unlock address is for X8.  The return value for finfo_uaddr
() is used to not only determine what the unlock addresses should be,
but also if a chip functions in a particular width.  This could cause
chips that only have an X16 and greater modes, but no X8 mode to fail in
jedec_match() and jedec_setup().

Yes, it does look broken.  If the ASSERT comment is *really* true (I am
not convinced) then they should accomplish what they want by using the
same uaddr initializer for all modes of a chip.

--=20
Thayne Harbaugh
Linux Networx

--=-HKUoHkTcxBF+V2YdzCae
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBBnLU9sYFQl3A+qS0RApE2AKC1/Nua6criRqMsIk0TnzwdFvWZ+QCfQhFK
IBdOiRx73Sy8HfOyMgvi6B8=
=h+xR
-----END PGP SIGNATURE-----

--=-HKUoHkTcxBF+V2YdzCae--
