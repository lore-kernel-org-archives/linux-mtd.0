Received: from e34.co.us.ibm.com ([32.97.110.152])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HPIyb-0004pt-Pr
	for linux-mtd@lists.infradead.org; Thu, 08 Mar 2007 08:48:15 -0500
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e34.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l28DjOBI003254
	for <linux-mtd@lists.infradead.org>; Thu, 8 Mar 2007 08:45:24 -0500
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by westrelay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l28DjOgA208746
	for <linux-mtd@lists.infradead.org>; Thu, 8 Mar 2007 06:45:24 -0700
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l28DjNju001672
	for <linux-mtd@lists.infradead.org>; Thu, 8 Mar 2007 06:45:24 -0700
Subject: Re: JFFS2 as transactional FS (in other words: how to be sure that
	data have been writtent correctly from userspace)
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1173360167.3461.438.camel@pmac.infradead.org>
References: <45EFDC0D.4090409@dave-tech.it>
	<1173351098.3461.414.camel@pmac.infradead.org>
	<20070308125416.GB23216@lazybastard.org>
	<1173359044.3461.433.camel@pmac.infradead.org>
	<20070308131257.GD23216@lazybastard.org>
	<1173360167.3461.438.camel@pmac.infradead.org>
Content-Type: text/plain; charset=utf-8
Date: Thu, 08 Mar 2007 07:44:32 -0600
Message-Id: <1173361473.4861.12.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Thu, 2007-03-08 at 13:22 +0000, David Woodhouse wrote:
> On Thu, 2007-03-08 at 14:12 +0100, Jörn Engel wrote:
> > Then you have your bug report.  Ignoring those was ok in 2001, but with
> > wbuf I would at least expect JFFS2 to return an error.
> 
> Not quite, because that's not what he was trying. He said he was using
> fsync().
> 
> I would hope that JFFS2 doesn't _have_ to return an error -- the VFS
> should do so if the filesystem doesn't support a given option. That
> doesn't seem to be the case though, so I agree that we should make JFFS2
> check for those two flags and refuse the operation (mount/open) for
> write-buffered flash.

Wait... why?  Rejecting mount -o sync seems sane, but why can't O_SYNC
support be handled?  If users want to open their files like that and it
causes JFFS2 to flush a bunch of padding out, well they asked for it.

josh
