Received: from mail2.extendcp.co.uk ([82.110.105.34])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ECiJm-00089e-LR
	for linux-mtd@lists.infradead.org; Tue, 06 Sep 2005 14:37:18 -0400
Received: from dynamic-62-56-51-33.park-s46b.dslaccess.co.uk ([62.56.51.33]
	helo=GladysDNS) by mail2.extendcp.com with esmtpa (Exim 4.42)
	id 1ECiFC-0003xJ-QS
	for linux-mtd@lists.infradead.org; Tue, 06 Sep 2005 19:32:31 +0100
From: yahoo_groups@rovoreed.com
To: linux-mtd@lists.infradead.org
Date: Tue, 06 Sep 2005 18:39:04 -0000
MIME-Version: 1.0
Message-ID: <431DE248.20912.15DAC1@localhost>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: DiskonChip problems.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I used to have DiskonChip stuff working on 2.4.18 kernel, but I've been forced to upgrade to 2.4.31 and now I can't get it to work.

I used to have a driver called fldrvlnx, which created a module called doc.o and I'd simply load that module and then I could mount the DiskonChip with a line in fstab like

/dev/fla1	/mnt/fla1	msdos	defaults	0	0

Now I see in 2.4.31, things have moved on and the DiskonChip stuff is different. Can someone enlighten me as to how I'm supposed to get it to work ?

Thanks
