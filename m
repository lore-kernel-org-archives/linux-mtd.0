Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CNJaf-0001Cy-3R
	for linux-mtd@lists.infradead.org; Thu, 28 Oct 2004 19:21:58 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Ben Dooks <ben@fluff.org.uk>
In-Reply-To: <20041028230640.GB13105@home.fluff.org>
References: <20041028230640.GB13105@home.fluff.org>
Content-Type: text/plain
Date: Fri, 29 Oct 2004 01:13:43 +0200
Message-Id: <1099005223.22387.501.camel@thomas>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Read/nBusy via interrupt
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-10-29 at 00:06 +0100, Ben Dooks wrote:
> Does anyone here have any comments over the pros/cons of using
> an interrupt which goes off to wait for a NAND flash ready/not-busy
> signal?

Sure.

- It makes totaly sense for long lasting operations like program/erase.
- It's overkill for read operations.

You can make it work by supplying a wait function, which implements the
irq driven wait for program/erase. Don't forget the timeout !

tglx
