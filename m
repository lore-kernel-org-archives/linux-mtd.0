Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sjlg6-0000Cx-Tt
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 06:24:40 +0000
Date: Wed, 27 Jun 2012 08:24:23 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd gpmi-nand: Fix read page when reading to vmalloced
 area
Message-ID: <20120627062423.GD24458@pengutronix.de>
References: <1340724377-22279-1-git-send-email-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1340724377-22279-1-git-send-email-s.hauer@pengutronix.de>
Cc: Subodh Nijsure <snijsure@grid-net.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, stable@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, kernel@pengutronix.de,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 26, 2012 at 05:26:16PM +0200, Sascha Hauer wrote:
> The gpmi-nand driver uses virt_addr_valid() to check whether a buffer
> is suitable for dma. If it's not, a driver allocated buffer is used
> instead. Then after a page read the driver allocated buffer must be
> copied to the user supplied buffer. This does not happen since:
> 
> commit 7725cc85932bd02dd12c23108e0ef748c551ccba
> Author: Brian Norris <computersforpeace@gmail.com>
> Date:   Wed May 2 10:15:02 2012 -0700
> 
>     mtd: gpmi-nand: utilize oob_requested parameter
> 
>     Don't read OOB if the caller didn't request it.
> 
>     Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>     Acked-by: Huang Shijie <b32955@freescale.com>
>     Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>     Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
> 
> This patch fixes this. The bug is encountered with UBI which uses a vmalloced
> buffer for the volume table.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: stable@vger.kernel.org

Sorry, please remove the stable tag, this bug was introduced in the last
merge window.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
