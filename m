Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EnNtb-0003TM-FT
	for linux-mtd@lists.infradead.org; Fri, 16 Dec 2005 17:17:49 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Charles Manning <manningc2@actrix.gen.nz>
In-Reply-To: <200512170853.32451.manningc2@actrix.gen.nz>
References: <43A1484C.5030300@ru.mvista.com>
	<200512161144.19130.manningc2@actrix.gen.nz>
	<43A28959.1030108@ru.mvista.com>
	<200512170853.32451.manningc2@actrix.gen.nz>
Content-Type: text/plain
Date: Fri, 16 Dec 2005 23:24:42 +0100
Message-Id: <1134771882.2806.35.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Vitaly Wool <vwool@ru.mvista.com>
Subject: Re: [RFC] the way to proceed with OOB data
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2005-12-17 at 08:53 +1300, Charles Manning wrote:
> > So, lemme a bit disagree with you, I hope that makes sense a bit :)
> 
> OK, I admit I'm looking at this through YAFFS eyes. YAFFS always writes one 
> page at a time, so this would not be an issue.
> 
> Do any other fs or users write multiple NAND pages at a time? If so how do 
> they handle any failures?

Well, return an error and the number of safely written bytes. The fs
requested n bytes to be written and gets the number of actually written
bytes. It makes not much of a difference to handle such a scenario or
the write per page failure.

	tglx
