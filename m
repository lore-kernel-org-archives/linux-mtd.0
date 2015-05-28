Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yy7Nd-0007yn-6V
 for linux-mtd@lists.infradead.org; Thu, 28 May 2015 23:38:29 +0000
Received: by pabru16 with SMTP id ru16so34503010pab.1
 for <linux-mtd@lists.infradead.org>; Thu, 28 May 2015 16:38:08 -0700 (PDT)
Date: Thu, 28 May 2015 16:38:05 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH] mtd-utils: libfec: use standard C type instead of u_long
Message-ID: <20150528233805.GC17945@ld-irv-0074>
References: <1430746594-5867-1-git-send-email-kaloz@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1430746594-5867-1-git-send-email-kaloz@openwrt.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 04, 2015 at 03:36:34PM +0200, Imre Kaloz wrote:
> Fixes compilation on hosts with the musl C library.
> Also drops the unused u_short typedef.
> 
> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>

Pushed to mtd-utils.git. Thanks!

Brian
