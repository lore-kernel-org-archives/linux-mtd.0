Received: from mail-pf0-x234.google.com ([2607:f8b0:400e:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGAJZ-0002Jz-O6
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2016 18:57:10 +0000
Received: by mail-pf0-x234.google.com with SMTP id q63so170269681pfb.0
 for <linux-mtd@lists.infradead.org>; Mon, 04 Jan 2016 10:56:48 -0800 (PST)
Date: Mon, 4 Jan 2016 10:56:46 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Heiko Schocher <hs@denx.de>, Frans Klaver <fransklaver@gmail.com>
Subject: Re: [PATCH for-4.4] mtd: fix cmdlinepart parser, early naming for
 auto-filled MTD
Message-ID: <20160104185646.GD109450@google.com>
References: <1449878281-94986-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449878281-94986-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 11, 2015 at 03:58:01PM -0800, Brian Norris wrote:
> Commit 807f16d4db95 ("mtd: core: set some defaults when dev.parent is
> set") attempted to provide some default settings for MTDs that
>  (a) assign the parent device and
>  (b) don't provide their own name or owner
> 
> However, this isn't a perfect drop-in replacement for the boilerplate
> found in some drivers, because the MTD name is used by partition
> parsers like cmdlinepart, but the name isn't set until add_mtd_device(),
> after the parsing is completed. This means cmdlinepart sees a NULL name
> and therefore will not work properly.
> 
> Fix this by moving the default name and owner assignment to be first in
> the MTD registration process.
> 
> Fixes: 807f16d4db95 ("mtd: core: set some defaults when dev.parent is set")
> Reported-by: Heiko Schocher <hs@denx.de>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Heiko Schocher <hs@denx.de>
> Cc: Frans Klaver <fransklaver@gmail.com>
> ---
> Heiko, can you provide testing feedback (e.g., 'Tested-by: ...')?

Applied this patch to linux-mtd.git, even though it doesn't completely
fix the reported problem -- it fixes many other MTD drivers, but
drivers/mtd/nand/ has an additional issue. I'll resend the additional
patch that fixes Heiko's problem completely in a bit.

Brian
