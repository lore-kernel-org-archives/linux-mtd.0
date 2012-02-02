Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RskFc-0004wp-L4
 for linux-mtd@lists.infradead.org; Thu, 02 Feb 2012 00:10:09 +0000
Received: by dakp5 with SMTP id p5so1630687dak.36
 for <linux-mtd@lists.infradead.org>; Wed, 01 Feb 2012 16:10:06 -0800 (PST)
Sender: Grant Likely <glikely@secretlab.ca>
Date: Wed, 1 Feb 2012 17:10:05 -0700
From: Grant Likely <grant.likely@secretlab.ca>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/3] platform: add common resource requesting and mapping
 helper
Message-ID: <20120202001005.GB15343@ponder.secretlab.ca>
References: <1328004002-24646-1-git-send-email-Barry.Song@csr.com>
 <1328004002-24646-2-git-send-email-Barry.Song@csr.com>
 <20120131101734.GE2471@pengutronix.de>
 <CAGsJ_4wyJ6Wymy4AWoW1eHubZX=W7GT_Fbow9ofXoY1RrcHzgA@mail.gmail.com>
 <20120131113358.GM2471@pengutronix.de>
 <20120131203455.GG22611@ponder.secretlab.ca>
 <20120131211554.GA28105@pengutronix.de>
 <CAGsJ_4yJZYHUzr9YerdM5o8grGd6iP51ra4nJkMuOo5Khn95RQ@mail.gmail.com>
 <20120201125642.GC13723@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120201125642.GC13723@sirena.org.uk>
Cc: Erik Gilling <konkers@google.com>, Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@suse.de>, Barry Song <21cnbao@gmail.com>,
 Wolfram Sang <w.sang@pengutronix.de>, workgroup.linux@csr.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Barry Song <Baohua.Song@csr.com>, David Woodhouse <dwmw2@infradead.org>,
 Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Barry Song <Barry.Song@csr.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 01, 2012 at 12:56:42PM +0000, Mark Brown wrote:
> On Wed, Feb 01, 2012 at 10:11:10AM +0800, Barry Song wrote:
> 
> > i think it makes sense for us to have platform_devm_request_irq() and
> > similar things. i'll take care.
> 
> Note that this one is more tricky than most as it's really important
> that the interrupt handler can't be called when the data it needs and so
> on have been freed.  With things like memory this really doesn't matter
> and you can happily free in any order.

Good point.

g.
