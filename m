Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1COvNl-0004Ub-Cs
	for linux-mtd@lists.infradead.org; Tue, 02 Nov 2004 04:55:18 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Ed Berube <eberube@gmail.com>
In-Reply-To: <a084b59f04110114152b341fea@mail.gmail.com>
References: <a084b59f04110114152b341fea@mail.gmail.com>
Content-Type: text/plain
Date: Tue, 02 Nov 2004 10:46:40 +0100
Message-Id: <1099388800.3337.68.camel@thomas>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD Driver problem/question with 384MB MD2202-D384.
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-11-01 at 17:15 -0500, Ed Berube wrote:
> I have to ask is the MD2202-D384 supported by MTD?  Is there a work
> around to get this DOC to work with MTD.  Or am I missing something
> and this should all be working.

Which DoC driver are you using ? 
drivers/mtd/devices/doc...
or 
drivers/mtd/nand/diskonchip.c

The latter is the one we support. Can you try it ?

The DoC firmware version is not really relevant for the first step. The
first step is to make sure, that the chip driver itself recognizes the
devices correctly. The firmware version is relevant for the (I)NFTL
drivers, which can only work when the device can be handled by the low
level driver.

tglx
