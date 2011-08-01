Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=TX2EHSOBE001.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QnzKg-0001qT-Cb
	for linux-mtd@lists.infradead.org; Mon, 01 Aug 2011 20:43:27 +0000
Date: Mon, 1 Aug 2011 15:43:21 -0500
From: Scott Wood <scottwood@freescale.com>
To: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCHv3] mtd: gpio-nand: add device tree bindings
Message-ID: <20110801154321.42be1a4b@schlenkerla.am.freescale.net>
In-Reply-To: <20110801153950.634eb432@schlenkerla.am.freescale.net>
References: <1312207374-14760-1-git-send-email-jamie@jamieiles.com>
	<20110801133825.0b4fff24@schlenkerla.am.freescale.net>
	<20110801193316.GA2648@pulham.picochip.com>
	<20110801151209.7b904320@schlenkerla.am.freescale.net>
	<20110801202536.GB2648@pulham.picochip.com>
	<20110801153950.634eb432@schlenkerla.am.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: Jamie Iles <jamie@jamieiles.com>, devicetree-discuss@lists.ozlabs.org,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 1 Aug 2011 15:39:50 -0500
Scott Wood <scottwood@freescale.com> wrote:

> On Mon, 1 Aug 2011 21:25:36 +0100
> Jamie Iles <jamie@jamieiles.com> wrote:
> 
> > On Mon, Aug 01, 2011 at 03:12:09PM -0500, Scott Wood wrote:
> > > Or perhaps the io sync address should just be a physical address, not a reg
> > > that gets translated.
> > 
> > OK, I like the sound of that.  I'm a bit new to the world of device tree 
> > so I'm not sure of the best way to do this.  Would reading the 
> > #address-cells property then use of_read_number() be the right way?
> 
> I'd just unconditionally define it as a 64-bit physical address.

To be clear, it should go in its own property, not be associated with "reg"
at all.

-Scott
