Received: from bay112-f22.bay112.hotmail.com ([64.4.26.32] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EOp35-0000cJ-G9
	for linux-mtd@lists.infradead.org; Mon, 10 Oct 2005 00:14:18 -0400
Message-ID: <BAY112-F220F3A8DFFA9ECE3156A5AB3790@phx.gbl>
From: "wen jia" <ganganwen@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Mon, 10 Oct 2005 03:53:21 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Subject: what should i do? using DOM and CF's problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,everyone
   I want to use DOM or CF in a ATM-like machine. In this machine I have to 
record after each exchange, and there is no UPS, so sudden Power loss must 
be accepted. I don't select DOC for its high price, not using harddisk for 
its high heat and easy damage.
   There is a article talking about the DOM,CF & DOC. And from this article 
there is no safe way to use a DOM,CF even DOC under such environment. what 
should I do?
   here is the article:http://www.koansoftware.com/en/art.php?art=40

Linux DiskOnChip, DiskOnModule, Compact Flash

Note that DOC (DiskOnChip) adn DOM (DiskOnModule) are completely different 
items:

DiskOnModule
A DOM device is interface compatible with a standard IDE drive, the 
software can't tell the difference, so consequently, you don't need any 
special boot sector or driver for it, the normal IDE driver and boot 
techniques will do. They do have some problems which I have tried to 
summarize in another posting in this thread.

DiskOnChip
A a DOC is basically a bank-switched flash memory device that comes with a 
tricky boot firmware preinstalled which replaces the BIOS's handlers for 
disk access calls. So the device *appears* as an IDE drive, but only as 
long as all accesses go through the BIOS. Since Linux does not use the 
BIOS, using a DOC requires a special device driver (which has been 
available for quite some time under "MTD Devices".


There are two things to consider when running a Linux system off a DOM, DOC 
or a CF

Wear
These devices use flash memory as their storage media. You can write to 
each block of flash memory only so many times (typically in the range of 
ten thousand to hundred thousand times). They do presumably implement some 
kind ow wear levelling internally (transparently distribute write accesses 
evenly over all available flash blocks) which improves things,
but nevertheless, if the Linux system keeps writing data to files, such a 
device can be worn out in a matter of weeks. To deal with this, the system 
should avoid write accesses where possible (best is to mount it read only, 
if not possible, at least use the "-noatime" mount option).

Sudden power loss
These devices are made to replace IDE disks, so they have apparently copied 
some of the problems of rotating had disk as well: It appears that, if 
power is lost while a write access was in progress, such a device can be 
seriously damaged. This has never been officialy acknowledged nor denied by 
any manufacturer as far as I am aware, but I have read numerous reports 
from credible people who have seen it happen. Some said that the device was 
damaged completely in the process, others said they were able to bring it 
back to life by doing a low-level format. In any case, all data on the 
device was lost.


In summary

If a sudden loss of power is an even remote possiblity for your 
application, the only way to safely use a DOM or CF is to keep it mounted 
read-only, and even if a power failure can be ruled out, there are still 
good reasons to keep it like that.


JFFS2
Neither a DOM or CF formatted with JFFS2 won't help for several reasons:

1. No read/write filesystem (neither JFFS* nor any other) can prevent a 
situation where a power failure happens while a write access is pending.

2. In order to do proper wear-levelling, JFFS needs to know the underlying 
media's block structure. But this information is invisible at the IDE 
interface. It may even vary across different CF makes/models.


About StrataFlash

StrataFlash is just plain flash memory and it makes sense
to use JFFS2 on Strataflash, because such a configuration should be 
resilient to power failures.

_________________________________________________________________
与联机的朋友进行交流，请使用 MSN Messenger:  http://messenger.msn.com/cn  
