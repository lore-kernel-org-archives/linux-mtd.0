Received: from miranda.axis.se ([193.13.178.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16eJ5e-0006F0-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Feb 2002 17:02:34 +0000
Message-ID: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6DE9@mailse01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: "'Robert Kaiser '" <rob@sysgo.de>
Cc: "'linux-mtd@lists.infradead.org '" <linux-mtd@lists.infradead.org>
Subject: RE: Re-entrancy of flash erase/write
Date: Fri, 22 Feb 2002 18:13:14 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

> Am I right in assuming that it is not possible to erase
> and/or write different blocks of the same flash chip
> concurrently ?

Some chips allow it and some don't. Those that allow it require all simultaneous erases to be started within a very short timeout. None of the chip drivers use that feature I think.

> If so, where is the lock in the MTD code that would
> prevent concurrent execution of erase/write on the
> same chip by multiple processes ?

I haven't got the code in front of me, but I think it is in the beginning of the erase_oneblock-functions (in cfi_cmdset_0002.c at least). There's a status variable in the flashchip struct and processes are put on a waitqueue if the chip is busy.

/Jonas
