Subject: Re: [patch 2.6.22-rc3] MTD: m25p80 converted to mutex
From: David Woodhouse <dwmw2@infradead.org>
To: David Brownell <david-b@pacbell.net>
In-Reply-To: <200706241509.14367.david-b@pacbell.net>
References: <200706241509.14367.david-b@pacbell.net>
Content-Type: text/plain
Date: Thu, 28 Jun 2007 20:11:52 +0100
Message-Id: <1183057912.1170.199.camel@pmac.infradead.org>
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

On Sun, 2007-06-24 at 15:09 -0700, David Brownell wrote:
> Convert semaphore usage in m25p80 driver to mutex; mention another kind of
> SPI flash chip that should be able to use this driver (given minor tweaks).
> 
> Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
> ---
> [RESEND -- original was on 25-May, was neither merged nor acked ]

Sorry, been very busy. Your patches both fail to apply though.

-- 
dwmw2
