Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1Du6QN-0000c8-AM
	for linux-mtd@lists.infradead.org; Sun, 17 Jul 2005 06:31:14 -0400
Message-ID: <42DA3346.5010408@yandex.ru>
Date: Sun, 17 Jul 2005 14:30:30 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <1121595014.24449.220.camel@tglx.tec.linutronix.de>
In-Reply-To: <1121595014.24449.220.camel@tglx.tec.linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD <linux-mtd@lists.infradead.org>
Subject: Re: [JFFS2] Cleanup the debugging stuff
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:
> Why not ? I prefer a coherent cleanup over some halfarsed attempt.
> 	D1(printk(KERN_DEBUG "Scanned flash completely\n"));
> Whats wrong with 
> jffs2_dbg1_msg("Scanned flash completely\n"); ?
> 
> All those D1 messages should have KERN_DEBUG syslog level, so its simple
> to wrap them nicely.
... and sometimes one may need to print current->pid at the debugging 
messages prefix...
Well, if dwmw2 agrees with this, I may do this when I have time.

>-	D2(jffs2_dump_block_lists(c));
>+	D2(jffs2_dbg_dump_block_lists(c));
> 
> Why D2() here ? jffs2_dbg2_dump_block_lists(c) removes D2() and provides
> a quick association to the debug level.
> 
I decided to make "paranoia" checks checks independent on the debug 
level. I.e., one may enable JFFS2 "paranoia" check without enabling 
JFFS2 debugging messages - this is often useful.

In turn, "paranoia" functions use "dump" functions, for example:

jffs2_dbg_fragtree_paranoia_check() uses jffs2_dbg_dump_fragtree();
jffs2_dbg_prewrite_paranoia_check() uses jffs2_dbg_dump_buffer();
etc.

So, as "paranoia" functions do not depend on the debug level, "dump" 
functions should not depend on it as well. jffs2_dbg_dump_block_lists() 
is also a "dump" function and I did not make "a quick association" for 
it. It allows me to have debug level 0 and at the same "paranoia" checks 
enabled.

But for "paranoia" functions I made the "quick association", so no Dx() 
is needed when you call, say, jffs2_dbg_fragtree_paranoia_check().

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
