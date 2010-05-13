Received: from mho-02-ewr.mailhop.org ([204.13.248.72])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OCaaL-00042Y-Mz
	for linux-mtd@lists.infradead.org; Thu, 13 May 2010 15:44:30 +0000
Date: Thu, 13 May 2010 08:44:23 -0700
From: Tony Lindgren <tony@atomide.com>
To: Sukumar Ghorai <s-ghorai@ti.com>
Subject: Re: [PATCH 0/3] omap3 nand: cleanup exiting platform related code
Message-ID: <20100513154423.GK29368@atomide.com>
References: <s-ghorai@ti.com>
	<1273657718-12517-1-git-send-email-s-ghorai@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1273657718-12517-1-git-send-email-s-ghorai@ti.com>
Cc: sakoman@gmail.com, Artem.Bityutskiy@nokia.com, linux-omap@vger.kernel.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Sukumar Ghorai <s-ghorai@ti.com> [100512 02:43]:
>    The following set of patches applies on top of master branch.
> 	http://git.kernel.org/?p=linux/kernel/git/tmlind/linux-omap-2.6.git
>    Patches verified on: omap3430-SDP, omap3630-sdp, zoom3 and beagle board
> 
>    And these are the patches required to address the following input -
>      1. The NAND driver needs to stop tinkering with the GPMC registers
> 	The omap General Purpose Memory Controller (GPMC) registers are omap
>         specific, and not driver specific. Tinkering with these registers can
>         cause issues with the other devices on the GPMC.
> 
>      2. Passing hardcoded GPMC_CS0_BASE needs to go from the board files
> 	Passing hardcoded GPMC virtual addressess is sure way to mess up things.
>         This should all become unnecessary once the NAND drivers stops messing
>         with the GPMC registers directly.

Thanks for working on this. I've made some comments to you patches
to do what's listed above.

Instead of exporting the GPMC registers, you should create new
functions into gpmc.c for the nand platform init code to use.

Regards,

Tony
