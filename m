Received: from mail-ie0-x22f.google.com ([2607:f8b0:4001:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRTkY-0007K2-TV
 for linux-mtd@lists.infradead.org; Wed, 02 Oct 2013 21:14:27 +0000
Received: by mail-ie0-f175.google.com with SMTP id e14so3198743iej.6
 for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2013 14:14:05 -0700 (PDT)
Date: Wed, 2 Oct 2013 14:14:01 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 01/21] mtd: nand: pxa3xx: Allocate data buffer on
 detected flash size
Message-ID: <20131002211401.GV23337@ld-irv-0074.broadcom.com>
References: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1379606505-2529-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130926201032.GL23337@ld-irv-0074.broadcom.com>
 <20130930123756.GB2417@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130930123756.GB2417@localhost>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Tawfik Bayouk <tawfik@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Daniel Mack <zonque@gmail.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 30, 2013 at 09:37:57AM -0300, Ezequiel Garcia wrote:
> On Thu, Sep 26, 2013 at 01:10:32PM -0700, Brian Norris wrote:
> > On Thu, Sep 19, 2013 at 01:01:25PM -0300, Ezequiel Garcia wrote:
> > > This commit replaces the currently hardcoded buffer size, by a
> > > dynamic detection scheme. First a small 256 bytes buffer is allocated
> > > so the device can be detected (using READID and friends commands).
> > > 
> > > After detection, this buffer is released and a new buffer is allocated
> > > to acommodate the page size plus out-of-band size.
> > > 
> > > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > 
> > This is the patch that breaks Daniel's DMA setup, right? It looks a bit
> > off.
> 
> What do you mean by 'a bit off'?

The existing code allocates data_buff with kmalloc() or
dma_alloc_coherent() depending on ARCH_HAS_DMA, but your patch does the
initial fixed-size allocation only with kmalloc(). It's just what you
and Daniel already identified: that this causes problems for the DMA
case.

> > BTW, there is a similar issue with at least one other driver (denali.c,
> > maybe others) where the driver uses some hard assumptions about the
> > maximum page/OOB sizes (NAND_MAX_PAGESIZE and NAND_MAX_OOBSIZE). This is
> > kind of ugly and not very sustainable/maintainable, since these
> > dimensions keep increasing. I appreciate your effort to avoid simply
> > kludging in a larger MAX_BUFF_SIZE :) I had similar plans for the other
> > drivers, but I don't know if we'll have much testing opportunities for
> > the ancient ones...
> > 
> > Also, it seems like your driver has a few potential leaks right now. If
> > alloc_nand_resource() succeeds but pxa3xx_nand_probe() later fails
> > (e.g., in pxa3xx_nand_scan()), you don't clean up after yourself. You
> > should address this soon, even if not in this patch series.
> > 
> 
> Hm.. are you sure about that? AFAICS, there's no leak at all.

No, I'm not sure :)

> If alloc_nand_resource() succeeds, the only leakable resources allocated
> are the ones allocated at pxa3xx_nand_init_buff() and the NAND base
> stuff.
> 
> If pxa3xx_nand_probe() later fails to complete, it calls pxa3xx_nand_remove()
> in this part:
> 
> 	if (!probe_success) {
> 		pxa3xx_nand_remove(pdev);
> 		return -ENODEV;
> 	}
> 
> Which takes care of cleaning both the buffers and the NAND base stuff.
> 
> Or am I missing something?

Nope, you were correct. I just missed this point when reading.

Brian
