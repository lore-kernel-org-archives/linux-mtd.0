Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E6BYf-0002lI-5h
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2005 14:25:39 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Ashwin Chaugule <ashwinc@aftek.com>
In-Reply-To: <43068933.1080609@aftek.com>
References: <430675EB.9030905@aftek.com>
	<1124457591.23647.382.camel@tglx.tec.linutronix.de>
	<43068933.1080609@aftek.com>
Content-Type: text/plain
Date: Fri, 19 Aug 2005 20:25:44 +0200
Message-Id: <1124475944.23647.389.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: is this a bug ?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2005-08-20 at 07:06 +0530, Ashwin Chaugule wrote:

> >
> In 2.6.12-2 my cmdline is ..

>From your previous mail

>     Im using 2.4.19-rmk7-pxa1, on a pxa255. .....
> 
> After digging into init/do_mounts.c , I found  root_mountflags was by 
> default readonly,

So what ? You were asking a question about 2.4.19 and you got an answer
related to that. It's coded that way in the ancient, broken and obsolete
2.4.19... kernel and there are two ways to solve that without hacking
the kernel code.

Where is the bug ?

tglx
