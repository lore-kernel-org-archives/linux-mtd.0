Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15eYOy-0002Q9-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2001 09:51:16 +0100
Message-ID: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6B21@mailse01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: mtd <linux-mtd@lists.infradead.org>,
   Wojciech Kromer
	 <krom@dgt-lab.com.pl>
Subject: RE: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slo
	w:(
Date: Wed, 5 Sep 2001 10:56:01 +0200 
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

> You could use a cramfs root filesystem then mount a small 
> jffs2 partition, 

I sometimes get decompression errors from cramfs with a configuration like that.
My guess is that you really shouldn't have a cramfs-partition on the same flash-
chip as a jffs or jffs2 partition since cramfs doesn't use mtd and does not know
if the chip is busy writing or erasing?

/Jonas
