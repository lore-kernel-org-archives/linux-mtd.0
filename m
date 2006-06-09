Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FoVIy-0006CH-NT
	for linux-mtd@lists.infradead.org; Thu, 08 Jun 2006 20:57:02 -0400
Received: from xanadu.home ([74.56.108.184]) by VL-MO-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0J0K00DJ2IMNNM10@VL-MO-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 08 Jun 2006 20:56:47 -0400 (EDT)
Date: Thu, 08 Jun 2006 20:56:47 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
Subject: Re: pxa2xx-flash again, please?
In-reply-to: <1149812317.18635.53.camel@shinybook.infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Message-id: <Pine.LNX.4.64.0606082054180.19403@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <Pine.LNX.4.63.0606080916491.1760@pcgl.dsa-ac.de>
	<20060608073632.GA12338@wohnheim.fh-wedel.de>
	<Pine.LNX.4.63.0606080955050.1760@pcgl.dsa-ac.de>
	<20060608115208.GA4155@wohnheim.fh-wedel.de>
	<Pine.LNX.4.63.0606081356100.1760@pcgl.dsa-ac.de>
	<44887D8C.2040806@gmail.com>
	<20060609001606.GC26509@xi.wantstofly.org>
	<1149812317.18635.53.camel@shinybook.infradead.org>
Cc: tpoynor@infradead.org, Todd Poynor <toddpoynor@gmail.com>,
	linux-mtd@lists.infradead.org, Lennert Buytenhek <buytenh@wantstofly.org>,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 9 Jun 2006, David Woodhouse wrote:

> On Fri, 2006-06-09 at 02:16 +0200, Lennert Buytenhek wrote:
> > I'd also like to see the unified pxa2xx flash mapping driver go in, so
> > that it can be used by the LogicPD PXA270 board support code (merged
> > in 2.6.17) too, instead of making Yet Another copy of
> > mainstone-flash.c.
> 
> Can't we use platform_devices and physmap for all of it?

We probably could if it wasn't for the cached mapping.


Nicolas
