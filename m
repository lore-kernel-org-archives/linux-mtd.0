Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15j7os-0007tR-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Sep 2001 00:28:54 +0100
Received: from mail.fh-wedel.de ([195.37.86.23])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 15j2wo-00073H-00
	for linux-mtd@lists.infradead.org; Mon, 17 Sep 2001 19:16:46 +0100
Received: from wohnheim.fh-wedel.de (wohnheim.fh-wedel.de [195.37.86.122])
	by mail.fh-wedel.de (8.9.3/8.9.3) with ESMTP id UAA24655
	for <linux-mtd@lists.infradead.org>; Mon, 17 Sep 2001 20:16:32 +0200
Date: Mon, 17 Sep 2001 20:16:43 +0200
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Subject: jffs vs. jffs2 & new code
Message-ID: <20010917201643.A6841@wohnheim.fh-wedel.de>
References: <fc.000f680100283f75000f680100283f75.283ff2@telos-systems.com> <20010915211257.B23628@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20010915211257.B23628@wohnheim.fh-wedel.de>; from joern@wohnheim.fh-wedel.de on Sat, Sep 15, 2001 at 09:12:57PM +0200
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi!

I am relatively new to mtd, but already have two questions. Please
give me a hint if they are covered in some faq.

1. jffs is not jffs2, obvious. But what is the difference from a
user-perspective besides the mkfs used?
I created some test partitions and tried both but could not really see
a difference. The platform is a 2.4.2 Kernel with the montavista
patches, additional patches for the hardware - still secret stuff,
sorry - and the current MTD code from cvs.

2. After examining the availlable partition table parsers, I was not
very happy with the choices and wrote my own, along with a userspace
tool for partition table creation. This still needs a couple of days
for testing and code cleanup, before it is ready for the wild, but at
least my employer allows me to send the code to you.
How, when, where, [...] can I do it?

Regards, Joern
