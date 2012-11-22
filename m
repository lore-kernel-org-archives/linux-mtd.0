Received: from userp1040.oracle.com ([156.151.31.81])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TbUjh-0004vc-A5
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 11:14:26 +0000
Date: Thu, 22 Nov 2012 14:14:11 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [patch] UBIFS: use kmalloc_array() in recomp_data_node()
Message-ID: <20121122111411.GJ6186@mwanda>
References: <20121117151126.GA16900@elgon.mountain>
 <1353580297.2701.29.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1353580297.2701.29.camel@sauron.fi.intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 22, 2012 at 12:31:37PM +0200, Artem Bityutskiy wrote:
> On Sat, 2012-11-17 at 18:11 +0300, Dan Carpenter wrote:
> >  	out_len = le32_to_cpu(dn->size);
> > -	buf = kmalloc(out_len * WORST_COMPR_FACTOR, GFP_NOFS);
> > +	buf = kmalloc_array(out_len, WORST_COMPR_FACTOR, GFP_NOFS);
> >  	if (!buf)
> >  		return -ENOMEM;
> 
> I think this makes the code unreadable, because we really allocate a
> buffer, not an array.

The problem with the original code is that the multiply looks very
suspect.  Everyone who reads it has to backtrack to find where
dn->size is capped.

I guess in one sense we never allocate an array, we always declare
it on the stack.  We debated the naming and there really isn't a
good name.  kmalloc_safe() isn't right either.  But anyway, the
intent is that eventually someone will right a coccinelle script
which replaces all these allocations with kmalloc_array().

When I look at this code more, I still don't see a place where
dn->size is capped.  So I think we *need* the integer overflow
check as an integer overflow fix and not just as a cleanup.

regards,
dan carpenter
