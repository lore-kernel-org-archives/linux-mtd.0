Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HPJtx-0005tD-Ra
	for linux-mtd@lists.infradead.org; Thu, 08 Mar 2007 09:47:31 -0500
Date: Thu, 8 Mar 2007 15:43:52 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Subject: Re: JFFS2 as transactional FS (in other words: how to be sure that
	data have been writtent correctly from userspace)
Message-ID: <20070308144350.GF23216@lazybastard.org>
References: <45EFDC0D.4090409@dave-tech.it>
	<1173351098.3461.414.camel@pmac.infradead.org>
	<20070308125416.GB23216@lazybastard.org>
	<1173359044.3461.433.camel@pmac.infradead.org>
	<20070308131257.GD23216@lazybastard.org>
	<1173360167.3461.438.camel@pmac.infradead.org>
	<1173361473.4861.12.camel@zod.rchland.ibm.com>
	<1173362305.3461.447.camel@pmac.infradead.org>
	<1173364518.4861.14.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1173364518.4861.14.camel@zod.rchland.ibm.com>
Cc: R&D4 <r&d4@dave-tech.it>, David Woodhouse <dwmw2@infradead.org>,
	mtd_mailinglist <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 8 March 2007 08:35:17 -0600, Josh Boyer wrote:
> On Thu, 2007-03-08 at 13:58 +0000, David Woodhouse wrote:
> > On Thu, 2007-03-08 at 07:44 -0600, Josh Boyer wrote:
> > > Wait... why?  Rejecting mount -o sync seems sane, but why can't O_SYNC
> > > support be handled?  If users want to open their files like that and it
> > > causes JFFS2 to flush a bunch of padding out, well they asked for it. 
> > 
> > Users ask for shared writable mmap too. That isn't a good idea either.
> > 
> > Contemplate what Linus always says about using 'volatile' vs. proper
> > barriers. Now consider it for O_SYNC vs. fsync(). And factor in the fact
> > that O_SYNC is going to be massively suboptimal if it causes syncs when
> > they otherwise didn't need to happen.
> 
> Ok, good point.  You've convinced me.

I can imagine cases when O_SYNC makes sense.  Logfiles, basically.
When debugging it is useful to have as much information in them as
possible, especially right before the crash.  O_SYNC is a useful
relaxation here on system where fsync() is identical to sync() - O_SYNC
will not flush every other file in the system.

Whether any applications actually do this is anyone's guess, though.

Jörn

-- 
Write programs that do one thing and do it well. Write programs to work
together. Write programs to handle text streams, because that is a
universal interface.
-- Doug MacIlroy
