From: David Woodhouse <dwmw2@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <1096751135.21297.73.camel@thomas>
References: <200410011858.28776.skorinkod@mosk.ru>
	<1096751135.21297.73.camel@thomas>
Content-Type: text/plain
Date: Sat, 02 Oct 2004 22:12:36 +0100
Message-Id: <1096751556.18638.16.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, skorinkod@mail.ru
Subject: Re: Problems with DiskOnChip 2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2004-10-02 at 23:05 +0200, Thomas Gleixner wrote:
> > Possible DiskOnChip with unknown ChipID 36 found at 0xe8000
> > Possible DiskOnChip with unknown ChipID C6 found at 0xea000
> > Possible DiskOnChip with unknown ChipID F6 found at 0xec000
> > Possible DiskOnChip with unknown ChipID C1 found at 0xee000
> 
> None of those ID's is a valid chip ID except the 0x36, which is a
> 64MiB,1.8V chip. I doubt, that there are DoC's available with 1.8V
> supply. The stuff looks more like random nonsense.

That's DiskOnChip ChipID, not NAND chip ID. But yes, it looks like
random crap from other addresses, probably BIOS or extension ROMs.

-- 
dwmw2
