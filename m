Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEPer-0004wO-2a
 for linux-mtd@lists.infradead.org; Mon, 04 Aug 2014 21:19:05 +0000
Received: by mail-pa0-f48.google.com with SMTP id et14so23254pad.35
 for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2014 14:18:44 -0700 (PDT)
Date: Mon, 4 Aug 2014 14:18:41 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH] mtd: atmel_nand: add pmecc support for 512, 1k, 4k, 8k
 page size
Message-ID: <20140804211841.GZ3711@ld-irv-0074>
References: <1406021058-5490-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1406021058-5490-1-git-send-email-josh.wu@atmel.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 22, 2014 at 05:24:18PM +0800, Josh Wu wrote:
> PMECC can support 512, 1k, 2k, 4k, 8k page size.
> The driver currently only support 2k page size nand flash. So this patch
> add support to 512, 1k, 4k and 8k page size nand flash.
> 
> Signed-off-by: Josh Wu <josh.wu@atmel.com>

Queued to l2-mtd.git/next. Thanks!

Brian
