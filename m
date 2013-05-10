Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UamWv-0005UY-U9
 for linux-mtd@lists.infradead.org; Fri, 10 May 2013 12:34:34 +0000
Message-ID: <1368189407.26780.159.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/3] MIPS: BCM63XX: export PSI size from nvram
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jonas Gorski <jogo@openwrt.org>
Date: Fri, 10 May 2013 15:36:47 +0300
In-Reply-To: <1364044070-10486-3-git-send-email-jogo@openwrt.org>
References: <1364044070-10486-1-git-send-email-jogo@openwrt.org>
 <1364044070-10486-3-git-send-email-jogo@openwrt.org>
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
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>
> ---
>  arch/mips/bcm63xx/nvram.c                          |   11 +++++++++++
>  arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h |    2 ++
>  2 files changed, 13 insertions(+)

Acks from MIPS folks would be nice to have, but I pushed this patch to
the l2-mtd.git tree, thanks!

-- 
Best Regards,
Artem Bityutskiy
