Received: from smtpeu1.atmel.com ([195.65.72.27] helo=bagnes.atmel.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KZO1t-0006Gm-5E
	for linux-mtd@lists.infradead.org; Sat, 30 Aug 2008 10:50:05 +0000
Date: Sat, 30 Aug 2008 12:49:45 +0200
From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
To: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Subject: Re: MTD/block regression (was Re: Slub debugging NAND error in
	2.6.25.10.atmel.2)
Message-ID: <20080830124945.3de989f6@siona.skinnemoen.net>
In-Reply-To: <20080830103318N.fujita.tomonori@lab.ntt.co.jp>
References: <6B5648EA2E2C2D42AF2FF7691522AD92417CA6@wpr01.wprmedical.local>
	<20080829114828.279b79bc@hskinnemo-gx745.norway.atmel.com>
	<20080829162824.17f8746b@hskinnemo-gx745.norway.atmel.com>
	<20080830103318N.fujita.tomonori@lab.ntt.co.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: eaa@wprmedical.com, kernel@avr32linux.org, linux-kernel@vger.kernel.org,
	fujita.tomonori@lab.ntt.co.jp, linux-mtd@lists.infradead.org,
	jens.axboe@oracle.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 30 Aug 2008 10:34:12 +0900
FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp> wrote:

> Really sorry about that. A fix was queued in Jens' tree:
> 
> http://marc.info/?l=linux-kernel&m=122000748432301&w=2

Ah, great. Sorry for not searching the list before posting.

> > Unfortunately, I can't revert it cleanly, so it could be a false
> > positive. But it does sort of make sense, since it makes the filter
> > per-queue instead of per-gendisk, so if MTD uses the same queue for
> > several block devices, the filter kobject might end up being
> > initialized multiple times. Or something.  
> 
> Right, the problem is that MTD uses the same queue for multiple
> gendisks. It would be great if a MTD developer could fix it.

Yeah, I sort of suspected that MTD was doing something unusual.
Unfortunately, I'm not familiar enough with the MTD and block code
to help out here...

Haavard	
