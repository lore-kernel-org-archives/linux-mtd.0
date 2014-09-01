Message-ID: <54043FDA.4050707@gmail.com>
Date: Mon, 01 Sep 2014 11:43:54 +0200
From: Matteo Fortini <matteo.fortini@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [RFC] MTD m25p80 3-byte addressing and boot problem
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Cc: barebox@lists.infradead.org, mike@steroidmicros.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If a Linux/Barebox system is using an SPI flash of size >= 16 MB, the 
driver is switching to 3-byte addressing to be able to use linear access 
to the whole memory.

This leads to the impossibility to boot a board after a warm reset, 
because all bootloaders use the standard 2-byte addressing (if the board 
doesn't physically reset the flash or do something similar).

Some documentation in the following links:
http://www.at91.com/discussions/viewtopic.php/f,30/t,22849.html
https://community.freescale.com/docs/DOC-93632

The solution proposed on freescale forums is not final: it involves 
switching back to 2-byte addressing after every access, which still 
leaves a small window in which a warm reset would be fatal.

One solution would be to use the bank command in the flash, using each 
16MB bank linearly, and changing bank depending on the address. This 
would be messy for accesses which are crossing the boundary, but it is 
doable.

I'm asking here for comments before I start patching the code. Right now 
I resorted to stick to 2-byte addressing and leave half of my NOR (32MB) 
unused.

TIA,
M
