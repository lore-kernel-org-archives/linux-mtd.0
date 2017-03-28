Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1csoHD-0008Nc-FZ
 for linux-mtd@lists.infradead.org; Tue, 28 Mar 2017 10:23:04 +0000
Date: Tue, 28 Mar 2017 11:22:28 +0100
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: yamada.masahiro@socionext.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, marek.vasut@gmail.com,
 computersforpeace@gmail.com, thorsten.christiansson@idquantique.com,
 laurent.monat@idquantique.com, dinguyen@kernel.org,
 artem.bityutskiy@linux.intel.com, grmoore@opensource.altera.com,
 ejo@pengutronix.de, chuanxiao.dong@intel.com, mhiramat@kernel.org,
 jaswinder.singh@linaro.org, robh@kernel.org
Subject: Re: [RESEND PATCH v2 50/53] mtd: nand: allocate aligned buffers if
 NAND_OWN_BUFFERS is unset
Message-ID: <20170328102228.GX7909@n2100.armlinux.org.uk>
References: <1490228282-10805-1-git-send-email-yamada.masahiro@socionext.com>
 <1490228282-10805-24-git-send-email-yamada.masahiro@socionext.com>
 <20170327100039.480b8d8d@bbrezillon>
 <831da313d194457db7bd02fd8ea5b291@SOC-EX02V.e01.socionext.com>
 <20170328095907.76d02ce9@bbrezillon>
 <20170328100721.0918dbda@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170328100721.0918dbda@bbrezillon>
Sender: Russell King - ARM Linux <linux@armlinux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 28, 2017 at 10:07:21AM +0200, Boris Brezillon wrote:
> Hm, it seems that alignment for kmalloc SLAB caches is set to
> ARCH_KMALLOC_MINALIGN which is set to ARCH_DMA_MINALIGN by default and
> ARCH_DMA_MINALIGN is usually equal to the L1 cache line size, so I was
> wrong here.

Yes, we set kmalloc() up to always return L1 cache line aligned data,
where "L1 cache line aligned" is the _maximum_ cache line alignment
that the kernel has been built for, not the cache line alignment of
the CPU we're running on.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
