Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abzvi-0004gy-3P
 for linux-mtd@lists.infradead.org; Sat, 05 Mar 2016 00:18:46 +0000
Received: by mail-pa0-x22b.google.com with SMTP id fy10so42907137pac.1
 for <linux-mtd@lists.infradead.org>; Fri, 04 Mar 2016 16:18:25 -0800 (PST)
Date: Fri, 4 Mar 2016 16:18:22 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com
Subject: Re: [PATCH] mtd: nand: sunxi: remove direct mtd->priv accesses
Message-ID: <20160305001822.GE55664@google.com>
References: <1457133680-18419-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1457133680-18419-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Mar 05, 2016 at 12:21:20AM +0100, Boris Brezillon wrote:
> mtd->priv is no longer pointing to the struct nand_chip it is attached to.
> Replace those accesses by mtd_to_nand() calls.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Fixes: 4be4e03efc7f ("mtd: nand: sunxi: add randomizer support")
> ---

Applied, thanks!

> Sorry for the inconvenience, but apparently I was not expecting
> the mtd_to_nand() rework to be taken before the randomizer patch,
> and I forgot to repost a version replacing mtd->priv by mtd_to_nand().

Eh, probably not entirely your fault. I can be erratic with my
review/acceptance times.

Brian
