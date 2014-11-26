Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtWOA-0000M8-AP
 for linux-mtd@lists.infradead.org; Wed, 26 Nov 2014 06:47:46 +0000
Received: by mail-pa0-f51.google.com with SMTP id ey11so2233848pad.24
 for <linux-mtd@lists.infradead.org>; Tue, 25 Nov 2014 22:47:24 -0800 (PST)
Date: Tue, 25 Nov 2014 22:47:09 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH v2] mtd: nand: omap: Fix NAND enumeration on 3430 LDP
Message-ID: <20141126064709.GI3212@norris-Latitude-E6410>
References: <1415185258-11747-1-git-send-email-rogerq@ti.com>
 <546C8B7F.6030600@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <546C8B7F.6030600@ti.com>
Cc: tony@atomide.com, pekon@pek-sem.com, linux-mtd@lists.infradead.org,
 ezequiel@vanguardiasur.com.ar, "Rini, Tom" <trini@ti.com>,
 linux-omap@vger.kernel.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 19, 2014 at 02:22:23PM +0200, Roger Quadros wrote:
> 3430LDP has NAND flash with 32 bytes OOB size which is sufficient to hold
> BCH8 codes but the small page check introduced in
> commit b491da7233d5 ("mtd: nand: omap: clean-up ecc layout for BCH ecc schemes")
> considers anything below 64 bytes unsuitable for BCH4/8/16. There is another
> bug in that code where it doesn't skip the check for OMAP_ECC_HAM1_CODE_SW.
> 
> Get rid of that small page check code as it is insufficient and redundant
> because we are checking for OOB available bytes vs ecc layout before calling
> nand_scan_tail().
> 
> Fixes: b491da7233d5 ("mtd: nand: omap: clean-up ecc layout for BCH ecc schemes")
> 
> Reported-by: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Roger Quadros <rogerq@ti.com>

Applied to l2-mtd.git.

Brian
