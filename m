Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15eYrI-0002Vi-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2001 10:20:32 +0100
Message-ID: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6B23@mailse01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: mtd <linux-mtd@lists.infradead.org>
Subject: RE: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slo
	 w:(
Date: Wed, 5 Sep 2001 11:25:30 +0200 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

> What _are_ you using? If you're going through the MTD device 
> for the flash 
> chip, calling its read() method, that still ought to work.
> 
> If you're trying to just read the compressed data in the 
> flash chip directly
> from the memory location you happen to know it's mapped at, 
> you've just
> demonstrated why XIP on a writable chips is such a pain :)

The latter i'm afraid... but I'm working on using jffs2 instead of cramfs.
Would you recommend a read-only (mount -o ro) jffs2 root partition as a replacement for a cramfs root partition?

/Jonas
