From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20060516102554.GL6931@stusta.de>
References: <20060515005637.00b54560.akpm@osdl.org>
	<20060516102554.GL6931@stusta.de>
Content-Type: text/plain
Date: Tue, 16 May 2006 13:13:21 +0100
Message-Id: <1147781601.27870.17.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@osdl.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: 2.6.17-rc4-mm1: no help text for MTD_NAND_CS553
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-05-16 at 12:25 +0200, Adrian Bunk wrote:
> This patch adds an MTD_NAND_CS553 option without a help text.
> 
> Please add at least a small help text.

Done; thanks.

config MTD_NAND_CS553X
	tristate "NAND support for CS5535/CS5536 (AMD Geode companion chip)"
	depends on MTD_NAND && X86_PC && PCI
	help
	  The CS553x companion chips for the AMD Geode processor
	  include NAND flash controllers with built-in hardware ECC
	  capabilities; enabling this option will allow you to use
	  these. The driver will check the MSRs to verify that the
	  controller is enabled for NAND, and currently requires that
	  the controller be in MMIO mode.

	  If you say "m", the module will be called "cs553x_nand.ko".
-- 
dwmw2
