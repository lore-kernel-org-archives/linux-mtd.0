Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D78gG-0007ph-16
	for linux-mtd@lists.infradead.org; Fri, 04 Mar 2005 04:01:08 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Steven Scholz <steven.scholz@imc-berlin.de>
In-Reply-To: <42280EB6.4030007@imc-berlin.de>
References: <1109841282.5398.30.camel@tglx.tec.linutronix.de>
	<1109845739.16158.14.camel@hades.cambridge.redhat.com>
	<1109846656.4370.20.camel@tglx.tec.linutronix.de>
	<1109846792.16158.20.camel@hades.cambridge.redhat.com>
	<1109847189.4370.27.camel@tglx.tec.linutronix.de>
	<1109847630.16158.22.camel@hades.cambridge.redhat.com>
	<4226F51A.7070603@imc-berlin.de>
	<Pine.LNX.4.62.0503031146070.15953@localhost.localdomain>
	<1109874008.29792.92.camel@baythorne.infradead.org>
	<42280EB6.4030007@imc-berlin.de>
Content-Type: text/plain
Date: Fri, 04 Mar 2005 10:00:54 +0100
Message-Id: <1109926854.4032.114.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: [RFD] Move 2.4 code out from CVS head
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-03-04 at 08:31 +0100, Steven Scholz wrote:
> How about SUMMARY patch then? ;-)
> Seriously, since JFFS3 will not get into the 2.4 stuff Ferenc's SUMMARY patch 
> would be nice!

That's exactly the point. Next week somebody comes up with another nice
feature and you or somebody else will ask "how about that ?".

> And BTW: How do I get the 2.4 branch from CVS?

David and I agreed not to have a 2.4 devel branch exactly for that
reason. You can get the latest working version by cvs up -D2005-03-01 or
whatever date will be the deadline.

tglx
