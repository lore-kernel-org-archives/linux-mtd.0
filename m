Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXEck-0005li-A5
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2015 20:27:15 +0000
Received: by pacfv12 with SMTP id fv12so22358638pac.2
 for <linux-mtd@lists.infradead.org>; Wed, 02 Sep 2015 13:26:53 -0700 (PDT)
Date: Wed, 2 Sep 2015 13:26:50 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Andrea Scian <rnd4@dave-tech.it>, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2 1/2] mtd: nand: add nand_check_erased helper functions
Message-ID: <20150902202650.GB21475@google.com>
References: <1440409642-5495-1-git-send-email-boris.brezillon@free-electrons.com>
 <1440409642-5495-2-git-send-email-boris.brezillon@free-electrons.com>
 <20150902184143.GR81844@google.com>
 <20150902213034.76d095f0@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150902213034.76d095f0@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 02, 2015 at 09:30:34PM +0200, Boris Brezillon wrote:
> On Wed, 2 Sep 2015 11:41:43 -0700
> Brian Norris <computersforpeace@gmail.com> wrote:
> 
> > Hi Boris,
> > 
> > First of all, thanks for the persistence.
> 
> Hehe, you're not done with me: I still have a bunch of NAND related
> patches to post ;-). But I need this one to be accepted first.

:)

> > 
> > On Mon, Aug 24, 2015 at 11:47:21AM +0200, Boris Brezillon wrote:
> > > Add two helper functions to help NAND controller drivers test whether a
> > > specific NAND region is erased or not.
> > 
> > What sort of tests (if any) did you run for this?
> 
> As I said, I have a series depending on this patch (see this branch [1]
> if you want more details), which means I successfully tested it on a
> sunxi platform.

OK. I'm a little wary of other platforms that may not, for instance,
expect the additional RNDOUT command. Hopefully we can get some more
testing, or at least I'll try to look through a few more drivers for
special cases.

> BTW, I tested it with the nandflipbits tool [2] I posted a while ago.
> Could you consider taking it (or a similar tool) in mtd-utils?

I'll try to take another look at it.

> Andrea, did you test this patch on your imx platform(s)?
> 
> > 
> > > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > > ---
> > >  drivers/mtd/nand/nand_base.c | 108 +++++++++++++++++++++++++++++++++++++++++++
> > >  include/linux/mtd/nand.h     |   8 ++++
> > >  2 files changed, 116 insertions(+)
> > > 
> > > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > > index ceb68ca..4d2ef65 100644
> > > --- a/drivers/mtd/nand/nand_base.c
> > > +++ b/drivers/mtd/nand/nand_base.c
> > > @@ -1101,6 +1101,114 @@ out:
> > >  EXPORT_SYMBOL(nand_lock);
> > >  
> > >  /**
> > > + * nand_check_erased_buf - check if a buffer contains (almost) only 0xff data
> > > + * @buf: buffer to test
> > > + * @len: buffer length
> > > + * @bitflips_threshold: maximum number of bitflips
> > > + *
> > > + * Check if a buffer contains only 0xff, which means the underlying region
> > > + * has been erased and is ready to be programmed.
> > > + * The bitflips_threshold specify the maximum number of bitflips before
> > > + * considering the region is not erased.
> > > + * Note: The logic of this function has been extracted from the memweight
> > > + * implementation, except that nand_check_erased_buf function exit before
> > > + * testing the whole buffer if the number of bitflips exceed the
> > > + * bitflips_threshold value.
> > > + *
> > > + * Returns a positive number of bitflips or -ERROR_CODE.
> > 
> > Small clarification:
> > 
> >   "Returns a positive number of bitflips less than or equal to
> >   bitflips_threshold, or -ERROR_CODE for bitflips in excess of the
> >   threshold."
> > 
> 
> Sure, I'll change this comment.
> 
> > > + */
> > > +int nand_check_erased_buf(void *buf, int len, int bitflips_threshold)
> > 
> > I don't have much problem with this function as a helper, but does it
> > really need to be exported? This is exactly the form I *don't* want to
> > encourage -- checking a data buffer while ignoring the OOB / ECC. Or did
> > you have a good reason to export this one? I see you don't use it
> > outside of this file.
> 
> I currently have no reason to export this function, but if we want to
> reuse part of the logic for non standard drivers we might need to
> export it afterwards.
> The example I have in mind is the GPMI driver, which also need to count
> bitflips, with the exception that ECC buffers are not necessarily
> aligned on a byte. So exposing this function would allow reusing a
> common logic for aligned buffers, and then dealing with unaligned parts
> in driver specific code.

Hmm, well I think I'd still be happier if we had an example
implementation that used it before exporting it. The GPMI case is
interesting, but I'd like to see code first.

> > 
> > And especially if we don't end up exporting this one, I'd really like
> > some extra explanatory text next to the public interface
> > (nand_check_erased_ecc_chunk()) to explain some of the pitfalls.
> > Particularly, why we must check both the data and spare area, and how we
> > highly recommend (if not require) that new drivers use the existing
> > methods rather than roll their own.
> 
> This is something I can add even if we keep exporting the previous
> function ;-).

Sure, I just said "especially" not "only" :)

> > 
> > > +{
> > > +	const unsigned char *bitmap = buf;
> > > +	int bitflips = 0;
> > > +	int weight;
> > > +	int longs;
> > > +
> > 
> > Does it make any sense to have a short-circuit condition for the
> > threshold == 0 case? We could expect to see that for common 1-bit ECC or
> > similar.
> 
> Hm, I'm not sure I understand your suggestion. How would you shortcut
> this case? You still need to detect one bitflip before returning, right?
> Are you suggesting to use memweight() in this case? Because if you are,
> then I don't see any benefit since I have copied the memweight()
> implementation to implement the nand_check_erased_buf() logic.
> The only thing that could be avoided are the extra
> 'bitflips > bitflips_threshold' checks, but I'm not sure it makes such a
> big difference for small/medium NAND pages (and 1-bit ECC will
> definitely be used on relatively small pages).

I probably wasn't too clear.

You don't need any weight check at all. You can essentially just do
memcmp() with 0xff. Or since memcmp() requires a second buffer, maybe
just roll our own loop checking for 0xffffffff. But that may not be
worth it.

> > 
> > > +	for (; len && ((unsigned long)bitmap) % sizeof(long);
> > 
> > Cast pointer to unsigned long? I'd expect uintptr_t, but then it sees
> > those are the same often enough that types.h says they're identical...
> 
> As I said in the header note, I blindly copied memweight()
> implementation, sightly adapting it for my need, so there might be room
> for improvement.

Ah, right. Well I guess my comments stand anyway.

> > 
> > > +	     len--, bitmap++) {
> > > +		weight = hweight8(*bitmap);
> > > +		bitflips += BITS_PER_BYTE - weight;
> > > +		if (unlikely(bitflips > bitflips_threshold))
> > > +			return -EINVAL;
> > 
> > I'm not sure EINVAL is the right thing. This isn't a bad argument, it's
> > just a bad flash. EUCLEAN would fit typical usage. Same comment applies
> > elsewhere.
> 
> Yep, I was considering replacing EINVAL by EIO, but EUCLEAN is better.
> I'll fix that.

I think I actually meant EBADMSG, not EUCLEAN. The MTD API uses the
former to mean uncorrectable and the latter to mean correctable.

> > 
> > > +	}
> > > +
> > > +
> > > +	for (longs = len / sizeof(long); longs;
> > > +	     longs--, bitmap += sizeof(long)) {
> > > +		BUG_ON(longs >= INT_MAX / BITS_PER_LONG);
> > 
> > Please don't add BUG_ON(). The language around it has gotten even
> > stronger to discourage its use. And in this instance I don't think it's
> > even helpful; because 'longs' is derived from 'len' (which is an 'int'),
> > this condition is mathematically impossible, no?
> 
> Ditto: everything was blindly copied from the memweight implementation.

OK.

> > 
> > Also (feel free to shoot me down), wouldn't the loop bounds be a little
> > more straightforward (and consistent with the rest of the function), and
> > not require the 'longs' variable, when written as the following?
> > 
> > 	for (; len >= sizeof(long); len -= sizeof(long), bitmap += sizeof(long)) {
> > 		...
> > 	}
> 
> Definitely better.
> 
> > 
> > > +		weight = hweight_long(*((unsigned long *)bitmap));
> > > +		bitflips += BITS_PER_LONG - weight;
> > > +		if (unlikely(bitflips > bitflips_threshold))
> > > +			return -EINVAL;
> > > +	}
> > > +
> > > +	len %= sizeof(long);
> > 
> > If you did the above, then you shouldn't need this line.
> 
> Yep.
> 
> > 
> > > +
> > > +	for (; len > 0; len--, bitmap++) {
> > > +		weight = hweight8(*bitmap);
> > > +		bitflips += BITS_PER_BYTE - weight;
> > > +		if (unlikely(bitflips > bitflips_threshold))
> > > +			return -EINVAL;
> > > +	}
> > > +
> > > +	return bitflips;
> > > +}
> > > +EXPORT_SYMBOL(nand_check_erased_buf);
> > > +
> > > +/**
> > > + * nand_check_erased_ecc_chunk - check if an ECC chunk contains (almost) only
> > > + *				 0xff data
> > > + * @data: data buffer to test
> > > + * @datalen: data length
> > > + * @ecc: ECC buffer
> > > + * @ecclen: ECC length
> > > + * @extraoob: extra OOB buffer
> > > + * @extraooblen: extra OOB length
> > > + * @bitflips_threshold: maximum number of bitflips
> > > + *
> > > + * Check if a data buffer and its associated ECC and OOB data contains only
> > > + * 0xff pattern, which means the underlying region has been erased and is
> > > + * ready to be programmed.
> > > + * The bitflips_threshold specify the maximum number of bitflips before
> > > + * considering the region as not erased.
> > > + *
> > > + * Returns a positive number of bitflips or -ERROR_CODE.
> > 
> > Add similar language from above? Also, it's very important to note that
> > this function wipes the buffers in the nearly-erased case!
> 
> Yes, I'll add that in the comment, in addition to a lot more precise
> description of how to use it and the importance of the ecc and extraoob
> fields (even if they are optionals).
> 
> 
> Thanks for your review.
> 
> Best Regards,
> 
> Boris
> 
> [1]https://github.com/bbrezillon/linux-sunxi/tree/sunxi/mtd-next
> [2]http://patchwork.ozlabs.org/patch/415517/

Brian
