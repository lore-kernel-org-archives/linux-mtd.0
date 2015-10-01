Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhhYQ-0008Tk-87
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2015 17:22:02 +0000
Received: by pacfv12 with SMTP id fv12so81857371pac.2
 for <linux-mtd@lists.infradead.org>; Thu, 01 Oct 2015 10:21:40 -0700 (PDT)
Date: Thu, 1 Oct 2015 10:21:38 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Huang Shijie <shijie.huang@arm.com>
Subject: Re: [PATCH] mtd: nand: remove unused ->init_size() hook
Message-ID: <20151001172138.GS143959@google.com>
References: <1443711507-1875-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1443711507-1875-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 01, 2015 at 04:58:27PM +0200, Boris Brezillon wrote:
> The ->init_size() hook was introduced to let NAND controller drivers
> support NAND devices that could not be described in the nand_ids table.
> Since then, the core has added support for extended-id parsing and
> full-id description, thus allowing to describe pretty much all existing
> NANDs.
> Moreover, this hook is not used by any mainline driver, and should not be
> used by new drivers, because detecting the NAND chip is not something
> controller specific.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Looks obvious and passes all my builds. Pushed to l2-mtd.git.
