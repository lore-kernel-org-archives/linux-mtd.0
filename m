Received: from ns1.thmulti.com ([141.11.234.67])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18VuaM-0007UN-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Jan 2003 14:20:06 +0000
Received: from smtprelay.thmulti.com (smtprelay [141.11.194.9])
	by ns1.thmulti.com (8.9.3/8.9.1) with ESMTP id PAA27923
	for <linux-mtd@lists.infradead.org>; Tue, 7 Jan 2003 15:50:23 +0100 (MET)
Received: from parexch9.paris.thmulti.com (localhost [127.0.0.1])
	by smtprelay.thmulti.com (8.9.3/8.9.1) with ESMTP id PAA16207
	for <linux-mtd@lists.infradead.org>; Tue, 7 Jan 2003 15:50:21 +0100 (MET)
Message-ID: <BC0FB3F45E37D611B6AB006008F6C2C490A4C9@villexch1.villingen.thmulti.com>
From: Muenzer Markus <MuenzerM@thmulti.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: DiskOnChip blocks
Date: Tue, 7 Jan 2003 15:50:19 +0100 
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

If I wait a long time fdisk starts an i can create a new partition. After i
press 'w' to write the partition table I get: 
-> The partition table has been altered!
-> Calling ioctl() to re-read partition table.
and then the damm thing blocks again ...

has anyone an idea ?

thank you for your reply ...
Markus
