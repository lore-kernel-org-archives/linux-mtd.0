Received: from f90.law11.hotmail.com ([64.4.17.90] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18NvEA-0003pT-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2002 13:24:10 +0000
From: "the muppeteer" <themuppeteer@hotmail.com>
To: linux-mtd@lists.infradead.org
Subject: bug in doc drivers?
Date: Mon, 16 Dec 2002 14:52:31 +0100
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Message-ID: <F907zk8J05YfrkaWumO0000c6dc@hotmail.com>
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

Hello,

I compile my kernel (2.4.20) with mtd support.
I did everything as said in the documentation mtd-jffs-HOWTO.
I boot with my new kernel, and my flash is detected.
I mount my flash.
I write a large amount of data on it ,so that its 100% full.
Then, when I do a sync, the system freezes for about 1min 30.
Why ? Is this a bug in the drivers ? Does the flash need swap to
function properly now ? it didn't need swap before with the binairy
old modules.

System:
-------
Red Hat 7.2
Kernel 2.4.20
No swap (its for a bootable cd)
DiskOnChip 2000 16MB

Regards,

themuppeteer.


_________________________________________________________________
Ontvang je Hotmail & Messenger berichten op je mobiele telefoon met Hotmail 
SMS http://www.msn.nl/jumppage/
