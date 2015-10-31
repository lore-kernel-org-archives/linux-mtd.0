Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsK1K-0006CT-Kd
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2015 00:27:47 +0000
Received: by pasz6 with SMTP id z6so88013719pas.2
 for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2015 17:27:25 -0700 (PDT)
Date: Fri, 30 Oct 2015 17:27:23 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Felipe Balbi <balbi@ti.com>,
 tony@atomide.com, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: blkdevs: fix potential deadlock + lockdep warnings
Message-ID: <20151031002723.GN13239@google.com>
References: <1445913529-19887-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1445913529-19887-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 26, 2015 at 07:38:49PM -0700, Brian Norris wrote:
> Commit 073db4a51ee4 ("mtd: fix: avoid race condition when accessing
> mtd->usecount") fixed a race condition but due to poor ordering of the
> mutex acquisition, introduced a potential deadlock.
[...]
> 
> Fixes: 073db4a51ee4 ("mtd: fix: avoid race condition when accessing mtd->usecount")
> Reported-by: Felipe Balbi <balbi@ti.com>
> Tested-by: Felipe Balbi <balbi@ti.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: <stable@vger.kernel.org>

Pushed to l2-mtd.git.

> ---
> Resending as a proper patch
> 
> Note: I tried to reproduce this lockdep warning myself but couldn't. But I saw
> no problem under the new patch either.
