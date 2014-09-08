Received: from mail-qc0-f178.google.com ([209.85.216.178])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQxBb-0007v7-UY
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 11:32:44 +0000
Received: by mail-qc0-f178.google.com with SMTP id x13so15576887qcv.9
 for <linux-mtd@lists.infradead.org>; Mon, 08 Sep 2014 04:32:22 -0700 (PDT)
Date: Mon, 8 Sep 2014 08:31:09 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH 0/3] nand: omap2: Two and a half improvements
Message-ID: <20140908113109.GC1676@arch.hh.imgtec.org>
References: <1410033389-32357-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <540D691B.2060202@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <540D691B.2060202@ti.com>
Cc: Tony Lindgren <tony@atomide.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08 Sep 11:30 AM, Roger Quadros wrote:
[..]
> > 
> > And speaking of modules, the driver loads as "modprobe omap2". And it's not
> > the only one with a clumsy name: "modprobe elm". I guess we cannot fix it now,
> > but it would be great to be more careful with driver naming in the future.
> 
> Why can't we fix it now? It seems nobody ever used it as a module before so now
> is the right time to fix. Unless Tony has any objections.
> 

That would be great. "omap2-nand" or something like that would be optimal.

Regarding the ELM driver, I agree with your suggestion in the other thread,
we could just move it into drivers/mtd/nand and rework it to not be a module
but just a pack of helpers for the NAND driver.

Do you think that would work?
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
