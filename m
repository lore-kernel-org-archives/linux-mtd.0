Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DIYsr-00062T-Se
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2005 17:13:22 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DIYpm-0004zU-4f
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2005 23:10:16 +0200
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Apr 2005 23:10:10 +0200
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Apr 2005 23:10:10 +0200
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Mon, 4 Apr 2005 21:08:35 +0000 (UTC)
Message-ID: <loom.20050404T224215-1@post.gmane.org>
References: <20050404135849.4689.qmail@web52705.mail.yahoo.com>
	<loom.20050404T173154-376@post.gmane.org>
	<1112640934.24487.375.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: Re: JFFS2 and frequent/small write operations
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
> On Mon, 2005-04-04 at 17:15 +0000, Sergei Sharonov wrote:
> > I was told that O_SYNC flag for open does not work with JFFS2 (!?).
> 
> You misunderstood. On NOR flash, O_SYNC does nothing because JFFS2 is
> entirely synchronous anyway. On NAND flash, I believe that O_SYNC does
> what it is supposed to -- any write will have reached the medium before
> the write() system call returns.

Thanks, that is good to know. It was suggested by others
http://article.gmane.org/gmane.linux.drivers.mtd/12175/match=+sync
that it may not work on JFFS2. Estelle?
 
> This has nothing to do with atomicity of writes with respect to power
> failure.

Sorry for the confusion. I did not mean that O_SYNC has anything to do 
with atomicity, only that it is usually one of the ways to assure that
all the data is flushed to media. I guess I heard that O_SYNC does
not work with JFFS2, did not want to accept it and was provoking people 
to confirm or disprove it ;-)

Sergei Sharonov
