Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17kX1M-0004Mz-00
	for <linux-mtd@lists.infradead.org>; Thu, 29 Aug 2002 22:40:08 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H1M00JRQK61ZZ@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Thu, 29 Aug 2002 23:39:38 +0200 (MEST)
Date: Thu, 29 Aug 2002 23:39:09 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: JFFS2 and DOC
In-reply-to: <200208292124.57483.hno@marasystems.com>
To: Henrik Nordstrom <hno@marasystems.com>
Cc: linux-mtd@lists.infradead.org
Message-id: <1030657149.11505.72.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
References: <200208292124.57483.hno@marasystems.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Thu, 2002-08-29 at 21:24, Henrik Nordstrom wrote:
> What is the current status of JFFS2 and DOC?
> 
> >From what I understand the current CVS includes many fixes for DOC, but is 
> there also support for JFFS2 ontop of DOC?
No
> Is the intention to run JFFS2 directly on the flash, or ontop of NTFL?
The intention is to run direct on the flash. The generic nand driver
could handle doc with some minor modifications. And a DOC driver
matching the nand driver has to be written. I will do this, if I have
some time for it or somebody convinces me with a contract to have time
for it.

-- 
Thomas 
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
