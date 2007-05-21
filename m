Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HqACC-0004F8-2Q
	for linux-mtd@lists.infradead.org; Mon, 21 May 2007 11:53:48 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HqAC5-0008ND-AY
	for linux-mtd@lists.infradead.org; Mon, 21 May 2007 17:53:09 +0200
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 21 May 2007 17:53:09 +0200
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 21 May 2007 17:53:09 +0200
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: [PATCH] Fix kfree usage in various mtd map remove functions
Date: Mon, 21 May 2007 15:53:01 +0000 (UTC)
Message-ID: <loom.20070521T175126-701@post.gmane.org>
References: <1179425894742@dmwebmail.belize.chezphil.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Phil Endecott <spam_from_linux_mtd <at> chezphil.org> writes:

....
> Since mtd drivers are rarely or never used as modules (they typically provide
root filesystems) 
> it is unlikely that these code paths have ever been exercised.  It also means
that this patch 
> has not been tested by the author.
....

PS a little worrying that people are committing patches without
testing them properly. Hope it's just an exception !

MikeW
