Subject: Re: [PATCH] Extend plat_nand to support more callbacks
From: David Woodhouse <dwmw2@infradead.org>
To: Florian Fainelli <florian.fainelli@telecomint.eu>
In-Reply-To: <200803031828.36965.florian.fainelli@telecomint.eu>
References: <200803031828.36965.florian.fainelli@telecomint.eu>
Content-Type: text/plain
Date: Tue, 22 Apr 2008 20:06:58 +0100
Message-Id: <1208891218.9212.657.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-03-03 at 18:28 +0100, Florian Fainelli wrote:
> This patch extends the platform NAND driver to support
> more callbacks thus making possible to convert more
> drivers to use plat_nand.

At what point does it stop being a simple platform driver, and start
being a driver with all its own custom methods which might as well have
had its own driver?

-- 
dwmw2
