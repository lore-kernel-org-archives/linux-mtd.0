Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BaxI8-0004We-Uw
	for linux-mtd@lists.infradead.org; Thu, 17 Jun 2004 09:50:57 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
In-Reply-To: <EFF9A3506F74924AB5CC77BDC66E79351812B9@atcml01.atc.army.mil>
References: <EFF9A3506F74924AB5CC77BDC66E79351812B9@atcml01.atc.army.mil>
Content-Type: text/plain
Message-Id: <1087480240.19489.2974.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 17 Jun 2004 14:50:40 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOC Mil Plus 32 any work being done?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-06-17 at 09:33 -0400, Carlos, John J USAATC wrote:
> Hi,
> 
>   Is anyone actually working on getting support for the Millennium Plus 32M
> chip.  I looked at the latest patch and unfortunately work on that chip
> hasn't been added.

The Millennium Plus is a little more bizarre than the other DiskOnChip
devices which we support; it'll take a little more to massage it into
the generic NAND framework, although Thomas seems to think it won't be
hard. 

Unfortunately, although I am able to give limited access to DiskOnChip
2000 and Millennium documentation, I can't do the same for the
Millennium Plus. So you have to sort of pick it up from the existing
code in drivers/doc2001plus.c. 

Can you join us on IRC? irc.freenode.net channel #mtd

>   I have been trying to hack up the code but don't have
> much knowledge in this area.  I am sure what I am doing is time ill spent
> other then getting a small understanding of the problem.  I am doing a lot
> of cut and paste to the diskonchip.c file. 

I suspect there isn't enough shared code to make it worth adding
Millennium Plus support to diskonchip.c. You'd probably do better to
create a new driver in drivers/nand for the Millennium Plus. You can
still base it on diskonchip.c of course.

If all you need to do is make INFTL work though, I suspect the
devices/doc2001plus driver ought to be sufficient for now. Your problem
wasn't actually with the low-level hardware driver; it was with the
INFTL formatting wasn't it?


-- 
dwmw2
