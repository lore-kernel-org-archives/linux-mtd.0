Received: from main.gmane.org ([80.91.224.249])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AGkDJ-0005MI-3b
	for <linux-mtd@lists.infradead.org>; Mon, 03 Nov 2003 19:18:09 +0000
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1AGkC5-000370-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Nov 2003 20:16:53 +0100
To: linux-mtd@lists.infradead.org
From: Miernik <miernik@ctnet.pl>
Date: Mon, 3 Nov 2003 20:16:47 +0100
Message-ID: <slrnbqdacv.kc.miernik@tarnica.ctnet.pl>
References: <slrnbq4c10.qor.miernik@tarnica.ctnet.pl>
	<200310311225.19498.david@avoncliff.com>
Sender: news <news@sea.gmane.org>
Subject: Re: "this device cannot be used for FTL" with a SMART PCMCIA linear
	flash
Reply-To: Miernik <miernik@ctnet.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2003-10-31, david stevenson <david@avoncliff.com> wrote:

>> I'm trying to get a "SMART Modular Technologies 4MB FAST FLASH CARD
>> SM9FA2043IP280" PCMCIA linear flash Intel Series 2+ card working.
>
> I am new round here so can not help directly with your problem, but do you 
> know about wrflash utility that comes as part of the alios bootloader from
> www.telos.info/ftp/linux/alios/alios-source-2.2.tar.gz
> I use it to erase and write to /dev/mem0c0c.

Thanks. I now installed wrflash, but still no luck. I have compiled 
pcmcia-modules with debug=8 and I have very detailed debug logs now. 
Can someone take a look at them?
It's 5559 byes gziped, but 149368 bytes ungizped. It's avialable at 
http://www.miernik.ctnet.pl/mtd/6-with-debug/testlog
http://www.miernik.ctnet.pl/mtd/6-with-debug/testlog.gz

You can see the contents of my /etc/pcmcia at 
http://www.miernik.ctnet.pl/mtd/6-with-debug/pcmcia/

My logs when the system boots with the card:
http://www.miernik.ctnet.pl/mtd/6-with-debug/log/

And the used kernel and modules:
http://www.miernik.ctnet.pl/debian/pool/kernel-image-2.4.22_tarnica.1.0_i386.deb
http://www.miernik.ctnet.pl/debian/pool/pcmcia-modules-2.4.22_3.2.2-1.4+tarnica+debug.1.0_i386.deb

In short words: 

When trying to do 'ftl_format -i /dev/mem0c0c' I get:
block erase failed: Input/output error
format failed.

and in my /var/log/messages:

Nov  3 19:15:51 tarnica kernel: memory_erase(0, 0x0, 65536)
Nov  3 19:15:51 tarnica kernel: cs: CardServices(CheckEraseQueue, 0xcea7a700, 0x00000000)
Nov  3 19:15:51 tarnica kernel: cs: trying erase request 0xcdfee260...
Nov  3 19:15:51 tarnica kernel: iflash2+_mtd: flash_event(0x020000)
Nov  3 19:15:51 tarnica kernel: iflash2+_mtd: flash_erase(0xced86a80, 0xcee81800, 0x0, 0x10000)
Nov  3 19:15:51 tarnica kernel: cs: CardServices(GetStatus, 0xced86880, 0xcd965de4)
Nov  3 19:15:51 tarnica kernel: i82365: GetStatus(0) = 0x01c0
Nov  3 19:15:51 tarnica kernel: iflash2+_mtd: raising Vpp...
Nov  3 19:15:51 tarnica kernel: i82365: SetSocket(0, flags 0x200, Vcc 50, Vpp 120, io_irq 0, csc_mask 0x80)
Nov  3 19:15:51 tarnica kernel: Status = 1, requeueing.
Nov  3 19:15:51 tarnica kernel: cs: erase timeout for entry 0xcdfee260
Nov  3 19:15:51 tarnica kernel: cs: trying erase request 0xcdfee260...
Nov  3 19:15:51 tarnica kernel: iflash2+_mtd: flash_event(0x020000)
Nov  3 19:15:51 tarnica kernel: iflash2+_mtd: flash_erase(0xced86a80, 0xcee81800, 0x0, 0x10000)
Nov  3 19:15:51 tarnica kernel: i82365: SetMemMap(0, 1, 0x03, 80 ns, 0xe1000-0xe1fff, 0x00000)
Nov  3 19:15:51 tarnica kernel: i82365: SetMemMap(0, 2, 0x23, 250 ns, 0xe2000-0xe2fff, 0x04000)
Nov  3 19:15:51 tarnica kernel: iflash2+_mtd: set_rdy_mode(0404)
Nov  3 19:15:51 tarnica kernel: iflash2+_mtd: set_rdy_mode failed!
Nov  3 19:15:51 tarnica kernel: CSR = 0xffff, BSR = 0xffff, GSR = 0xffff
Nov  3 19:15:51 tarnica kernel: Status = 1, requeueing.
Nov  3 19:15:51 tarnica kernel: cs: erase timeout for entry 0xcdfee260
Nov  3 19:15:51 tarnica kernel: cs: trying erase request 0xcdfee260...
Nov  3 19:15:51 tarnica kernel: iflash2+_mtd: flash_event(0x020000)
Nov  3 19:15:51 tarnica kernel: iflash2+_mtd: flash_erase(0xced86a80, 0xcee81800, 0x0, 0x10000)
Nov  3 19:15:51 tarnica kernel: i82365: SetMemMap(0, 1, 0x03, 80 ns, 0xe1000-0xe1fff, 0x00000)
Nov  3 19:15:51 tarnica kernel: erase error: CSR = 0xffff, BSR = 0xffff, GSR = 0xffff
Nov  3 19:15:51 tarnica kernel: Status = 1, requeueing.


And while trying to do 'wrflash -ef test1 /dev/mem0c0c' (where test1 
is a sample 8kByte file) I get:

Partition size = 4 mb, erase unit size = 64 kb, start address 0x0


erasing block 1 of 64 (0x0-0xFFFF)
This will destroy data on the target device.  Confirm (y/n): y
block erase failed: Input/output error
---> failure.

And more or less the same thing as above in /var/log/messages. 

Reading from the card with dd looks OK, at least it doesn't say 
"error" anywhere :)

While reading I get about 60 kB/s from the block device and 200 kB/s 
from the character device. I get a file with all bits set to 1 
(FFFFFFFF etc), but maybe it is just what is on the card.

One more thing: I do it all through a Intel i82365sl B step rev 00 
ISA-to-PCMCIA card. It has a big chip "OMEGA MICRO 82C365G".

While I try to write to the card, I get Vpp 12.0V in cardctl config.

-- 
    Miernik         ________________________ jabber:miernik@jabber.gda.pl
__ ICQ: 4004001 ___/__ tel: +48608233394 __/      mailto:miernik@ctnet.pl
Save Europe from Software Patents 
http://www.gnu.org/philosophy/savingeurope.html
