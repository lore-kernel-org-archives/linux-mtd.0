Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17JtFj-0002MX-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2002 10:56:51 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200206170924.g5H9OXJJ003077@blooper.utfors.se> 
References: <200206170924.g5H9OXJJ003077@blooper.utfors.se>  <0111121314140A.28381@jocke.lumentis.se> <02012911331100.15969@jocke.lumentis.se> <02022614424803.15969@jocke.lumentis.se> 
To: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
Cc: linux-mtd@lists.infradead.org
Subject: Re: point()/unpoint() questions + small cfi_cmdset_0001.c patch 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Date: Mon, 17 Jun 2002 10:56:36 +0100
Message-ID: <20561.1024307796@redhat.com>
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


Joakim.Tjernlund@lumentis.se said:
> 1)  There is no point()/unpoint() function pointers in struct
> map_info, so I wounder where one should
>      add the point()/unpoint() functions?

> 2)  It is not clear to me how the semantics for point()/unpoint()
> works, is the following sequence legal: 

The point()/unpoint() methods date back to about 1997, and were never used
or properly defined.

The idea was to return a pointer directly into the flash chip, and to lock 
the chip state machine so that it can't be removed from read mode until the 
corresponding unpoint(). Flash drivers would either have to keep track of 
multiple point() requests or disallow subsequent point() calls when one was 
outstanding. 

Any code with a point() call outstanding would need to take care not to do 
anything which would deadlock, of course.

These methods would be implemented in the flash chip driver -- the map 
driver would only need to provide the physical (or virtual) address to look 
at, in the common case where the flash isn't paged. I'd argue that we don't 
want to allow point() to happen in the case where the flash _is_ paged -- 
and hence even read requests outside the region of the point() request 
could deadlock.

The thing is; I'm not convinced I like the potential for deadlock. I've 
been tempted to use this kind of hack for mounting JFFS2 without multiple 
out of line read calls, but haven't actually got round to even hacking up 
the code to test how fast it would be, by replacing the jffs2_flash_read() 
in scan.c with a memcpy from a hard-coded address.

For execute in place, we need something similar, but more sophisticated. The
plan for that, which Linus approved at the time, was to provide a new mmzone
-- and array of 'struct page's, which can be added into the page cache on
demand by the XIP-aware file system. When a given (logical) page from a file
moves from one location to another, or when the chip is temporarily in a
mode other than read mode, we have to mark those pages invalid, and
subsequent faults on those pages must sleep until the chip is back in read
mode.

The RMAP VM helps us a lot here -- until we could find all the virtual 
mappings of a given physical page, it was just about impossible to do what 
we need. 

Note that using AMD chips instead of Intel chips seems to be particularly 
sensible if you want XIP -- with Intel chips, the whole chip goes into 
status mode when you're doing things with it. Yet I believe that with AMD 
chips, only the block to which you're actually writing returns status bits, 
and all other erase blocks remain readable during the operation.

Anyway, to get back to the point... given that I don't like the possibility 
of deadlock with the naïve point/unpoint routines, and that I think we will 
need to do the page-based thing for XIP anyway, I suspect we should just 
use the suggested XIP setup for doing what you want in kernel space.

So if you're looking at letting JFFS2 read directly from the flash, it 
would call a chip driver method akin to ioremap(), which would return a 
kernel virtual address from which all the flash can be read. The chip 
driver then marks pages absent as an when necessary -- for kernel mappings 
we can do that even without the rmap VM. We can probably also mark these 
pages as cacheable, to let burst reads work.

Comments?

--
dwmw2
