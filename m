Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UamVW-0005SD-T9
 for linux-mtd@lists.infradead.org; Fri, 10 May 2013 12:33:07 +0000
Message-ID: <1368189329.26780.157.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 0/3] fix NVRAM partition size if larger than expected
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jonas Gorski <jogo@openwrt.org>
Date: Fri, 10 May 2013 15:35:29 +0300
In-Reply-To: <1364044070-10486-1-git-send-email-jogo@openwrt.org>
References: <1364044070-10486-1-git-send-email-jogo@openwrt.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mips@linux-mips.org, Kevin Cernekee <cernekee@gmail.com>,
 linux-mtd@lists.infradead.org, Maxime Bizon <mbizon@freebox.fr>,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2013-03-23 at 14:07 +0100, Jonas Gorski wrote:
> Some device vendors use a larger nvram size than expected. While Broadcom
> has defined it as 64K max, devices with 128K have been seen in the wild.
> Luckily they properly set the nvram's PSI size to the correct value, so
> we can use that to size the nvram partion.
> 
> Yes it's a bit confusing as there are two nvrams, one with a fixed layout
> with in the bootloader, with the size information about the other.
> 
> Since 2 of 3 patches are for the mtd tree, this patchset should go there
> (but it applies to both l2-mtd and mips-next fine).

Pushed all 3 to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
