Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DVz1q-0002lc-5K
	for linux-mtd@lists.infradead.org; Wed, 11 May 2005 17:46:06 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: m.mikolaiczyk@rac.de
In-Reply-To: <4281C196.2010806@rac.de>
References: <4281C196.2010806@rac.de>
Content-Type: text/plain
Date: Wed, 11 May 2005 21:46:57 +0000
Message-Id: <1115848017.22180.112.camel@tglx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Patching only NAND specific stuff possible?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-05-11 at 10:25 +0200, Marcus Mikolaiczyk wrote:
> Considering the four Layers (jffs2,mtd,nand,hardware-drivers) it should
> be possible onloy to 'update' the nand and hardware-drivers stuff.
> Any objections to this?

No, as long as you do not ask questions, why it doesnt work. :)
The current nand driver needs the current mtd layer and JFFS2 from the
last century will not work with those.

> A secondary short question, if you don't mind.
> Where takes the 'addressing' of the NAND takes place (write Col,Row to ALE)?

nand_command(_lp) depending on the device type.

> On the Samsung K9F2G08... there are 5 Cycles for the address resolution
> I saw some NAND chips which only have 4 Address Cycles.

Thats handled by the nand driver depending on the chip size.

tglx
