Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ASPyk-0002Aa-OZ
	for <linux-mtd@lists.infradead.org>; Sat, 06 Dec 2003 00:07:23 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Jasmine Strong <jasmine@regolith.co.uk>
In-Reply-To: <Pine.LNX.4.53.0312052344460.3377@pink.linuxgrrls.org>
References: 
	 <77FE4A1FA59FF947845A42194AD667620A0F4E@uswaumsx07medge.med.ge.com>
	 <Pine.LNX.4.53.0312052158410.3295@pink.linuxgrrls.org>
	 <1070666214.8421.4.camel@imladris.demon.co.uk>
	 <Pine.LNX.4.53.0312052344460.3377@pink.linuxgrrls.org>
Message-Id: <1070669126.8421.30.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sat, 06 Dec 2003 00:05:26 +0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
cc: "Howard, Michael \(MED\)" <Michael.Howard@med.ge.com>
Subject: Re: Why restrict to page aligned writes in nand_write_ecc() ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-12-05 at 23:45 -0100, Jasmine Strong wrote:
> On Fri, 5 Dec 2003, David Woodhouse wrote:
> 
> > > For jffs2 to work properly it's pretty much essential to support partial
> > > page writing.  You also need to support subsequent writes to the same
> > > partially-written page.
> >
> > No. The current JFFS2 code handles batching writes up into page-sized
> > chunks just fine.
> 
> ...what about power failures?

sys_fsync() and sys_sync() trigger garbage collection to flush pending
data from the write buffer. If there's nothing to GC, we pad it with
zeroes. There's also a timed flush which behaves similarly.

-- 
dwmw2
