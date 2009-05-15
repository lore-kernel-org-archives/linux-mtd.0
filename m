Received: from woodchuck.wormnet.eu ([2a01:348:0:6:4d4b:69df:0:1])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M4yyv-0003VN-4R
	for linux-mtd@lists.infradead.org; Fri, 15 May 2009 15:05:56 +0000
Date: Fri, 15 May 2009 16:05:49 +0100
From: Alexander Clouter <alex@digriz.org.uk>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH] [REPOST] mtd: extend plat_nand for (read|write)_buf
Message-ID: <20090515150549.GE32684@woodchuck>
References: <20090511182801.GK32684@woodchuck>
	<1242395460.27996.249.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1242395460.27996.249.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

* Artem Bityutskiy <dedekind@infradead.org> [2009-05-15 16:51:00+0300]:
> 
> On Mon, 2009-05-11 at 19:28 +0100, Alexander Clouter wrote:
> > This patch adds (write|read)_buf callbacks to plat_nand.
> > 
> > The NAND on the TS-7800 provisioned by the FPGA allows readw() and 
> > readl() to be used which gives a 2.5x speed up.  To be able to use this 
> > from the plat_nand driver a hook for read_buf (and also write_buf whilst 
> > we are in there) need to be made available.  This patch adds the hook.
> > 
> > This is a repost[1] of a feature asked for before[2], plus other helpful 
> > patches to plat_nand[3] would be welcomed if at all possible too.
> > 
> > [1] http://lists.infradead.org/pipermail/linux-mtd/2009-March/024747.html
> > [2] http://lists.infradead.org/pipermail/linux-mtd/2007-October/019659.html
> > [3] http://lists.infradead.org/pipermail/linux-mtd/2009-March/024780.html
> > 
> > Signed-off-by: Alexander Clouter <alex@digriz.org.uk>
> 
> I think this should be submitted with the user at the same
> time. Adding hooks without having a user is not very good.
> E.g., you may find out later that this does not help, or
> cancel your project, or end up with different call-backs,
> etc.
> 
In the case of read/write_buf...there is no other way, I'm all ears if 
you know how I can do (read|write)(w|l) with plat_nand *now*?

I just pulled off this type of manoeuvre for a HW RNG driver:

http://lkml.indiana.edu/hypermail/linux/kernel/0902.2/02727.html
http://git.marvell.com/?p=orion.git;a=commit;h=8be7b57dea0467324ad4545334c5e35c18f0814b

I doubt the ARM people would be happy if I push ARM patches through the 
MTD sub-system :)

> You may keep this patch privately, work on your NAND driver,
> and when you have it ready, you submit it with this at the
> same time.
> 
Erm, it's been ready for a *long* time, about a year[1], and is being 
used.  Recently the bits of my plat_nand impementation[2] is on it's way 
to going mainline (Orion -> ARM -> Linus):

http://git.marvell.com/?p=orion.git;a=commit;h=75bb6b9aab3255f440ef4e72a31978d1681105d6

Cheers

[1] http://tech.groups.yahoo.com/group/ts-7000/message/11616
[2] http://lists.infradead.org/pipermail/linux-mtd/2009-February/024555.html

-- 
Alexander Clouter
.sigmonster says: Your fly might be open (but don't check it just now).
