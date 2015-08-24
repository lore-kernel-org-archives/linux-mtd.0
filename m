Received: from pandora.arm.linux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZTrEb-0004vt-IG
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2015 12:52:22 +0000
Date: Mon, 24 Aug 2015 13:49:24 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Marek Vasut <marex@denx.de>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>, mark.rutland@arm.com,
 devicetree@vger.kernel.org, pawel.moll@arm.com,
 ijc+devicetree@hellion.org.uk, ben@decadent.org.uk,
 zajec5@gmail.com, nicolas.ferre@atmel.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-spi@vger.kernel.org, juhosg@openwrt.org, broonie@kernel.org,
 linux-mtd@lists.infradead.org, galak@codeaurora.org,
 shijie.huang@intel.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Subject: Re: [PATCH linux-next v4 5/5] mtd: atmel-quadspi: add driver for
 Atmel QSPI controller
Message-ID: <20150824124924.GZ7557@n2100.arm.linux.org.uk>
References: <cover.1440410236.git.cyrille.pitchen@atmel.com>
 <bf368fc101f38db231131b69eff0863210f2b01c.1440410236.git.cyrille.pitchen@atmel.com>
 <201508241303.52066.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201508241303.52066.marex@denx.de>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 24, 2015 at 01:03:51PM +0200, Marek Vasut wrote:
> These are functions, not macros :)
> 
> btw is there any reason for these ? I'd say, just put the read*() and
> write*() functions directly into the code and be done with it, it is
> much less confusing.
> 
> Also, why do you use the _relaxed() versions of the functions ?

Now that the _relaxed() accessors are available throughout the kernel,
everyone should be using the _relaxed() versions unless they need the
properties of the non-relaxed versions.  Remember that the non-relaxed
versions are rather expensive on ARM due to the need to go all the way
out to the L2 cache - it at least doubles the number of accesses for
every read*/write*().

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
