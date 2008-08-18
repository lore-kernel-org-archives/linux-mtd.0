Received: from mho-01-bos.mailhop.org ([63.208.196.178])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KV43J-0008Qp-JW
	for linux-mtd@lists.infradead.org; Mon, 18 Aug 2008 12:41:41 +0000
Date: Mon, 18 Aug 2008 15:41:36 +0300
From: Tony Lindgren <tony@atomide.com>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH] [MTD] OneNAND OMAP3: add delay for GPIO
Message-ID: <20080818124135.GF17827@atomide.com>
References: <48A4103C.9090603@nokia.com> <20080818123319.GD17827@atomide.com>
	<1219063003.18027.5.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1219063003.18027.5.camel@sauron>
Cc: linux-omap@vger.kernel.org,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <ext-adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Artem Bityutskiy <dedekind@infradead.org> [080818 15:38]:
> 
> On Mon, 2008-08-18 at 15:33 +0300, Tony Lindgren wrote:
> > * Adrian Hunter <ext-adrian.hunter@nokia.com> [080814 14:21]:
> > > On OMAP3, the driver was occasionally not seeing the GPIO
> > > interrupt.  Adding a small delay of one register read
> > > eliminates the problem.
> > 
> > Pushing to linux-omap tree.
> 
> Note, dwmw2 pushed this to mtd tree already:
> 
> http://git.infradead.org/mtd-2.6.git?a=commit;h=782b7a367d81da005d93b28cb00f9ae086773c24

OK good, I'll be using whatever drops down from mainline for MTD files.

So just pushing the fix to linux-omap to wait for it to drop down from
mainline.

Regards,

Tony
