Received: from ns1.thmulti.com ([141.11.234.67])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18VpcQ-0006hE-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Jan 2003 09:01:55 +0000
Received: from smtprelay.thmulti.com (smtprelay [141.11.194.9])
	by ns1.thmulti.com (8.9.3/8.9.1) with ESMTP id KAA22767
	for <linux-mtd@lists.infradead.org>; Tue, 7 Jan 2003 10:32:14 +0100 (MET)
Received: from parexch9.paris.thmulti.com (localhost [127.0.0.1])
	by smtprelay.thmulti.com (8.9.3/8.9.1) with ESMTP id KAA02148
	for <linux-mtd@lists.infradead.org>; Tue, 7 Jan 2003 10:32:12 +0100 (MET)
Message-ID: <BC0FB3F45E37D611B6AB006008F6C2C490A4C3@villexch1.villingen.thmulti.com>
From: Muenzer Markus <MuenzerM@thmulti.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: DiskOnChip blocks ... 
Date: Tue, 7 Jan 2003 10:32:11 +0100 
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

Hy everybody, 

I'm trying to run a doc 2000 with linux kernel 2.4.18 but fdisk blocks ?
I set up the driver correctly and the doc is recognized. The chip is nftla1
after booting. If I do more /proc/mtd I get
mtd0: 01000000 00004000 "DiskOnChip 2000". 
If I enter fdisk /dev/nftla1 the execution blocks. Does anyone have a
suggestion ? 
