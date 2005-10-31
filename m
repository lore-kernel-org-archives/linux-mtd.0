Received: from smtp102.biz.mail.mud.yahoo.com ([68.142.200.237])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EWc4p-000793-Mp
	for linux-mtd@lists.infradead.org; Mon, 31 Oct 2005 11:00:08 -0500
From: Pete Popov <ppopov@embeddedalley.com>
To: Leif Lindholm <leif.lindholm@i3micro.com>
In-Reply-To: <1130769581.6003.43.camel@localhost>
References: <4363DF17.6080906@ru.mvista.com>
	<1130745519.12171.93.camel@localhost.localdomain>
	<1130769581.6003.43.camel@localhost>
Content-Type: text/plain
Date: Mon, 31 Oct 2005 08:00:02 -0800
Message-Id: <1130774403.12171.111.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Sergei Shtylylov <sshtylyov@ru.mvista.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] NAND: Fix NAND ECC errors on AMD Au1550
Reply-To: ppopov@embeddedalley.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-10-31 at 15:39 +0100, Leif Lindholm wrote:
> On Sun, 2005-10-30 at 23:58 -0800, Pete Popov wrote:
> > It works on the Db1550. I need to run a sanity check on the Db1200. If
> > no one has any objections, I'll commit it in the next couple of days
> > after I check the Db1200.
> 
> Just a comment (forgot to post this last time around):
> At least one of the chips we're using - identified as
> "NAND device: Manufacturer ID: 0xec, Chip ID: 0x76 (Samsung NAND 64MiB 3,3V 8-bit)"
> seems to also need the CS manually asserted during a READID operation.
> 
> This made the if-statements ridicilously long, so I added a case
> statement and a variable keeping track of wether or not to force-enable
> CS to the au1550_command function.
> 
> If there is any interest, I could post a patch, but am unsure of the
> correct way. Should I send a new patch against cvs HEAD containing my
> trivial tweak as well as Sergeis modifications, or...?

Send an incremental patch on top of Sergey's patch if you can.

Pete
