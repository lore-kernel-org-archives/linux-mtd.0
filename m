Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DCPdx-0007OO-26
	for linux-mtd@lists.infradead.org; Fri, 18 Mar 2005 17:08:33 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: "Robert P. J. Day" <rpjday@mindspring.com>
In-Reply-To: <Pine.LNX.4.61.0503181635320.31009@localhost.localdomain>
References: <Pine.LNX.4.61.0503181635320.31009@localhost.localdomain>
Content-Type: text/plain
Date: Fri, 18 Mar 2005 23:08:29 +0100
Message-Id: <1111183709.17944.8.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: will auto-formatting span physical flash chips?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-03-18 at 16:54 -0500, Robert P. J. Day wrote:
>   can the second physical chip still be left as all unformatted xFF's?
> so that it will be auto-formatted on mount?  apparently, it costs
> money to format each chip and, since they're delivered with all xFF's,
> it would be nice to leave the second chip that way and save the $$.
> 
>   can this be done?

JFFS2 does the formatting of the second chip on the first mount.

tglx
