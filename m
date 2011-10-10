Received: from smtp.newsguy.com ([74.209.136.69])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RDN02-00088r-8V
	for linux-mtd@lists.infradead.org; Mon, 10 Oct 2011 21:03:03 +0000
Message-ID: <4E935D5D.4050504@newsguy.com>
Date: Mon, 10 Oct 2011 14:02:21 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: [PATCH] Add driver for M-sys / Sandisk diskonchip G4 nand flash
References: <1318258091-12670-1-git-send-email-mikedunn@newsguy.com>	<201110101751.19010.marek.vasut@gmail.com>
	<20111010181210.GA23655@parrot.com>
In-Reply-To: <20111010181210.GA23655@parrot.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
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

On 10/10/2011 11:12 AM, Ivan Djelic wrote:
>
> Hello Mike,

Hi Ivan.  Boy, I wish I had dropped you a line sooner!

> I had a quick look at how you handle BCH ecc correction. If I understood
> correctly:
> - hw generates a 56-bit polynomial remainder (56 = 14*4, m=14, t=4)

Well, m=14 and t=4, yes.  But honestly, I'm not sure what the hardware
generates, except that it is the same size as the syndrome, given m and t.

> - hw-generated polynomial terms are mapped to bits in a way not compatible with
> the BCH library

Well yes, the bit order is backwards.  But again, I'mnot sure what the hardware
gives me.  The key to my success was having a look at some other code that does
the same thing (but using static remainder tables, and preserving the reversed
bit order throughout the whole decoding).  Then I got a basic understanding of
the mechanics of the steps, and for the driver I re-wrote (using generated
remainder tables and reversing the bit order along the way) the first two steps
of the decoding (up to the syndrome calculation), then let your code handle the
rest (error locator polynomial and root-finding).

If you can enlighted me, I'd be grateful!  From what I've been able to
understand from the textbook, it looks to me that the processing normally done
on the entire code polynomial - as described in the text - is done only on the
56 bit hw ecc.  In my simplistic interpretation, it seems that the 56 bits are
some kind of distillation of the entire code vector.  The steps are all the same.

> Still, I do not understand why you go to great lengths computing syndromes in
> your code, using a mix of generated remainder tables and Galois field tables.
>
> Why don't you just reformat the hw-generated polynomial (cheap, only 56 bits
> to shuffle) and let the BCH library do the whole computation ?

Could you elaborate?  What are the 56 bits that the hardware gives me?  It's not
the syndrome, right?  (BTW, I did verify that the results are correct).

>>> +
>>> +     /* undo last step in BCH alg; currently this is a mystery to me */
> Maybe I can help here :)
> This last step exists because the BCH library represents nand data as a large
> polynomial with high order terms first (this is consistent with several hw
> generators). If N is the total bit length of array data[], then byte data[0]
> will contain polynomial terms X^(N-1) (in bit 7), X^(N-2), ... X^(N-8) (in bit
> 0). Byte data[1] will contain X^(N-9) (bit 7) ... X^(N-16) (bit 0) and so on.
>
> Thus, term X^i is located in byte data[(N-1-i)/8], in bit position
> 7-(N-1-i)%8. The last step:
>
>    errloc[i] = (errloc[i] & ~7)|(7-(errloc[i] & 7));
>
> was added just so that users can correct bit errors with byte access:
>
>    data[errloc[i]/8] ^= 1 << (errloc[i] & 7);
>
> instead of (the slightly more complicated):
>
>    data[errloc[i]/8] ^= 1 << (7-(errloc[i] & 7));
>
> And that's all there is to it, really.
>
> Looking at your code, it seems that your hw generator represents nand data[] as
> a 32-bit words array with high order terms in lower bits (assuming your machine
> is little-endian):
>
> data[0] = X^(N-32) (bit 31) ... X^(N-1) (bit 0),
> data[1] = X^(N-64) (bit 31) ... X^(N-33) (bit 0)
>
> .. and so on. In your case you don't need the modulo mirroring step.

Thanks much, Ivan!  I'll need some time to digest that.  All I knew was that the
last three bits were screwy, and by chance discovered that undoing that last
step generted the correct result.

Thanks again,
Mike
