Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HGvkS-00045W-Du
	for linux-mtd@lists.infradead.org; Tue, 13 Feb 2007 06:23:04 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HGvkF-0006Xa-52
	for linux-mtd@lists.infradead.org; Tue, 13 Feb 2007 12:22:47 +0100
Received: from ASt-Lambert-152-1-70-213.w86-217.abo.wanadoo.fr
	([86.217.64.213]) by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 13 Feb 2007 12:22:47 +0100
Received: from matthieu.castet by
	ASt-Lambert-152-1-70-213.w86-217.abo.wanadoo.fr with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 13 Feb 2007 12:22:47 +0100
To: linux-mtd@lists.infradead.org
From: Matthieu CASTET <matthieu.castet@parrot.fr>
Subject: Re: [PATCH] S3C2412 TACLS rate calculation fix
Date: Tue, 13 Feb 2007 11:22:32 +0000 (UTC)
Message-ID: <loom.20070213T122031-705@post.gmane.org>
References: <20070213111204.GC2211@fluff.org.uk>
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

Ben Dooks <ben <at> fluff.org.uk> writes:

> 
> The TALCs value on the S3C2412 value does not have
> an +1 adjustment unlike the S3C2410 and S3C2440.
> 
> The TALCs value on the S3C2440 is only 2 bits instead
> of three, so change it to a maximum of 4.
> 
> Re-work of an patch by Matt Reimer <mreimer <at> vpop.net>
> 
Doesn't we lose the part that allow tacls to be 0 ?

Matthieu
