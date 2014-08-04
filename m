Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEPll-0000Le-75
 for linux-mtd@lists.infradead.org; Mon, 04 Aug 2014 21:26:16 +0000
Received: by mail-pa0-f42.google.com with SMTP id lf10so36606pab.15
 for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2014 14:25:52 -0700 (PDT)
Date: Mon, 4 Aug 2014 14:25:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] mtd: fix linux/mtd/nand.h kernel-doc warning
Message-ID: <20140804212549.GC3711@ld-irv-0074>
References: <53D56FC9.8050909@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53D56FC9.8050909@infradead.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jul 27, 2014 at 02:31:53PM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix kernel-doc warning in <linux/mtd/nand.h>:
> 
> Warning(..//include/linux/mtd/nand.h:795): No description found for parameter 'ecc'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc:	David Woodhouse <dwmw2@infradead.org>
> Cc:	Brian Norris <computersforpeace@gmail.com>
> Cc:	linux-mtd@lists.infradead.org

Queued to l2-mtd.git/next. Thanks!

Brian
