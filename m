Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HoGDF-0000RE-D0
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 05:54:31 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HoGDD-00043y-BE
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 11:54:27 +0200
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 May 2007 11:54:27 +0200
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 May 2007 11:54:27 +0200
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: When to use mtd.h or mtd-user.h
Date: Wed, 16 May 2007 09:54:20 +0000 (UTC)
Message-ID: <loom.20070516T115003-521@post.gmane.org>
References: <loom.20070515T170629-855@post.gmane.org>
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

MikeW <mw_phil <at> yahoo.co.uk> writes:

> 
> I note some applications for running in userspace say:
> #include <linux/mtd/mtd.h>
> and some say
> #include <mtd/mtd-user.h>
> 
> Which is the recommended usage, and why ?
> 
> Many thanks,
> MikeW

Incidentally, I did actually realise which was the *correct* usage,
but I wondered why anyone (especially uBoot) would use the other.

Thanks for the comments,
MikeW
