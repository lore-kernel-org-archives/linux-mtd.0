Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by casper.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vq9O7-0006Jd-Hi
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2013 22:33:16 +0000
Date: Mon, 9 Dec 2013 19:32:59 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx: Use info->use_dma to release DMA
 resources
Message-ID: <20131209223258.GG31944@localhost>
References: <1385470344-2542-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131127075819.GC13929@norris.computersforpeace.net>
 <20131127113405.GA2326@localhost>
 <20131209215547.GX27149@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131209215547.GX27149@ld-irv-0074.broadcom.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Wed, Nov 27, 2013 at 08:34:06AM -0300, Ezequiel Garcia wrote:
> > On Tue, Nov 26, 2013 at 11:58:19PM -0800, Brian Norris wrote:
> >
> > It's a very rare condition, but it's a real bug. Is that enough for -stable?
> 
> Yes, this qualifies just fine. I'm not quite sure how far back this can
> go on stable, though, as we have a lot of churn in pxa3xx_nand.c.
> It looks like the bug is long-standing, but we may need to port it for
> older releases. Let me know what you want to do here.
> 

No, it's not. This was actually introduced by me when we added the
non-DMA initial probing to allocate a buffer based on the page size.

Namely, I *think* this commit introduces the bug (haven't actually
tested it):

commit 62e8b851783138a11da63285be0fbf69530ff73d
Author: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date:   Fri Oct 4 15:30:38 2013 -0300

  mtd: nand: pxa3xx: Allocate data buffer on detected flash size

This commit changed the way we allocate the buffer: the first READ_ID
is issued with a small kmalloc'ed buffer and only later DMA buffer are
allocated.

So the actual decision must now be made based on 'info->use_dma' instead
of module parameter 'use_dma' (this also uncovers a real crappy naming issue
in this driver, which I should have changed long long ago).

Therefore, this doesn't hit stable, and it's just v3.13 material; sorry
for the confusion. And to be fair, the commit log could much better.
Right now it looks a bit laconic. Want me to resend a more verbose one?

> BTW, am I reading something wrong or is pxa3xx_nand.c broken for
> multi-CS systems? It seems like each chip's pxa3xx_nand_scan() will take
> turns overwriting info->buf_size and info->data_buff, leaking memory in
> the process. I guess the driver's designed to only use one chip at a
> time?
> 

Glad you noticed. I've been having problems with this since a long time.
The multi-chip feature was added a long time ago, and the last time I
checked it also looked quite broken. However, I don't have any HW to
test, nor I know anyone else that can help here.

I've been tempted to remove it, but I wasn't convinced either. My best
solution was to always work with extra care and touch the relevant multi-cs
code in the least intrusive way.

FWIW, there's not a single current user in the kernel for that, given
'num_cs' is always set to '1' in board files.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
