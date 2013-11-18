Received: from mail-ob0-x22f.google.com ([2607:f8b0:4003:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ViShg-00015q-UV
 for linux-mtd@lists.infradead.org; Mon, 18 Nov 2013 17:33:41 +0000
Received: by mail-ob0-f175.google.com with SMTP id va2so7260568obc.20
 for <linux-mtd@lists.infradead.org>; Mon, 18 Nov 2013 09:33:19 -0800 (PST)
Date: Mon, 18 Nov 2013 09:33:14 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx: make ECC configuration checks more
 explicit
Message-ID: <20131118173314.GY9468@ld-irv-0074.broadcom.com>
References: <1384471108-28188-1-git-send-email-computersforpeace@gmail.com>
 <20131117045704.GA17731@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131117045704.GA17731@localhost>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 17, 2013 at 01:57:05AM -0300, Ezequiel Garcia wrote:
> On Thu, Nov 14, 2013 at 03:18:28PM -0800, Brian Norris wrote:
> > The Armada BCH configuration in this driver uses one of the two
> > following ECC schemes:
> > 
> >  16-bit correction per 2048 bytes
> >  16-bit correction per 1024 bytes
> > 
> > These are sufficient for mapping to the 4-bit per 512-bytes and 8-bit
> > per 512-bytes (respectively) minimum correctability requirements of many
> > common NAND.
> > 
> > The current code only checks for the required strength (4-bit or 8-bit)
> > without checking the ECC step size that is associated with that strength
> > (and simply assumes it is 512). While that is often a safe assumption to
> > make, let's make it explicit, since we have that information.
> > 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> 
> Acked-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Pushed to l2-mtd.git/next.

Brian
