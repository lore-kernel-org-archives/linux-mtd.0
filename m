Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CDrQS-00006w-8l
	for linux-mtd@lists.infradead.org; Sat, 02 Oct 2004 17:28:21 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1096751556.18638.16.camel@localhost.localdomain>
References: <200410011858.28776.skorinkod@mosk.ru>
	<1096751135.21297.73.camel@thomas>
	<1096751556.18638.16.camel@localhost.localdomain>
Content-Type: text/plain
Message-Id: <1096752038.21297.75.camel@thomas>
Mime-Version: 1.0
Date: Sat, 02 Oct 2004 23:20:38 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, skorinkod@mail.ru
Subject: Re: Problems with DiskOnChip 2000
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2004-10-02 at 23:12, David Woodhouse wrote:
> On Sat, 2004-10-02 at 23:05 +0200, Thomas Gleixner wrote:
> > 
> > None of those ID's is a valid chip ID except the 0x36, which is a
> > 64MiB,1.8V chip. I doubt, that there are DoC's available with 1.8V
> > supply. The stuff looks more like random nonsense.
> 
> That's DiskOnChip ChipID, not NAND chip ID. But yes, it looks like
> random crap from other addresses, probably BIOS or extension ROMs.

Yep, I mixed that up.

tglx
