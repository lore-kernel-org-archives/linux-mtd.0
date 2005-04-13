Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DLm6S-0007vW-6a
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2005 13:56:41 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DLm1z-0006hv-6A
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2005 19:52:09 +0200
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2005 19:52:03 +0200
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2005 19:52:03 +0200
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Wed, 13 Apr 2005 17:51:01 +0000 (UTC)
Message-ID: <loom.20050413T193912-984@post.gmane.org>
References: <loom.20050413T142519-107@post.gmane.org>
	<1113400225.23175.9.camel@sauron.oktetlabs.ru>
	<loom.20050413T160136-559@post.gmane.org>
	<1113404557.23175.23.camel@sauron.oktetlabs.ru>
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
> > Hmm.. ls is not a writer but it is blocked as well.
> It may be blocked but for shorter time (checking one ore few inodes, not
> all). Do you have very big files or directories with a lot of L1
> children ?

Nope. Just three files: one is 200 MBytes, two others are small. 

# time mount /mnt/flash/

real    1m33.528s
user    0m0.010s
sys     1m33.421s
# time ls /mnt/flash/
blockno1  junk      test1

real    20m54.573s
user    0m0.010s
sys     9m32.519s
#

This is not usable for embedded application. Have I run into a bug or that
is just how things are with jffs2 on big NANDs? Is that a problem with
a 200 MByte file? 

Sergei Sharonov
