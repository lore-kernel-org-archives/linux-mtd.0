Received: from caramon.arm.linux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LxRgF-00067l-Ea
	for linux-mtd@lists.infradead.org; Fri, 24 Apr 2009 20:07:34 +0000
Date: Fri, 24 Apr 2009 20:59:28 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Catalin Marinas <catalin.marinas@arm.com>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] Add armflash support for multiple blocks of flash
Message-ID: <20090424195928.GI28748@n2100.arm.linux.org.uk>
References: <20090423164110.31264.42300.stgit@pc1117.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090423164110.31264.42300.stgit@pc1117.cambridge.arm.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 23, 2009 at 05:41:10PM +0100, Catalin Marinas wrote:
> This patch adds MTD concatenation support to integrator-flash.c for
> platforms with more than one block of flash memory (e.g. RealView
> PB11MPCore). The implementation is based on the sa1100-flash.c one.
> 
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Russell King <linux@arm.linux.org.uk>

Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>

David, please merge via the mtd tree, thanks.
