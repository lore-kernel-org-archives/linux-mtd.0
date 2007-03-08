Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HPITY-0004D4-No
	for linux-mtd@lists.infradead.org; Thu, 08 Mar 2007 08:16:11 -0500
Date: Thu, 8 Mar 2007 14:12:58 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 as transactional FS (in other words: how to be sure that
	data have been writtent correctly from userspace)
Message-ID: <20070308131257.GD23216@lazybastard.org>
References: <45EFDC0D.4090409@dave-tech.it>
	<1173351098.3461.414.camel@pmac.infradead.org>
	<20070308125416.GB23216@lazybastard.org>
	<1173359044.3461.433.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1173359044.3461.433.camel@pmac.infradead.org>
Cc: R&D4 <r&d4@dave-tech.it>, mtd_mailinglist <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 8 March 2007 13:04:04 +0000, David Woodhouse wrote:
> On Thu, 2007-03-08 at 13:54 +0100, Jörn Engel wrote:
> > 
> > Last time I checked, JFFS2 got one case wrong.  Don't remember which
> > one,
> > but there are not that many to check:
> >  - mount -o sync
> >  - open(..., O_SYNC);
> 
> I don't think we've implemented those two at all.

Then you have your bug report.  Ignoring those was ok in 2001, but with
wbuf I would at least expect JFFS2 to return an error.

One option for implementing this would be to do the write, call schedule
to let other processes write something, then check whether the buffer
has been flushed out by other processes.  Or do some GC to fill the
buffer with useful data.  Anything but padding it.

Jörn

-- 
The strong give up and move away, while the weak give up and stay.
-- unknown
