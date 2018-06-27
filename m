Received: from botnar.kaiser.cx ([176.28.20.183])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fY6Fo-0007Pg-40
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2018 08:56:45 +0000
Date: Wed, 27 Jun 2018 10:55:11 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <fabio.estevam@nxp.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: mxc: remove __init qualifier from
 mxcnd_probe_dt
Message-ID: <20180627085511.GA31924@botnar.kaiser.cx>
References: <1529679025-5735-1-git-send-email-martin@kaiser.cx>
 <20180626091005.08d56b2a@xps13>
 <20180626092413.703249c8@bbrezillon>
 <20180626093650.5835593b@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180626093650.5835593b@xps13>
Sender: Martin Kaiser <martin@botnar.kaiser.cx>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel & Boris,

thanks for your feedback.

Thus wrote Miquel Raynal (miquel.raynal@bootlin.com):

> Hi Boris,

> On Tue, 26 Jun 2018 09:24:13 +0200, Boris Brezillon
> <boris.brezillon@bootlin.com> wrote:

> > On Tue, 26 Jun 2018 09:10:05 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> > > Hi Martin, Boris,

> > > On Fri, 22 Jun 2018 16:50:25 +0200, Martin Kaiser <martin@kaiser.cx>
> > > wrote:

> > > > mxcnd_probe_dt is called from mxcnd_probe, which is not marked as __init.


> > > I think this line is just a side note and should be at the end of the
> > > commit log.

> > > > Using the sysfs unbind, bind nodes, mxcnd_probe and mxcnd_probe_dt can
> > > > potentially be called at any time. After the __init functions are cleaned,
> > > > mxcnd_probe_dt is no longer available. Calling it anyway causes a crash.    

> > > The above paragraph explains the problem and the solution, you can just
> > > add something like "mcvnd_probe is untouched because it is already not
> > > marked as __init" instead of the first line.


> > > > Signed-off-by: Martin Kaiser <martin@kaiser.cx>    

> > > Boris, do you think this patch is a good candidate for stable?

> > > If yes, Martin, could you please add a couple of stable/fixes tags above
> > > your SoB?  

> > We should at least have a Fixes tag. For the stable one, I'm not so
> > sure because the bug does not exist in practice (the compiler always
> > inline mxcnd_probe_dt()).

> Fine, then a Fixes tag will be enough and I will take it into
> nand/next as it is not urgent at all to have it in the main tree.

I agree that this is not a candidate for stable. I just sent an update
with a Fixes tag and rephrased commit message.

Best regards,
Martin
