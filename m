Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E66mM-0007kn-Ro
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2005 09:19:30 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Ashwin Chaugule <ashwinc@aftek.com>
In-Reply-To: <430675EB.9030905@aftek.com>
References: <430675EB.9030905@aftek.com>
Content-Type: text/plain
Date: Fri, 19 Aug 2005 15:19:51 +0200
Message-Id: <1124457591.23647.382.camel@tglx.tec.linutronix.de>
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

On Sat, 2005-08-20 at 05:44 +0530, Ashwin Chaugule wrote:

> The following addition to do_mounts.c , did the trick.
> 
> + root_mountflags &= ~MS_RDONLY;
>    mount_block_root("/dev/root", root_mountflags);

Uurg. RTFM !

There are at least two sane ways to do that without touching the kernel
code.

- Documentation/kernel-parameters.txt (hint: rootflags)
- man mount (hint: remount)

tglx
