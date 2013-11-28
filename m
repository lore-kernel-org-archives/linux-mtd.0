Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vm6tQ-0001Ds-29
 for linux-mtd@lists.infradead.org; Thu, 28 Nov 2013 19:04:52 +0000
Date: Thu, 28 Nov 2013 11:05:20 -0800
From: Greg KH <greg@kroah.com>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Subject: Re: [PATCH] mxc_nand: remove redundant stat counting
Message-ID: <20131128190520.GA2194@kroah.com>
References: <1385651080-15562-1-git-send-email-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1385651080-15562-1-git-send-email-m.grzeschik@pengutronix.de>
Cc: artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 28, 2013 at 04:04:40PM +0100, Michael Grzeschik wrote:
> The stats count variable will already be incremented
> in the above framework-layer just after this callback.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/mtd/nand/mxc_nand.c | 1 -
>  1 file changed, 1 deletion(-)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read Documentation/stable_kernel_rules.txt
for how to do this properly.

</formletter>
