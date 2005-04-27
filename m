Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DQjtW-00018c-JV
	for linux-mtd@lists.infradead.org; Wed, 27 Apr 2005 06:35:51 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: "Timofei V. Bondarenko" <timm@ipi.ac.ru>
In-Reply-To: <426F691D.50905@ipi.ac.ru>
References: <426F40A3.8010308@ipi.ac.ru>
	<1114592403.879.175.camel@tglx.tec.linutronix.de>
	<426F56C1.6020204@ipi.ac.ru>
	<1114598706.879.185.camel@tglx.tec.linutronix.de>
	<426F691D.50905@ipi.ac.ru>
Content-Type: text/plain
Date: Wed, 27 Apr 2005 13:35:47 +0200
Message-Id: <1114601747.879.199.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: nand locking
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-04-27 at 14:27 +0400, Timofei V. Bondarenko wrote:
> > Lock/unlock are general features and should be added to nand_base.c.
> > I guess the chips which have those functions can be identified and an
> > appropriate option flag set in the ID list, which then lets nand_scan
> > decide whether to fill in the lock/unlock function pointers or not.
> 
> An easy problem: I'm looking for the simplest way to protect
> read-only mtd partitions by hardware lock.
> The current nand_base seems lack of this feature.
> Should i hack the nand_base? Or is there a correct workaround?

As I said above, it is functionality which should be integrated cleanly
into nand_base.c. It should be automatically available for those chips
which support it.

There is no workaround. Its missing and must be added. I'm happy if you
can provide a patch.

> It awaits since 18 Apr - longer than a week... is it ok?

David Woodhouse was travelling last week

> Are there other ways to submit a patch? (a small bugfix to cmdlinepart).
> AFAIK, placing diffs into message text is not welcomed too.

It's a correct way to do it, when your mail client can handle the
whitespace (tabs) correct and does no line truncating at 80, which is
requested for the mail text itself.

tglx
