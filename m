Received: from dsl-64-129-133-253.telocity.com ([64.129.133.253] helo=skylab.outpostsentinel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dC7F-0000Ox-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Feb 2002 15:23:37 +0000
Received: from GATEKEEPER ([192.168.2.103])
	by skylab.outpostsentinel.com (8.11.2/8.11.2) with SMTP id g1JGPgL15079
	for <linux-mtd@lists.infradead.org>; Tue, 19 Feb 2002 11:25:42 -0500
Message-Id: <200202191625.g1JGPgL15079@skylab.outpostsentinel.com>
Date: Tue, 19 Feb 2002 10:33:33 -0500
To: linux-mtd@lists.infradead.org
From: Chris Fowler <cfowler@outpostsentinel.com>
Subject: Kerlen 2.4.13 and ramdisks
Reply-To: cfowler@outpostsentinel.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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

You guys might have ran across a ramdisk problem.  I have a feeling that kernel 2.4.13 is not respecting my ramdisks.


dd if=/etc/user.img of=/dev/ram6

mount /dev/ram6  fails.  


Is this a problem?
