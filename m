Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aUIr5-0006lI-QD
 for linux-mtd@lists.infradead.org; Fri, 12 Feb 2016 18:54:23 +0000
Received: by mail-pa0-x242.google.com with SMTP id fl4so4129145pad.2
 for <linux-mtd@lists.infradead.org>; Fri, 12 Feb 2016 10:53:50 -0800 (PST)
Date: Fri, 12 Feb 2016 10:53:47 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Simon Arlott <simon@fire.lp0.eu>, Ralf Baechle <ralf@linux-mips.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Kevin Cernekee <cernekee@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Jonas Gorski <jogo@openwrt.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MIPS Mailing List <linux-mips@linux-mips.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>, sfr@canb.auug.org.au
Subject: Re: [PATCH linux-next v4 07/11] MIPS: bcm63xx: nvram: Remove unused
 bcm63xx_nvram_get_psi_size() function
Message-ID: <20160212185347.GA21465@google.com>
References: <566DF43B.5010400@simon.arlott.org.uk>
 <566DF625.3060801@simon.arlott.org.uk>
 <20160126191607.GA111152@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160126191607.GA111152@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ralf,

On Tue, Jan 26, 2016 at 11:16:07AM -0800, Brian Norris wrote:
> On Sun, Dec 13, 2015 at 10:50:13PM +0000, Simon Arlott wrote:
> > Remove bcm63xx_nvram_get_psi_size() as it now has no users.
> > 
> > Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
> > ---
> > v4: New patch.
> 
> Ralf,
> 
> Please revert this and send it to Linus (or else, I can send it myself).
> This is causing build failures, because I didn't take the rest of
> Simon's series yet.
> 
> drivers/mtd/bcm63xxpart.c: In function 'bcm63xx_parse_cfe_partitions':
> drivers/mtd/bcm63xxpart.c:93:2: error: implicit declaration of function 'bcm63xx_nvram_get_psi_size' [-Werror=implicit-function-declaration]
> 
> I will reply to the series if/when I accept any patches from it. I would
> appreciate it if you would do the same.

I see that the revert made it to Linus. Thanks!

I've now pushed the dependent pieces to l2-mtd.git, and they should make
it to v4.6-rc1. So I guess it's fair game to re-apply this patch?
Although, if you don't merge in my MTD branch first, you'd still be
breaking bisectability... Maybe it's a post-rc1 candidate?

Brian
