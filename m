Received: from [208.177.141.226] (helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ZY4O-0002Ng-Vx
	for <linux-mtd@lists.infradead.org>; Mon, 07 Jul 2003 16:38:25 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
In-Reply-To: <m3k7aw8sua.fsf@maxwell.lnxi.com>
References: <200307042232.43815.joshua@joshuawise.com>
	 <200307050103.58666.joshua@joshuawise.com>
	 <m3wuexksa9.fsf@maxwell.lnxi.com>
	 <200307051406.08109.joshua@joshuawise.com>
	 <m3k7aw8sua.fsf@maxwell.lnxi.com>
Message-Id: <1057592282.1135.8613.camel@tubarao.lnxi.com>
Mime-Version: 1.0
Date: 07 Jul 2003 09:38:02 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-MvIXJlUF7vRtWLOol9Ea"
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


--=-MvIXJlUF7vRtWLOol9Ea
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, 2003-07-05 at 17:19, Eric W. Biederman wrote:
> Joshua Wise <joshua@joshuawise.com> writes:
>=20
> > On Saturday 05 July 2003 9:38 am, Eric W. Biederman wrote:
> > > Why?  What is your problem.  All the pieces do is validate what
> > > was detected.
>=20
> > My problem is that jedec_probe_chip() incorrectly determines unlock
> > addresses for my chip. They seemingly work anyway, but then
> > jedec_match() fails because the unlock addresses that already are
> > stored in the struct cfi_private do not match what they should be
> > for my flash chip.=20
>=20
> Ok.  So one of the TODO list items in jedec_probe finally hit.
> The check in jedec_match for unlock addresses was added to verify
> the proper unlock addresses was actually used so if the probe
> succeeded the chip would work.

More exactly: Some chips will ID with incorrect unlock addresses.  When
it comes time to use those incorrect unlock addresses to erase or write
then there is a failure.  The check was put in to prevent chips that ID
with incorrect unlock addresses from having a successful probe.  This
sounds like Joshua's MTD's are ID'ing with the wrong unlock addresses.

>   The fact that the proper unlock
> addresses never get tried is certainly a problem.

This is the _real_ problem.

> When the code was changed to confirm the proper unlock addresses were
> being used there were no reported cases of the code not attempting
> the proper unlock addresses so that part of the existing code was left
> untouched.

Although it was anticipated that this problem would eventually surface.=20
Blame the problem on lazy programmers (that's me).

>   Now that we have the information on which unlock addresses
> the various chips use we can walk through all of the known unlock
> addresses attempting to match them.

Yes.

> That can be refined by a walk
> through the table to see if there is a chance of a given unlock
> address working.

I'm not convinced that "refining" the list is a good thing unless there
are obvious connections between chip type/mode and unlock addresses.=20
Maybe there's a slick way to organize the jedec_table[] so that extra
code isn't necessary.

> > Oh, but there is. Everything on these iPAQs uses MTD

So this is a well-defined platform.  You shouldn't need generic probing
- just write a simple init module that initializes the CFI structure and
loads the proper command set.

> > I believe I explained the problem earlier - jedec_probe is wildly probi=
ng=20
> > about, and making guesses at addr_unlock, which unfortunately turn out =
to be=20
> > correct on every chip but mine.

Not necessarily correct for every chip but yours - I do know of some
specific cases where the probe is broken and needs to be fixed:
jedec_match has a problem when checking fit with interleaved devices; 16
bit chips don't probe correctly in 8 bit mode; I know of another
situation where the unlock seeds are insufficient.  Sorry to burst your
bubble when you think that we targeted the iPAQ 8^) (yes, humor
implied).

>  (For what it's worth, this is a AM29LV400BT.=20
> > Specs:=20
> > http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs=
/21523d1.pdf)

Thanks for the link.  The more broken cases I know about and the more
data sheets I read, the easier it is to generalize the code so that it
just works (especially since right now it doesn't).

I'll be able to work on this sometime near the end of this week.

--=20
Thayne Harbaugh
Linux Networx

--=-MvIXJlUF7vRtWLOol9Ea
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA/CZPZfsBPTKE6HMkRAk87AJ4o9yr4fB2271iy7gFDVETy83lClwCfae7B
5NuZCxKQz9D+fLgzva7q25Q=
=bXIW
-----END PGP SIGNATURE-----

--=-MvIXJlUF7vRtWLOol9Ea--
