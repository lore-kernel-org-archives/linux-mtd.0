Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FtB69-0005ET-3u
	for linux-mtd@lists.infradead.org; Wed, 21 Jun 2006 23:22:58 +0100
Subject: Re: [2.6 patch] drivers/mtd/devices/: remove dead _ecc code
From: Thomas Gleixner <tglx@linutronix.de>
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20060621215840.GP9111@stusta.de>
References: <20060621215840.GP9111@stusta.de>
Content-Type: text/plain
Date: Thu, 22 Jun 2006 00:24:24 +0200
Message-Id: <1150928664.25491.34.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-06-21 at 23:58 +0200, Adrian Bunk wrote:
> This patch removes some code that is dead code after the
> "Remove read/write _ecc variants" patch that went into Linus' tree.

Holy cow, are you even remotly knowing what you are doing ? 

Removing the xxx_ecc function pointers from the mtd structs does not
remove the fundamental requirement of ECC for NAND FLASH.

I'm just waiting for the follow up patches which remove nand_ecc and the
reed solomon library.

When you're done with those, please remove NAND support entirely.

> Signed-off-by: Adrian Bunk <bunk@stusta.de>

Debunked-by: Thomas Gleixner <tglx@linutronix.de>
