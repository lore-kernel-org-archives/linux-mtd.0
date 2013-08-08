Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V7ZIK-0005Zb-Kq
 for linux-mtd@lists.infradead.org; Thu, 08 Aug 2013 23:07:01 +0000
Received: by mail-pa0-f54.google.com with SMTP id kx1so4210585pab.41
 for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2013 16:06:37 -0700 (PDT)
Date: Thu, 8 Aug 2013 16:06:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v6 00/10] mtd: add datasheet's ECC information to
 nand_chip{}
Message-ID: <20130808230630.GA14434@norris.computersforpeace.net>
References: <1368760654-28754-1-git-send-email-b32955@freescale.com>
 <CAN8TOE-QvScbPUEPyrs-fYVQZmPu1h-wWX2hjz46KYtaWRckBw@mail.gmail.com>
 <520357DF.3030403@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <520357DF.3030403@freescale.com>
Cc: vikram186@gmail.com, linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 08, 2013 at 04:33:35PM +0800, Huang Shijie wrote:
> Hi Artem & Brian:
> >Hi Huang and others,
> >
> >On Thu, May 16, 2013 at 8:17 PM, Huang Shijie<b32955@freescale.com>  wrote:
> >>1.) Why add the ECC information to the nand_chip{} ?
...
> >Reviewed-by: Brian Norris<computersforpeace@gmail.com>
> >Tested-by: Brian Norris<computersforpeace@gmail.com>
> >
> >Thanks for the work Huang.
> >
> Could you please merge this patch set?

Thanks for the reminder. I haven't sorted through all the piles of
backed up stuff yet!

I made a few minor changes (for checkpatch.pl, regarding
__attribute__((packed)), and to make the style a little more
easily-read) and tested the generic stuff on my platform. I've pushed
the series to l2-mtd.git. Thanks for the patience!

Brian
