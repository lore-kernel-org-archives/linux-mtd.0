Received: from mail-ob0-x22e.google.com ([2607:f8b0:4003:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VglS7-0001dW-5I
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2013 01:10:40 +0000
Received: by mail-ob0-f174.google.com with SMTP id uy5so1438136obc.33
 for <linux-mtd@lists.infradead.org>; Wed, 13 Nov 2013 17:10:13 -0800 (PST)
Date: Wed, 13 Nov 2013 17:10:09 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] mtd: Make mtd_partition.name const
Message-ID: <20131114011009.GN9468@ld-irv-0074.broadcom.com>
References: <1384283486-10348-1-git-send-email-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1384283486-10348-1-git-send-email-geert@linux-m68k.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 12, 2013 at 08:11:26PM +0100, Geert Uytterhoeven wrote:
> This allows to drop a few casts.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Pushed to l2-mtd.git/next. Thanks!

Brian
