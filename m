Received: from mho-02-ewr.mailhop.org ([204.13.248.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WvLnA-0008U7-GB
 for linux-mtd@lists.infradead.org; Fri, 13 Jun 2014 07:20:52 +0000
Date: Fri, 13 Jun 2014 00:20:23 -0700
From: Tony Lindgren <tony@atomide.com>
To: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH 07/36] mtd: nand: omap: Move NAND write protect code from
 GPMC to NAND driver
Message-ID: <20140613072023.GK17845@atomide.com>
References: <1402477001-31132-1-git-send-email-rogerq@ti.com>
 <1402477001-31132-8-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1402477001-31132-8-git-send-email-rogerq@ti.com>
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, kyungmin.park@samsung.com,
 linux-mtd@lists.infradead.org, pekon@ti.com,
 ezequiel.garcia@free-electrons.com, javier@dowhile0.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Roger Quadros <rogerq@ti.com> [140611 01:58]:
> The write protect (WP) pin is only used for NAND devices. So move
> the code into the NAND driver.

Eek, noooo!

Tony
