Received: from smtp109.sbc.mail.mud.yahoo.com ([68.142.198.208])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I40IM-0004WF-Ao
	for linux-mtd@lists.infradead.org; Thu, 28 Jun 2007 16:08:56 -0400
From: David Brownell <david-b@pacbell.net>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [patch 2.6.22-rc3] MTD: m25p80 converted to mutex
Date: Thu, 28 Jun 2007 13:08:45 -0700
References: <200706241509.14367.david-b@pacbell.net>
	<1183057912.1170.199.camel@pmac.infradead.org>
In-Reply-To: <1183057912.1170.199.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200706281308.46022.david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 28 June 2007, David Woodhouse wrote:
> On Sun, 2007-06-24 at 15:09 -0700, David Brownell wrote:
> > Convert semaphore usage in m25p80 driver to mutex; mention another kind of
> > SPI flash chip that should be able to use this driver (given minor tweaks).
> > 
> > Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
> > ---
> > [RESEND -- original was on 25-May, was neither merged nor acked ]
> 
> Sorry, been very busy. Your patches both fail to apply though.

They applied just fine against 2.6.22-rc6 ... did you apply them
in the correct order?

- Dave
