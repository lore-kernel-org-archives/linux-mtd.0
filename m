Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12uj3v-0000Jc-00
	for mtd-list@infradead.org; Wed, 24 May 2000 22:51:35 +0100
Received: from mail.transzap.net ([207.239.241.226] helo=tzi.transzap.com)
	by infradead.org with smtp (Exim 3.03 #1)
	id 12uj3t-0000JW-00
	for mtd@infradead.org; Wed, 24 May 2000 22:51:34 +0100
Received: from localhost (phiggins@localhost)
	by phiggins.transzap.com (8.9.3/8.8.7) with ESMTP id PAA17075
	for <mtd@infradead.org>; Wed, 24 May 2000 15:55:07 -0600
From: Patrick Higgins <phiggins@transzap.com>
To: mtd@infradead.org
Date: Wed, 24 May 2000 15:55:07 -0600 (MDT)
Subject: Patched LILO problems
Message-ID: <Pine.LNX.4.21.0005241545550.16970-100000@phiggins.transzap.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


I'm using the binary patched LILO from mtd/patches/lilo-mtd.tar.gz, and it
doesn't seem to pass the correct command line to kernel.  The parameters I
specify in the lilo.conf are totally ignored, and after the system boots,
cat'ing /proc/cmdline shows that it's full of 0xff's.  Has anyone had
similar problems, or know what might be going on?


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
