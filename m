Received: from rm-rstar.sfu.ca ([142.58.120.21] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17tuJC-0001Se-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2002 19:21:19 +0100
Received: from fraser.sfu.ca (btlee@fraser.sfu.ca [142.58.101.25])
	by rm-rstar.sfu.ca (8.12.5/8.12.5/SFU-5.0H) with ESMTP id g8OILFNs018112
	for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2002 11:21:15 -0700 (PDT)
From: Benjamin Tze-Kit Lee <btlee@sfu.ca>
Received: (from btlee@localhost)
	by fraser.sfu.ca (8.9.2/8.9.2/SFU-5.0C) id LAA19873
	for linux-mtd@lists.infradead.org; Tue, 24 Sep 2002 11:21:14 -0700 (PDT)
Message-Id: <200209241821.LAA19873@fraser.sfu.ca>
Subject: What is a superblock in JFFS2?
To: linux-mtd@lists.infradead.org
Date: Tue, 24 Sep 2002 11:21:14 -0700 (PDT)
MIME-Version: 1.0
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

Hi,

Can anyone tell me what does a "super_block" represents in JFFS/MTD?
Is that equal to the whole memory block that's mounted to the file 
system/driver?

Thx a lot,
Ben
