Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=executor.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15PTtU-0004j0-00
	for <linux-mtd@lists.infradead.org>; Wed, 25 Jul 2001 20:00:28 +0100
Date: Wed, 25 Jul 2001 20:06:13 +0100 (BST)
From: David Woodhouse <dwmw2@redhat.com>
To: <olea@hispafuentes.com>
Cc: <linux-mtd@lists.infradead.org>, <juan@hispafuentes.com>
Subject: Re: Ask for some guidance...
In-Reply-To: <3B5DBF28.94BBF1A@hispafuentes.com>
Message-ID: <Pine.LNX.4.33.0107251953560.4023-100000@passion.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Tue, 24 Jul 2001 olea@hispafuentes.com wrote:

> We are porting Linux to a kind of PDA built on a ELAN SC400 processor.
> It has two Samsung KM29U128T flash chips running as an IDE hard disk.

Why do you say 'IDE'? It's most likely that there's just a BIOS extension 
which makes it appear as a block device under DOS via INT 13h.

> Our problem is that Linux can't see the IDE device.

You've given no reason to assume it's actually connected through a real
IDE interface. I assume Linux doesn't see any SCSI block devices or USB
block devices either :)

> We have investigated the machine and we have some suppositions:
> 
>         - the bios doesn't look modified to access the flash ide disk;
>         - there isn't any Samsung flash controler chip in the board;
>         - the board has some chips looking as programmable roms;
>         - it's looks that this chips are a firmware for doing the FTL.

All sounds sane.

> Our questions are:
> 
>         - How can we probe that there is a firmware doing the FTL and
> which firmware is it?

Scan the BIOS extension areas (0xc0000-0xeffff) and use 'strings' on any
which you find. What does it say when it's booting?

> 	- Do you think we could access to the flash disk using MTD?

If it's actually _the_ FTL, rather than just _a_ flash translation layer,
then yes - we have code do to that if you just make it find the flash
chips - the 'physmap' driver, appropriately configured, will probably do
that for you.

First find out where in the physical memory map the flash chips are mapped
and make them work under Linux. Then we can look at the BIOS extension and
the current contents of the flash chips to see if it's actually FTL or
something else that we recognise.

-- 
dwmw2
