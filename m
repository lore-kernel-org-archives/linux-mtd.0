Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CYoJB-0000sm-E0
	for linux-mtd@lists.infradead.org; Mon, 29 Nov 2004 11:23:26 -0500
Date: Mon, 29 Nov 2004 17:23:10 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Josh Boyer <jdub@us.ibm.com>
Message-ID: <20041129162310.GB26164@wohnheim.fh-wedel.de>
References: <200411291024906.SM01112@ACarlisle>
	<1101742712.23997.2.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1101742712.23997.2.camel@weaponx.rchland.ibm.com>
Cc: Andrew Carlisle <ACarlisle@acmepacket.com>, linux-mtd@lists.infradead.org
Subject: Re: Multiple banks of flash?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 29 November 2004 09:38:32 -0600, Josh Boyer wrote:
> On Mon, 2004-11-29 at 09:15, Andrew Carlisle wrote:
> > I have two banks of flash that are physically located at different
> > locations.  I have successfully mapped one bank.  I can also map the other
> > bank, but the problem is that I can't map both the banks simultaneously.
> > 
> > I went into physmap.c and modified init_physmap() so that it basically does
> > the same thing twice, two probes, two partition searches, but it doesn't
> > seem to work mapping two banks which are located at different address mapped
> > in at the same time.
> > 
> > I am using the Monta Vista 2.6 version of the kernel.
> 
> Joern Engel wrote a mphysmap driver some time ago.  It works fairly
> well.  You might be able to find it if you google for it.  Not sure why
> it wasn't included in MTD CVS.

Iirc it was included, but in some branch that noone ever noticed or
cared about.  Should have gotten some testing, never did, nothing
happened.  Nothing unusual.

Jörn

-- 
Don't patch bad code, rewrite it.
-- Kernigham and Pike, according to Rusty
