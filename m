Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EWdqe-0008Uw-1S
	for linux-mtd@lists.infradead.org; Mon, 31 Oct 2005 12:53:38 -0500
Message-ID: <43665A85.9020502@ru.mvista.com>
Date: Mon, 31 Oct 2005 20:55:17 +0300
From: Sergei Shtylylov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: Leif Lindholm <leif.lindholm@i3micro.com>, linux-mtd@lists.infradead.org
References: <4363DF17.6080906@ru.mvista.com>	
	<1130745519.12171.93.camel@localhost.localdomain>
	<1130769581.6003.43.camel@localhost>
In-Reply-To: <1130769581.6003.43.camel@localhost>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: [PATCH] NAND: Fix NAND ECC errors on AMD Au1550
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

Leif Lindholm wrote:

> On Sun, 2005-10-30 at 23:58 -0800, Pete Popov wrote:
> 
>>It works on the Db1550. I need to run a sanity check on the Db1200. If
>>no one has any objections, I'll commit it in the next couple of days
>>after I check the Db1200.
> 
> 
> Just a comment (forgot to post this last time around):
> At least one of the chips we're using - identified as
> "NAND device: Manufacturer ID: 0xec, Chip ID: 0x76 (Samsung NAND 64MiB 3,3V 8-bit)"
> seems to also need the CS manually asserted during a READID operation.

    Well, the static bus controller seems to hold -CE asserted itself (at
least from what can be seen in the timing diagrams from the Au1550 datasheet)
-- presumably until it has to release it in favor of servicing I/O via another
chip select. That's the point that causes some concern about my patch since I
was unable to assure myself that the chip can tolerate -CS release (and
re-assertion later) during the sector read and not to interrupt the read.
However, the patch proved working, so...

> This made the if-statements ridicilously long, so I added a case
> statement and a variable keeping track of wether or not to force-enable
> CS to the au1550_command function.

    Hm, at what point -CE should be forced low for ID read?

WBR, Sergei
