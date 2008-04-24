Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jp24E-0002PY-Kv
	for linux-mtd@lists.infradead.org; Thu, 24 Apr 2008 14:04:55 +0000
Date: Fri, 25 Apr 2008 00:04:47 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: [RFC][patch] NAND partial page read functionality
Message-ID: <20080424140447.GA30558@cloud.net.au>
References: <Pine.LNX.4.64.0712131747490.16624@pentafluge.infradead.org>
	<1209018876.11721.100.camel@sauron>
	<20080424074526.GA21709@cloud.net.au>
	<Pine.LNX.4.64.0804241057520.6029@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0804241057520.6029@pentafluge.infradead.org>
Cc: dwmw2@infradead.org, Thomas Gleixner <tglx@linutronix.de>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Thanks for your patch Alexey.

On Thu, Apr 24, 2008 at 11:25:01AM +0100, Alexey Korolev wrote:
> Oh I'm glad to hear that this patch is needful. In fact I did
> not drop it. We did some more investigations about integration subpage
>  read in background. We tried to remove some drawback caused by
> invalidation of prestored page in do_read_ops function. (We have found
> that on large read requests nand subpage read causes ~10% of read performance degradation. I
> wanted to remove but changes made code ugly and saved only 5%)

Do you know why this is? If you are reading a whole page then the
partial read code is equivalent to the read full page code as far as I
can tell.

> > Also Alexey said:
> > > Setting NAND_PART_READ option in board driver will enable this
> > > feature.
> > 
> > which is not true, as nand_base.c masks out chip-options (like this)
> > inherited from the board driver. It must be set for the chip in
> > nand_ids.c instead.
> It works fine,  you need to setup this option after nand_scan. 
> Using it in NAND_IDS is bad idea because some people may want disable it you can indirectly identify if chip
> supports subpage read from NAND capabilities records.y 

Oh, I see. I think it is unusual to modify the chip->options after
calling nand_scan? I am using plat_nand.c and it doesn't have any way to
do this.

Maybe NAND_PART_READ should be excluded from NAND_CHIPOPTIONS_MSK. But
you still have the case where the chip can't do it even if the board
wants to. Maybe the chip should declare it's capable and the board
should be able to turn it off if required.

Mind you, other parts of nand_base use the RNDOUT function already so I
don't think there is any case where you *wouldn't* enable partial reads.

> So if there is an interest in subpage read let resume the topic. In next couple days I
> will send updated patch with subpage read functionality. 

Thanks. Did you find any actual bugs with the previous patch, or is it
safe for me to use it?

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
