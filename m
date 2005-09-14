Received: from mail.sysgo.com ([62.8.134.5])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EFRKx-0008Ls-Gl
	for linux-mtd@lists.infradead.org; Wed, 14 Sep 2005 03:05:55 -0400
Date: Wed, 14 Sep 2005 09:05:31 +0200 (CEST)
From: Marius Groeger <mgroeger@sysgo.com>
Sender: mag@sysgo.com
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050913230631.GB29579@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.63.0509140900250.18636@mag.sysgo.com>
References: <005e01c5b882$9b318420$0100000a@LuCyFir3>
	<20050913230631.GB29579@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: =?iso-8859-1?Q?S=E9bastien?= Couret <sebastiencouret@aol.com>,
	linux-mtd@lists.infradead.org
Subject: Re: Silent GCC4.0 warning
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 14 Sep 2005, J=F6rn Engel wrote:

> Rejected.  Examplary reasons below...

Unless you feel your comments are insignificant, please don't put them=20
below the sigdashes "-- <NL>". Otherwise good Mailers will strip them=20
in the reply.

> In principle, I'd like a patch to silence gcc warnings.  But only when
> the patch actually improves code quality.  If I get to choose between
> bad code and compiler warnings, I'll pick the warning.
[...]
> > -                     unsigned long *datum =3D ebuf + i;
> > +                     unsigned long *datum =3D (unsigned long *)((char*=
)
> ebuf + i);
>=20
> Arithmetic with void* pointers is one of the best gcc extensions.  Use
> it!  The above is obviously correct, while below makes my brain rotate
> around itself at dangerous speed.

If I get to choose between portable code and some remote developers=20
brain rotation, I'll pick the portable code. :-)

Regards,
Marius

--=20
Marius Groeger <mgroeger@sysgo.com>
SYSGO AG                      Embedded and Real-Time Software
Voice: +49 6136 9948 0                  FAX: +49 6136 9948 10
www.sysgo.com | www.elinos.com | www.osek.de | www.pikeos.com
