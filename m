Received: from muru.com ([72.249.23.125])
 by casper.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1aqQej-0005Xa-ON
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 19:40:54 +0000
Date: Wed, 13 Apr 2016 12:40:27 -0700
From: Tony Lindgren <tony@atomide.com>
To: Roger Quadros <rogerq@ti.com>
Cc: "Franklin S Cooper Jr." <fcooper@ti.com>, nsekhar@ti.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/7] ARM: OMAP2+: gpmc-nand: Set omap2-nand's parent
 dev to GPMC dev
Message-ID: <20160413194027.GZ5995@atomide.com>
References: <1457654203-20856-1-git-send-email-fcooper@ti.com>
 <1457654203-20856-2-git-send-email-fcooper@ti.com>
 <56E2CDB7.2080306@ti.com> <56E2E6B0.5050507@ti.com>
 <56E68143.9040903@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56E68143.9040903@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Roger Quadros <rogerq@ti.com> [160314 02:16]:
> 
> I think it is OK to assume that NAND DMA won't work with legacy boot.
> Tony any objections? I see that board-ldp.c is the only legacy user
> of NAND. When can we drop support for it?

Sorry for the delay, just nocied this one. Let's not touch the
board-*.c files until we just remove them except for fixes.
It's OK to assume legacy booting does not support DMA.

Regards,

Tony
