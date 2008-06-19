Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K9LfU-0002YT-By
	for linux-mtd@lists.infradead.org; Thu, 19 Jun 2008 15:03:21 +0000
Date: Fri, 20 Jun 2008 00:04:47 +0900 (JST)
Message-Id: <20080620.000447.05598315.anemo@mba.ocn.ne.jp>
To: greg@kroah.com
Subject: Re: [stable] [PATCH] jedec_probe: Fix SST 16-bit chip detection
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <20080619110418.GB27196@kroah.com>
References: <20080619.163648.262833678.nemoto@toshiba-tops.co.jp>
	<20080619110418.GB27196@kroah.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 19 Jun 2008 04:04:18 -0700, Greg KH <greg@kroah.com> wrote:
> In the future, if you want something to go into the stable tree, just
> add:
> 	cc: stable <stable@kernel.org>
> to the signed-off-by area of the patch and we will be automatically
> notifed when it goes into Linus's tree and will then add it to the
> -stable tree.
> 
> Otherwise it's a pain to try to track when a patch goes into mainline.

Sure.  Will do next time.  I had misunderstand the statement in
stable_kernel_rules.txt, as CC: in mail header (not S-O-B area) is
enough.  Thank you.

> Can you notify us when this patch is accepted?

Sure too.
---
Atsushi Nemoto
