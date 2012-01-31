Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsKQ1-0005zP-5T
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 20:35:09 +0000
Received: by laam7 with SMTP id m7so303695laa.36
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 12:35:05 -0800 (PST)
Sender: Grant Likely <glikely@secretlab.ca>
Date: Tue, 31 Jan 2012 13:34:55 -0700
From: Grant Likely <grant.likely@secretlab.ca>
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH 1/3] platform: add common resource requesting and mapping
 helper
Message-ID: <20120131203455.GG22611@ponder.secretlab.ca>
References: <1328004002-24646-1-git-send-email-Barry.Song@csr.com>
 <1328004002-24646-2-git-send-email-Barry.Song@csr.com>
 <20120131101734.GE2471@pengutronix.de>
 <CAGsJ_4wyJ6Wymy4AWoW1eHubZX=W7GT_Fbow9ofXoY1RrcHzgA@mail.gmail.com>
 <20120131113358.GM2471@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120131113358.GM2471@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@suse.de>, Barry Song <21cnbao@gmail.com>,
 linux-kernel@vger.kernel.org, workgroup.linux@csr.com,
 linux-mtd@lists.infradead.org, Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
 Barry Song <Baohua.Song@csr.com>, David Woodhouse <dwmw2@infradead.org>,
 Erik Gilling <konkers@google.com>, Barry Song <Barry.Song@csr.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 31, 2012 at 12:33:58PM +0100, Wolfram Sang wrote:
> Barry,
> 
> > > You don't need to do the error checking for 'res'. You can simply do
> > >
> > > res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > base = devm_request_and_ioremap(&dev->dev, res);
> > 
> > i do know  devm_request_and_ioremap() does res checking. but that is
> > implicit, confused and not a smart way actually.
> 
> I agree about the implicit thing (keep in mind the function is new). But
> calling a function "not smart" because it checks its arguments? I do
> like the NULL check of kfree() for example.
> 
> > actually, no people by now really use the implicit checking. that
> > shows people don't really think that is a good programming way.
> 
> I'd think most people just copy&paste and don't have an opinion either
> way, so the quantity doesn't show much.
> 
> > > devm_request_and_ioremap() will check res. Given that, I don't think
> > > we can save a lot with another wrapper.
> > 
> > i think we can save some.
> > The story begins from Grant's feedback in:
> > http://www.spinics.net/lists/arm-kernel/msg157644.html
> 
> I am not sure using 'platform_devm_request_and_ioremap' and later using
> plain 'devm_*' functions (without platform_-prefix) is less confusing.
> The alternative would be to check which helper functions also use
> 'struct resource' and if they do checks on that. If all do that, you
> would have the simple rule, that you only need to check yourself if you
> access it yourself.

The reason I suggested the wrapper is that then the driver code doesn't need
to fart around with the res pointer at all.  It reduces boilerplate in platform
drivers which I think is a good thing.

g.
