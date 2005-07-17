Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1Du6kW-00018F-QX
	for linux-mtd@lists.infradead.org; Sun, 17 Jul 2005 06:52:04 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <1121597237.24449.231.camel@tglx.tec.linutronix.de>
References: <1121595014.24449.220.camel@tglx.tec.linutronix.de>
	<42DA3346.5010408@yandex.ru>
	<1121597237.24449.231.camel@tglx.tec.linutronix.de>
Content-Type: text/plain
Date: Sun, 17 Jul 2005 14:51:24 +0400
Message-Id: <1121597484.17840.2.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>,
	MTD <linux-mtd@lists.infradead.org>
Subject: Re: [JFFS2] Cleanup the debugging stuff
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2005-07-17 at 12:47 +0200, Thomas Gleixner wrote: 
> ? jffs2_dgb1_msg("Bla: %d. Message\n", current->pid);
What I wanted to say that it is easier to re-define jffs2_dgb1_msg then
to change all jffs2_dgb1_msg() invocations. With current Dx() it is not
very easy to do thins cleanly. So, I vote for changing Dx() on
jffs2_dgb1_msg().

> Remove all the Dx() crap or none. This is more mess than before. You can
> achieve all this by defining the macros correct
ok.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
