Received: from atl.cbeyond.com ([64.238.96.10] helo=smtp.atl.cbeyond.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 197ehH-0002m2-9o
	for <linux-mtd@lists.infradead.org>; Mon, 21 Apr 2003 18:03:15 +0100
Received: from [127.0.0.1] (HELO mail.atl.cbeyond.com)
	by smtp.atl.cbeyond.com (CommuniGate Pro SMTP 4.0.6)
	with ESMTP id 25530166 for linux-mtd@lists.infradead.org;
	Mon, 21 Apr 2003 13:02:46 -0400
Received: from [64.25.14.193] (HELO sgluckman)
	by mail.atl.cbeyond.com (CommuniGate Pro SMTP 4.0.6)
	with SMTP id 32354457 for linux-mtd@lists.infradead.org;
	Mon, 21 Apr 2003 13:02:45 -0400
From: "Sid Gluckman" <sgluckman@omnitech.com>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 21 Apr 2003 11:00:48 -0600
Message-ID: <OOEOKBMECIFAEPIMFOGIIEEBCBAA.sgluckman@omnitech.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: MTD on a USB SmartMedai Reader
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I want to access a SmartMedia card on a USB adapter with JFFS2 filesystem.
The USB reader is recognized fine and seems to detect the card correctly.
My question is how can I direct the MTD subsystem to use the USB adapter?
Is this supported?

Thanks,

Sid
