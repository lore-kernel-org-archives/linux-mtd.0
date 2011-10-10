Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RDKLr-0005UX-3l
	for linux-mtd@lists.infradead.org; Mon, 10 Oct 2011 18:13:23 +0000
Date: Mon, 10 Oct 2011 20:12:10 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH] Add driver for M-sys / Sandisk diskonchip G4 nand flash
Message-ID: <20111010181210.GA23655@parrot.com>
References: <1318258091-12670-1-git-send-email-mikedunn@newsguy.com>
	<201110101751.19010.marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <201110101751.19010.marek.vasut@gmail.com>
Cc: Marek Vasut <marek.vasut@gmail.com>,
	"robert.jarzmik@free.fr" <robert.jarzmik@free.fr>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 10, 2011 at 04:51:18PM +0100, Marek Vasut wrote:
> On Monday, October 10, 2011 04:48:10 PM Mike Dunn wrote:
> > This is a driver for the diskonchip G4 in my Palm Treo680.  I've tested it
> > fairly well; it passes the nandtest utility, and I've been able to create a
> > ubifs using it.

Hello Mike,

I had a quick look at how you handle BCH ecc correction. If I understood
correctly:
- hw generates a 56-bit polynomial remainder (56 = 14*4, m=14, t=4)
- hw-generated polynomial terms are mapped to bits in a way not compatible with
the BCH library

Still, I do not understand why you go to great lengths computing syndromes in
your code, using a mix of generated remainder tables and Galois field tables.

Why don't you just reformat the hw-generated polynomial (cheap, only 56 bits
to shuffle) and let the BCH library do the whole computation ?

> > +
> > +     /* undo last step in BCH alg; currently this is a mystery to me */

Maybe I can help here :)
This last step exists because the BCH library represents nand data as a large
polynomial with high order terms first (this is consistent with several hw
generators). If N is the total bit length of array data[], then byte data[0]
will contain polynomial terms X^(N-1) (in bit 7), X^(N-2), ... X^(N-8) (in bit
0). Byte data[1] will contain X^(N-9) (bit 7) ... X^(N-16) (bit 0) and so on.

Thus, term X^i is located in byte data[(N-1-i)/8], in bit position
7-(N-1-i)%8. The last step:

   errloc[i] = (errloc[i] & ~7)|(7-(errloc[i] & 7));

was added just so that users can correct bit errors with byte access:

   data[errloc[i]/8] ^= 1 << (errloc[i] & 7);

instead of (the slightly more complicated):

   data[errloc[i]/8] ^= 1 << (7-(errloc[i] & 7));

And that's all there is to it, really.

Looking at your code, it seems that your hw generator represents nand data[] as
a 32-bit words array with high order terms in lower bits (assuming your machine
is little-endian):

data[0] = X^(N-32) (bit 31) ... X^(N-1) (bit 0),
data[1] = X^(N-64) (bit 31) ... X^(N-33) (bit 0)

.. and so on. In your case you don't need the modulo mirroring step.

BR,

--
Ivan
