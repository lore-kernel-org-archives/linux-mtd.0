Received: from e31.co.us.ibm.com ([32.97.110.129])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CuLK4-00061Z-0y
	for linux-mtd@lists.infradead.org; Thu, 27 Jan 2005 20:53:21 -0500
Received: from westrelay03.boulder.ibm.com (westrelay03.boulder.ibm.com
	[9.17.195.12])
	by e31.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id j0S1rGm4417156
	for <linux-mtd@lists.infradead.org>; Thu, 27 Jan 2005 20:53:16 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by westrelay03.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j0S1rG9j344926
	for <linux-mtd@lists.infradead.org>; Thu, 27 Jan 2005 18:53:16 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11/8.12.11) with ESMTP id
	j0S1rGtg014096
	for <linux-mtd@lists.infradead.org>; Thu, 27 Jan 2005 18:53:16 -0700
From: Josh Boyer <jdub@us.ibm.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1106872400.6480.201.camel@localhost.localdomain>
References: <Pine.LNX.4.58.0501260841380.3222@phoenix.infradead.org>
	<1106730647.6480.190.camel@localhost.localdomain>
	<Pine.LNX.4.58.0501271719470.11160@phoenix.infradead.org>
	<1106857409.21196.58.camel@tglx.tec.linutronix.de>
	<1106865326.783.146.camel@baythorne.infradead.org>
	<1106871577.21196.155.camel@tglx.tec.linutronix.de>
	<1106872400.6480.201.camel@localhost.localdomain>
Content-Type: text/plain
Date: Thu, 27 Jan 2005 19:53:09 -0600
Message-Id: <1106877190.10729.1.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de, MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 memory consumption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-01-28 at 00:33 +0000, David Woodhouse wrote:
> On Fri, 2005-01-28 at 01:19 +0100, Thomas Gleixner wrote:
> > Sure. I'm aware of O_SYNC, fsync() and sync().
> > 
> > Please reread http://sources.redhat.com/jffs2/jffs2.pdf
> 
> That isn't a promise that I'll continue to guarantee anything that POSIX
> doesn't guarantee, especially in JFFS3.
> 
> I'm not going to object to a mount option which forces O_SYNC behaviour
> for all files. But there's no need for that to be the default.

Isn't that what the MS_SYNCHRONOUS flag is for?  I seem to recall using
that in a different filesystem once.  Something like:

mount -t <fstype> -o sync <dev> <mnt>

josh
