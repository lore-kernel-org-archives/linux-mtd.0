Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z5H1E-0002Lr-U8
 for linux-mtd@lists.infradead.org; Wed, 17 Jun 2015 17:20:57 +0000
Received: by paceq1 with SMTP id eq1so16108084pac.3
 for <linux-mtd@lists.infradead.org>; Wed, 17 Jun 2015 10:20:34 -0700 (PDT)
Date: Wed, 17 Jun 2015 10:20:26 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Kamil Debski <Kamil.Debski@imgtec.com>
Subject: Re: NAND/OneNAND/SPI NAND bad block management
Message-ID: <20150617172026.GF4917@ld-irv-0074>
References: <616819EF2EBFD445AEF36EFF651655B6AB8BB1@hhmail02.hh.imgtec.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <616819EF2EBFD445AEF36EFF651655B6AB8BB1@hhmail02.hh.imgtec.org>
Cc: Ionela Voinescu <Ionela.Voinescu@imgtec.com>,
 "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ezequiel@vanguardiasur.com.ar" <ezequiel@vanguardiasur.com.ar>,
 "peterpandong@micron.com" <peterpandong@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 11, 2015 at 03:57:00PM +0000, Kamil Debski wrote:
> Hi,

Hi!

> I am currently working on the SPI NAND framework. I noticed that there
> was quite a lot of discussion on this topic. 
> 
> It seems that the necessary task to do first is to make some
> modification to the bad block management. It is necessary to separate
> it from the NAND core, as the same bad block handling would be used by
> the SPI NAND core. 
> 
> My question regarding this is following. OneNAND core also needs BBM
> and implements it on its own. The design of BBM in OneNAND core is
> very similar to NAND core - there are also two files onenand_base.c
> and onenand_bbt.c.  The latter was actually derived from nand_bbt.c. I
> am pretty sure OneNAND would be also benefit from using a generic BBM.
> I did not find OneNAND mentioned in the previous discussion about
> separating bad block management from the NAND core [1]. Was there any
> reason why it was left out, or was it just overlooked?

OneNAND development is essentially dead, AFAICT. I don't know if anyone
still uses it, but I haven't really seen significant patches from anyone
on that code in a long time. So I figure it's better to leave it alone,
until someone actually has hardware to test and a desire to work on it.

(I see you sent patches just recently; do you have hardware to test it?)

> The file include/linux/mtd/bbm.h contains the struct bbm_info, which
> seems as a good place to store the parameters and state of the BBM. I
> am not sure about creating a new struct nand_bbt for that reason;
> especially that struct bbm_info is already used by the OneNAND core.
> I would go for embedding a struct bbm_info * in struct mtd_info, such
> that it wouldn't be necessary to create wrappers.

I suppose that's possible, but as I mentioned, we aren't really equipped
to rework OneNAND at the moment, so it may be best to keep them
separate.

> I am working on the patches and should send them out soon. I am quite
> new to mtd, so I am sure you'll have quite a few comments on this
> topic and the patches :)

Glad to see you interested in the topic. You might do best to comment
on and/or test existing solutions, though, rather than rewrite them.

> Best wishes,
> Kamil Debski
> 
> [1] http://lists.infradead.org/pipermail/linux-mtd/2015-January/057639.html
> 
> Other useful links:
> - previous attempt at the SPI NAND framework by Ezequiel Garcia
> http://lists.infradead.org/pipermail/linux-mtd/2014-December/056763.html
> - successive attempt at the SPI NAND framework by Peter Pan
> http://lists.infradead.org/pipermail/linux-mtd/2015-January/057223.html

You're missing Peter Pan's latest revision:

http://lists.infradead.org/pipermail/linux-mtd/2015-May/059183.html

I'd appreciate if you could make an argument why we should consider your
solution instead of just focusing on his.

Regards,
Brian
