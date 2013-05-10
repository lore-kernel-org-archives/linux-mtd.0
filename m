Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UalYn-0004Mk-Mc
 for linux-mtd@lists.infradead.org; Fri, 10 May 2013 11:32:26 +0000
Message-ID: <1368185687.26780.116.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: plat_nand: add further DT bindings and documentation
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alexander Clouter <alex@digriz.org.uk>
Date: Fri, 10 May 2013 14:34:47 +0300
In-Reply-To: <1364124453-899-1-git-send-email-alex@digriz.org.uk>
References: <1364124453-899-1-git-send-email-alex@digriz.org.uk>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2013-03-24 at 11:27 +0000, Alexander Clouter wrote:
> The plat_nand driver has some devicetree support but it is currently
> unusable, especially as there is no documentation on how to use it.
> 
> This patch adds the much needed documentation as well as adds some common
> properties (bank-width, chip-delay, bbt-use-flash and nr-chips) removing
> further use of the platform_nand_data struct.
> 
> Signed-off-by: Alexander Clouter <alex@digriz.org.uk>

I think you should re-send this patch with
devicetree-discuss@lists.ozlabs.org in CC.

-- 
Best Regards,
Artem Bityutskiy
