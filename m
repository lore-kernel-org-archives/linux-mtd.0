Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HTJrC-0002WU-IQ
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 11:33:14 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HTJqu-0004br-4A
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 16:32:52 +0100
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2007 16:32:52 +0100
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2007 16:32:52 +0100
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Clarification on multiple mtdram devices
Date: Mon, 19 Mar 2007 15:32:33 +0000 (UTC)
Message-ID: <loom.20070319T162102-206@post.gmane.org>
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

>From a (much) earlier post, I note that the mtdram driver can emulate
several /dev/mtd's by "loading the driver more than once".

Does this mean modprobing *once* but then setting up multiple
device nodes with the same major number and different minor numbers ?

I presume this also implies that each device must have the same size & erasesize.

Regards,
MikeW
