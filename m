Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HRn8W-0008PQ-Lb
	for linux-mtd@lists.infradead.org; Thu, 15 Mar 2007 10:24:47 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HRn8S-0000Ks-CY
	for linux-mtd@lists.infradead.org; Thu, 15 Mar 2007 11:24:40 +0100
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 15 Mar 2007 11:24:40 +0100
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 15 Mar 2007 11:24:40 +0100
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Journalling (?) single-block parameter storage
Date: Thu, 15 Mar 2007 10:24:28 +0000 (UTC)
Message-ID: <loom.20070315T111554-92@post.gmane.org>
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

Any prior art ?

I have a single eraseblock available, and the need to store an
updateable (small, 20-30 bytes) parameter block which is fixed in size.

Although I can easily come up with a sequential block-invalidating storage
scheme, eventually erasing the block when the end is reached, I wondered
whether anyone knew of an existing library package which would achieve
these ends.

Searching brings up lots of stuff on flash filesystems, but nothing on
such a simplified requirement.

Regards,
MikeW
