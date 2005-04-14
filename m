Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DM5GX-0005Pu-GM
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2005 10:24:22 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DM5AZ-0003ak-9u
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2005 16:18:17 +0200
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2005 16:18:11 +0200
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2005 16:18:11 +0200
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Thu, 14 Apr 2005 14:15:36 +0000 (UTC)
Message-ID: <loom.20050414T151238-645@post.gmane.org>
References: <loom.20050413T142519-107@post.gmane.org>
	<1113400225.23175.9.camel@sauron.oktetlabs.ru>
	<loom.20050413T160136-559@post.gmane.org>
	<1113404557.23175.23.camel@sauron.oktetlabs.ru>
	<loom.20050413T193912-984@post.gmane.org>
	<Pine.LNX.4.58.0504140941040.3328@phoenix.infradead.org>
	<loom.20050414T140640-566@post.gmane.org>
	<Pine.LNX.4.58.0504141409200.3328@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: Re: mounting jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> > Other possibilities that I would like to investigate:
> > 1. Partition NAND into two blocks.
> We usually call flash sector "block", so I am confused what do you mean. 
> Just split your flash on 2 partitions?

Sorry, I meant two partitions. (blocks is sense of /dev/mtdblock ;)

> > 2. Try YAFFS. Can anybody offer an opinion ;) ? 
...
> I have no Idea. And I'd like to know this too 

It looks like I would need YAFFS2 in order to handle 2 kB pages. And it is
pretty new. Also the traffic is definitely lower on yaffs list.

> > 3. Try summary patch. How stable is it with jffs2? Is anybody using it
> > in production or is it still pretty much experimental?
> AFAIK, it is quite good.

That is good to know. Thanks.

> > 4. Combine (1) with (3). (1) will give fast write access, (3) hopefuly 
> will
> > give fast read access????
> You'll end up with quick mount, but the "touch your_200mb_file" command 
> (just after mount) should be still be slow. touch your_20mb_file will be 
> ~10 times faster.

I'll run a test with 10x20 MByte files and post results.

> > 5. Look for a commercial solution. I recall somebody was talking at 
> > Embedded Conference about porting their filesystem to linux.
> May be. The other case is just to start developing JFFS3. We have some 
> ideas.

What would be a time frame for a stable JFFS3 solution assuming there is a 
support?
 
> > What's the point in having a big NAND if you cannot fill it ;) ?
> JFFS2 wasn't designed for such large flashes/files. It has scalability 
> problems. And you can fill it if you're ready to spend a lot of RAM/time.

Got 32 MB, can probably go to 64 MB. Will that be sufficient to support 
256 MB NAND assuming 1 kB writes? BTW, does it make sense to increase write 
size above 1 page (2 kB). I understood from previous discussions that jffs2 
will split it on a page boundary anyway?

Sergei Sharonov
