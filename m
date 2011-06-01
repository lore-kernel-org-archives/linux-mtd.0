Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRgR1-0001nA-V6
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 08:05:49 +0000
Date: Wed, 1 Jun 2011 09:05:13 +0100
From: Russell King <rmk@arm.linux.org.uk>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH -next] mtd: fix physmap.h warnings
Message-ID: <20110601080513.GA21186@flint.arm.linux.org.uk>
References: <20110523154518.5e27cfb0.sfr@canb.auug.org.au>
	<20110523113709.4357b4ba.randy.dunlap@oracle.com>
	<1306216431.2785.46.camel@localhost>
	<1306216683.2785.47.camel@localhost>
	<20110524074020.GA9490@flint.arm.linux.org.uk>
	<1306222943.2785.55.camel@localhost>
	<1306914354.4405.49.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1306914354.4405.49.camel@localhost>
Sender: Russell King <rmk@arm.linux.org.uk>
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Marc Zyngier <Marc.Zyngier@arm.com>,
	LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 01, 2011 at 10:45:54AM +0300, Artem Bityutskiy wrote:
> On Tue, 2011-05-24 at 10:42 +0300, Artem Bityutskiy wrote:
> > From: Randy Dunlap <randy.dunlap@oracle.com>
> > Subject: [PATCH] mtd: fix physmap.h warnings
> > 
> > Fix build warnings in physmap.h:
> > 
> > include/linux/mtd/physmap.h:25: warning: 'struct platform_device' declared inside parameter list
> > include/linux/mtd/physmap.h:25: warning: its scope is only this definition or declaration, which is probably not what you want
> > include/linux/mtd/physmap.h:26: warning: 'struct platform_device' declared inside parameter list
> > include/linux/mtd/physmap.h:27: warning: 'struct platform_device' declared inside parameter list
> > 
> > Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> > Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> 
> David, it looks like Russel did not merge this patch and people
                            ^^
> complain. Could you please merge it?

Bah, it got lost in the depths of my mailboxes and forgotten...

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
