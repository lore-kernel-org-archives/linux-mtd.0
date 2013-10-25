Received: from mail-ie0-x232.google.com ([2607:f8b0:4001:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZlgF-0002Y7-Lp
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2013 18:00:16 +0000
Received: by mail-ie0-f178.google.com with SMTP id x13so7227654ief.9
 for <linux-mtd@lists.infradead.org>; Fri, 25 Oct 2013 10:59:54 -0700 (PDT)
Date: Fri, 25 Oct 2013 10:59:47 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 4/5] mtd: m25p80: remove M25PXX_USE_FAST_READ Kconfig
Message-ID: <20131025175947.GI20061@ld-irv-0074.broadcom.com>
References: <1382583503-13748-1-git-send-email-computersforpeace@gmail.com>
 <1382583503-13748-4-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1382583503-13748-4-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 sourav.poddar@ti.com, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 23, 2013 at 07:58:22PM -0700, Brian Norris wrote:
> Remove the compile-time option for FAST_READ, since we have run-time
> support for detecting it.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed to l2-mtd.git. Comments are still welcome.

FYI Huang: Sourav's new quad read patch applies on top of this patch.

Brian
