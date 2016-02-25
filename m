Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZ03u-0006E9-Dn
 for linux-mtd@lists.infradead.org; Thu, 25 Feb 2016 17:50:50 +0000
Received: by mail-pa0-x230.google.com with SMTP id fl4so35737035pad.0
 for <linux-mtd@lists.infradead.org>; Thu, 25 Feb 2016 09:50:29 -0800 (PST)
Date: Thu, 25 Feb 2016 09:50:27 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mtd@lists.infradead.org, Kamal Dasu <kdasu.kdev@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "open list:BROADCOM STB NAND FLASH DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: brcmnand: Fix v7.1 register offsets
Message-ID: <20160225175027.GJ21465@google.com>
References: <1456358843-16347-1-git-send-email-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1456358843-16347-1-git-send-email-f.fainelli@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 24, 2016 at 04:07:23PM -0800, Florian Fainelli wrote:
> The BRCMNAND controller revision 7.1 is almost 100% compatible with the
> previous v6.0 register offset layout, except for the Correctable Error
> Reporting Threshold registers. Fix this by adding another table with the
> correct offsets for CORR_THRESHOLD and CORR_THRESHOLD_EXT.

Wow. That sucks, but I guess I can't say I'm surprised.

> Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied to l2-mtd.git.
