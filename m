Received: from sparta.scl.co.uk ([212.38.81.5] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173EfP-0003TY-00
	for <linux-mtd@lists.infradead.org>; Thu, 02 May 2002 12:22:31 +0100
From: John Sutton <john@scl.co.uk>
To: Russ Dill <Russ.Dill@asu.edu>
Subject: Re: Booting from DOC2000 with GRUB loader
Date: Thu, 2 May 2002 11:56:52 +0100
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org
References: <02050120383503.07252@diva.localdomain> <02050209075601.08259@diva.localdomain> <1020331947.19824.3160.camel@russ>
In-Reply-To: <1020331947.19824.3160.camel@russ>
MIME-Version: 1.0
Message-Id: <02050212224002.09412@diva.localdomain>
Content-Transfer-Encoding: quoted-printable
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Nearly there ;-)...

On Thu, 02 May 2002, Russ Dill wrote:
> On Thu, 2002-05-02 at 00:47, John Sutton wrote:
> > Hi again
> >=20
> > Many thanks for all that feedback!  Definitely a positive consensus
> > about the units for start_offset ;-)
> >=20
> > Jasmine suggests that I should leave some extra after the end of grub=
 for
> > future expansion, which seems a good idea, but raises in my mind the
> > question as to how grub (or anything else) knows where the nftl parti=
tion
> > starts?  Does nftl_format also write a pointer to the start block
> > somewhere else?  Or does the format contain some kind of signature?
>=20
> just sure to erase any unused sectors.

Is a sector a block?  And what is a block?

Here's where I'm up to now:

=2E/nftl_format /dev/mtd0 98304
$Id: nftl_format.c,v 1.17 2001/08/29 14:28:48 dwmw2 Exp $
Erase size not 8Kb - I'm confused

So I put a %d for meminfo.erasesize in the printf and I get:

=2E/nftl_format /dev/mtd0 98304
$Id: nftl_format.c,v 1.17 2001/08/29 14:28:48 dwmw2 Exp $
Erase size not 8Kb - I'm confused 16384

So I've got a 16Kb erase size.  What now?  If I hack the source so that i=
t
just falls through this test and proceeds to malloc(meminfo.erasesize * 5=
)
am I heading for big trouble or success?

Once I've gotten past this little gotcha, how do I go about using the
erase util to erase the piece between the end of the grub and the start o=
f
the nftl partition?  I'm thinking that if I start the nftl at 98304 then =
I
don't need to erase anything because doc_loadbios will have already erase=
d
the unoccupied 96k-87k=3D9k at the end of the last of the 6 blocks.=20
Whereas, if I do:

=2E/nftl_format /dev/mtd0 114688  ( i.e. 7 x 16k block )

then I'll need to do:

erase /dev/mtd0 6 1

or, should that be:

erase /dev/mtd0 98304 16384

Sorry to be a dummy ;-(

Thanks again!

***************************************************
John Sutton
SCL Internet
URL http://www.scl.co.uk/
Tel. +44 (0) 1239 711 888
***************************************************
