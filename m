Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VrEu4-0004M6-SO
 for linux-mtd@lists.infradead.org; Thu, 12 Dec 2013 22:38:45 +0000
Date: Thu, 12 Dec 2013 19:38:31 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH for v3.13 2/2] mtd: nand: pxa3xx: Clear need_wait flag
 when starting a command
Message-ID: <20131212223830.GA2467@localhost>
References: <1386680236-21698-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1386680236-21698-3-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131212203522.GU27149@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131212203522.GU27149@ld-irv-0074.broadcom.com>
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

On Thu, Dec 12, 2013 at 12:35:22PM -0800, Brian Norris wrote:
> On Tue, Dec 10, 2013 at 09:57:16AM -0300, Ezequiel Garcia wrote:
> ...
> > This fixes a current bug that can be reproduced on PXA boards by writing
> > blank (all 0xff'ed) to a page:
> ...
> 
> This patch doesn't apply to 3.13-rc1, so how am I supposed to send it
> for the 3.13 cycle? It seems that you based this on l2-mtd.git, which
> has code queued for 3.14.
> 

Ugh... crap!! This patch is *not* for v3.13, and I've no idea why I said so in
the first place. The bug this patch fixes was introduced with the device ready
completion mess in:

  commit 8524028ee90d177580b496e2740efd673f8e7910
  Author: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
  Date:   Thu Nov 14 18:25:26 2013 -0300

  mtd: nand: pxa3xx: Use a completion to signal device ready

So, this fix goes on top of l2-mtd.git (for v3.14), while the ones appropriate
for v3.13 are:

http://patchwork.ozlabs.org/patch/299645/

and

http://patchwork.ozlabs.org/patch/299202/

Can you pick them, or do you prefer me to resend everything?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
