Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 184gfq-0002gP-00
	for <linux-mtd@lists.infradead.org>; Thu, 24 Oct 2002 13:01:14 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H4H0099RK3316@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Thu, 24 Oct 2002 14:30:39 +0200 (MEST)
Date: Thu, 24 Oct 2002 14:28:55 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: does mtd support both toshiba and samsung 128MBytes (1GBits) nand
 flash?
In-reply-to: <014201c27b48$799ba360$b30210ac@gv.com.tw>
To: ?? <kevin@gv.com.tw>, David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200210241428.55154.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <013d01c2388f$94c655a0$1b0448c0@gv.com.tw>
 <0H05001Y6RM950@smtp-out.bhp.t-online.de>
 <014201c27b48$799ba360$b30210ac@gv.com.tw>
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

On Thursday 24 October 2002 12:31, ?? wrote:
> dear all,
>
> does mtd support both toshiba and samsung 128MBytes (1GBits) nand flash?
Yes, see include/linux/mtd/nand_ids.h
-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
