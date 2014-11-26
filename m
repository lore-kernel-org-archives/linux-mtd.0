Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtWnv-0006zx-KU
 for linux-mtd@lists.infradead.org; Wed, 26 Nov 2014 07:14:24 +0000
Received: by mail-pa0-f54.google.com with SMTP id fb1so2271718pad.41
 for <linux-mtd@lists.infradead.org>; Tue, 25 Nov 2014 23:14:02 -0800 (PST)
Date: Tue, 25 Nov 2014 23:13:59 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: cafe_nand: drop duplicate .write_page implementation
Message-ID: <20141126071359.GN3212@norris-Latitude-E6410>
References: <1415653564-23113-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1415653564-23113-1-git-send-email-computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 10, 2014 at 01:06:04PM -0800, Brian Norris wrote:
> This write_page() function is functionally equivalent to the default in
> nand_base.c. Its only difference is in subpage programming support,
> which cafe_nand.c does not advertise, so the difference is negligible.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Applied to l2-mtd.git.

Brian
