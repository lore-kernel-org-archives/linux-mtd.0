Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HqA3w-00040U-2Y
	for linux-mtd@lists.infradead.org; Mon, 21 May 2007 11:44:47 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HqA3m-00072m-Ns
	for linux-mtd@lists.infradead.org; Mon, 21 May 2007 17:44:34 +0200
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 21 May 2007 17:44:34 +0200
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 21 May 2007 17:44:34 +0200
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: [PATCH] Fix kfree usage in various mtd map remove functions
Date: Mon, 21 May 2007 15:44:28 +0000 (UTC)
Message-ID: <loom.20070521T174147-996@post.gmane.org>
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

> 
> The remove() functions in various mtd map drivers were incorrectly kfree()ing
the struct 
> resource that they had passed to release_resource(), and/or failing to free
the *_flash_info 
> structure.  This looks like a typo which has gradually propogated by
copy&paste into a number 
> of these drivers.
> 
> Since mtd drivers are rarely or never used as modules (they typically provide
root filesystems) 
> it is unlikely that these code paths have ever been exercised.  It also means
that this patch 
> has not been tested by the author.
> 
> This patch is against 2.6.21.
> 
> Signed-off-by: Phil Endecott <spam_from_linux_mtd_patch <at> chezphil.org>
> 

Good chap !!

They could be tested by building as modules then insmod/rmmod-ing
repeatedly, whilst observing kernel memory usage, before and after fix.

Regards,
MikeW
