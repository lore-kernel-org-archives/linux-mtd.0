Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DM3ib-0004kE-9d
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2005 08:45:15 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DM3eB-0003Ad-4w
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2005 14:40:45 +0200
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2005 14:40:39 +0200
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2005 14:40:39 +0200
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Thu, 14 Apr 2005 12:39:53 +0000 (UTC)
Message-ID: <loom.20050414T140640-566@post.gmane.org>
References: <loom.20050413T142519-107@post.gmane.org>
	<1113400225.23175.9.camel@sauron.oktetlabs.ru>
	<loom.20050413T160136-559@post.gmane.org>
	<1113404557.23175.23.camel@sauron.oktetlabs.ru>
	<loom.20050413T193912-984@post.gmane.org>
	<Pine.LNX.4.58.0504140941040.3328@phoenix.infradead.org>
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

thanks, Artem.

> > Nope. Just three files: one is 200 MBytes, two others are small.
> 
> That's all I need to know. JFFS2 was originally developed to work with
> small NOR flashes. After NAND support was added it became possible to
> utilize it on top of NAND, but with large flashes it is not very usable.
> 200 MB file is very large for JFFS2. It eats a lot of RAM when
> you open the file and iget() is very slow with it (iget() happens when
> you open the file, stat it, ls -l, etc).

That's what I was afraid of. Looks like JFFS2 is not very usable on large
NAND chips. Will the situation improve if the 200 MByte file
is split into, say, multiple 20 MByte files? I guess not..

Other possibilities that I would like to investigate:

1. Partition NAND into two blocks. One will be small and will buffer incomming
data while the second big partition is being mounted. Problem: if power
cycles just before the readout the user will have to wait 20+ minutes before 
he can get to data. Argh..

2. Try YAFFS. Can anybody offer an opinion ;) ? 
JFFS2 is well supported, every resonable question or problem is followed 
up within hours. What about YAFFS? I also have a feeling that jffs2 has had 
a bit more testing and larger user base. How mature is YAFFS?

3. Try summary patch. How stable is it with jffs2? Is anybody using it
in production or is it still pretty much experimental? I recall that
initially summary was not created/updated dynamically, e.g. it was not 
usefull for log data. Is it still the case?

4. Combine (1) with (3). (1) will give fast write access, (3) hopefuly will
give fast read access????

5. Look for a commercial solution. I recall somebody was talking at 
Embedded Conference about porting their filesystem to linux.

> This is why I started designing JFFS3, though I do this in background and 
> don't really spend a lot of time (sponsors are needed ). Take a glimpse 
> at the evolving document at 
> http://www.linux-mtd.infradead.org/tech/JFFS3design.pdf, especially at the 
> "JFFS2 analysis chapter", which is far not complete though. This will help 
> you to realize why it is difficult to use JFFS2 on large flashes, 
> especially if you have a 200 MB file 

What's the point in having a big NAND if you cannot fill it ;) ?

Best regards,

Sergei Sharonov
