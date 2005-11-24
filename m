Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EfOVN-0001Pe-D0
	for linux-mtd@lists.infradead.org; Thu, 24 Nov 2005 16:19:53 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Stefan Roese <sr@denx.de>
In-Reply-To: <200511242145.00013.sr@denx.de>
References: <AHEILKONAKAEJPHNMOPNIELBCDAA.hs@denx.de>
	<200511231311.51467.sr@denx.de>
	<1132831796.32542.183.camel@tglx.tec.linutronix.de>
	<200511242145.00013.sr@denx.de>
Content-Type: text/plain
Date: Thu, 24 Nov 2005 22:24:57 +0100
Message-Id: <1132867497.32542.268.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: Add P3P440 MTD support
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-11-24 at 21:44 +0100, Stefan Roese wrote:
> Please let me know, if this version is still not acceptable:

Looks good. Thanks for cooperation.

Enqueued into the pending patch queue, which gets committed in the next
days.

	tglx


PS: One really nitpicking comment

+/*             .size = RW_PART2_SZ */ /* will be adjusted dynamically */

looks ugly and twists my brain :)
