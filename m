Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VD86Q-0005E0-5F
 for linux-mtd@lists.infradead.org; Sat, 24 Aug 2013 07:17:43 +0000
Received: by mail-pa0-f43.google.com with SMTP id hz10so1503015pad.30
 for <linux-mtd@lists.infradead.org>; Sat, 24 Aug 2013 00:17:20 -0700 (PDT)
Date: Sat, 24 Aug 2013 00:17:16 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v2 4/9] mtd: gpmi: rewrite the gpmi_ecc_write_oob() to
 support the jffs2
Message-ID: <20130824071716.GE32074@brian-ubuntu>
References: <1376879478-22128-1-git-send-email-b32955@freescale.com>
 <1376879478-22128-5-git-send-email-b32955@freescale.com>
 <20130824061916.GC32074@brian-ubuntu>
 <20130824191757.GA23955@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130824191757.GA23955@gmail.com>
Cc: dedekind1@gmail.com, akinobu.mita@gmail.com, matthieu.castet@parrot.com,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 24, 2013 at 03:18:13PM -0400, Huang Shijie wrote:
> On Fri, Aug 23, 2013 at 11:19:16PM -0700, Brian Norris wrote:
> > On Mon, Aug 19, 2013 at 10:31:13AM +0800, Huang Shijie wrote:
> > > -	 */
> > > -	return -EPERM;
> > > +	struct nand_oobfree *of = gpmi_hw_ecclayout.oobfree;
> > 
> > Why do you directly access your static layout? I think you should use
> > the proper indirection, through chip->ecc.layout. (There's a similar
> 		
> yes, it is better to use the chip->ecc.layout.
> 
> > issue with set_geometry_by_ecc_info() currently.)
> 
> Not a same issue.  The set_geometry_by_ecc_info() is called before we
> call the nand_scan_tail(). so it should not changed.

OK.

> > 
> > [BTW, I was about to recommend nand_chip.ecclayout, but it looks like
> > that is just a dead field. It's not initialized anywhere, AFAICT, and if
> The jffs2 write may also uses the ecclayout. 

It uses mtd_info.ecclayout. I'm pretty sure nand_chip.ecclayout is never
used (except for a debug print).

Brian
