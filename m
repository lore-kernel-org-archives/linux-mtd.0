Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DiF1p-0005t9-Lx
	for linux-mtd@lists.infradead.org; Tue, 14 Jun 2005 13:16:48 -0400
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1DiEvM-0006xa-Jr
	for linux-mtd@lists.infradead.org; Tue, 14 Jun 2005 19:10:04 +0200
Received: from S01060004e28f4900.du.shawcable.net ([70.67.196.121])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Jun 2005 19:10:04 +0200
Received: from andre by S01060004e28f4900.du.shawcable.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Jun 2005 19:10:04 +0200
To: linux-mtd@lists.infradead.org
From: Andre <andre@rocklandocean.com>
Date: Tue, 14 Jun 2005 17:01:25 +0000 (UTC)
Message-ID: <loom.20050614T185630-101@post.gmane.org>
References: <004d01c57074$ad3758d0$6702a8c0@niro>
	<loom.20050614T135901-706@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: Re: suggestion on use of linux-mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sergei Sharonov <sergei.sharonov <at> halliburton.com> writes:

> You may forget about jffs2 on such large flashes. Depending on the size of the
> writes that filled the disk it will take anywhere from ten minutes to hours
> to mount jffs2. The only other alternative that uses mtd is yaffs. It does
> mount significantly faster, but the user base is small and there is no active
> development going on (as far as I can tell).

ok, I will not pursue jffs2.

> > What exactly does one get with *just* NFTL, i.e. does it makes sense to run
> > ext3 on top of NFTL? Is NFTL production ready?
> 
> Are you going to power cycle your nftl+ext3 setup? I would be
> interested in results.

Yes, as soon as I find out the state of NFTL. I got a little scared by the 
following comment in the howto:

quote: "DO NOT EVER USE THE nftl_format UTILITY WITHOUT FIRST SEEKING ADVICE
ON THE MAILING LIST. It will erase all blocks on the device,
potentially losing the factory-programmed information about bad
blocks. (Someone really ought to fix it one of these days - ed)"

Does NFTL include wear leveling and/or bad block remapping?
