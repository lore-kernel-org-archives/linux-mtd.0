Received: from host-212-158-219-180.bulldogdsl.com ([212.158.219.180]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CAcjL-0003LR-IQ
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2004 19:10:28 -0400
Date: Fri, 24 Sep 2004 00:05:18 +0100
From: Ben Dooks <ben-mtd@fluff.org>
To: Ben Dooks <ben-mtd@fluff.org>
Message-ID: <20040923230518.GG25491@home.fluff.org>
References: <I4G9K8$32150B19D33A6F23F04032D520B4890A@libero.it>
	<20040922202907.GA25491@home.fluff.org>
	<1095923470.2925.57.camel@thomas>
	<20040923191506.GE25491@home.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20040923191506.GE25491@home.fluff.org>
Sender: Ben Dooks <ben@fluff.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, gavin@simtec.co.uk
Subject: Re: NAND detect
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 23, 2004 at 08:15:06PM +0100, Ben Dooks wrote:
> On Thu, Sep 23, 2004 at 09:11:10AM +0200, Thomas Gleixner wrote:
> > On Wed, 2004-09-22 at 22:29, Ben Dooks wrote:
> 
> I've posted the patch to a 2.6.9 kernel from my first
> effort here (the kernel has the 19th September snapshot
> applied to it first):
> 
> http://www.fluff.org/ben/mtd/nand-multi1.diff

after discussions with tglx, the patch is too invasive into
nand_base.c and has other problems.

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
