Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Jyvm-0002tW-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2002 17:00:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLIEKMFEAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLIEKMFEAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] scan.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 17 Jun 2002 17:00:37 +0100
Message-ID: <30609.1024329637@redhat.com>
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

joakim.tjernlund@lumentis.se said:
>  Yes shit happens, but removing this scan here lowers my mount time
> alot(don't have the figures anymore) and shit has yet to happen :-) 

Yeah - I've been doing profiling too and although it's not that close to 
the top of the list, I suspect that's because my flash is mostly full, so 
there aren't many empty blocks to be scanned.

I'm happy to remove it from the mount path -- but I'd like to do it later,
before actually trying to use those blocks, rather than simply refraining
from doing it at all.

> Yes, this is what I did too(removing the check of the data CRC) and
> that reduces my mount time alot. It's the biggest part of my mount
> time.

Yep, mine too -- after jffs2_get_ino_cache() was fixed, anyway. 

c0083ff0 jffs2_scan_empty                             10   0.0225
c0081d30 jffs2_add_full_dnode_to_fraglist             12   0.0181
c0140e90 huft_build                                   13   0.0093
c00bb6c8 cfi_intelext_read                            17   0.0127
c0140014 zlib_inflate_fast                            31   0.0356
c00838ec jffs2_scan_eraseblock                        79   0.0440
c0084258 jffs2_scan_inode_node                        99   0.0709
c013ad60 memmove                                     214   0.1911

But we do need to check data CRC at some point before starting to each node,
or deciding that other nodes are obsolete due to the existence of the node.

>  I am not that familiar with flash HW, but I thought that once data
> was correctly written to flash, it's more or less "safe". A nearby
> flipping bit can by checked for once the flag  has been cleared. 

Nah, it's never safe -- you can always manage to corrupt it somehow :)

> I don't see how this would increase the probability for random data
> being interpreted as a real node, it's only the data CRC check that is
> omitted, not the whole node CRC.  

OK, that wouldn't increase the chances of error by too much, and could 
perhaps be acceptable. I'd be interested in seeing how much that gives us 
over the once-per-mount approach. P'raps we could make it an option, 
although I'd prefer it to be disabled by default. 

--
dwmw2
