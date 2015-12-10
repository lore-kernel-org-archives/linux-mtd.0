Received: from mail-pf0-x230.google.com ([2607:f8b0:400e:c00::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6qom-00050h-FU
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2015 02:18:52 +0000
Received: by pfbg73 with SMTP id g73so40415093pfb.1
 for <linux-mtd@lists.infradead.org>; Wed, 09 Dec 2015 18:18:32 -0800 (PST)
Date: Wed, 9 Dec 2015 18:18:29 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: David Woodhouse <dwmw2@infradead.org>, Simon Horman <horms@verge.net.au>,
 Magnus Damm <magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-mtd@lists.infradead.org, linux-sh@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: Confine MTD_NAND_SH_FLCTL to SUPERH
Message-ID: <20151210021829.GG144338@google.com>
References: <1449596459-31653-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449596459-31653-1-git-send-email-geert+renesas@glider.be>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 08, 2015 at 06:40:59PM +0100, Geert Uytterhoeven wrote:
> As of commit a521422ea4ae6128 ("ARM: shmobile: mackerel: Remove Legacy C
> board code"), the Renesas SuperH FLCTL driver is no longer used on ARM
> SH-Mobile SoCs. Restrict the dependencies, unless compile-testing.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to l2-mtd.git
