Received: from rm-rstar.sfu.ca ([142.58.120.21] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17pa8C-0006n2-00
	for <linux-mtd@lists.infradead.org>; Thu, 12 Sep 2002 21:00:04 +0100
Received: from fraser.sfu.ca (btlee@fraser.sfu.ca [142.58.101.25])
	by rm-rstar.sfu.ca (8.12.5/8.12.5/SFU-5.0H) with ESMTP id g8CJxwrn002578
	for <linux-mtd@lists.infradead.org>; Thu, 12 Sep 2002 12:59:59 -0700 (PDT)
Received: from localhost (btlee@localhost)
	by fraser.sfu.ca (8.9.2/8.9.2/SFU-5.0C) with ESMTP id MAA18752
	for <linux-mtd@lists.infradead.org>; Thu, 12 Sep 2002 12:59:58 -0700 (PDT)
Date: Thu, 12 Sep 2002 12:59:58 -0700 (PDT)
From: Benjamin Tze-Kit Lee <btlee@sfu.ca>
To: linux-mtd@lists.infradead.org
Subject: flash chip interface with MTD
Message-ID: <Pine.GSO.4.44.0209121259120.26546-100000@fraser.sfu.ca>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi all,

I am looking through the source code for MTD and trying to find the driver
(interface) which communicates with the flash.
Can anyone point me to some file or function that does the actually
read/write to the flash?

Also, is MTD able to talk to an on board flash chip, something like the
Intel StrataFlash?

Thx a lot,
Ben
