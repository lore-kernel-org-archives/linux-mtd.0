Received: from [130.94.201.13] (helo=mail1.nyc.yamaha.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BeKqn-0004BP-QE
	for linux-mtd@lists.infradead.org; Sat, 26 Jun 2004 17:36:42 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail1.nyc.yamaha.com (Postfix) with ESMTP id 32FD11F516
	for <linux-mtd@lists.infradead.org>;
	Sat, 26 Jun 2004 17:36:06 -0400 (EDT)
Received: from [10.5.1.236] (68-174-180-151.nyc.rr.com [68.174.180.151])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail1.nyc.yamaha.com (Postfix) with ESMTP id 4E3A31F515
	for <linux-mtd@lists.infradead.org>;
	Sat, 26 Jun 2004 17:36:05 -0400 (EDT)
From: Herman Sheremetyev <mlists@swebpage.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1088285767.2194.15.camel@camel>
Mime-Version: 1.0
Date: Sat, 26 Jun 2004 17:36:07 -0400
Content-Transfer-Encoding: 7bit
Subject: Ricoh SD card reader
Reply-To: mlists@swebpage.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I'm hoping I'm on the right list with this question, if not please
accept my apologies and if possible direct me to the right place. I own
an Asus M6N series notebook that has a built-in SD card reader that I'm
trying to get working.  I'm running Fedora Core 2 with a vanilla 2.6.7
kernel and pcmcia-cs-3.2.7.  Reading through the pcmcia-cs docs it seems
that my chip is supported my the memory-cs module however all memory
support is removed from the RPM with a comment saying that it's obsolete
and should be handled by MTD drivers in the kernel.  The pcmcia-cs docs
also state that I can't use the standalone drivers with a 2.6 kernel so
I'm out of luck testing that module.  I read through the available
documentation on MTD that comes with the kernel and tried loading the
various mtd modules but nothing seems to work.  Here's some information
about the device:

[/sbin/lspci -vv]
02:01.1 CardBus bridge: Ricoh Co Ltd RL5c476 II (rev ac)
        Subsystem: Asustek Computer, Inc.: Unknown device 1864
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B-
        Status: Cap+ 66Mhz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR-
        Latency: 168
        Interrupt: pin B routed to IRQ 11
        Region 0: Memory at 20002000 (32-bit, non-prefetchable)
        Bus: primary=02, secondary=07, subordinate=0a, sec-latency=176
        Memory window 0: 20c00000-20fff000 (prefetchable)
        Memory window 1: 21000000-213ff000
        I/O window 0: 00004800-000048ff
        I/O window 1: 00004c00-00004cff
        BridgeCtl: Parity- SERR- ISA- VGA- MAbort- >Reset- 16bInt+
PostWrite+
        16-bit legacy interface ports at 0001

[/var/log/messages when plugging in an SD card]
Jun 26 15:56:24 camel kernel: cs: memory probe 0x0c0000-0x0fffff:
excluding 0xc0000-0xcbfff 0xe0000-0xfffff
Jun 26 15:56:24 camel cardmgr[1003]: unsupported card in socket 0
Jun 26 15:56:24 camel cardmgr[1003]:   product info: "RICOH",
"Bay1Controller"
Jun 26 15:56:24 camel cardmgr[1003]:   function: 254 ((null))


[/var/log/messages after /sbin/modprobe ftl]
Jun 26 17:01:47 camel kernel: $Id: ftl.c,v 1.51 2003/06/23 12:00:08
dwmw2 Exp $
Jun 26 17:01:47 camel kernel: ram_read(pos:0, len:68)
Jun 26 17:01:47 camel kernel: ram_read(pos:131072, len:68)
Jun 26 17:01:47 camel kernel: ram_read(pos:262144, len:68)
Jun 26 17:01:47 camel kernel: ram_read(pos:393216, len:68)
Jun 26 17:01:47 camel kernel: ram_read(pos:524288, len:68)
Jun 26 17:01:47 camel kernel: ram_read(pos:655360, len:68)
Jun 26 17:01:47 camel kernel: ram_read(pos:786432, len:68)
Jun 26 17:01:47 camel kernel: ram_read(pos:917504, len:68)
Jun 26 17:01:47 camel kernel: ftl_cs: FTL header not found.

None of the other MTD modules produce interesting output.  Any
assistance would be much appreciated.

TIA,

-Herman
