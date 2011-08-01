Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
	helo=DB3EHSOBE006.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QnzHK-0001m9-Qx
	for linux-mtd@lists.infradead.org; Mon, 01 Aug 2011 20:40:00 +0000
Date: Mon, 1 Aug 2011 15:39:50 -0500
From: Scott Wood <scottwood@freescale.com>
To: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCHv3] mtd: gpio-nand: add device tree bindings
Message-ID: <20110801153950.634eb432@schlenkerla.am.freescale.net>
In-Reply-To: <20110801202536.GB2648@pulham.picochip.com>
References: <1312207374-14760-1-git-send-email-jamie@jamieiles.com>
	<20110801133825.0b4fff24@schlenkerla.am.freescale.net>
	<20110801193316.GA2648@pulham.picochip.com>
	<20110801151209.7b904320@schlenkerla.am.freescale.net>
	<20110801202536.GB2648@pulham.picochip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, devicetree-discuss@lists.ozlabs.org,
	linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 1 Aug 2011 21:25:36 +0100
Jamie Iles <jamie@jamieiles.com> wrote:

> On Mon, Aug 01, 2011 at 03:12:09PM -0500, Scott Wood wrote:
> > It looks like the code uses a little-endian accessor (readw) in a couple
> > places.  The instance in gpio_nand_readbuf16() should never be reached
> > since the NAND layer should never do an unaligned buffer read, but the one
> > in gpio_nand_verifybuf16() could cause problems.
[snip]
> 
> OK, so for this should I just document that all accesses are 
> little-endian?  We can then add properties later if we need something 
> different.

Right now, the driver is using a mix of native and little endian accesses.
That's not something the binding can fix. :-)

Native endian is what it should be.

> > Or perhaps the io sync address should just be a physical address, not a reg
> > that gets translated.
> 
> OK, I like the sound of that.  I'm a bit new to the world of device tree 
> so I'm not sure of the best way to do this.  Would reading the 
> #address-cells property then use of_read_number() be the right way?

I'd just unconditionally define it as a 64-bit physical address.

-Scott
