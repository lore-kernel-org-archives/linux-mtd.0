Received: from mail-ie0-x22c.google.com ([2607:f8b0:4001:c03::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VrCz5-0000qM-Dz
 for linux-mtd@lists.infradead.org; Thu, 12 Dec 2013 20:35:47 +0000
Received: by mail-ie0-f172.google.com with SMTP id qd12so1516830ieb.3
 for <linux-mtd@lists.infradead.org>; Thu, 12 Dec 2013 12:35:26 -0800 (PST)
Date: Thu, 12 Dec 2013 12:35:22 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH for v3.13 2/2] mtd: nand: pxa3xx: Clear need_wait flag
 when starting a command
Message-ID: <20131212203522.GU27149@ld-irv-0074.broadcom.com>
References: <1386680236-21698-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1386680236-21698-3-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1386680236-21698-3-git-send-email-ezequiel.garcia@free-electrons.com>
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

On Tue, Dec 10, 2013 at 09:57:16AM -0300, Ezequiel Garcia wrote:
...
> This fixes a current bug that can be reproduced on PXA boards by writing
> blank (all 0xff'ed) to a page:
...

This patch doesn't apply to 3.13-rc1, so how am I supposed to send it
for the 3.13 cycle? It seems that you based this on l2-mtd.git, which
has code queued for 3.14.

Please rebase on linux-mtd.git, give it a test, and resend it so I can
get it out soon.

Thanks,
Brian
