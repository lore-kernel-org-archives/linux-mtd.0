Received: from mail3.asianet.co.th ([203.144.222.231] helo=mail.asianet.co.th)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkgMR-0001gU-Bi
	for linux-mtd@lists.infradead.org; Wed, 14 Jul 2004 05:47:36 -0400
Received: from virscan3.asianet.co.th (HELO mail.asianet.co.th)
	([203.144.222.224]) (envelope-sender <jay4mail@yahoo.com>)
	by mail3.asianet.co.th (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 14 Jul 2004 16:47:28 +0700
Message-ID: <40F50325.3000404@yahoo.com>
Date: Wed, 14 Jul 2004 16:55:49 +0700
From: Pathompong Puengrostham <jay4mail@yahoo.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <40F4B205.6060902@yahoo.com> <40F4BD37.4090500@yahoo.com>
	<1089790912.5274.61.camel@thomas.tec.linutronix.de>
In-Reply-To: <1089790912.5274.61.camel@thomas.tec.linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 on NAND, Magic bitmask 0x1985 not found
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:
> On Wed, 2004-07-14 at 06:57, Pathompong Puengrostham wrote:
> 
>>Hi,
>>
>>I just found the problem. It is that my NAND flash CE pin is not driven 
>>by GPIO. It is driven by CS from the CPU. Here is the change that I made.
> 
> 
> Ok, I accept the change in nand_verify_pages. I expected this to break,
> as it was stated in the comment. But for sure we will not invent a new
> CONFIG_ switch, we have an options field for such stuff already, also
> using a wait for ready there in any case will be enough.
> 
> 
>>I also had to add the following to my nand_init().
>>
>>for (i = 0; nand_flash_ids[i].name != NULL; i++)
>>	nand_flash_ids[i].options |= NAND_NO_AUTOINCR;
> 
> 
> Sorry, thats crap. The options are defined in nand_ids.c and are not a
> subject to be modified anywhere else. If you want to have the
> NO_AUTOINCR option set for your board, then set it in the options field
> before calling nand_scan. The bit is not overwritten by the option init
> in nand_scan.
> 

Thank you for pointing that out. I just read the nand_scan code. I
didn't know I can do that. I copied the code from spia.c and changed
only the low-level stuff.

> Which chiptype are you using exactly? 
> 

I'm using Samsung K9F5608U0C.

> The changes you made make not really sense as you put in delays which
> are neccecary for chips, which do autoincrement. Those chips which can
> not autoincrement do neither need a wait nor a deselect/select after a
> page is read.
> 
> tglx
> 

The chip I'm using do autoincrement but I thought that after CE goes
high I have to send the read command again which is not correct.
Now I don't set NAND_NO_AUTOINCR and it works good. But I still need the
delays.

Jay
