Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19KF4A-0005JA-4w
	for <linux-mtd@lists.infradead.org>; Mon, 26 May 2003 11:18:54 +0100
Date: Mon, 26 May 2003 12:19:19 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20030526101918.GA11734@wohnheim.fh-wedel.de>
References: <001101c32078$7de79840$740486da@w0a3t0>
	<20030522195708.GB11240@wohnheim.fh-wedel.de>
	<004101c3214d$223c9560$740486da@w0a3t0>
	<20030526094050.GA30361@wohnheim.fh-wedel.de>
	<1053942836.17182.83.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1053942836.17182.83.camel@imladris.demon.co.uk>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: matsunaga <matsunaga_kazuhisa@yahoo.co.jp>
Subject: Re: vmalloc for zlib workspace
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 26 May 2003 10:53:56 +0100, David Woodhouse wrote:
> On Mon, 2003-05-26 at 10:40, Jörn Engel wrote:
> > 
> > Now every subsystem using zlib can reuse the same workspace, jffs2
> > anole would save one, a big fat system (TM) with jffs2, cramfs, ppp
> > and additional patches would save quite a bit more.  And those systems
> > do exist, no kidding.
> 
> Would be cute -- we need to ensure that it doesn't deadlock. In what
> context does PPP do its decompression? I have a feeling it does it in BH
> or softirq context, hence isn't allowed to attempt to obtain a
> semaphore. cramfs and jffs2 could almost certainly share though.

Not sure right now, the ppp code doesn't make that clear at first
glance.  But if it calls zlib from softirq context, that should be
changed as well.  It would shorten the buffers a little and process
accounting should be a bit more accurate.

Jörn

-- 
And spam is a useful source of entropy for /dev/random too!
-- Jasmine Strong
