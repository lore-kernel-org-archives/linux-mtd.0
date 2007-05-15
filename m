Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HnyeW-00024i-FQ
	for linux-mtd@lists.infradead.org; Tue, 15 May 2007 11:09:30 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HnyeR-0005rT-EU
	for linux-mtd@lists.infradead.org; Tue, 15 May 2007 17:09:23 +0200
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 May 2007 17:09:23 +0200
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 May 2007 17:09:23 +0200
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: When to use mtd.h or mtd-user.h
Date: Tue, 15 May 2007 15:09:14 +0000 (UTC)
Message-ID: <loom.20070515T170629-855@post.gmane.org>
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

I note some applications for running in userspace say:
#include <linux/mtd/mtd.h>
and some say
#include <mtd/mtd-user.h>

Which is the recommended usage, and why ?

Many thanks,
MikeW
