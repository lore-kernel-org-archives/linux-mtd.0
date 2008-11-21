Received: from e5.ny.us.ibm.com ([32.97.182.145])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L3U5W-00019S-SV
	for linux-mtd@lists.infradead.org; Fri, 21 Nov 2008 11:22:15 +0000
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e5.ny.us.ibm.com (8.13.1/8.13.1) with ESMTP id mALBM9Qj032652
	for <linux-mtd@lists.infradead.org>; Fri, 21 Nov 2008 06:22:09 -0500
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	mALBMEwh147594
	for <linux-mtd@lists.infradead.org>; Fri, 21 Nov 2008 06:22:14 -0500
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	mALBLrrD015067
	for <linux-mtd@lists.infradead.org>; Fri, 21 Nov 2008 06:21:54 -0500
Date: Fri, 21 Nov 2008 06:22:05 -0500
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: dedekind@infradead.org
Subject: Re: flash_eraseall reports incorrect percentage
Message-ID: <20081121062205.4f6fd699@zod.rchland.ibm.com>
In-Reply-To: <1227261098.3954.49.camel@sauron>
References: <200801301403.13149.sr@denx.de>
	<20081118185652.GA32157@michl.2n.cz>
	<1227261098.3954.49.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Stefan Roese <sr@denx.de>, Ladislav Michl <ladis@linux-mips.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 21 Nov 2008 11:51:38 +0200
Artem Bityutskiy <dedekind@infradead.org> wrote:

> On Tue, 2008-11-18 at 19:56 +0100, Ladislav Michl wrote:
> > On Wed, Jan 30, 2008 at 02:03:13PM +0100, Stefan Roese wrote:
> > > It seems that the flash_eraseall utility doesn't report the correct percentage 
> > > upon completion. After erasing the last sector, the output seems not to get 
> > > updated anymore. This leads to something like this on a partition with only 2 
> > > sectors:
> > > 
> > > flash_eraseall /dev/mtd6
> > > Erasing 256 Kibyte @ 40000 -- 50 % complete.
> > > 
> > > I'm just posting this report as a reference. Perhaps somebody has a little 
> > > time to fix it.
> > 
> > Well, I sacrificed a little time otherwise used to prepare supper, but
> > fridge is emty...
> > 
> > # flash_eraseall /dev/mtd4
> > Erasing 128 Kibyte @ 2800000 -- 100 % complete.
> > 
> > flash_eraseall
> >  * fix percentage reporting
> >  * exit()ing from main() is overkill, just return
> > 
> > Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> 
> 
> It seems others are busy, so I took a look at this. I think the patch is
> OK, pushed to mtd-utils.git.

Thanks.  I was planning to do that this afternoon, but now I can stare
at some other patch instead :).

josh
