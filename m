Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DOGle-0000uE-IM
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2005 11:05:31 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DOGhB-0003ts-Cg
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2005 17:00:53 +0200
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2005 17:00:53 +0200
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2005 17:00:53 +0200
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Wed, 20 Apr 2005 14:59:50 +0000 (UTC)
Message-ID: <loom.20050420T165531-253@post.gmane.org>
References: <loom.20050413T142519-107@post.gmane.org>
	<425E3174.4030308@inf.u-szeged.hu>
	<Pine.LNX.4.58.0504141014400.3328@phoenix.infradead.org>
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
> > Just an idea: you may try out our summary patch. (
> > http://www.inf.u-szeged.hu/jffs2/mount.php )
> Yes, summary will help greatly with mount time, but unfortunately it 
> doesn't help with memory consumption and iget() (in Sergey's case the time 
> of the background checking is the same).

Hmm.. then what improvement does summary patch provide? In my case mount
returns in 1.5 minutes but then I cannot do anything to flash for
another 20+ minutes.

Sergei Sharonov
