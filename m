Received: from emailhub.stusta.mhn.de ([141.84.69.5]
	helo=mailout.stusta.mhn.de)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FvDLu-0007Av-VY
	for linux-mtd@lists.infradead.org; Tue, 27 Jun 2006 09:12:07 -0400
Date: Tue, 27 Jun 2006 15:11:16 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [2.6 patch] drivers/mtd/devices/: remove dead _ecc code
Message-ID: <20060627131116.GL23314@stusta.de>
References: <20060621215840.GP9111@stusta.de>
	<1150928664.25491.34.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1150928664.25491.34.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 22, 2006 at 12:24:24AM +0200, Thomas Gleixner wrote:
> On Wed, 2006-06-21 at 23:58 +0200, Adrian Bunk wrote:
> > This patch removes some code that is dead code after the
> > "Remove read/write _ecc variants" patch that went into Linus' tree.
> 
> Holy cow, are you even remotly knowing what you are doing ? 
> 
> Removing the xxx_ecc function pointers from the mtd structs does not
> remove the fundamental requirement of ECC for NAND FLASH.
> 
> I'm just waiting for the follow up patches which remove nand_ecc and the
> reed solomon library.
>...

nand_ecc isn't dead code.

But if I do understand correctly, you have pending patches to let the 
code your patch made dead code and my patch would have removed be used 
again?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
