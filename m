Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1Du62W-0000Bj-6p
	for linux-mtd@lists.infradead.org; Sun, 17 Jul 2005 06:06:34 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Content-Type: text/plain
Date: Sun, 17 Jul 2005 12:10:14 +0200
Message-Id: <1121595014.24449.220.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD <linux-mtd@lists.infradead.org>
Subject: [JFFS2] Cleanup the debugging stuff
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Move most of debugging-related JFFS2 stuff to debug.c and debug.h. It is much
> tidier then the previous approach. Preserve dwmw2's favourite D1() - I would
> like to clean-up them as well, but do not dare. :-)
> 

Why not ? I prefer a coherent cleanup over some halfarsed attempt.

>  	D1(printk(KERN_DEBUG "Scanned flash completely\n"));

Whats wrong with 

jffs2_dbg1_msg("Scanned flash completely\n"); ?

All those D1 messages should have KERN_DEBUG syslog level, so its simple
to wrap them nicely.

> -	D2(jffs2_dump_block_lists(c));
> +	D2(jffs2_dbg_dump_block_lists(c));

Why D2() here ? jffs2_dbg2_dump_block_lists(c) removes D2() and provides
a quick association to the debug level.

tglx
