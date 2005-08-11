Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E3Jiu-0003ON-TR
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2005 16:32:24 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Todd Poynor <tpoynor@mvista.com>
In-Reply-To: <42FBB3B1.2080609@mvista.com>
References: <42FB5E72.2010402@ru.mvista.com>  <42FBB3B1.2080609@mvista.com>
Content-Type: text/plain
Date: Thu, 11 Aug 2005 20:31:47 +0000
Message-Id: <1123792307.23647.71.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Vitaly Wool <vwool@ru.mvista.com>
Subject: Re: power management routines for NAND driver
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-08-11 at 13:23 -0700, Todd Poynor wrote:

> Yes, the pm_send etc. APM-style calls are deprecated.  The Linux Driver 
> Model PM hooks (incl. struct device_driver suspend/resume callbacks) are 
> the way to do it now.  I floated a patch for another board in thread 
> "MTD PM Resume" in July that does approximately what you're talking 
> about, although calling existing Intel/Sharp CFI NOR flash routines.  If 
> there's no objections to that style of PM support then I'll check it in.

I removed the pm_oldstyle stuff in mtdcore.c anyway. 

Look at the SA1100 driver as reference. Thats the way to go.

tglx
