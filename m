Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a78Sy-0000Pf-3Y
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2015 21:09:32 +0000
Received: by pacwq6 with SMTP id wq6so53106790pac.1
 for <linux-mtd@lists.infradead.org>; Thu, 10 Dec 2015 13:09:11 -0800 (PST)
Date: Thu, 10 Dec 2015 13:09:08 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Simon Arlott <simon@fire.lp0.eu>
Cc: linux-mtd@lists.infradead.org, Kamal Dasu <kdasu.kdev@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH] mtd: brcmnand: defer to devm_ioremap_resource() for
 error checking
Message-ID: <20151210210908.GN144338@google.com>
References: <1449714797-27492-1-git-send-email-computersforpeace@gmail.com>
 <5669E920.9010706@simon.arlott.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5669E920.9010706@simon.arlott.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 10, 2015 at 09:05:36PM +0000, Simon Arlott wrote:
> On 10/12/15 02:33, Brian Norris wrote:
> > devm_ioremap_resource() does error checking on the 'res' argument, so
> > drop the error check in bcm6368_nand.c.
> > 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > Cc: Simon Arlott <simon@fire.lp0.eu>
> 
> Tested-by: Simon Arlott <simon@fire.lp0.eu>

Applied to l2-mtd.git
