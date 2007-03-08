Subject: Re: JFFS2 as transactional FS (in other words: how to be sure that
	data have been writtent correctly from userspace)
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>
In-Reply-To: <20070308131257.GD23216@lazybastard.org>
References: <45EFDC0D.4090409@dave-tech.it>
	<1173351098.3461.414.camel@pmac.infradead.org>
	<20070308125416.GB23216@lazybastard.org>
	<1173359044.3461.433.camel@pmac.infradead.org>
	<20070308131257.GD23216@lazybastard.org>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Mar 2007 13:22:47 +0000
Message-Id: <1173360167.3461.438.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: R&D4 <r&d4@dave-tech.it>, mtd_mailinglist <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-03-08 at 14:12 +0100, Jörn Engel wrote:
> Then you have your bug report.  Ignoring those was ok in 2001, but with
> wbuf I would at least expect JFFS2 to return an error.

Not quite, because that's not what he was trying. He said he was using
fsync().

I would hope that JFFS2 doesn't _have_ to return an error -- the VFS
should do so if the filesystem doesn't support a given option. That
doesn't seem to be the case though, so I agree that we should make JFFS2
check for those two flags and refuse the operation (mount/open) for
write-buffered flash.

> One option for implementing this would be to do the write, call schedule
> to let other processes write something, then check whether the buffer
> has been flushed out by other processes.  Or do some GC to fill the
> buffer with useful data.  Anything but padding it. 

Better just to say 'no', I think :)

-- 
dwmw2
