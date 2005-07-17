Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1Du6cN-0000uD-3p
	for linux-mtd@lists.infradead.org; Sun, 17 Jul 2005 06:43:38 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
In-Reply-To: <42DA3346.5010408@yandex.ru>
References: <1121595014.24449.220.camel@tglx.tec.linutronix.de>
	<42DA3346.5010408@yandex.ru>
Content-Type: text/plain
Date: Sun, 17 Jul 2005 12:47:16 +0200
Message-Id: <1121597237.24449.231.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD <linux-mtd@lists.infradead.org>
Subject: Re: [JFFS2] Cleanup the debugging stuff
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2005-07-17 at 14:30 +0400, Artem B. Bityuckiy wrote:
> > All those D1 messages should have KERN_DEBUG syslog level, so its simple
> > to wrap them nicely.
> ... and sometimes one may need to print current->pid at the debugging 
> messages prefix...

? jffs2_dgb1_msg("Bla: %d. Message\n", current->pid);

> In turn, "paranoia" functions use "dump" functions, for example:
> 
> jffs2_dbg_fragtree_paranoia_check() uses jffs2_dbg_dump_fragtree();
> jffs2_dbg_prewrite_paranoia_check() uses jffs2_dbg_dump_buffer();
> etc.
> 
> So, as "paranoia" functions do not depend on the debug level, "dump" 
> functions should not depend on it as well. jffs2_dbg_dump_block_lists() 
> is also a "dump" function and I did not make "a quick association" for 
> it. It allows me to have debug level 0 and at the same "paranoia" checks 
> enabled.
> 
> But for "paranoia" functions I made the "quick association", so no Dx() 
> is needed when you call, say, jffs2_dbg_fragtree_paranoia_check().

Remove all the Dx() crap or none. This is more mess than before. You can
achieve all this by defining the macros correct

#if DBGLEVEL > 1
#define jffs2_dbg2_dump_whatever jff2_dbg_dmp_whatever
#else
#define jffs2_dbg2_dump_whatever do {} while(0)
#endif

#if DBGLEVEL > 1 || PARANOIA > 0
extern void jffs2_dbg_dump_whatever(arg);
#else
#define jffs2_dbg_dump_whatever do {} while(0)
#endif

tglx
