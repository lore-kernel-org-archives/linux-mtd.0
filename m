Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEPcy-0004Wj-Cb
 for linux-mtd@lists.infradead.org; Mon, 04 Aug 2014 21:17:09 +0000
Received: by mail-pa0-f41.google.com with SMTP id rd3so22221pab.28
 for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2014 14:16:47 -0700 (PDT)
Date: Mon, 4 Aug 2014 14:16:44 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH] mtd: use NULL instead of 0 for an address
Message-ID: <20140804211644.GX3711@ld-irv-0074>
References: <1406817076-1072-1-git-send-email-martink@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1406817076-1072-1-git-send-email-martink@posteo.de>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 31, 2014 at 04:31:16PM +0200, Martin Kepplinger wrote:
> Use NULL instead of 0 when returning an address. This fixes a
> sparse warning.
> 
> Signed-off-by: Martin Kepplinger <martink@posteo.de>
> ---
> Sorry if this is only noise, I stumbled upon it and why not send it.
> applies to next-20140731

Queued to l2-mtd.git/next.

Brian
