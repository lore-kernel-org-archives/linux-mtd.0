Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aWOBa-0001p2-Ov
 for linux-mtd@lists.infradead.org; Thu, 18 Feb 2016 13:00:00 +0000
Date: Thu, 18 Feb 2016 13:59:28 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Guilherme de Oliveira Costa <guilherme.oliveira@autotrac.com.br>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: NAND Bad Block Marking Policy
In-Reply-To: <7F9DB42F7DDA544EA3EB31D694929A30EB03F3@PERU.autotrac.corp>
Message-ID: <alpine.DEB.2.02.1602181353070.10339@lnxricardw1.se.axis.com>
References: <7F9DB42F7DDA544EA3EB31D694929A30EB03F3@PERU.autotrac.corp>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 18 Feb 2016, Guilherme de Oliveira Costa wrote:

> I?m using U-Boot 2013.01.01, and I noticed a behaviour that I could not comprehend
> regarding bad block handling by U-Boot: it only checks the first two pages of a block to see if
> the block is bad.
> 
> Let's say we have a nand with the following features:
>    Memory Size 128 MB
>    Sector size 128 KiB
>    Page size      2048 b
>    OOB size         64 b
>    Erase size   131072 b
> 
> If I try and mark a block as bad manually (via nand markbad), the following happens:
> 
> U-Boot@UCC3# nand markbad 0x4290000
> block 0x04290000 successfully marked as bad
> U-Boot@UCC3# nand bad
> 
> Device 0 bad blocks:
>   04280000
> 
> Everything seems fine. However, after a reboot, the system loses the information. Sifting
> through the code, I found the it is only checking the first two pages OOB. Note however that
> the block that gets marked as bad is block 0x4280000, which is aligned in memory with the
> eraseblock size (1st page in the eraseblock). Also, if I dump the OOB info from 0x428000, it is
> not flagged as bad, but  in 0x429000, the first byte is still 0x00, indicating it as bad.
> If I mark the 1st or 2nd page in an erase block as bad, then the information persists through
> boot cycles. Also, I've verified that we are not using a NAND based BBT.
> 
> My main concern is that, because this checking shared between functionalities, every time
> we erase a block, we keep losing bad block information, because inner pages (i.e. not the
> 1st or 2nd in an eraseblock), are flagged as good, and are not skipped by nand erase (which,
> in my point of view,  is a bad thing).
> 
> So, a few questions:
>   - Why is this the default behaviour? It seems to me a bad idea to check only the first two
>      pages, since any block could go bad. Unless anytime a page goes bad, we should mark it on
>      the first two   pages and on the page itself.
>   - If this is indeed the default behaviour, it seems to me that it is due to performance reasons.
>     So, in this case, should we mark the whole eraseblock as bad (by writing 0x00 to the 1st or
>     2nd pages) if we find a single bad page? Isn't this also a bad solution, since we will be marking
>     128kiB as bad due to a single page? Shouldn't this control be made 
>     at a finer level (i.e. page level)?

I don't know if thie mailing list is really the right place to discuss 
U-Boot, but I don't know much about U-Boot; it might derive its flash 
device handling from Linux mtd so the discussion might be valid just the 
same.

But in general, if a block is considered bad, then it is the whole 128 
kbyte (in this case) block that is bad, not individual pages. After all, 
it's called a 'bad block', not a 'bad page'. Thus manufacturer-marked bad 
blocks only need to have their first two pages marked, by convention (or 
rather, according to the data sheets) that means that the whole block is 
bad. And the same then goes for user-marked bad blocks.

Thus, attempting to mark a block at 0x4290000 in a 128 kbyte eraseblock 
flash is wrong to start with; apparently U-Boot doesn't check that though 
and dutifully does what the user requests. The correct way would be to 
mark 0x4280000 as bad.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
