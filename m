Received: from tank.panorama.sth.ac.at ([193.170.53.11])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bo8tH-00062C-Ta
	for linux-mtd@lists.infradead.org; Fri, 23 Jul 2004 18:51:50 -0400
Received: from soldats.cb.ac.at (soldats.cb.ac.at [10.1.33.21])
	by tank.panorama.sth.ac.at (8.11.6/8.11.6) with ESMTP id i6NMpem21865
	for <linux-mtd@lists.infradead.org>; Sat, 24 Jul 2004 00:51:40 +0200
Received: from soldats.cb.ac.at (soldats.cb.ac.at [10.1.33.21])
	by soldats.cb.ac.at (8.12.8/8.12.8) with ESMTP id i6NMpe2P028072
	for <linux-mtd@lists.infradead.org>; Sat, 24 Jul 2004 00:51:40 +0200
Date: Sat, 24 Jul 2004 00:51:39 +0200
From: Peter Surda <shurdeek@routehat.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20040723225139.GK31924@soldats.cb.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Problems getting grub to work with DoC 2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have problems getting grub_firmware compiled correctly. No matter what I
try (patching, editing makefiles, ...), upon boot it doesn't find menu.lst on
the DoC and doesn't like
root (dc0,0)

I know it used to work, because I have another DoC2k on which I tried it about
a year ago and there are no problems with it.

Does anyone have a working grub_firmware for DoC2k with support for FAT and
can email it to me?

Bye,

Peter Surda (Shurdeek) <shurdeek@routehat.org>, ICQ 10236103, +436505122023

-- 
                Where do you think you're going today?
