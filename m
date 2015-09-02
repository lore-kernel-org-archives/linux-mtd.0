Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXEPX-0006mG-TL
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2015 20:13:36 +0000
Received: by padhy1 with SMTP id hy1so21799755pad.1
 for <linux-mtd@lists.infradead.org>; Wed, 02 Sep 2015 13:13:15 -0700 (PDT)
Date: Wed, 2 Sep 2015 13:13:12 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Richard Weinberger <richard@nod.at>,
 Bhuvanchandra DV <bhuvanchandradv@gmail.com>,
 linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: UBIFS errors when file-system is full
Message-ID: <20150902201312.GA21475@google.com>
References: <55B26D24.3060006@nod.at> <55BBA6A5.9020701@gmail.com>
 <55BC68D6.2070008@nod.at> <55C3379E.50000@gmail.com>
 <55C4A695.7060608@nod.at>
 <e3d338cfd875b941061d5ac3da9f29c0@agner.ch>
 <55CAF568.5090704@nod.at>
 <812d355821f585decf92a66628caef7b@agner.ch>
 <20150901014315.GF81844@google.com>
 <f3a5ff1f82ee358541125b920460c17a@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3a5ff1f82ee358541125b920460c17a@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 02, 2015 at 12:58:08PM -0700, Stefan Agner wrote:
> On 2015-08-31 18:43, Brian Norris wrote:
> > Why do you actually need to check the idle bit? If you need to read it
> > to clear out some FIFO, then that's fine -- just read it, but don't use
> > it as a second condition. The complete()/wait_for_completion()
> > synchronization should be sufficient on its own. (If not, then I think
> > you have other problems.)
> > 
> > The NFC_IRQ_STATUS-based condition looks like it could lead to races
> > because your interrupt may fire between setting and checking
> > the idle bit. So the IRQ handler will increment the completion struct
> > (cmd_done), but you *won't* be doing the corresponding decrement via
> > wait_for_completion(). If you don't do that... then the subsequent
> > wait_for_completion() will immediately succeed.
> 
> Tested over night and did some additional tests today, I did not see any
> issues for more than 2000 boots, so this really seems to fix the issue!

Awesome!

> Thanks Brian, will send out v12 soon.

Glad to help.

In case I didn't mention it already, I'm taking a closer look at Boris'
approach for this series:

http://lists.infradead.org/pipermail/linux-mtd/2015-August/061361.html

but your driver looks like a good candidate for using
nand_check_erased_ecc_chunk(), once we've agreed. Depenending on the
order of acceptance, I might like to get your driver converted either
before or after merging it. Shouldn't be too hard, though, as your
implementation looks very similar right now.

Brian
