Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3kC4-00040z-Lv
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2015 12:38:05 +0000
Date: Tue, 1 Dec 2015 13:37:32 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] mtd: support a cleanup callback for partition parsers
Message-ID: <20151201133732.440f2357@bbrezillon>
In-Reply-To: <20151130235340.GP64635@google.com>
References: <1447989997-108476-1-git-send-email-computersforpeace@gmail.com>
 <1447989997-108476-4-git-send-email-computersforpeace@gmail.com>
 <20151130193624.152c032a@bbrezillon>
 <20151130235340.GP64635@google.com>
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

Hi Brian,

On Mon, 30 Nov 2015 15:53:40 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> Hi Boris,
> 
> On Mon, Nov 30, 2015 at 07:36:24PM +0100, Boris Brezillon wrote:
> > On Thu, 19 Nov 2015 19:26:37 -0800
> > Brian Norris <computersforpeace@gmail.com> wrote:
> > 
> > > If partition parsers need to clean up their resources, we shouldn't
> > > assume that all memory will fit in a single kmalloc() that the caller
> > > can kfree(). We should allow the parser to provide a proper cleanup
> > > routine.
> > > 
> > > Note that this means we need to keep a hold on the parser's module for a
> > > bit longer, and release it later with mtd_part_parser_put().
> > 
> > I like the general idea behind this patch but I would have done it
> > sightly differently. Here you are keeping the parser around and the
> > parse_mtd_partitions() caller is responsible for calling the
> > appropriate cleanup method and releasing the parser reference if any.
> > 
> > How about simplifying callers life by doing all this behind the scene
> > and keeping the parser reference directly inside the mtd_partition
> > object (see the following diff).
> > Of course this implies adding an extra ->parser field to all partitions
> > while all we need is one parser reference per partition array, but
> > IMHO, it also keeps the code more readable (I guess it's a matter of
> > taste).
> > Another solution would be to declare an mtd_partitions struct
> > containing the number of partitions, the partition array and a
> > reference to the partition parser, which would even further simplify
> > the caller logic (nr_parts would be directly available in the
> > mtd_partitions struct).
> > 
> > What do you think?
> 
> I guess I do like the idea of hiding the handling of the parser
> reference so mtd_device_parse_register() doesn't have to track the
> parser directly. I'll admit I didn't like yet another
> return-by-pointer-argument, but I didn't bother finding a better
> solution at the time.
> 
> About the extra parser field: it's awkward that you assume the first
> partition has the reference, making all the other instances of that
> field pointless. Maybe a new mtd_partitions struct would be nice for
> encapsulating everything properly.

Agreed. I just wanted to show that with a minimal amount of changes we
could have a simpler implementation, but I clearly prefer the
mtd_partitions approach.

> 
> > Best Regards,
> > 
> > Boris
> > 
> > diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> > index c8d5494..e0bd54d 100644
> > --- a/drivers/mtd/mtdcore.c
> > +++ b/drivers/mtd/mtdcore.c
> > @@ -630,7 +630,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
> >  	}
> >  
> >  out:
> > -	kfree(real_parts);
> > +	mtd_part_cleanup(real_parts, nr_parts);
> 
> I purposely distinguished the parsed partitions case from the "provided
> by driver" partitions. With your patch, you're letting
> mtd_part_cleanup() handle even the case where the parsing code did not
> generate 'real_parts'. Though that works for now, I think it's a bad
> choice. So we should still have something like:
> 
> 	if (parser /* or some other equivalent condition */ )
> 		mtd_part_cleanup( /* stuff allocated in parse_mtd_partitions() */ );
> 	else
> 		kfree( /* stuff we allocated in mtd_device_parse_register() */ );
> 
> But wait...why do we even kmemdup() anything in
> mtd_device_parse_register() at all? add_mtd_partitions() already makes
> sure to copy any relevant info, and it passes everything around as
> 'const'. We should just drop the kmemdup() entirely.

That's true. I guess this was done to avoid differentiating the 2 cases
in the cleanup path, but maybe we can do better if a default ->cleanup()
is provided (a simple cleanup() function calling kfree()) ...

> 
> >  	return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(mtd_device_parse_register);
> > diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
> > index 102cdef..b8a6e07 100644
> > --- a/drivers/mtd/mtdcore.h
> > +++ b/drivers/mtd/mtdcore.h
> > @@ -21,6 +21,25 @@ static inline void mtd_part_parser_put(struct mtd_part_parser *p)
> >  	module_put(p->owner);
> >  }
> >  
> > +static inline void mtd_part_cleanup(struct mtd_partition *pparts, int nrparts)
> > +{
> > +	struct mtd_part_parser *parser = pparts->parser;
> > +
> > +	/* Some parsers provide their own cleanup function */
> > +	if (parser && parser->cleanup)
> > +		parser->cleanup(pparts, nrparts);
> > +	/*
> > +	 * Others have historically relied on the core to kfree() their data.
> > +	 * Retain this behavior for legacy.
> > +	 */
> > +	else
> > +		kfree(pparts);
> 
> Now that I'm looking at my code again, I'm thinking this could work
> better as a default cleanup function. i.e., have __register_mtd_parser()
> assign parser->cleanup to something that just calls kfree().

... as you suggest here.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
