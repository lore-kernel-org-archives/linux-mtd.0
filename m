Received: from host-212-158-219-180.bulldogdsl.com ([212.158.219.180]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CCyBh-0008Ie-R4
	for linux-mtd@lists.infradead.org; Thu, 30 Sep 2004 06:29:28 -0400
Date: Thu, 30 Sep 2004 11:29:20 +0100
From: Ben Dooks <ben-mtd@fluff.org>
To: Ben Dooks <ben@mail.home.fluff.org>
Message-ID: <20040930102920.GM22627@home.fluff.org>
References: <I4SQEX$87F965B35ECF509E90791E3541F12398@libero.it>
	<20040929191307.GL22627@home.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20040929191307.GL22627@home.fluff.org>
Sender: Ben Dooks <ben@fluff.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: s3c2410 nand controller (#2)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 29, 2004 at 08:13:07PM +0100, Ben Dooks wrote:
> On Wed, Sep 29, 2004 at 11:30:33AM +0200, lp4u@inwind.it wrote:
> > Hi,
> > 
> > I've trying, but I receive an error; this is my compiling error message:
> 
> [snip]
> 
> rmk posted a fix for the first compile problem, that I think got into
> either 2.6.9-rc2-bk12 or 2.6.9-rc2-bk13, so go and get the latest release.
> 
> Secondly, you will also need to apply the following patch:
> 
> http://www.fluff.org/ben/linux-26/mtd-bast1.patch
> and ensure CONFIG_BAST_NAND is set

2.6.9-rc3 now carries the nand header, so you may see an
`previously applied patch` message from diff.

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
