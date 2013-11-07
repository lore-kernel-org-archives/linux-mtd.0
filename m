Received: from mail-pb0-x229.google.com ([2607:f8b0:400e:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeKiV-00007o-Vd
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2013 08:13:29 +0000
Received: by mail-pb0-f41.google.com with SMTP id wy17so254782pbc.0
 for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2013 00:13:06 -0800 (PST)
Date: Thu, 7 Nov 2013 00:13:03 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: nand: use a local variable to simplify the
 nand_scan_tail
Message-ID: <20131107081303.GF3805@norris.computersforpeace.net>
References: <1382077253-21709-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1382077253-21709-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 18, 2013 at 02:20:53PM +0800, Huang Shijie wrote:
> There are too many "chip->ecc" in the nand_scan_tail() which makes the eyes
> sore.
> 
> This patch uses a local variable "ecc" to replace the "chip->ecc" to
> make the code more graceful.
> 
> Do the code change with "s/chip->ecc\./ecc->/g" in the nand_scan_tail,
> and also change some lines by hand.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Pushed to l2-mtd.git.

Brian
