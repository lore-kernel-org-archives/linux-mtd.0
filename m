Received: from h002078c680df.ne.client2.attbi.com
	([24.34.94.87] helo=joshuawise.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19YreB-0002Mk-FN
	for <linux-mtd@lists.infradead.org>; Sat, 05 Jul 2003 19:20:31 +0100
Received: from 192.168.1.100 (unknown [192.168.1.100])7D5CA1901F
	for <linux-mtd@lists.infradead.org>;
	Sat,  5 Jul 2003 14:21:39 -0400 (EDT)
From: Joshua Wise <joshua@joshuawise.com>
To: linux-mtd@lists.infradead.org
Date: Sat, 5 Jul 2003 14:20:43 -0400
References: <200307042232.43815.joshua@joshuawise.com>
	<200307050103.58666.joshua@joshuawise.com> <m3wuexksa9.fsf@maxwell.lnxi.com>
In-Reply-To: <m3wuexksa9.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Description: clearsigned data
Content-Disposition: inline
Message-Id: <200307051420.45666.joshua@joshuawise.com>
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

On Saturday 05 July 2003 9:38 am, Eric W. Biederman wrote:
> Why?  What is your problem.  All the pieces do is validate what
> was detected.
My problem is that jedec_probe_chip() incorrectly determines unlock address=
es
for my chip. They seemingly work anyway, but then jedec_match() fails becau=
se
the unlock addresses that already are stored in the struct cfi_private do n=
ot
match what they should be for my flash chip.

> > I stand corrected. It seems like it's also possible that jedec_probe()
> > could be rewritten to just probe all the chips that we know about.
> > Methinks I'll try that.
> It already does test for all of the chips we know about.
But IMHO it does a bad job of doing it. It needs to go through each chip in
order, and try each chip's unlock addresses in order, as opposed to guessing
at unlock addresses based on interleave and chip type.

> NOR flash devices have two different JEDEC specified methods of detecting
> exactly which flash chip you have plugged in.   Either the older
> jedec_probe, or the more recent cfi_probe.  Using the basic method
> in jedec_probe we can only get the manufacturer and device id of the
> flash chip, the rest of the information we need comes from a table.
> Flash devices tend to be a lot more common than that so the newer
> Common Flash Interface probe also reports the number of erase regions
> and the like, so the flash drive does not need to have knowledge of
> a specific kind of flash device.
Right, right, I know all that - I know that there are multiple ways to probe
for chips. I was just mentioning that it seems that MTD was entirely built =
on
the assumption that every chip would be CFI, and that every chip would
conform to a struct cfi_private. This produces wonderful pieces of cruft li=
ke
jedec_probe.c, which gathers information from a JEDEC data table, flies
around randomly probing, and then finally, by a work of magic, finds out
which datatable entry our flash chip corresponds with and smashes it into
something like a struct cfi_private.

> Most NOR flash devices implement either the Intel or the AMD command
> set.  The probe method does not matter so the command set code
> is reused by both methods.
=2E. .. And don't get me started on how NAND doesn't seem to conform to the
_probe methods, etcetera. (Or at least, doesn't conform in any way that I c=
an
=46IND.) I think that the command set code works fine - I just wish it was
exported so that it could be used by other drivers.

> There is no requirement to reuse the mtd infrastructure.  It is
> there simply because it does a good job of factoring out the common
> pieces.
Oh, but there is. Everything on these iPAQs uses MTD - including JFFS2, and
various other things. The userland API, technically, rules. I'm just saying
that internally, MTD is based upon many layers of assumptions that,
unfortunately, no longer work - or that's how it looks to me.

> So what kind of flash device do you have?  And why does the
> existing infrastructure not work for you?
I believe I explained the problem earlier - jedec_probe is wildly probing
about, and making guesses at addr_unlock, which unfortunately turn out to be
correct on every chip but mine. (For what it's worth, this is a AM29LV400BT.
Specs:
http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/215=
23d1.pdf)

> Eric
~joshua

=2D --=20
Joshua Wise | www.joshuawise.com
GPG Key     | 0xEA80E0B3
Quote       | <lilo> I akilled *@* by mistake
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/Bxb7Pn9tWOqA4LMRAjXSAJ0V8FCRI2t8Yuj777/CrYd3Q/FYegCbBF75
80+YAs18CzNNlGGW2rcd3XE=3D
=3DuDpu
=2D----END PGP SIGNATURE-----
