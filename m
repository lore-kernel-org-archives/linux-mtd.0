Received: from zmc.proxad.net ([212.27.53.206])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RPEQI-0001BW-U6
 for linux-mtd@lists.infradead.org; Sat, 12 Nov 2011 14:19:12 +0000
From: Florian Fainelli <ffainelli@freebox.fr>
To: linux-mtd@lists.infradead.org
Subject: Re: bad block markers + ONFI
Date: Sat, 12 Nov 2011 15:19:07 +0100
References: <CAN8TOE9FPF-drb2d8cTAvxsK3M_ZdLTaaq7hn-CgEraiWVXAcA@mail.gmail.com>
In-Reply-To: <CAN8TOE9FPF-drb2d8cTAvxsK3M_ZdLTaaq7hn-CgEraiWVXAcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201111121519.07387.ffainelli@freebox.fr>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Brian,

Le vendredi 11 novembre 2011 01:52:37, Brian Norris a =E9crit :
> Hello,
>=20
> I've wondered for a while what the MTD community expects from ONFI
> NAND with respect to bad block markers and bad block scanning. I'll
> try to enumerate some observations, followed by some recommendations
> and rationale. Please comment, and maybe I'll code one of these
> options shortly. I'd like to settle the high level points first
> though.
>=20
> Observations:
>=20
> (A) ONFI spec says the host should scan the 1st OOB byte of the 1st
> and last pages of each block. See reference [1] for exact text.
> (B) There are some ONFI parts whose data sheets do not list bad block
> scanning specifications. Presumably these are inheriting the ONFI
> definition as stated in (A).
> (C) There are many ONFI parts whose data sheets list their own bad
> block scanning specifications that do not match (A) exactly. See
> reference [3] for examples.
>=20
> Currently, we don't follow (A) for NAND that reports ONFI
> compatibility. In fact, we do not even have a flag that gives the
> option for scanning 1st and last pages of a device (this can be
> overcome pretty easily). Instead, after ONFI detection, nand_base
> proceeds to its regular BBM code. This causes different manufacturers'
> chips to be scanned according to their non-ONFI rules.
>=20
> Now, I was considering trying to implement (A) more strictly, so that
> if the chip reports ONFI compatibility, we scan 1st and last pages.
> This would help define the otherwise ambiguous behavior for parts from
> (B), which might otherwise default to the rules already in
> nand_base.c. On the other hand, this would also modify the current
> "established" behavior as well as violate the contradicting
> definitions (as in (C)).
>=20
> So I came up with a few options:
> (a) Implement (A) for all ONFI-capable NAND
> (b) Implement a flag for (A) without enforcing it for all ONFI NAND
> (allow driver to specify, perhaps?)
> (c) Make no change
>=20
> We can rationalize (a) by the ONFI standard and claim that it makes
> little breakage, since:
> * all of the exceptions (in reference [3]) allow at least the 1st
> page, 1st OOB byte scans. Last page is not a big addition
> * the "1st and 2nd page" scans are only intended for when it wasn't
> possible to scan the first page
> * the "1st or 6th byte" scans can be safely treated with 1st-byte-only
> scans (discussed in another thread recently)
>=20
> Rationale for (b) is to totally prevent breakage while allowing
> deterministic behavior for drivers that want to use the exact ONFI
> specification.
>=20
> Rationale for (c) is laziness or "selective effort" (whichever you
> prefer). It seems that there are very few chips that actually follow
> ONFI's BBM guidelines properly, so it may not really be worth it to
> try to implement them and deal with the breakage. However, this leaves
> no deterministic solution for chips that fall under (B).
>=20
> FWIW, the motivating example for these questions (point (B): Hynix
> H27U4G8F2DTR-BC) defaults to scanning the last page of each block in
> the current nand_base.c. This may not be significantly different than
> 1st and last page.
>=20
> Comments are appreciated. If you've read this far, you probably have
> something to say :)

We have already seen a manufacturer reporting that a specific Flash part wa=
s=20
ONFI-capable while it was not in fact, I also expect them not to 100% compl=
y=20
with the ONFI bad block scanning scheme (for compatibility reasons or no).

Considering that options a) is going to introduce quite some code, with a=20
possibility of breakage, so in the end, we need the old non-ONFI BBM scanni=
ng=20
code, I would vote for option b) which adds less code, preserves the existi=
ng=20
scanning behavior, and still allows us to comply with the ONFI spec if we=20
want.

>=20
> Brian
>=20
> [1] ONFI 1.0 specification, section 3.2.2
> A defective block is indicated by a byte value equal to 00h for 8-bit
> access or a word value equal to 0000h for 16-bit access being present
> at the first byte/word location in the defect area of either the first
> page or last page of the block. The host shall check the first
> byte/word of the defect area of both the first and last past page of
> each block to verify the block is valid prior to any erase or program
> operations on that block.
>=20
> [2] Example of (B): Hynix H27U4G8F2DTR-BC
>=20
> [3] http://www.linux-mtd.infradead.org/nand-data/nanddata.html
> There are a range of data sheets that say to scan:
> 1st and 2nd page (1st byte in OOB)
> 1st page (1st byte in OOB)
> 1st page (1st or 6th byte in OOB)
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

=2D-=20
=46lorian
