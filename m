Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17wmt3-0002yN-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2002 18:02:13 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H3D007MU5YQYV@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 02 Oct 2002 19:01:39 +0200 (MEST)
Date: Wed, 02 Oct 2002 19:00:34 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: nor and nand on same system
In-reply-to: <1033573620.5141.6.camel@AladinSane>
To: Jim Stewart <jstewart@celerox.com>, linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200210021900.34742.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <1033573620.5141.6.camel@AladinSane>
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

On Wednesday 02 October 2002 17:46, Jim Stewart wrote:
> I am designing a system that may contain both nor and nand flash in the
> same system (NAND flash for future expansion and nor for boot and root
> fs).
cool

> I have looked over the MTD documentation, how-to's, etc. and it seems
> that the driver level is linked to a SINGLE specific hardware
> implementation. Is it possible to have two separate drivers -- one for
> the nor device (probably using the current CFI drivers) and one for a
> NAND device?
Yep, each device has it's own driver. They live side by side, as long they 
arent configured to access the same physical device, which is unlikely for 
NAND and NOR.

> I plan on using the JFFS as the MTD client
JFFS does not support NAND, JFFS2 does

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
