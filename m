Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DyTrc-0001KV-76
	for linux-mtd@lists.infradead.org; Fri, 29 Jul 2005 08:21:26 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Sean Young <sean@mess.org>
In-Reply-To: <20050729115913.GA7389@atlantis.8hz.com>
References: <20050729115913.GA7389@atlantis.8hz.com>
Content-Type: text/plain
Date: Fri, 29 Jul 2005 14:25:18 +0200
Message-Id: <1122639918.26146.87.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/rfd_ftl.c not in git?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-07-29 at 13:59 +0200, Sean Young wrote:
> rfd_ftl.c is not in git so it won't be included in Linus' tree. What is the
> reason for this?

We usually let new stuff breed a while in the CVS and -mm. It's in the
queue for the next update.

tglx
