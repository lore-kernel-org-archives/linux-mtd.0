Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16qWik-0002wb-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2002 10:01:26 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200203281000.g2SA0qG16192@thomas.tec.autronix.de> 
References: <200203281000.g2SA0qG16192@thomas.tec.autronix.de>  <541025071C7AC24C84E9F82296BB9B952CE4@OPTEX1.optex.local> 
To: gleixner@autronix.de
Cc: "John Hall" <John.Hall@optionexist.co.uk>,
    linux-mtd@lists.infradead.org
Subject: Re: JFFS2 NAND flash support 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 28 Mar 2002 10:01:19 +0000
Message-ID: <26882.1017309679@redhat.com>
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

John.Hall@optionexist.co.uk said:
>  Our hardware interface is a btit weird (ALE and CLE are controlled by
> address lines...). I also can get interrupts from the busy pin, so
> I've changed the code so it doesn't do busy waits as nand.c does.

Good. You can actually implement the async erases that the MTD erase API 
was designed for.

You return zero from the erase() function to indicate that the request was 
started OK, then later you set the instr->state to indicate whether the 
erase succeeded or not, and call the callback.

The only thing to beware of is that users will currently not expect the 
callback to be called in interrupt context; only in bottom half context - 
and I'm thinking of changing that to allow only _process_ context. You can 
use schedule_task() to schedule the callback from the interrupt handler.

--
dwmw2
