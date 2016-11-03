Received: from relay1.mentorg.com ([192.94.38.131])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c2GIL-0008BR-Qp
 for linux-mtd@lists.infradead.org; Thu, 03 Nov 2016 11:34:58 +0000
Date: Thu, 3 Nov 2016 17:04:22 +0530
From: Sandeep Jain <Sandeep_Jain@mentor.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, Steve
 Longerbeam <steve_longerbeam@mentor.com>, Jim Baxter <jim_baxter@mentor.com>
Subject: Re: [PATCH] mtd: Allocate bdi objects dynamically
Message-ID: <20161103113421.GA4873@mentor.com>
References: <Sandeep_Jain@mentor.com>
 <1470319275-9465-1-git-send-email-Sandeep_Jain@mentor.com>
 <CAFLxGvx6B02c+HgYwJ8exVLT6owrkQL1Rq+X6VzUDKVUxE=aoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFLxGvx6B02c+HgYwJ8exVLT6owrkQL1Rq+X6VzUDKVUxE=aoQ@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Maintainers,
  This patch is reviewed by Richard.
Requesting for Maintainer's attention for patch merge.

Thanks & Regards,
Sandeep Jain

On Sat, Sep 17, 2016 at 04:41:47PM +0200, Richard Weinberger wrote:
> On Thu, Aug 4, 2016 at 4:01 PM, Sandeep Jain <Sandeep_Jain@mentor.com> wrote:
> > From: Steve Longerbeam <steve_longerbeam@mentor.com>
> >
> > The MTD backing dev info objects mtd_bdi was statically allocated.
> > So when MTD is built as a loadable module, this object fall in the
> > vmalloc address space.
> >
> > The problem with that, is that the BDI APIs use wake_up_bit(), which calls
> > virt_to_page() to retrieve the memory zone of the page containing the
> > wait_queue to wake up, and virt_to_page() is not valid for vmalloc or
> > highmem addresses.
> >
> > Fix this by allocating the BDI objects dynamically with kmalloc. The
> > objects now fall in the logical address space so that BDI APIs will
> > work in all cases (mtd builtin or module).
> >
> > Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
> > Signed-off-by: Jim Baxter <jim_baxter@mentor.com>
> > Signed-off-by: Sandeep Jain <Sandeep_Jain@mentor.com>
> 
> Reviewed-by: Richard Weinberger <richard@nod.at>
> 
> -- 
> Thanks,
> //richard
