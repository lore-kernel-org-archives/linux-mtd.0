Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XAORg-00075W-Al
 for linux-mtd@lists.infradead.org; Thu, 24 Jul 2014 19:12:56 +0000
Received: by mail-pa0-f45.google.com with SMTP id eu11so4500942pac.18
 for <linux-mtd@lists.infradead.org>; Thu, 24 Jul 2014 12:12:00 -0700 (PDT)
Date: Thu, 24 Jul 2014 12:11:56 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH] mtd: nand: omap: save Bad-Block-Table (BBT) on device
Message-ID: <20140724191156.GG3711@ld-irv-0074>
References: <1406116461-27089-1-git-send-email-pekon@ti.com>
 <20140723120510.GA19677@arch.cereza>
 <20980858CB6D3A4BAE95CA194937D5E73EB064F3@DBDE04.ent.ti.com>
 <20140723202746.GA26346@arch.cereza>
 <20140724015438.GC3711@ld-irv-0074>
 <20140724134018.GA711@arch.cereza>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140724134018.GA711@arch.cereza>
Cc: "Nori, Sekhar" <nsekhar@ti.com>, Huang Shijie <b32955@freescale.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, "Gupta, Pekon" <pekon@ti.com>,
 "Quadros, Roger" <rogerq@ti.com>,
 Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

On Thu, Jul 24, 2014 at 10:40:18AM -0300, Ezequiel Garcia wrote:
> On 23 Jul 06:54 PM, Brian Norris wrote:
> > The only real backwards-compatibility concern you'd have for
> > unconditionally enabling on-flash BBT (like in this patch) is if you had
> > previous file system data in the last 4 blocks; nand_bbt will just
> > clobber it, breaking your file system. For this reason, using DT is
> > probably a good idea -- you're opting in, rather than being forced in by
> > a kernel upgrade.
> 
> FWIW, having the kernel wipe your precious data, is even worse than having
> him fail; which means this represents a much more serious drawback.
> This is why any modification to a NAND driver that involves a different
> 'view' of the flash, should be considered with a lot of care!

Yes, that's pretty serious. Perhaps there could be some more attention
paid to this issue (throwing out some half-baked ideas: tag partitions
as exclusive 'BBT' partitions, to ensure data / BBT separation; or
prevent nand_bbt from reserving non-empty blocks for BBT). But for now,
this issue can be best dealt with by using the supported DT option to
explicitly opt in.

> > Beyond the backwards-compatibility concern, you still have other
> > concerns about on-flash BBT's robustness. Limiting yourself to a region
> > of 4 blocks is one potential issue. There are others (e.g., lack of CRC
> > protection), but none that have been real show-stoppers. I have a few
> > generations of products running it here.
> 
> Hm.. Can you guys mention what's the benefit of using a BBT, against keeping
> the bad block mark in the OOB region? (Other than the fact that some ECC
> strength may not leave any available OOB).

The primary reason would be that NAND datasheets specify it these days
:) But a better argument: nobody guarantees that you can write a 
bad block marker to a worn out block; you may just get program failures.
This has been acknowledged by several developers over the last several
years, some of whom I think were quoting their recollection from talking
w/ manufacturers (does that make this 3rd-hand info?). Most recently,
Lothar brought this up [1].

Additionally, you get a boot-time performance improvement if you only
have to read a few pages, instead of a page or two from every block on
the flash.

Brian

[1] http://lists.infradead.org/pipermail/linux-mtd/2014-July/054767.html
