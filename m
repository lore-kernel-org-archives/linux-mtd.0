Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fEiwl-0001yJ-CD
 for linux-mtd@lists.infradead.org; Fri, 04 May 2018 22:13:00 +0000
Date: Fri, 4 May 2018 15:12:31 -0700
From: Greg KH <greg@kroah.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: v4.4-stable: GPMI nand controller broken
Message-ID: <20180504221231.GB20328@kroah.com>
References: <20180504065621.hclfdfxjxnobt4e7@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180504065621.hclfdfxjxnobt4e7@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 04, 2018 at 08:56:21AM +0200, Sascha Hauer wrote:
> The following went into v4.4.120:
> 
> 197190bc5c48 mtd: nand: gpmi: Fix failure when a erased page has a bitflip at BBM
> 
> This patch was backported to far for the stable tree. It only makes sense
> (and only works) together with:
> 
> bd2e778c9ee3 gpmi-nand: Handle ECC Errors in erased pages
> 
> which first appeared in v4.7.
> 
> So either we revert 197190bc5c48 on the v4.4 stable tree or we apply the
> attached patch which is a backport of bd2e778c9ee3 for v4.4.
> 
> I don't know which solution is prefered, personally I would prefer
> applying the attached patch which is also a bugfix. Without it erased
> pages may not be handled properly.

I've now applied this bugfix, thanks!

greg k-h
