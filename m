Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15eb3p-0002hz-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2001 12:41:37 +0100
Message-ID: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6B26@mailse01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: mtd <linux-mtd@lists.infradead.org>
Subject: RE: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slo
	 w:(
Date: Wed, 5 Sep 2001 13:46:33 +0200 
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

> jonas.holmberg@axis.com said:
> >  1. To be able to write to both devices the partitions must start on
> > eraseblock block boundary. The bootloader I would use with this
> > configuration is less than 10kB and my eraseblocks are 64kB. I would
> > waste to much space on the loader partition. 
> 
> You really don't want JFFS2 erasing and reprogramming the 
> sector with your 
> bootloader in, surely?

Wouldn't mounting the partition read-only prevent that?

/Jonas
