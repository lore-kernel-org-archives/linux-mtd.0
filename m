Received: from [64.170.22.142] (helo=mail.spewey.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15PEoL-0003tF-00
	for <linux-mtd@lists.infradead.org>; Wed, 25 Jul 2001 03:54:09 +0100
Message-Id: <5.1.0.14.0.20010724220606.00a67960@mail.spewey.com>
Date: Tue, 24 Jul 2001 22:12:27 -0500
To: olea@hispafuentes.com,linux-mtd@lists.infradead.org
From: Vipin Malik <vipin@embeddedlinuxworks.com>
Subject: Re: Ask for some guidance...
Cc: juan@hispafuentes.com
In-Reply-To: <3B5DBF28.94BBF1A@hispafuentes.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

At 08:32 PM 7/24/2001 +0200, olea@hispafuentes.com wrote:


>Our problem is that Linux can't see the IDE device.
>
>Since the machine is designed and built by a third company (other than
>our client) we don't have any information about the implementation.
>
>We have investigated the machine and we have some suppositions:
>
>         - the bios doesn't look modified to access the flash ide disk;
>         - there isn't any Samsung flash controler chip in the board;
>         - the board has some chips looking as programmable roms;
>         - it's looks that this chips are a firmware for doing the FTL.


It's not trivial to do FTL inside some "prom's". Depending on how large 
(rather small) they are, they may be doing just chip decoding.

Most of the times IDE disk's are emulated under a "special" BIOS that 
translate the BIOS IDE int (int 13?) into read/writes of the Flash sectors.
What BIOS is it using? I know that General Software's Embedded BIOS 
supports that functionality.

There is not much that you can do re. accessing this disk under Linux as 
Linux does not use the BIOS for IDE disk access.



>Our questions are:
>
>         - How can we probe that there is a firmware doing the FTL and
>which firmware is it?

Simple (!), use "Debug" under DOS, to trace into the BIOS IDE interrupt and 
see that it does.


>         - Do you think we could access to the flash disk using MTD?

That's probably the most sensible approach in my mind- though you would not 
access the flash _disk_, rather just the flash under MTD, which would show 
up as a char and block device on which you could then mount JFFS2 and then 
access it like a regular file system through Linux, including booting from it.

Vipin
