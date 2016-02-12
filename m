Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aUImW-0004C5-7z
 for linux-mtd@lists.infradead.org; Fri, 12 Feb 2016 18:49:28 +0000
Received: by mail-pa0-x244.google.com with SMTP id fl4so4124961pad.2
 for <linux-mtd@lists.infradead.org>; Fri, 12 Feb 2016 10:49:08 -0800 (PST)
Date: Fri, 12 Feb 2016 10:49:05 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Simon Arlott <simon@fire.lp0.eu>
Cc: Ralf Baechle <ralf@linux-mips.org>, David Woodhouse <dwmw2@infradead.org>,
 Kevin Cernekee <cernekee@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Jonas Gorski <jogo@openwrt.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MIPS Mailing List <linux-mips@linux-mips.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH linux-next v4 06/11] mtd: bcm63xxpart: Remove dependency
 on mach-bcm63xx
Message-ID: <20160212184905.GQ19540@google.com>
References: <566DF43B.5010400@simon.arlott.org.uk>
 <566DF5F6.6070901@simon.arlott.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <566DF5F6.6070901@simon.arlott.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 13, 2015 at 10:49:26PM +0000, Simon Arlott wrote:
> Read nvram directly from flash instead of using the in-memory copy that
> mach-bcm63xx has, to remove the dependency on mach-bcm63xx and allow the
> parser to work on bmips too.
> 
> Rename remaining BCM63XX defines to BCM963XX as these are properties of
> the flash layout on the board.
> 
> BCM963XX_DEFAULT_PSI_SIZE changes from SZ_64K to 64 because it will be
> multiplied by SZ_1K later on.
> 
> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
> ---
> v4: New patch.

Pushed patches 6, 8, 9, and 10 to l2-mtd.git. I had comments on patch
11.

Thanks,
Brian
