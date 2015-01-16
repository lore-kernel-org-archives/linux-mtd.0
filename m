Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBxfo-0004rs-Pd
 for linux-mtd@lists.infradead.org; Fri, 16 Jan 2015 03:34:14 +0000
Received: by mail-pa0-f46.google.com with SMTP id lf10so21569571pab.5
 for <linux-mtd@lists.infradead.org>; Thu, 15 Jan 2015 19:33:50 -0800 (PST)
Date: Thu, 15 Jan 2015 19:33:47 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
Subject: Re: [PATCH] mtd: nand: ams-delta: fix overwritten mtd_info->owner in
 initialization
Message-ID: <20150116033347.GE9759@ld-irv-0074>
References: <1420981640-16495-1-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1420981640-16495-1-git-send-email-akinobu.mita@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Jonathan McDowell <noodles@earth.li>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jan 11, 2015 at 10:07:20PM +0900, Akinobu Mita wrote:
> In initialization routine, mtd_info->owner is overwritten by memset()
> just after being initialized.  This can be fixed by moving memset() calls
> to just before setting mtd_info->owner.  But the memory region is allocated
> by kmalloc, so we can fix it by using kzalloc instead of kmalloc.
> 
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> Cc: Jonathan McDowell <noodles@earth.li>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: linux-mtd@lists.infradead.org

Pushed to l2-mtd.git. Thanks!

Brian
