Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Certr-0008NR-39
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2004 04:26:22 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Shen Aaron-r62966 <aaron.shen@freescale.com>
In-Reply-To: <9FCDBA58F226D911B202000BDBAD467307D4DC@zch01exm40.sps.mot.com>
References: <9FCDBA58F226D911B202000BDBAD467307D4DC@zch01exm40.sps.mot.com>
Content-Type: text/plain
Date: Thu, 16 Dec 2004 10:26:14 +0100
Message-Id: <1103189174.3406.201.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problem of sending reset operation for NAND flash
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-12-16 at 17:07 +0800, Shen Aaron-r62966 wrote:
> Is there any difference to send the reset command? Anybody can give comments 
> to me?

Yes.

1, Fix you mail client. Read http://www.infradead.org/~dwmw2/email.html

2. A command is a command. Read the datasheet.

3. I don't have any witchcraft abilities to figure out what _xzy_zyx_xzy
is and I don't see any relevance to MTD/NAND code. 

tglx
