Received: from hex.linuxgrrls.org ([212.18.228.73] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mc9s-0001ku-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 16:33:32 +0100
Date: Wed, 4 Sep 2002 16:33:31 +0100 (BST)
From: Jasmine Strong <jasmine@hex.linuxgrrls.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Allen Curtis <acurtis@onz.com>,
	John Hall <John.Hall@optionexist.co.uk>,
	"Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Stable cvs version for 2.4 
In-Reply-To: <6203.1031152822@redhat.com>
Message-ID: <Pine.LNX.4.33.0209041629310.22657-100000@hex.linuxgrrls.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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


On Wed, 4 Sep 2002, David Woodhouse wrote:

> jasmine@hex.linuxgrrls.org said:
> > > How about we add 1 byte which contains up to 8 bit fields?
> > Adding a byte will destroy the alignment.  you'd have to add a whole
> > word.
>
> Er, what alignment?

The alignment of the structure.  Either it's a whole multiple of words or
it isn't.

> Either the CPU or something else assumes and requires alignment, in which
> case we know that we can happily abuse the low-bit of the address.

Yes, that's what I said.

> Or it doesn't, in which case we can add our single byte and use it with
> impunity.

I said that too...

> And yes, Allen's right that if we're going to add a single byte
> to the structure we should just put the colour information into that
> instead of using it to align the pointer so that we can abuse the low bit
> of the pointer :)

Yep.  I agree wholeheartedly.  I would be happiest with having
compile-time options for the three different methods-  on many
architectures writing a byte is much slower than writing a word, so on
those architectures it may be better to use an int (the current method).
On other architectures addresses are word aligned and one may abuse the
pointers with impunity (David's suggested method), and on others pointers
aren't always aligned and a byte write is nice and fast (the method using
a flags byte.)

Jas.
