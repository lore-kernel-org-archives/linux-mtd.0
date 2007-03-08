Received: from e1.ny.us.ibm.com ([32.97.182.141])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HPJkD-0005bS-2Q
	for linux-mtd@lists.infradead.org; Thu, 08 Mar 2007 09:37:28 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e1.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id l28EbICe031210
	for <linux-mtd@lists.infradead.org>; Thu, 8 Mar 2007 09:37:18 -0500
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l28Ea2nW314854
	for <linux-mtd@lists.infradead.org>; Thu, 8 Mar 2007 09:36:02 -0500
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l28Ea1nq030094
	for <linux-mtd@lists.infradead.org>; Thu, 8 Mar 2007 09:36:02 -0500
Subject: Re: JFFS2 as transactional FS (in other words: how to be sure that
	data have been writtent correctly from userspace)
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1173362305.3461.447.camel@pmac.infradead.org>
References: <45EFDC0D.4090409@dave-tech.it>
	<1173351098.3461.414.camel@pmac.infradead.org>
	<20070308125416.GB23216@lazybastard.org>
	<1173359044.3461.433.camel@pmac.infradead.org>
	<20070308131257.GD23216@lazybastard.org>
	<1173360167.3461.438.camel@pmac.infradead.org>
	<1173361473.4861.12.camel@zod.rchland.ibm.com>
	<1173362305.3461.447.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Thu, 08 Mar 2007 08:35:17 -0600
Message-Id: <1173364518.4861.14.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: R&D4 <r&d4@dave-tech.it>,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>,
	mtd_mailinglist <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-03-08 at 13:58 +0000, David Woodhouse wrote:
> On Thu, 2007-03-08 at 07:44 -0600, Josh Boyer wrote:
> > Wait... why?  Rejecting mount -o sync seems sane, but why can't O_SYNC
> > support be handled?  If users want to open their files like that and it
> > causes JFFS2 to flush a bunch of padding out, well they asked for it. 
> 
> Users ask for shared writable mmap too. That isn't a good idea either.
> 
> Contemplate what Linus always says about using 'volatile' vs. proper
> barriers. Now consider it for O_SYNC vs. fsync(). And factor in the fact
> that O_SYNC is going to be massively suboptimal if it causes syncs when
> they otherwise didn't need to happen.

Ok, good point.  You've convinced me.

josh
