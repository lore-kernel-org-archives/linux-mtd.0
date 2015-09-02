Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXF0f-0000rw-1a
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2015 20:51:57 +0000
Date: Wed, 2 Sep 2015 22:51:34 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Andrea Scian <rnd4@dave-tech.it>, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2 1/2] mtd: nand: add nand_check_erased helper functions
Message-ID: <20150902225134.5f44904e@bbrezillon>
In-Reply-To: <20150902202650.GB21475@google.com>
References: <1440409642-5495-1-git-send-email-boris.brezillon@free-electrons.com>
 <1440409642-5495-2-git-send-email-boris.brezillon@free-electrons.com>
 <20150902184143.GR81844@google.com>
 <20150902213034.76d095f0@bbrezillon>
 <20150902202650.GB21475@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2 Sep 2015 13:26:50 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> On Wed, Sep 02, 2015 at 09:30:34PM +0200, Boris Brezillon wrote:
> > On Wed, 2 Sep 2015 11:41:43 -0700
> > Brian Norris <computersforpeace@gmail.com> wrote:
> > 
> > > Hi Boris,
> > > 
> > > First of all, thanks for the persistence.
> > 
> > Hehe, you're not done with me: I still have a bunch of NAND related
> > patches to post ;-). But I need this one to be accepted first.
> 
> :)
> 
> > > 
> > > On Mon, Aug 24, 2015 at 11:47:21AM +0200, Boris Brezillon wrote:
> > > > Add two helper functions to help NAND controller drivers test whether a
> > > > specific NAND region is erased or not.
> > > 
> > > What sort of tests (if any) did you run for this?
> > 
> > As I said, I have a series depending on this patch (see this branch [1]
> > if you want more details), which means I successfully tested it on a
> > sunxi platform.
> 
> OK. I'm a little wary of other platforms that may not, for instance,
> expect the additional RNDOUT command. Hopefully we can get some more
> testing, or at least I'll try to look through a few more drivers for
> special cases.

Hm, I guess you're talking about patch 2, because this one does not
directly interact with the NAND.


> > > > + */
> > > > +int nand_check_erased_buf(void *buf, int len, int bitflips_threshold)
> > > 
> > > I don't have much problem with this function as a helper, but does it
> > > really need to be exported? This is exactly the form I *don't* want to
> > > encourage -- checking a data buffer while ignoring the OOB / ECC. Or did
> > > you have a good reason to export this one? I see you don't use it
> > > outside of this file.
> > 
> > I currently have no reason to export this function, but if we want to
> > reuse part of the logic for non standard drivers we might need to
> > export it afterwards.
> > The example I have in mind is the GPMI driver, which also need to count
> > bitflips, with the exception that ECC buffers are not necessarily
> > aligned on a byte. So exposing this function would allow reusing a
> > common logic for aligned buffers, and then dealing with unaligned parts
> > in driver specific code.
> 
> Hmm, well I think I'd still be happier if we had an example
> implementation that used it before exporting it. The GPMI case is
> interesting, but I'd like to see code first.

Sounds reasonable. I'll drop the EXPORT and make this function static.



> > > Does it make any sense to have a short-circuit condition for the
> > > threshold == 0 case? We could expect to see that for common 1-bit ECC or
> > > similar.
> > 
> > Hm, I'm not sure I understand your suggestion. How would you shortcut
> > this case? You still need to detect one bitflip before returning, right?
> > Are you suggesting to use memweight() in this case? Because if you are,
> > then I don't see any benefit since I have copied the memweight()
> > implementation to implement the nand_check_erased_buf() logic.
> > The only thing that could be avoided are the extra
> > 'bitflips > bitflips_threshold' checks, but I'm not sure it makes such a
> > big difference for small/medium NAND pages (and 1-bit ECC will
> > definitely be used on relatively small pages).
> 
> I probably wasn't too clear.
> 
> You don't need any weight check at all. You can essentially just do
> memcmp() with 0xff. Or since memcmp() requires a second buffer, maybe
> just roll our own loop checking for 0xffffffff. But that may not be
> worth it.

Yep, I thought about memcmp(), but allocating a buffer (or filling an
existing buffer with 0xff) just for that seems a bit overkill.
This leaves the specialized loop solution, but I think we should leave
it as a possible improvement if someone feels the need to get better
perfs in this case. 

> 
> > > 
> > > > +	for (; len && ((unsigned long)bitmap) % sizeof(long);
> > > 
> > > Cast pointer to unsigned long? I'd expect uintptr_t, but then it sees
> > > those are the same often enough that types.h says they're identical...
> > 
> > As I said in the header note, I blindly copied memweight()
> > implementation, sightly adapting it for my need, so there might be room
> > for improvement.
> 
> Ah, right. Well I guess my comments stand anyway.

Sure, I'll address all of them in v3.

> 
> > > 
> > > > +	     len--, bitmap++) {
> > > > +		weight = hweight8(*bitmap);
> > > > +		bitflips += BITS_PER_BYTE - weight;
> > > > +		if (unlikely(bitflips > bitflips_threshold))
> > > > +			return -EINVAL;
> > > 
> > > I'm not sure EINVAL is the right thing. This isn't a bad argument, it's
> > > just a bad flash. EUCLEAN would fit typical usage. Same comment applies
> > > elsewhere.
> > 
> > Yep, I was considering replacing EINVAL by EIO, but EUCLEAN is better.
> > I'll fix that.
> 
> I think I actually meant EBADMSG, not EUCLEAN. The MTD API uses the
> former to mean uncorrectable and the latter to mean correctable.

Right.


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
