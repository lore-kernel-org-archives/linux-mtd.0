Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBl5C-00027m-Hu
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2018 17:53:28 +0000
Date: Thu, 26 Apr 2018 19:53:03 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Richard Weinberger <richard@nod.at>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>, MTD Maling List
 <linux-mtd@lists.infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: partitions: Handle add_mtd_device() failures
 gracefully
Message-ID: <20180426195303.1f08d2cd@bbrezillon>
In-Reply-To: <CAMuHMdWHoxrq-tj=QznAhuZ8eC22gTTgWFi9HgyqT9pNfJFJyw@mail.gmail.com>
References: <1523276721-4982-1-git-send-email-geert+renesas@glider.be>
 <9bea3ad8-7e84-87c2-9963-de81ad4cb3bf@gmail.com>
 <CAMuHMdWHoxrq-tj=QznAhuZ8eC22gTTgWFi9HgyqT9pNfJFJyw@mail.gmail.com>
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

Hi Geert,

Sorry for the late reply.

On Tue, 10 Apr 2018 15:26:20 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Marek,
> 
> On Mon, Apr 9, 2018 at 11:59 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> > On 04/09/2018 02:25 PM, Geert Uytterhoeven wrote:  
> >> Currently add_mtd_device() failures are plainly ignored, which may lead
> >> to kernel crashes later.  
> 
> >> Fix this by ignoring and freeing partitions that failed to add in
> >> add_mtd_partitions().  The same issue is present in mtd_add_partition(),
> >> so fix that as well.
> >>
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> ---
> >> I don't know if it is worthwhile factoring out the common handling.
> >>
> >> Should allocate_partition() fail instead?  There's a comment saying
> >> "let's register it anyway to preserve ordering".  
> 
> >> --- a/drivers/mtd/mtdpart.c
> >> +++ b/drivers/mtd/mtdpart.c  
> 
> >> @@ -746,7 +753,15 @@ int add_mtd_partitions(struct mtd_info *master,
> >>               list_add(&slave->list, &mtd_partitions);
> >>               mutex_unlock(&mtd_partitions_mutex);
> >>
> >> -             add_mtd_device(&slave->mtd);
> >> +             ret = add_mtd_device(&slave->mtd);
> >> +             if (ret) {
> >> +                     mutex_lock(&mtd_partitions_mutex);
> >> +                     list_del(&slave->list);
> >> +                     mutex_unlock(&mtd_partitions_mutex);
> >> +                     free_partition(slave);
> >> +                     continue;
> >> +             }  
> >
> > Why is the partition even in the list in the first place ? Can we avoid
> > adding it rather than adding and removing it ?  
> 
> Hence my question "Should allocate_partition() fail instead?".

I'd prefer this option too. Can you prepare a new version doing that?

Thanks,

Boris
