Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DErWq-0003R6-F2
	for linux-mtd@lists.infradead.org; Fri, 25 Mar 2005 11:19:21 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DErWG-0003LB-BR
	for linux-mtd@lists.infradead.org; Fri, 25 Mar 2005 17:18:50 +0100
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 Mar 2005 17:18:44 +0100
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 Mar 2005 17:18:44 +0100
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Fri, 25 Mar 2005 16:18:35 +0000 (UTC)
Message-ID: <loom.20050325T163810-877@post.gmane.org>
References: <loom.20050322T224733-491@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: Re: atomic file operations
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I was browsing the mailing lists and found that this topic has already 
generated a fair bit of discussions started by Vipin Malik around 2001. 
Then the consensus was that it is not a responsibility of a filesystem 
to do transactions but a user space application. Nevertheless this question 
keeps coming back again and again because obviously people with 
"real life" applications want a way to store data in a transactional 
manner. Nowadays there are also filesystems out there that sport that
transactional functionality to address this need despite the fact that 
"POSIX does not require it" and such. Obviously there are also transactional 
databases out there (Dah!) but that does not help much if one needs to expose 
data as a filesystem.

I appologize since it now appears that the original post had little to 
do with JFFS2 ;-) so the question may be rephrased as: Is anybody aware 
of a generic transactional library that can be run on top of JFFS2 to 
provide transactions for the filesystem operations? Or is everybody 
for himself?


Sergei Sharonov
