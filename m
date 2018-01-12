Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eZw0v-0002IB-7T
 for linux-mtd@lists.infradead.org; Fri, 12 Jan 2018 09:52:43 +0000
Date: Fri, 12 Jan 2018 10:52:28 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Miquel RAYNAL <miquel.raynal@free-electrons.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 0/7] Marvell NAND controller rework with ->exec_op()
Message-ID: <20180112105228.176ab80f@bbrezillon>
In-Reply-To: <876087beui.fsf@belgarion.home>
References: <20180109103637.23798-1-miquel.raynal@free-electrons.com>
 <20180111122751.4bd74366@bbrezillon>
 <87efmwb8bj.fsf@belgarion.home> <20180111232417.4aa86075@xps13>
 <87a7xjbis2.fsf@belgarion.home>
 <20180112094501.27706bfc@bbrezillon>
 <876087beui.fsf@belgarion.home>
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

On Fri, 12 Jan 2018 10:34:13 +0100
Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> Boris Brezillon <boris.brezillon@free-electrons.com> writes:
> 
> > On Fri, 12 Jan 2018 09:09:17 +0100
> > Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> >  
> >> Miquel RAYNAL <miquel.raynal@free-electrons.com> writes:
> >> 
> >> I begun all your test procedure (on my zylonite board).
> >> The timing registers are the same in both pxa3xx_nand and marvell_nand, ie :
> >> [    3.085539] Timing registers from Bootloader:
> >> [    3.089971] -  NDTR0: 0x00161c1c
> >> [    3.095979] -  NDTR1: 0x0f3c00a2
> >> 
> >> I can attach the dmesg of the first run (dump of OOB). Yet I think you're
> >> missing the point as to where the bug lies.  
> >
> > We definitely don't know where the bug lies, otherwise we wouldn't do
> > the remote debug session we're doing here.  
> Fair enough.
> > The driver is not searching for a BBT because it's explicitly disabled
> > in your pdata (if it was enabled we would see something like "Bad block
> > table not found ..." or "Bad block table found ..." in the logs).  
> You're right, and that's because I was told to remove the "flash_bbt=1" from my
> platform data by Miquel in order to not destroy it again.

Because we though scanning of BBMs was working with the old pxa driver
(which should be the case for your setup, BTW), and we thought the new
driver was introducing a regression here.

BTW, did you ever try with the old driver and ->flash_bbt = false? If
you did not, can you test?

> 
> > And that's anyway not the bug we're trying to fix here. In your setup (2k
> > pages with Hamming ECC), the bad block markers, i.e. the markers present in
> > each block and used to mark a block good or bad (0xffff => good, != 0xffff =>
> > bad), should be preserved.  
> I think we're still not aligned here. There are _no_ bad block markers in the
> OOB on my flash, because there is a BBT at the end.

That's not how it works. The BBT is a way to get information about bad
blocks within a single read access, but, if you can preserve BBMs and
keep them updated (which is the case here), you should do it, just in
case you lose the BBT.

> 
> > So, the symptoms we're seeing here, where almost all blocks are reported as
> > bad when scanning BBMs, is not expected, and that's what we're trying to
> > debug/fix.  
> Well, I still think this is not something to fix ... I still think that OOB data
> is not relevant as to the state of bad blocks in my flash ...

Hm, I disagree. What if, for any reason, the BBT is lost? Don't you
want the full scan to work?

> 
> > Timing mis-configuration was just a lead we had to follow. It seems
> > that it's not the problem here, but we had to test it. Now, the missing
> > BBT scan is clearly caused by an explicit config telling the driver to
> > ignore the BBT.  
> We agree on that.
> 
> > You can try to enable it if you want to test BBT
> > handling (pdata->flash_bbt = 1), but even if that works, we'd like to
> > understand why the regular BBM scanning does not work.  
> As you wish. I can make other tests, as long as my BBT is not broken again. If I
> re-enable "flash_bbt=1", I'd like another "hack" to prevent BBT breakage, as
> disabling it was adviced by Miquel to protect my NAND.

Okay, so I have another solution for that: drop the NAND_BBT_CREATE and
NAND_BBT_WRITE here [1] and here [2]. That should let you read the
existing BBT without updating it or creating a new one if it's not
detected.

> 
> > Honestly, it's hard to be sure what you're testing, because we don't
> > know whether you're testing the branch Miquel provided or manually
> > apply some changes locally. Can you push your local changes somewhere
> > (if any)?  
> git fetch https://github.com/rjarzmik/linux marvell-nand-bug
> make zylonite_defconfig

Thanks for sharing this branch.

> 
> >> mtdparts=pxa3xx_nand-0:128k@0(TIMH)ro,128k@128k(OBMI)ro,768k@256k(barebox),256k@1024k(barebox-env),12M@1280k(kernel),38016k@13568k(root)
> >> [    3.414298] marvell-nfc pxa3xx-nand: 
> >> [    3.414298] NDCR:  0x9d079fff
> >> [    3.414298] NDCB0: 0x000d3000
> >> [    3.414298] NDCB1: 0x00800000
> >> [    3.414298] NDCB2: 0x00000000
> >> [    3.414298] NDCB3: 0x00000000
> >> [    3.433140] OOB from page 128:
> >> [    3.436237] 00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
> >> [    3.447080] 01: 00 00 00 00 00 00 00 00 48 5b 01 d2 56 00 a2 ec 23 82 51 02 ef af 9d ae 3e 02 34 82 6c d8 75 0e   
> >
> > All bytes set to 0. Looks like someone explicitly wrote 0 in the OOB
> > area :-/. Do you know which component wrote this block (barebox or
> > Linux)?  
> In this specific case, you're in "TIMH" partition, which a specific partition
> for the IPL (ROM part of the PXA3xx reads and loads it), and follows other rules
> AFAIK.
> 
> The really anoying and relevant part are the bad blocks at 13568 KBytes offset
> (ie. root partition), which contains the ext2/ubifs.

Can you provide the OOB dump of this block?

Thanks,

Boris

[1]https://github.com/rjarzmik/linux/blob/marvell-nand-bug/drivers/mtd/nand/marvell_nand.c#L2181
[2]https://github.com/rjarzmik/linux/blob/marvell-nand-bug/drivers/mtd/nand/marvell_nand.c#L2191
