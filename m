Received: from pandora.arm.linux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aO1yP-00044m-Av
 for linux-mtd@lists.infradead.org; Tue, 26 Jan 2016 11:39:51 +0000
Date: Tue, 26 Jan 2016 11:37:08 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Grant Likely <grant.likely@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/6] mtd: physmap_of: add a hook for Versatile write
 protection
Message-ID: <20160126113707.GL10826@n2100.arm.linux.org.uk>
References: <1453806725-4880-1-git-send-email-linus.walleij@linaro.org>
 <1453806725-4880-3-git-send-email-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1453806725-4880-3-git-send-email-linus.walleij@linaro.org>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 26, 2016 at 12:12:01PM +0100, Linus Walleij wrote:
> Solve this by looking for the arm,versatile-flash compatible
> string in the flash device tree node. In the driver,
> add a special hook to check for the various Versatile syscons and
> register a callback for .set_vpp() if this compatible is present.

You are aware that the "write enable" applies to all flash devices
on the board, and not just NOR flash.  What that means is if you
have drivers for the other flash devices, you need to have a way
to enable writes when _any_ driver wants write access.

So, it shouldn't be part of the flash driver at all.

-- 
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
