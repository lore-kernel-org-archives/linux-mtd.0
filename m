Received: from h002078c680df.ne.client2.attbi.com
	([24.34.94.87] helo=joshuawise.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ALYOf-0002Qf-CK
	for <linux-mtd@lists.infradead.org>; Mon, 17 Nov 2003 01:41:45 +0000
From: Joshua Wise <joshua@joshuawise.com>
To: ebiederman@lnxi.com (Eric W. Biederman),
	David Woodhouse <dwmw2@infradead.org>
Date: Sun, 16 Nov 2003 20:40:06 -0500
References: <200311150109.39539.joshua@joshuawise.com>
	<1069021350.3450.65.camel@lapdancer.baythorne.internal>
	<m3smknn68x.fsf@maxwell.lnxi.com>
In-Reply-To: <m3smknn68x.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Description: clearsigned data
Content-Disposition: inline
Message-Id: <200311162040.14052.joshua@joshuawise.com>
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
cc: Thayne Harbaugh <tharbaugh@lnxi.com>
Subject: Re: JEDEC probing redux
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

> You are masking the unlock addresses way to late to be of value.
> Things need to be masked out during the probe not when we finally
> see what works and decide to set it up.  Not that masking should
> make any difference when the address line is not hooked up.
The PXA does weird stuff sometimes. I found that it just Didn't Work when t=
he=20
lower line wasn't masked.

> Eric
/joshua

=2D --=20
Joshua Wise | www.joshuawise.com
GPG Key     | 0xEA80E0B3
Quote       | <lilo> I akilled *@* by mistake
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/uCb9Pn9tWOqA4LMRAo9tAJ9ltr1S8NFEMZUmEyYQvfFyNr/V5wCfdk1i
HUMP6lMP/EimCzOWs6zZwnI=3D
=3D4LtR
=2D----END PGP SIGNATURE-----
