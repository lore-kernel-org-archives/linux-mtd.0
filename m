Received: from mk-outboundfilter-3.mail.uk.tiscali.com ([212.74.114.23])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KMXTp-0003cI-1t
	for linux-mtd@lists.infradead.org; Sat, 26 Jul 2008 00:17:50 +0000
Subject: Re: [MFD] TMIO NAND driver
From: ian <spyro@f2s.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1217018004.17427.9.camel@wirenth>
References: <1216204824.11481.156.camel@wirenth>
	<1216259137.11481.225.camel@wirenth> <1216397385.3644.17.camel@wirenth>
	<1216994487.28941.141.camel@shinybook.infradead.org>
	<1216995092.11324.165.camel@wirenth>
	<1216995404.28941.143.camel@shinybook.infradead.org>
	<1216999137.11324.174.camel@wirenth>
	<1217010815.28941.162.camel@shinybook.infradead.org>
	<1217018004.17427.9.camel@wirenth>
Content-Type: text/plain
Date: Sat, 26 Jul 2008 01:17:37 +0100
Message-Id: <1217031457.17427.40.camel@wirenth>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-07-25 at 21:33 +0100, ian wrote:
> On Fri, 2008-07-25 at 14:33 -0400, David Woodhouse wrote:
> > > git://git.mnementh.co.uk/linux-2.6-im.git mfd_push_try_10
> > 
> > There stuff in there which wants to go separately. Do you want me to
> > cherry-pick just the NAND driver and push it through my tree?
> 
> Yes please.

Ok, theres been discussion about accessors on LAKML with regards to the
TMIO devices.

I've made an updated version of this driver using tmio specific
accessors that should allow the driver to be used more easily on other
MFDs.

Trouble is this causes a dependancy on a patch that needs to go via RMKs
tree.

Theres two ways to handle this

1) You merge the version I already gave you and I send a later patch to
convert it to the new accessors

2) We push everything via RMKs tree, all in one go.

I'd prefer 2) if theres still time and its not too much trouble. It
causes less breakage.

All it'd need is your acked-by:

Let me know what you'd prefer to do.
