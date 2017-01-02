Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cO3L2-00087r-CY
 for linux-mtd@lists.infradead.org; Mon, 02 Jan 2017 14:11:51 +0000
Date: Mon, 2 Jan 2017 14:10:59 +0000
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, nicolas.pitre@linaro.org,
 panand@redhat.com, chris.brandt@renesas.com, arnd@arndb.de,
 jonathan.austin@arm.com, pawel.moll@arm.com,
 vladimir.murzin@arm.com, mark.rutland@arm.com,
 ard.biesheuvel@linaro.org, keescook@chromium.org,
 matt@codeblueprint.co.uk, labbott@fedoraproject.org,
 kirill.shutemov@linux.intel.com, ben@decadent.org.uk,
 js07.lee@samsung.com, stefan@agner.ch, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, cyrille.pitchen@atmel.com,
 richard@nod.at, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Subject: Re: [PATCH v4 0/4] ARM: Add support for CONFIG_DEBUG_VIRTUAL
Message-ID: <20170102141058.GG14217@n2100.armlinux.org.uk>
References: <20161209233628.6642-1-f.fainelli@gmail.com>
 <20161226203842.19457-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161226203842.19457-1-f.fainelli@gmail.com>
Sender: Russell King - ARM Linux <linux@armlinux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 26, 2016 at 12:38:38PM -0800, Florian Fainelli wrote:
> Hi all,
> 
> This patch series builds on top of Laura's [PATCHv5 00/10] CONFIG_DEBUG_VIRTUAL
> for arm64 to add support for CONFIG_DEBUG_VIRTUAL for ARM.
> 
> This was tested on a Brahma B15 platform (ARMv7 + HIGHMEM + LPAE).
> 
> Note that the treewide changes would involve a huge CC list, which
> is why it has been purposely trimmed to just focusing on the DEBUG_VIRTUAL
> aspect.

Nothing stands out from a quick read-through of these patches, so for the
core ARM and SA11x0 bits:

Acked-by: Russell King <rmk+kernel@armlinux.org.uk>

Thanks.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
