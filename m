Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DGxI4-00040h-Dl
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2005 05:52:45 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Joshua Wise <joshua@joshuawise.com>
In-Reply-To: <424B4FFA.7050906@joshuawise.com>
References: <424B4FFA.7050906@joshuawise.com>
Content-Type: text/plain
Date: Thu, 31 Mar 2005 13:52:46 +0200
Message-Id: <1112269966.4228.68.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Matt Reimer <mreimer@vpop.net>, linux-mtd@lists.infradead.org
Subject: Re: oobavail issues
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-03-30 at 20:18 -0500, Joshua Wise wrote:
> We found that making our oobfree match up with oobavail seemed to do the 
> trick for avoiding this, and make JFFS2 work, to boot! Here's what we did:
>
> I suspect that oobavail should be summing oobfree instead of doing that 
> arithmetic. Or is there something I'm not seeing?

In general you're right. oobavail should be derived from oobfree, but in
case of JFFS2 this does not matter at all.

Which problem went away with your changes ?

tglx
