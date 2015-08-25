Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZUJqf-0005AL-3N
 for linux-mtd@lists.infradead.org; Tue, 25 Aug 2015 19:25:33 +0000
Received: by pacgr6 with SMTP id gr6so29454pac.3
 for <linux-mtd@lists.infradead.org>; Tue, 25 Aug 2015 12:25:12 -0700 (PDT)
Date: Tue, 25 Aug 2015 12:25:09 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 3/3] mtd: nand: add Toshiba TC58NVG0S3E to nand_ids
 table
Message-ID: <20150825192509.GI81844@google.com>
References: <20141230200946.277c56c0@bbrezillon>
 <1420030733-10374-1-git-send-email-linux@rempel-privat.de>
 <1420030733-10374-3-git-send-email-linux@rempel-privat.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1420030733-10374-3-git-send-email-linux@rempel-privat.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

An old one here...

On Wed, Dec 31, 2014 at 01:58:53PM +0100, Oleksij Rempel wrote:
> Add the full description of the Toshiba TC58NVG0S3E NAND chip in the
> nand_ids table so that we can later use the NAND ECC infos and ONFI timings
> mode in controller drivers.
> 
> Tested with asm9260_nand driver.

Looks like this driver work stalled?

> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>

This patch looks good anyway, so pushed to l2-mtd.git.

Brian
