Received: from authicp1.giga.net.tw ([203.133.1.106])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BVYnP-0005hg-49
	for linux-mtd@lists.infradead.org; Wed, 02 Jun 2004 12:40:56 -0400
Received: from yam.com (61-70-204-82.adsl.static.giga.net.tw [61.70.204.82])
	by authicp1.giga.net.tw (Postfix) with ESMTP id 016515D2B4
	for <linux-mtd@lists.infradead.org>;
	Thu,  3 Jun 2004 00:36:21 +0800 (CST)
Message-ID: <40BE02C6.5030107@yam.com>
Date: Thu, 03 Jun 2004 00:39:34 +0800
From: linuxtom@yam.com
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: erase error when I use the Intel E28F128J3C-150 chip
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all:

I wrote a flash writer program to download all images to this chip,It's
  working. and then, I tryed to use jffs2 & MTD to mount root filesystem.
I mounted this partition as root when I mounted It as a read only
filesystem.
But when I mounted it as a writeable filesystem, the system was crashed.
I tryed to debug this error, and I found that the problem is erase error
in do_erase_oneblock().
The system crashed after erase command.(CFI:0x20,0xD0) in this
function.(waiting... and then core dump....)

I can use my flash writer program to erase block,
so I rewrite a simple code like the erase function part of my flash
writer porgram to replace the do_erase_oneblock()
but the system crash after the CFI erase commend still, even It working
in my flash writer program.


Can you give me some help or advices ?

Thank you!!


Thomas# Chiang
