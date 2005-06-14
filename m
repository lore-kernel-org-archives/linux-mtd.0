Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DiAbR-0004QW-Qo
	for linux-mtd@lists.infradead.org; Tue, 14 Jun 2005 08:33:17 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DiAVL-0005J8-HS
	for linux-mtd@lists.infradead.org; Tue, 14 Jun 2005 14:27:02 +0200
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Jun 2005 14:26:55 +0200
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Jun 2005 14:26:55 +0200
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Tue, 14 Jun 2005 12:25:21 +0000 (UTC)
Message-ID: <loom.20050614T135901-706@post.gmane.org>
References: <004d01c57074$ad3758d0$6702a8c0@niro>
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

Hi,

> I have been running ext3 on diskonchip2000 (using m-sys trueffs driver) for
> quite a while now and have not run into any problems yet, although I never
> did any asynchronous power off tests. 

I am also interested in power fail tolerance of ext3 but could not find
any test data. People mentioned that it should be better then other 
journaling filesystem (such as reserfs, jfs, xfs) because of different
journaling scheme. 

> The diskonchip will be at least 384MB up to a maximum
> of 1GB. 

You may forget about jffs2 on such large flashes. Depending on the size of the
writes that filled the disk it will take anywhere from ten minutes to hours
to mount jffs2. The only other alternative that uses mtd is yaffs. It does
mount significantly faster, but the user base is small and there is no active
development going on (as far as I can tell).

> in the same partition. Asynchronous power offs cannot be ruled out due to
> the nature of the instrument that will host the cpu board with the
> diskonchip.

I know people that did extensive power-cycling testing on jffs2 with very
good results. I tried cycling yaffs and it fails on me about after 100-200
cycles.

> What exactly does one get with *just* NFTL, i.e. does it makes sense to run
> ext3 on top of NFTL? Is NFTL production ready?

Are you going to power cycle your nftl+ext3 setup? I would be
interested in results.

Best regards,

Sergei Sharonov
