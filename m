Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FscIc-0001M7-9U
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 10:13:33 +0100
Subject: Re: [PATCH] AT91RM9200 NAND support
From: Thomas Gleixner <tglx@linutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1150794428.3176.475.camel@pmac.infradead.org>
References: <1150786454.15581.289.camel@fuzzie.sanpeople.com>
	<1150787336.6780.102.camel@localhost.localdomain>
	<1150794428.3176.475.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Tue, 20 Jun 2006 11:14:41 +0200
Message-Id: <1150794881.6780.113.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-06-20 at 10:07 +0100, David Woodhouse wrote:
> On Tue, 2006-06-20 at 09:08 +0200, Thomas Gleixner wrote:
> > As I pointed out in my previous mail, the driver needs to be updated to
> > work with the latest changes in the nand driver. 
> 
> Apologies for not pulling this into the git tree earlier, btw. If I'd
> done that _before_ the recent round of changes, then it would have been
> updated with the others.

Fixed it already. When its confirmed to work, I put it in

	tglx
