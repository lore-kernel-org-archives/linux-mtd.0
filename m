Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CK24v-0006sx-KN
	for linux-mtd@lists.infradead.org; Tue, 19 Oct 2004 18:03:40 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Michael Moedt <xemc@yahoo.com>
In-Reply-To: <20041019214518.26339.qmail@web52703.mail.yahoo.com>
References: <20041019214518.26339.qmail@web52703.mail.yahoo.com>
Content-Type: text/plain
Message-Id: <1098222917.12223.1020.camel@thomas>
Mime-Version: 1.0
Date: Tue, 19 Oct 2004 23:55:17 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, simon@baydel.com
Subject: Re: Bad Blocks On JFFS2/NAND
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-10-19 at 23:45, Michael Moedt wrote:
> 1. Do you know what usually causes the "Newly-erased block contained
> word   "... error?
> Is it caused by a interrupted (or otherwise failed) erase?  Would
> power-fail cause this?

It's caused by a failed erase. If the chip interface is correct then it
is usually a problem of a bad page/block. If not (e.g. wrong timing) it
might return too early from an erase.

> 2. Would this cause good blocks to be incorrectly [and permanently]
> marked as bad?

Only if failes 5 times after mount. The counter is reset with each
mount.

> 
> I think I may have seen something similar on my system.  I'm
> considering writing a test to see if this is a problem for me, but
> I'd like to learn more about this also.

Which version of the mtd/nand code ?

There was a problem with the page cache, which was not invalidated on
erase some time ago, but its fixed.

tglx
