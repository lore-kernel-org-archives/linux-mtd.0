Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DBzhh-00016K-Al
	for linux-mtd@lists.infradead.org; Thu, 17 Mar 2005 13:26:42 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DBzcz-0000Dy-Ol
	for linux-mtd@lists.infradead.org; Thu, 17 Mar 2005 19:21:56 +0100
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 17 Mar 2005 19:21:49 +0100
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 17 Mar 2005 19:21:49 +0100
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Thu, 17 Mar 2005 18:20:57 +0000 (UTC)
Message-ID: <loom.20050317T190818-133@post.gmane.org>
References: <487B538D08487B4D8FEC138A13D4F6AC509BA5@HOUEXCH077.corp.halliburton.com>
	<1110974906.30606.38.camel@sauron.oktetlabs.ru>
	<1111002676.4814.112.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: Re: failed write verify causes segmentation fault
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> > This is only one possible reason. The other possible reason which I
> > think is more likely has happened in your case is that JFFS2 tried to
> > write to a non-empty NAND page, e.g., the page didn't contain all 0xFF.
> > In this case write_verify() might fail as well. I don't know why JFFS2
> > might do that, possibly there is some bug.
> 
> The question is not why the write verify fails. In his test environment
> a page failure is expected to happen at some point. The question is why
> JFFS2 did not cope with the problem as it is supposed to be.

Exactly. Could not have said better myself. How should jffs2 handle failed 
writes? Replace bad page transparently on the fly, return number of bytes 
written < number of bytes requested, segfault ;-) ? 

Sergei

P.S. For you, poor souls stuck behind corporate firewalls with Outlook/Exchange,
it looks like gmane.org is a good alternative. It does threading, posts plain 
text and checks for >80 chars/lines.
