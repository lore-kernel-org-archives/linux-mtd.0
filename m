Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEfZf-0000U2-Th
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2016 17:00:54 +0000
Date: Wed, 7 Dec 2016 17:59:33 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>, Kees Trommel
 <ctrommel@aimvalley.nl>, linux-mtd@lists.infradead.org
Subject: Re: Add --skip-all-ffs option to mtd-utils nandwrite
Message-ID: <20161207175933.28c0df93@bbrezillon>
In-Reply-To: <3b42761b-4415-f8a1-37cf-f01c064b76d3@gmail.com>
References: <82cbfdbc-c79b-01b0-bc64-a4259d7a150e@aimvalley.nl>
 <16abefc9-61e8-3b0d-c44c-6d02764ec8e9@sigma-star.at>
 <33437f45-d3e8-17ec-d5b0-0118d50ff6ec@aimvalley.nl>
 <cb18365f-4fe0-9e07-f7cc-6c2bf72018b3@sigma-star.at>
 <15c62cdb-38f7-76b8-b3fc-6b3c2766e9df@gmail.com>
 <b2a82878-d9f8-f22b-1993-aeae926a0e40@sigma-star.at>
 <d4a1082b-d79a-8c90-b17d-5d559e32308a@gmail.com>
 <20161207170700.4b967faa@bbrezillon>
 <3b42761b-4415-f8a1-37cf-f01c064b76d3@gmail.com>
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

On Wed, 7 Dec 2016 17:31:04 +0100
Marek Vasut <marek.vasut@gmail.com> wrote:

> On 12/07/2016 05:07 PM, Boris Brezillon wrote:
> > On Wed, 7 Dec 2016 15:09:49 +0100
> > Marek Vasut <marek.vasut@gmail.com> wrote:
> >   
> >> On 12/07/2016 09:21 AM, David Oberhollenzer wrote:  
> >>> On 12/07/2016 06:01 AM, Marek Vasut wrote:    
> >>>> +               if (skipallffs)
> >>>> +               {
> >>>> +                       for (ii = 0; ii < mtd.min_io_size; ii +=
> >>>> sizeof(uint32_t))
> >>>> +                       {
> >>>> +                               if (*(uint32_t*)(writebuf + ii) !=
> >>>> 0xffffffff)
> >>>> +                                       break;
> >>>>
> >>>> Is this memcmp()-alike function ?
> >>>>
> >>>> +                       }
> >>>> +                       if (ii == mtd.min_io_size)
> >>>> +                               allffs = 1;
> >>>> +               }
> >>>> +               if (!allffs) {    
> >>> The point of the patch is not to write a page that is filled with 0xFF bytes.
> >>> A feature that is turned off by default and can be activated via a command
> >>> line switch.    
> >>
> >> That much I figured out
> >>  
> >>> The code you are trying to replace tries to figure out if an entire block of
> >>> memory is set to 0xFF. The code path should be conditional, as this feature
> >>> is turned off unless explicitly requested.    
> >>
> >> And to do that, we need to open-code it like above ?
> >> Looks pretty crappy.  
> > 
> > I agree with Marek on one point: we're likely to need the 0xff-pattern
> > check in other places, so how about implementing a helper (or several
> > helpers) in libmtd?  
> 
> Helper would be great, yeah.
> 
> >>>> This could be simply turned to:
> >>>>
> >>>> ret = 0;
> >>>> if (!memcmp(writebuf, writebuf + 1, mtd.min_io_size - 1)) {
> >>>>     ret = mtd_write(....);
> >>>> }    
> > 
> > Oh, nice trick! It works with and additional writebuf[0] == 0xff test.
> > However I'm concerned about readability (can be addressed with a comment
> > explaining what you're doing)  
> 
> Yeah, it's not exactly obvious. You need the writebuf[0] == pattern test
> and bufsize >= 2 test.
> 
> >, and perfs (memcmp is likely to be
> > optimized for aligned accesses, and you defeat that with your writebuf
> > + 1).  
> 
> That's up to libc optimization, really. memcpy() implementation in glibc
> and musl at least does a lot of magic to optimize copying regardless of
> alignment.
> 
> > Here's a proposal for the pattern comparison API:
> > 
> > struct pattern_buf {
> > 	unsigned int size;
> > 	void *buf;
> > }
> > 
> > const struct pattern_buf *mtd_create_pattern_buf(int size, u8 pattern);
> > void mtd_free_pattern_buf(const struct pattern_buf *pbuf);
> > bool mtd_check_pattern(const struct pattern_buf *pbuf, void *buf,
> > 		       int size);
> > 
> > This way you can allocate a pattern buffer of pagesize and re-use it for
> > each new page you want to check. This also solves the unaligned
> > memcmp() problem.  
> 
> Here you're filling memory with stuff, which for large buffer will
> trigger IO to main memory, which is slow. This is unnecessary since
> you already have such data available to you (it's your own buffer and
> it's in cache), just use it.

Indeed, I didn't consider caches, and as you said, memcmp is likely to
be optimized for the unaligned case, and even if it's not, I'm not sure
we really care about perfs here. 

> 
> And the implementation would be:
> 
> int mtd_buffer_is_filled_with_byte(void *buf, size_t size, u8 pattern)
> {
>   int match;
> 
>   if (size == 0)
>     return 0;
> 
>   match = (*buf == pattern);
> 
>   return (size == 1) ? match : !memcmp(buf, buf + 1, size - 1)
> }
> 

Looks good to me. Feel free to post a patch ;-).
