Received: from a.smtp-out.sonic.net ([208.201.224.38])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Mz1O-00057N-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Dec 2002 23:15:06 +0000
Received: from mailman.eason.com (adsl-209-204-139-80.sonic.net [209.204.139.80])
	by tempest.sonic.net (8.11.6/8.8.5) with ESMTP id gBDNjiP04143
	for <linux-mtd@lists.infradead.org>; Fri, 13 Dec 2002 15:45:44 -0800
Message-ID: <D3AF5F134D627243993F2F2FC32EE4D229C4A7@mailman.eason.com>
From: Alex Pavloff <apavloff@eason.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: writing new BBRAM driver
Date: Fri, 13 Dec 2002 15:45:42 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi there folks.  I've written the struct mtd_info functions for a 128KB
BBRAM driver for my companies new board.  It's horribly simple, as most of
it is actually done by a gate array on the board, so from kernel land its
just poking ioports.  Easy stuff.

Anyway, at this point, I've got that written, but I'm a little hazy as to
what I do next.  Insmod the driver, and then....?

How do I get a drive to mount?

Also, what FS should I use for this BBRAM?

Thanks!

Alex Pavloff - apavloff@eason.com
Eason Technology -- www.eason.com
 
