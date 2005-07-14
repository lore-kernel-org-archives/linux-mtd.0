Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1Dt2z0-0005gy-Ik
	for linux-mtd@lists.infradead.org; Thu, 14 Jul 2005 08:38:55 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Sunil Khandelwal <sunil_khandelwal@yahoo.com>
In-Reply-To: <20050714122812.33576.qmail@web31714.mail.mud.yahoo.com>
References: <20050714122812.33576.qmail@web31714.mail.mud.yahoo.com>
Content-Type: text/plain
Date: Thu, 14 Jul 2005 14:42:01 +0200
Message-Id: <1121344921.24449.60.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Nand Flash driver for dedicated conroller
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-07-14 at 05:28 -0700, Sunil Khandelwal wrote:
> I have an ARM based board, which has a flash
> controller on chip.
> 
> There is no way I can control the signals like ALE, CE
> etc to flash directly. 

Read http://www.linux-mtd.infradead.org/tech/mtdnand/x76.html

> How can I use nand.c of mtd in my driver specially as
> it expect me to control IO lines.

There is no nand.c

tglx
