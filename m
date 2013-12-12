Received: from mail-oa0-x22b.google.com ([2607:f8b0:4003:c02::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VrFEs-0004lu-1k
 for linux-mtd@lists.infradead.org; Thu, 12 Dec 2013 23:00:15 +0000
Received: by mail-oa0-f43.google.com with SMTP id i7so1247334oag.2
 for <linux-mtd@lists.infradead.org>; Thu, 12 Dec 2013 14:59:52 -0800 (PST)
Date: Thu, 12 Dec 2013 14:59:45 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH for v3.13 2/2] mtd: nand: pxa3xx: Clear need_wait flag
 when starting a command
Message-ID: <20131212225945.GV27149@ld-irv-0074.broadcom.com>
References: <1386680236-21698-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1386680236-21698-3-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131212203522.GU27149@ld-irv-0074.broadcom.com>
 <20131212223830.GA2467@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131212223830.GA2467@localhost>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Seif Mazareeb <seif@marvell.com>,
 Tawfik Bayouk <tawfik@marvell.com>, Arnaud Ebalard <arno@natisbad.org>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 12, 2013 at 07:38:31PM -0300, Ezequiel Garcia wrote:
> On Thu, Dec 12, 2013 at 12:35:22PM -0800, Brian Norris wrote:
> > On Tue, Dec 10, 2013 at 09:57:16AM -0300, Ezequiel Garcia wrote:
> > ...
> > > This fixes a current bug that can be reproduced on PXA boards by writing
> > > blank (all 0xff'ed) to a page:
> > ...
> > 
> > This patch doesn't apply to 3.13-rc1, so how am I supposed to send it
> > for the 3.13 cycle? It seems that you based this on l2-mtd.git, which
> > has code queued for 3.14.
> > 
> 
> Ugh... crap!! This patch is *not* for v3.13, and I've no idea why I said so in
> the first place. The bug this patch fixes was introduced with the device ready
> completion mess in:
> 
>   commit 8524028ee90d177580b496e2740efd673f8e7910
>   Author: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
>   Date:   Thu Nov 14 18:25:26 2013 -0300
> 
>   mtd: nand: pxa3xx: Use a completion to signal device ready

I see :) And yes, that makes sense.

> So, this fix goes on top of l2-mtd.git (for v3.14), while the ones appropriate
> for v3.13 are:
> 
> http://patchwork.ozlabs.org/patch/299645/
> 
> and
> 
> http://patchwork.ozlabs.org/patch/299202/
> 
> Can you pick them, or do you prefer me to resend everything?

Got 'em already. Will tag them for upstream within the day, hopefully.

Please resubmit the remaining patch (for 3.14, against l2-mtd.git)
separately once I get everything else queued up properly, and we can
work from there.

Thanks,
Brian
