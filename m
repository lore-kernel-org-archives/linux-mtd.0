Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12FJ27-0004Xq-00
	for mtd-list@infradead.org; Mon, 31 Jan 2000 15:46:31 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12FJ25-0004Xj-00
	for mtd@infradead.org; Mon, 31 Jan 2000 15:46:29 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Cc: linux-router@linuxrouter.org, linux-kernel@vger.rutgers.edu
Subject: Memory Technology Device support mtd-20000131 release
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 31 Jan 2000 15:46:19 +0000
Message-Id: <E12FJ1v-0006Tc-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

This really is the last release I can make until the end of Feb. I've included
the grub bootloader code, fixed to use INT 19 instead of INT 18 - which means
it's not just a last resort before falling back to ROM BASIC, it's the first
thing the machine tries to boot from.

It's also updated to handle the block device changes in recent 2.3.x kernels, 
and the fact that request merging appears to be screwed in them too.

There's a patch against 2.3.41, which includes changes to arch/*/config.in for 
all architectures rather than just i386, and also includes the byteorder fixes 
which are necessary.

The patch ought to apply to 2.2.1x fairly cleanly too - you'll just need to 
add some calls to the init() routines if you're compiling the drivers into the 
kernel.

	http://www.linux-mtd.infradead.org/

Oh - I've disabled FTL in the 2.3.41 kernel patch - my copy of ftl.c is so out 
of date that it's probably better to start again with David Hinds' version and 
port it to the MTD setup again. Volunteers?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
