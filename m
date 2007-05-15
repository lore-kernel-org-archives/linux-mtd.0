Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HnzGn-00034t-Tc
	for linux-mtd@lists.infradead.org; Tue, 15 May 2007 11:49:03 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HnzGI-00057N-VZ
	for linux-mtd@lists.infradead.org; Tue, 15 May 2007 17:48:30 +0200
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 May 2007 17:48:30 +0200
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 May 2007 17:48:30 +0200
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: When to use mtd.h or mtd-user.h
Date: Tue, 15 May 2007 15:48:04 +0000 (UTC)
Message-ID: <loom.20070515T173632-969@post.gmane.org>
References: <loom.20070515T170629-855@post.gmane.org>
	<Pine.LNX.4.64.0705151118590.6528@localhost.localdomain>
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

Robert P. J. Day <rpjday <at> mindspring.com> writes:

> 
> 
> i'm not even sure where that first header file would be coming from.
> it's not part of glibc, and it's not created as part of the sanitized
> headers by the kernel.  are you sure you've seen that in someone's
> *userspace* code?  and the inclusion worked?
> 
> in any event, it's that second header file that's correct.
> 
> rday

The line #include <linux/mtd/mtd.h> is taken from uboot/tools/env/fw_env.c
from www.denx.de (v.1.1.4)

There's another usage in openwrt/package/mtd/mtd.c

Both are intended to run as userspace apps.
However, making the mtd-user.h patch allows them to build without complaint.

Thanks,
MikeW
