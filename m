Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HfwoN-0004II-Oy
	for linux-mtd@lists.infradead.org; Mon, 23 Apr 2007 07:34:29 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Hfwo9-0000J9-Rd
	for linux-mtd@lists.infradead.org; Mon, 23 Apr 2007 13:34:13 +0200
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 23 Apr 2007 13:34:13 +0200
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 23 Apr 2007 13:34:13 +0200
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Wanted - simple NOR Flash filing system
Date: Mon, 23 Apr 2007 11:34:07 +0000 (UTC)
Message-ID: <loom.20070423T132454-397@post.gmane.org>
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

For storing a few tens/hundreds of bytes of configuration data,
in a handful of files (no subdirs), read access 99.99%,
write/update once or twice in life of the system.
Fits into single erase block ideally, so might need to hold data in RAM
pending erase - if ever filled the block !

Any suggestions ?

Regards,
MikeW
