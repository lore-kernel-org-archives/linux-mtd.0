Received: from h002078c680df.ne.client2.attbi.com
	([24.34.94.87] helo=joshuawise.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19YzxV-00041F-1Q
	for <linux-mtd@lists.infradead.org>; Sun, 06 Jul 2003 04:13:01 +0100
From: Joshua Wise <joshua@joshuawise.com>
To: ebiederman@lnxi.com (Eric W. Biederman)
Date: Sat, 5 Jul 2003 23:13:12 -0400
References: <200307042232.43815.joshua@joshuawise.com>
	<200307052215.35596.joshua@joshuawise.com> <m38yrcmkr2.fsf@maxwell.lnxi.com>
In-Reply-To: <m38yrcmkr2.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Description: clearsigned data
Content-Disposition: inline
Message-Id: <200307052313.13389.joshua@joshuawise.com>
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

On Saturday 05 July 2003 10:50 pm, Eric W. Biederman wrote:
> gen_probe_chip is one case where the cfi and the jedec case are
> common.  Warts are there but it is a common case.  And handling
> the various combinations of interleaved chips and various word
> sizes is tricky, and is quite easy for people who don't need that
> logic to get it wrong if it is not handled in common.

Really? I think it would be better to just probe all the unlock addresses i=
n=20
order instead of probing interleaves, etc

> > Sweet, so if jedec_probe was rewritten to not have to use
> > jedec_probe_chip, or gen_probe at all for that matter, we would not
> > have to deal with jedec_probe_chip anywhere else?
>
> Well yes, but I don't see the point in going in that direction.

See above..

> Sorry, I'm not.  Submitting patches for review is another good
> way of accomplishing the same thing, and it is more economical
> of other peoples time.  This is a weekend and one of my rare moments
> with free time.  Thayne Harbaugh should be able to do just as good
> a job at answering your questions and he has a little more time
> than me.

Understood, I can appreciate that :) Who is Thayne Harbaugh? *pokes Thayne=
=20
with a sharp object to call their attention to the discussion*

> Seriously all you should need to do is to take the loop in
> jedec_probe_chip where it loops through some unlock address and have
> it explicitly loop through all of the combinations, or at least enough
> of them until a match is found.  Look for the retry label.  It is a
> significant code change but it should be contained to just that one spot.

I'll take a look into that.

> Eric
~joshua

=2D --=20
Joshua Wise | www.joshuawise.com
GPG Key     | 0xEA80E0B3
Quote       | <lilo> I akilled *@* by mistake
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/B5PJPn9tWOqA4LMRArvXAJ4tUS/NYq0e2t+6y2Oxj4IQ2I80ygCfaf3H
IUJ864JnVXEOtmf9EnaVhD0=3D
=3DqBOM
=2D----END PGP SIGNATURE-----
