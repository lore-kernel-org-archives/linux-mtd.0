Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZyB4-0004uH-0N
 for linux-mtd@lists.infradead.org; Thu, 20 Dec 2018 13:15:52 +0000
From: Richard Weinberger <richard@nod.at>
To: Martin Townsend <mtownsend1973@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: hung task detected in ubifs
Date: Thu, 20 Dec 2018 14:15:36 +0100
Message-ID: <2102406.fBQmoxhIU4@blindfold>
In-Reply-To: <CABatt_yNxPpHMN98Jt1rcjHLHDSyz7XAjY=jdberVT3EiP=_Ag@mail.gmail.com>
References: <CABatt_wvwVuzAMp6JX4yUireb3wAuiiF5i+=7FRGDPx3fwxrKA@mail.gmail.com>
 <CAFLxGvzaZythh+u93Tq4Eqrdr7gN4v6sdoy3WP67qpBfpoxOmw@mail.gmail.com>
 <CABatt_yNxPpHMN98Jt1rcjHLHDSyz7XAjY=jdberVT3EiP=_Ag@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Donnerstag, 20. Dezember 2018, 14:07:45 CET schrieb Martin Townsend:
> Hi Richard,
> 
> On Thu, Dec 20, 2018 at 10:54 AM Richard Weinberger
> <richard.weinberger@gmail.com> wrote:
> >
> > On Thu, Dec 20, 2018 at 10:49 AM Martin Townsend
> > <mtownsend1973@gmail.com> wrote:
> > > 5 locks held by programmingapp/930:>  #0:  (&mm->mmap_sem){......}, at: [<80113ef0>] do_page_fault+0xb8/0x350
> > >  #1:  (&le->mutex){......}, at: [<80568150>] ubi_eba_read_leb+0x34/0x438
> > >  #2:  (of_dma_lock){......}, at: [<804ab890>]
> > > of_dma_request_slave_channel+0x140/0x228
> > >  #3:  (dma_list_mutex){......}, at: [<804a9d3c>] __dma_request_channel+0x24/0x8c
> > >  #4:  (cma_mutex){......}, at: [<80246814>] cma_alloc+0xc8/0x29c
> >
> > The system seems to block in CMA, therefore make_reservation() does not make any
> > progress and all write back blocks too.
> > Do you have CONFIG_MIGRATION enabled?
> >
> > If possible, enable LOCKDEP, it can give us more details what is going on.
> >
> > --
> > Thanks,
> > //richard
> 
> I just checked and CONFIG_MIGRATION=y.

Hmm, that should be ok.
I expected CONFIG_MIGRATION=n.

In the meanwhile you can also try that patch:
http://lists.infradead.org/pipermail/linux-mtd/2018-December/086389.html

It fixes allocation failures of CMA.
But I'm not sure whether you're facing the same problem.

> Interesting that it seems to block in the CMA, could it be that the
> programmingapp process has used up all the CMA memory?  I'll ask for a
> complete log file.

I don't know what the system is doing.
Does it really(!) deadlock or does it just take very long to continue?
(Lockdep should be able to tell...)

The MTD driver seems to do DMA which uses CMA to allocate memory.
So we need to understand why the CMA allocation blocks (forever?).
>From the current picture I cannot tell whether UBIFS is the root cause
or just a victim.

Thanks,
//richard
