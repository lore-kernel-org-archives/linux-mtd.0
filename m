Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Wd7d-000728-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Feb 2002 12:48:53 +0000
Received: from pcjonashg.axis.se (pcjonashg.axis.se [10.13.8.50])
	by krynn.axis.se (8.12.1/8.12.1/Debian -5) with ESMTP id g11B6F5l024876
	for <linux-mtd@lists.infradead.org>; Fri, 1 Feb 2002 12:06:15 +0100
Subject: chip drivers
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 01 Feb 2002 12:06:43 +0100
Message-Id: <1012561603.21481.4.camel@pcjonashg>
Mime-Version: 1.0
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

I need to use different flash chips (AMD compatible, mixed CFI and
non-CFI, mixed geometry etc) at the same time :). I think I will need to
change the cfi drivers and the cfi- and jedec-probe to accomplish this. 

I'm not going to try to use different chips in interleave (the code for
that would probably be unreadable, and who needs it?).

Are there other cases I ought to handle as well? Would anyone object if
I replace the cfi_probe and jedec_probe with one unified flash_probe?

I'll do some thinking and testing and come up with a more detailed plan
before I start doing any serious damag^H^H^H^H^Hcoding.

/Jonas
