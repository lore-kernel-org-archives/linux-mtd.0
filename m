Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6mHM-0004ML-Gv
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 16:05:28 +0000
Received: by iyb39 with SMTP id 39so7146518iyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Apr 2011 09:05:23 -0700 (PDT)
Date: Mon, 04 Apr 2011 09:05:16 -0700
Subject: Re: [PATCH] MTD: Retry Read/Write Transfer Buffer Allocations
From: Grant Erickson <marathon96@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Message-ID: <C9BF3A4C.27686%marathon96@gmail.com>
In-Reply-To: <1301902050.2760.23.camel@localhost>
Mime-version: 1.0
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>, linux-mtd@lists.infradead.org,
	linux-kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/4/11 12:27 AM, Artem Bityutskiy wrote:
> [CCing LKML in a hope to get good suggestions]
> [The patch: 
> http://lists.infradead.org/pipermail/linux-mtd/2011-April/034645.html]
> 
> Hi Grant,
> 
> Just in case, Jarkko was trying to address the same issue recently:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2011-March/034416.html
> 
> This should be a bit more complex I think. First of all, I think it is
> better to make this a separate function. Second, you should make sure
> the system does not print scary warnings when the allocation fails - use
> __GFP_NOWARN flag, just like Jarkko did.
> 
> An third, as I wrote in my answer to Jarkko, allocating large contiguous
> buffers is bad for performance: if the system memory is fragmented and
> there is no such large contiguous areas, the kernel will start writing
> back dirty FS data, killing FS caches, shrinking caches and buggers,
> probably even swapping out applications. We do not want MTD to cause
> this at all.
> 
> Probably we can mitigate this with kmalloc flags. Now, I'm not sure what
> flags are the optimal, but I'd do:
> 
> __GFP_NOWARN | __GFP_WAIT | __GFP_NORETRY
> 
> May be even __GFP_WAIT flag could be kicked out.

Artem:

Thanks for the feedback and the link to Jarkko's very similar patch. Your
suggestions will be incorporated into a subsequent patch.

For reference, I pursued a second uses-less-memory-but-is-more-complex
approach that does get_user_pages, builds up a series of iovecs for the page
extents. This worked well for all read cases I could test; however, for the
write case, the approach required yet more refinement and overhead since the
head and tail of the transfer need to be deblocked with read-modify-write
due to the NOTALIGNED checks in nand_base.c:nand_do_write_ops. I am happy to
share the work-in-progress with the list if anyone is interested.

I propose a two-stage approach. This issue has been in the kernel for about
six years. 

Can we take a modified version of Jarkko's or my simpler fixes for the first
pass and then iterate toward the get_user_pages scatter/gather approach
later?

Best,

Grant
