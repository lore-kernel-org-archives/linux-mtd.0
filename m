Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D6mPs-00064V-IG
	for linux-mtd@lists.infradead.org; Thu, 03 Mar 2005 04:14:51 -0500
Received: from tglx.tec.linutronix.de (213-239-205-147.clients.your-server.de
	[213.239.205.147]) (using SSLv3 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by mail.tglx.de (Postfix) with ESMTP id D826A65C2B9
	for <linux-mtd@lists.infradead.org>;
	Thu,  3 Mar 2005 10:10:41 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: MTD List <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Thu, 03 Mar 2005 10:14:42 +0100
Message-Id: <1109841282.5398.30.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [RFD] Move 2.4 code out from CVS head
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We announced some time ago:

"The MTD support for 2.4 will be moved to a maintainence only mode in
the near future. This will relieve us from a lot of compatibility crap
and lets us concentrate on the further development in the 2.6 series."

The latests symlink changes broke 2.4 and I dont see any reason to keep
this stupid game up.

The last CVS version which might work on 2.4 is before
Tue, 01 Mar 2005 10:00:00 +0000  (11:00 CET)

I strongly vote to branch of a mtd-2.4-latest-devel in CVS from said
point and then remove the whole 2.4 crap from CVS head. 

If somebody feels responsible to keep this branch up to date, I neither
care nor object.

I'm really tired of this backwards compability stuff and the complaints
on the maillist.

tglx
