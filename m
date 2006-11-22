Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GmqNV-0006TD-BZ
	for linux-mtd@lists.infradead.org; Wed, 22 Nov 2006 06:35:01 -0500
Date: Wed, 22 Nov 2006 12:34:51 +0100
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: Guennadi Liakhovetski <gl@dsa-ac.de>
Subject: Re: pxa2xx-flash again, please?
Message-ID: <20061122113451.GA13039@xi.wantstofly.org>
References: <Pine.LNX.4.63.0606080916491.1760@pcgl.dsa-ac.de>
	<20060608073632.GA12338@wohnheim.fh-wedel.de>
	<Pine.LNX.4.63.0606080955050.1760@pcgl.dsa-ac.de>
	<20060608115208.GA4155@wohnheim.fh-wedel.de>
	<Pine.LNX.4.63.0606081356100.1760@pcgl.dsa-ac.de>
	<44887D8C.2040806@gmail.com>
	<20060609001606.GC26509@xi.wantstofly.org>
	<Pine.LNX.4.63.0611210851420.1891@pcgl.dsa-ac.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.63.0611210851420.1891@pcgl.dsa-ac.de>
Cc: tpoynor@infradead.org, Todd Poynor <toddpoynor@gmail.com>,
	linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	=?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 21, 2006 at 08:52:46AM +0100, Guennadi Liakhovetski wrote:

> >I'd also like to see the unified pxa2xx flash mapping driver go in, so
> >that it can be used by the LogicPD PXA270 board support code (merged in
> >2.6.17) too, instead of making Yet Another copy of mainstone-flash.c.
> 
> This patch is still not upstream, as far as I can see. Can we please push 
> it up?

We should probably just use physmap instead.  The only thing that
physmap lacks, compared to mainstone-flash (as far as I can see), is
->cached support, but that should be easy enough to add.
