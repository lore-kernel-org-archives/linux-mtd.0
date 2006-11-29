Received: from alias2.ihug.co.nz ([203.96.222.12])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GpDf8-0000mv-Gk
	for linux-mtd@lists.infradead.org; Wed, 29 Nov 2006 00:51:02 +0000
From: "Gavin Lambert" <gavinl@compacsort.com>
To: <linux-mtd@lists.infradead.org>
Subject: Removable MTD device
Date: Wed, 29 Nov 2006 13:50:17 +1300
Message-ID: <01f301c71350$56a27fb0$4800a8c0@gavinlpc>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

What's the best way to implement a removable MTD device?

Specifically, I've got a DataFlash card with an MMC footprint.  For
fault tolerance and graycoding I'd like to use JFFS2 on it, since that
seems like a good choice.  (Compatibility isn't an issue here since most
devices can't read DF cards anyway.)

However, the problem comes when the user inserts or removes the card
while the system is running.  I can do change detection readily enough
(through polling for the card's status periodically), but I'm not sure
how I should then pass that on to MTD and the rest of the system.  In
particular, what should I do if the filesystem is mounted?  Ideally I'd
like to auto-demount it, even if there is outstanding activity (since
there's no possible way it could succeed, since the card isn't there any
more).

I was also wondering how safe it is to change MTD device parameters
(such as type/size/etc) while the device is 'added'.  I don't really
want to remove and re-add the device on remove and insert events, since
that could change the device number.  So how safe is it to just flip the
type/size of an existing MTD device to MTD_ABSENT/0 on removal?
