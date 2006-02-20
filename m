Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FBHAf-0002Ew-8T
	for linux-mtd@lists.infradead.org; Mon, 20 Feb 2006 14:58:10 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Ben Dooks <ben-mtd@fluff.org>
In-Reply-To: <20060220153536.GD7092@home.fluff.org>
References: <1140447277.1638.63.camel@fuzzie.sanpeople.com>
	<20060220153536.GD7092@home.fluff.org>
Content-Type: text/plain
Date: Mon, 20 Feb 2006 20:59:06 +0100
Message-Id: <1140465547.2480.764.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND driver for AT91RM9200
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I'm interested in why you feel necessary to over-ride the extant
> small page read/write code here, it should be ok to use the command
> code to move the IO address that the nand core code uses
> (see the s3c2410 nand driver, and others).
> 
> Maybe it would be worth fixing the core code handling for large
> page devices?

It works with large page devices in the same way with the modified
->IO_ADDR_WR modifications in ->hw_control

	tglx
