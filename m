Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 177Ea5-0007KB-00
	for <linux-mtd@lists.infradead.org>; Mon, 13 May 2002 13:05:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020513101623.DE1A14235@tiger.actrix.co.nz> 
References: <20020513101623.DE1A14235@tiger.actrix.co.nz>  <3CDF6922.9A0A870F@netbricks.com> <16389.1021282176@redhat.com> 
To: manningc2@actrix.gen.nz
Cc: franck.fleter@netbricks.com, linux-mtd@lists.infradead.org
Subject: Re: Boot from NAND flash ??? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 13 May 2002 13:05:28 +0100
Message-ID: <23974.1021291528@redhat.com>
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

manningc2@actrix.gen.nz said:
>  There are however two mechanisms to get around this: * Some people
> and micros implement a "data pump" state machine to extract an
> executable sequence from a NAND device.

The DiskOnChip Millennium does this. Which is how it's used for LinuxBIOS 
-- the device has 512 bytes of SRAM which is initialised from the flash at 
reset time, and that's just about enough to initialise the system and pull 
the rest of the startup code off the flash.

Note that the DiskOnChip 2000 has ROM instead of RAM, so you can't change 
the startup code from the PC BIOS extension header that it ships with, 
hence can't use it for such things.

--
dwmw2
