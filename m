Received: from ns1.idleaire.net ([65.220.16.2] helo=iasrv1.idleaire.net)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CehdG-0005Ab-9x
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2004 17:28:35 -0500
From: Dave Dillow <dave@thedillows.org>
To: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
In-Reply-To: <EFF9A3506F74924AB5CC77BDC66E7935181390@atcml01.atc.army.mil>
References: <EFF9A3506F74924AB5CC77BDC66E7935181390@atcml01.atc.army.mil>
Content-Type: text/plain
Message-Id: <1103149709.5814.8.camel@dillow.idleaire.com>
Mime-Version: 1.0
Date: Wed, 15 Dec 2004 17:28:29 -0500
Content-Transfer-Encoding: 7bit
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: Big Problem with DOC 128Mbyte Help!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-12-15 at 09:38, Carlos, John J USAATC wrote:
> I get read errors if I try to list what might be in them
> and a df shows only 1% use, with all files on it it is at 54%.
> 
>   QUESTION:  What/why could this be happening.  Why would the boot loader be
> trashing my DiskOnChip???????????

Two possible reasons:
1) I'm pretty sure the Linux INFTL driver uses the wrong scheme to
calculate the block header parity bits. I'll have to find old code to
check this/remember the fix.
2) If your chipset has errata, such that receiving an interrupt during a
multibyte read on the bus causes the data to discarded and the read
re-issued, then M-System's firmware could be getting bad data and think
that the virtual unit is corrupt.

I tripped over #2 using SiS55x chipsets. M-System's firmware was erasing
blocks if I typed on the keyboard while reading from the DoC, but the
Linux driver wasn't. It turned out that M-System's firmware issued
4-byte reads (ie, memcpy), and the Linux driver did one byte at a time.
Linux was slower, but unaffected by the chip errata. I believe it's been
hit before, hence the move away from memcpy_from/toio() in the driver.
-- 
Dave Dillow <dave@thedillows.org>
