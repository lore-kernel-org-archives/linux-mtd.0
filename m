Received: from h002078c680df.ne.client2.attbi.com
	([24.34.94.87] helo=joshuawise.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Yz3h-0003bn-Bl
	for <linux-mtd@lists.infradead.org>; Sun, 06 Jul 2003 03:15:21 +0100
From: Joshua Wise <joshua@joshuawise.com>
To: ebiederman@lnxi.com (Eric W. Biederman)
Date: Sat, 5 Jul 2003 22:15:34 -0400
References: <200307042232.43815.joshua@joshuawise.com>
	<200307052157.06325.joshua@joshuawise.com> <m3el142yly.fsf@maxwell.lnxi.com>
In-Reply-To: <m3el142yly.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Description: clearsigned data
Content-Disposition: inline
Message-Id: <200307052215.35596.joshua@joshuawise.com>
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
Subject: Re: jedec_probe.c
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

On Saturday 05 July 2003 10:11 pm, Eric W. Biederman wrote:
> Ok.  My point is that there is no reason to go through each chip in the
> array.  We can just iterate through the unlock_addrs array, which
> holds every unlock address.

Right, that makes sense.

> We can and do have generic probe functions, in the jedec case.

Not even like that - I meant the way gen_probe.c goes through all interlace=
s,=20
all device sizes, etcetera. I meant that 'different'.

> It is a different probe than the cfi one but it is just as valid.
> The challenge is that the query opcode needs a prefix for some chips
> so we need to loop through all of the prefixes (unlock addresses) instead
> of just some magic subset of them.

Right - guessing at what gen_probe really wants and interpreting it like th=
at,=20
IMHO, makes extremely little sense.

> It shouldn't be, and the probes are just used at probe time.  The
> rest of the time their modules can even be unloaded if necessary.

Sweet, so if jedec_probe was rewritten to not have to use jedec_probe_chip,=
 or=20
gen_probe at all for that matter, we would not have to deal with=20
jedec_probe_chip anywhere else?

Also, out of curiousity, are you on IRC? I would appreciate it if you could=
=20
'look over my shoulder' through a screen session as I hack at a new=20
jedec_probe, and poke me with a generic sharp object if I do something=20
obviously stupid.

> Eric
~joshua

=2D --=20
Joshua Wise | www.joshuawise.com
GPG Key     | 0xEA80E0B3
Quote       | <lilo> I akilled *@* by mistake
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/B4ZGPn9tWOqA4LMRAhPaAJwP22JpVB6WzOvaUp/Ah13AjsvRagCgi3vb
9kZlolNsMbJGmt7gk+EtI0k=3D
=3Dj9jm
=2D----END PGP SIGNATURE-----
