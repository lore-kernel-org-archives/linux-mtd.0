Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eZwSn-0004Z5-V4
 for linux-mtd@lists.infradead.org; Fri, 12 Jan 2018 10:21:34 +0000
Date: Fri, 12 Jan 2018 11:21:08 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Miquel RAYNAL <miquel.raynal@free-electrons.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 0/7] Marvell NAND controller rework with ->exec_op()
Message-ID: <20180112112108.2e20dc14@bbrezillon>
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
> 
> > And that's anyway not the bug we're trying to fix here. In your setup (2k
> > pages with Hamming ECC), the bad block markers, i.e. the markers present in
> > each block and used to mark a block good or bad (0xffff => good, != 0xffff =>
> > bad), should be preserved.  
> I think we're still not aligned here. There are _no_ bad block markers in the
> OOB on my flash, because there is a BBT at the end.

I think I'm still missing something. If I look at the branch you just
pushed, I see that ->flash_bbt was not set to 1 before this commit [1],
which means the pxa3xx driver was no setting the NAND_BBT_USE_FLASH
flag, which in turn means you were not using the on-flash-bbt.
When you test the old (pxa3xx) driver, are you sure you're testing
things with a mainline kernel? If you have extra commits on top of
mainline, can you push them somewhere?

[1]https://github.com/rjarzmik/linux/commit/5d391176c89a777f1c7d082cd50c1dc87e54b355#diff-6e551812174323b126d3f20eff6eec83
