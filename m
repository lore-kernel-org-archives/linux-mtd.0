Received: from mail-ie0-x22d.google.com ([2607:f8b0:4001:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vq8oN-0003u2-0b
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2013 21:56:19 +0000
Received: by mail-ie0-f173.google.com with SMTP id to1so7210905ieb.4
 for <linux-mtd@lists.infradead.org>; Mon, 09 Dec 2013 13:55:54 -0800 (PST)
Date: Mon, 9 Dec 2013 13:55:47 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx: Use info->use_dma to release DMA
 resources
Message-ID: <20131209215547.GX27149@ld-irv-0074.broadcom.com>
References: <1385470344-2542-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131127075819.GC13929@norris.computersforpeace.net>
 <20131127113405.GA2326@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131127113405.GA2326@localhost>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry this one fell through a bit.

On Wed, Nov 27, 2013 at 08:34:06AM -0300, Ezequiel Garcia wrote:
> On Tue, Nov 26, 2013 at 11:58:19PM -0800, Brian Norris wrote:
> > For my reference, have you actually seen this bug in practice? I'm not
> > sure how well this fits in the -stable rules, if it hasn't been observed
> > and tested appropriately.
> 
> Yes, I've seen this bug in practice, or otherwise wouldn't notice such small
> typo :-) The bug was triggered in PXA platforms, when the device cannot
> be identified (nand_scan fails).
> 
> It's a very rare condition, but it's a real bug. Is that enough for -stable?

Yes, this qualifies just fine. I'm not quite sure how far back this can
go on stable, though, as we have a lot of churn in pxa3xx_nand.c. It
looks like the bug is long-standing, but we may need to port it for
older releases. Let me know what you want to do here.

BTW, am I reading something wrong or is pxa3xx_nand.c broken for
multi-CS systems? It seems like each chip's pxa3xx_nand_scan() will take
turns overwriting info->buf_size and info->data_buff, leaking memory in
the process. I guess the driver's designed to only use one chip at a
time?

Brian
