Received: from h80ad2599.async.vt.edu
	([128.173.37.153] helo=turing-police.cc.vt.edu ident=root)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19zHOW-0000zD-MH
	for <linux-mtd@lists.infradead.org>; Tue, 16 Sep 2003 16:05:33 +0100
Message-Id: <200309161504.h8GF4MYe015141@turing-police.cc.vt.edu>
To: Timothy Miller <miller@techsource.com>
In-Reply-To: Your message of "Tue, 16 Sep 2003 10:52:06 EDT."
             <3F672396.10906@techsource.com>
From: Valdis.Kletnieks@vt.edu
References: <200309160435.h8G4ZkQM009953@elaine4.Stanford.EDU>
	<20030916065553.GA12329@wohnheim.fh-wedel.de>
	<3F672396.10906@techsource.com>
Mime-Version: 1.0
Date: Tue, 16 Sep 2003 11:04:21 -0400
Content-Type: multipart/signed; boundary="==_Exmh_-837387179P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
cc: David Yu Chen <dychen@stanford.edu>
cc: linux-mtd@lists.infradead.org
cc: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
cc: mc@cs.stanford.edu
cc: David Woodhouse <dwmw2@infradead.org>
cc: linux-kernel@vger.kernel.org
Subject: Re: [CHECKER] 32 Memory Leaks on Error Paths 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--==_Exmh_-837387179P
Content-Type: text/plain; charset=us-ascii

On Tue, 16 Sep 2003 10:52:06 EDT, Timothy Miller said:
> 
> >> 276:	/* OK, it's not open. Create cache info for it */
> >>START -->
> >> 277:	mtdblk = kmalloc(sizeof(struct mtdblk_dev), GFP_KERNEL);
> >> 278:	if (!mtdblks)
> >>END -->
> >> 279:		return -ENOMEM;
> 
> > 
> > Invalid.  This is quite an obvious false positive, at least if your
> > algorithm checks for possible value ranges.
> 
> Wait... one is "mtdblk", and the other is "mtdblks".  One has an extra 
> 's' on it.  Unless there is some kind of aliasing going on, they would 
> appear to be different variables.  Naturally, I didn't check the 
> original code, so I could be full of it.  :)

On the other hand, even if the report was invalid (which another posting says isn't
the case), this code is just *begging* for somebody to "fix the typo", due to how
much the kernel uses
	foo = function(..)
	if (!foo)
Yeah, they're different variables - but we alloc mktblk and then return -ENOMEM
if the OTHER variable is null?? ;)

--==_Exmh_-837387179P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE/ZyZ1cC3lWbTT17ARAi3pAKD2q/kclzGldljMKcUsbmWwaW3qHwCfV3Ej
G5i+GBBseF/X2OEnA3gE/9A=
=HDWl
-----END PGP SIGNATURE-----

--==_Exmh_-837387179P--
