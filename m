Received: from boisdslgw5poolb76.bois.uswest.net ([65.101.73.76] helo=ridgerun-lx.ridgerun.cxm)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15JxR7-0006K1-00
	for <linux-mtd@lists.infradead.org>; Tue, 10 Jul 2001 14:20:21 +0100
Message-ID: <3B4B0267.8DBE367@ridgerun.com>
Date: Tue, 10 Jul 2001 07:25:59 -0600
From: Steve Kranz <skranz@ridgerun.com>
MIME-Version: 1.0
To: skranz@ridgerun.com
CC: linux-mtd@lists.infradead.org
Subject: Help: MTD & SmartMedia
References: <01071015225100.01159@ronin>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Help -- what is the best MTD approach for a guy who
wants r/w ability of an embedded SmartMedia slot of
a Linux device, but also wants the media readable/writable
when taken to a desktop Windows box?

  Should I use this combination?

  vfat + MTD + nftl("user") + nand.c("driver")

Thanks!
Steve Kranz  <skranz@ridgerun.com>
RidgeRun, Inc.
