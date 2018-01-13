Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eaHKW-0001ap-Br
 for linux-mtd@lists.infradead.org; Sat, 13 Jan 2018 08:38:22 +0000
Date: Sat, 13 Jan 2018 09:38:07 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Miquel RAYNAL <miquel.raynal@free-electrons.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 0/7] Marvell NAND controller rework with ->exec_op()
Message-ID: <20180113093807.3984c184@bbrezillon>
In-Reply-To: <87wp0majtg.fsf@belgarion.home>
References: <20180109103637.23798-1-miquel.raynal@free-electrons.com>
 <20180111122751.4bd74366@bbrezillon>
 <87efmwb8bj.fsf@belgarion.home> <20180111232417.4aa86075@xps13>
 <87a7xjbis2.fsf@belgarion.home>
 <20180112094501.27706bfc@bbrezillon>
 <876087beui.fsf@belgarion.home>
 <20180112105228.176ab80f@bbrezillon>
 <87wp0majtg.fsf@belgarion.home>
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

Hello Robert,

On Fri, 12 Jan 2018 21:44:27 +0100
Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> Boris Brezillon <boris.brezillon@free-electrons.com> writes:
> 
> > On Fri, 12 Jan 2018 10:34:13 +0100
> > Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> >  
> >> Boris Brezillon <boris.brezillon@free-electrons.com> writes:  
> > Because we though scanning of BBMs was working with the old pxa driver
> > (which should be the case for your setup, BTW), and we thought the new
> > driver was introducing a regression here.  
> That's what happens :
>  - flash_bbt=1 with old driver => everything works fine
>  - flash_bbt=1 with marvell_nand => BBT is damaged (or so I believe from
>    Miquel's analysis)

It shouldn't be damaged anymore. The bug has been fixed just before we
asked you to scrub the BBT area.

> 
> > BTW, did you ever try with the old driver and ->flash_bbt = false? If
> > you did not, can you test?  
> Sure, just did, same behavior as with marvell_nand :
>  - bad erase blocks (almost) everywhere
>  - ubifs error

That's a relief!

> 
> >> I think we're still not aligned here. There are _no_ bad block markers in the
> >> OOB on my flash, because there is a BBT at the end.  
> >
> > That's not how it works. The BBT is a way to get information about bad
> > blocks within a single read access, but, if you can preserve BBMs and
> > keep them updated (which is the case here), you should do it, just in
> > case you lose the BBT.  
> You're probably right today. But this assertion is probably wrong for system
> created in early 2000s ... :)

I can't say, but I recommend patching the component that screw up BBMs
in your setup anyway. It's probably not the kernel since Miquel tested
the transition from the old to the new driver without activating the
on-flash-bbt on his pxa boards, and all BBMs were preserved.

So, it's either barebox or another component you use to program things.

> 
> >> > So, the symptoms we're seeing here, where almost all blocks are reported as
> >> > bad when scanning BBMs, is not expected, and that's what we're trying to
> >> > debug/fix.    
> >> Well, I still think this is not something to fix ... I still think that OOB data
> >> is not relevant as to the state of bad blocks in my flash ...  
> >
> > Hm, I disagree. What if, for any reason, the BBT is lost? Don't you
> > want the full scan to work?  
> If the BBT is lost, you have the mirror BBT, it's its purpose.

If both are lost, you're screwed.

> 
> > Okay, so I have another solution for that: drop the NAND_BBT_CREATE and
> > NAND_BBT_WRITE here [1] and here [2]. That should let you read the
> > existing BBT without updating it or creating a new one if it's not
> > detected.  
> Okay, let's try the marvell-nand-bug branch with this included.
> It works :
> [   18.302123] ubi0: attached mtd5 (name "root", size 37 MiB)
> [   18.307691] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> [   18.315003] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
> [   18.322155] ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
> [   18.329167] ubi0: good PEBs: 297, bad PEBs: 0, corrupted PEBs: 0
> [   18.335789] ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
> [   18.343409] ubi0: max/mean erase counter: 6/4, WL threshold: 4096, image sequence number: 30621
> [   18.352460] ubi0: available PEBs: 0, total reserved PEBs: 297, PEBs reserved for bad PEB handling: 40
> [   18.361937] ubi0: background thread "ubi_bgt0d" started, PID 411
> 
> That means the BBT reading is the issue don't you think ?

The BBT detection issue has already been fixed with Miquel's previous
version. So there shouldn't be any issue with that anymore, and your
results tend to confirm that.

> 
> Now if I keep NAND_BBT_CREATE but remove NAND_BBT_WRITE same thing, it works as
> well. That leaves only the re-enabling of the BBT write, which I'll do as soon
> as you tell me my NAND won't be damaged.

It won't, you can safely re-enable NAND_BBT_WRITE. The one that was
causing trouble previously was NAND_BBT_CREATE, because the BBT was not
found, and the NAND framework was creating a new one after scanning
BBMs, which led to the situation you reported: BBT reporting all blocks
as bad.

Thanks for helping us with this bug, I think we're close to a fully
working situation now.

Regards,

Boris
