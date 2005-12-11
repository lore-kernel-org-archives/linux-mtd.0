Received: from emailhub.stusta.mhn.de ([141.84.69.5]
	helo=mailout.stusta.mhn.de)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ElWvq-0001WY-S8
	for linux-mtd@lists.infradead.org; Sun, 11 Dec 2005 14:32:28 -0500
Resent-Message-ID: <20051211193226.GS23349@stusta.de>
Date: Sun, 11 Dec 2005 20:31:18 +0100
From: Adrian Bunk <bunk@stusta.de>
To: linux-kernel@vger.kernel.org, tony.luck@intel.com,
	linux-ia64@vger.kernel.org, matthew@wil.cx,
	grundler@parisc-linux.org, parisc-linux@parisc-linux.org,
	paulus@samba.org, linuxppc-dev@ozlabs.org, lethal@linux-sh.org,
	kkojima@rr.iij4u.or.jp, dwmw2@infradead.org
Message-ID: <20051211193118.GR23349@stusta.de>
References: <20051211185212.GQ23349@stusta.de>
	<20051211192109.GA22537@flint.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20051211192109.GA22537@flint.arm.linux.org.uk>
Cc: linux-mtd@lists.infradead.xn--org-boa
Subject: Re: [2.6 patch] defconfig's shouldn't set CONFIG_BROKEN=y
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 11, 2005 at 07:21:10PM +0000, Russell King wrote:
> On Sun, Dec 11, 2005 at 07:52:12PM +0100, Adrian Bunk wrote:
> > defconfig's shouldn't set CONFIG_BROKEN=y.
> 
> NACK.  This changes other configuration options in addition, for example
> in collie_defconfig:
> 
> -CONFIG_MTD_OBSOLETE_CHIPS=y
> -# CONFIG_MTD_AMDSTD is not set
> -CONFIG_MTD_SHARP=y
> -# CONFIG_MTD_JEDEC is not set

That's not a problem introduced by my patch.

Either the depency of MTD_OBSOLETE_CHIPS on BROKEN is correct (in which 
case CONFIG_MTD_OBSOLETE_CHIPS=y wouldn't bring you anything), or the 
dependency on BROKEN is not correct and should be corrected.

David, can you comment on this issue?

> Russell King

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
