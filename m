Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HqRuC-00018B-S6
	for linux-mtd@lists.infradead.org; Tue, 22 May 2007 06:47:56 -0400
Received: from [10.191.255.159] (dhcp-255-159.norway.atmel.com
	[10.191.255.159])
	by relay.atmel.no (8.13.4/8.13.4) with ESMTP id l4MAll1S019490
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 May 2007 12:47:47 +0200 (CEST)
	(envelope-from hcegtvedt@atmel.com)
Subject: Re: Serial SPI flash
From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <008301c79c56$eae6c020$81c8a8c0@cayenne>
References: <008301c79c56$eae6c020$81c8a8c0@cayenne>
Content-Type: text/plain
Date: Tue, 22 May 2007 12:47:42 +0200
Message-Id: <1179830862.3159.24.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-05-22 at 15:22 +0530, jameesh wrote:
> Hi,
> 
> Please help me.
> Do MTD have serial SPI flash Support?

Yes, MTD supports serial flash through the standard SPI framework in the
kernel.

Enable AT45xxx DataFlash support under:
Device Drivers  --->
Memory Technology Devices (MTD)  --->
Self-contained MTD device drivers  --->
<M/*> Support for AT45xxx DataFlash

You must have a SPI driver before this option being available.

> Can  JFFS2 Flash File system be used on serial SPI flash?

Yes.

Enable JFFS2 under:
File systems  --->
Miscellaneous filesystems  --->
<M/*> Journalling Flash File System v2 (JFFS2) support

> I may be using SPI flash from ATMEL(M25P128) or ST 
> Microelectronics(AT45DB642D). Is there any Patch available for the device.

Atmel has a reference design running Linux and using a _ATMEL_
AT45FB642D DataFlash for storage of applications and data. The kit is
called ATNGW100.

Sorry if referring to kits is outside the scope of this list.

-- 
With kind regards,

Hans-Christian Egtvedt, siv.ing. (M.Sc.)
Applications Engineer - AVR32 System Solutions - Atmel Norway
