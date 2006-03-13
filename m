Received: from cassiel.sirena.org.uk ([80.68.93.111])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FIsAh-0000Wt-D3
	for linux-mtd@lists.infradead.org; Mon, 13 Mar 2006 13:53:39 -0500
Date: Mon, 13 Mar 2006 18:47:30 +0000
From: Mark Brown <broonie@sirena.org.uk>
To: J?rn Engel <joern@wohnheim.fh-wedel.de>
Message-ID: <20060313184729.GB19014@sirena.org.uk>
References: <20060212170441.GA28427@xi.wantstofly.org>
	<20060228191642.GB19811@xi.wantstofly.org>
	<20060312221248.GA7525@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20060312221248.GA7525@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org, Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: [less intrusive PATCH, RFC] don't load physmap if length is zero
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Mar 12, 2006 at 11:12:48PM +0100, J?rn Engel wrote:
> On Tue, 28 February 2006 20:16:42 +0100, Lennert Buytenhek wrote:

> > I'd still prefer the platform driver patch to be applied, but having
> > some kind of solution merged is better than no solution at all :-)

> Is there a good reason why you didn't just write your own mapping
> driver?  Most people copy physmap.c, change a few things and use that
> driver instead of physmap.c.  It does involve many copies of
> essentially the same code, but that code is very simple and no sane
> kernel should have more than one mapping driver included, so no object
> code is duplicated.

It is reasonable to have multiple board variants with differing flash
setups but still want them all to run the same kernel.  If you're using
platform devices to tell the world about the rest of the differing fit
information it's reasonable to also want to use it for the flash.

-- 
"You grabbed my hand and we fell into it, like a daydream - or a fever."
