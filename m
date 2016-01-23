Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aN6GH-0003rm-3o
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2016 22:02:25 +0000
Received: by mail-pf0-x22c.google.com with SMTP id n128so60866891pfn.3
 for <linux-mtd@lists.infradead.org>; Sat, 23 Jan 2016 14:02:04 -0800 (PST)
Date: Sat, 23 Jan 2016 14:01:59 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 1/3] mtd: nand: remove EXPORT_SYMBOL of nand_scan_bbt()
Message-ID: <20160123220159.GD24744@localhost>
References: <1452782691-5193-1-git-send-email-thomas.petazzoni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452782691-5193-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 14, 2016 at 03:44:49PM +0100, Thomas Petazzoni wrote:
> Since commit 17799359e7b3fa6ef4f2bf926cd6821cf7903ecf ("mtd: nand_bbt:
> make nand_scan_bbt() static"), the nand_scan_bbt() function is marked
> as static but is still exported using EXPORT_SYMBOL(), which doesn't
> make much sense.
> 
> This commit gets rid of the useless EXPORT_SYMBOL.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Pushed all 3 to l2-mtd.git/next
