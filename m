Received: from snail.directvbroadband.net ([216.227.60.197])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15f1iq-00055K-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Sep 2001 17:09:45 +0100
Received: from snail.directvbroadband.net (snail.directvbroadband.net [216.227.60.197])
	by snail.directvbroadband.net (Build 101 8.9.3/NT-8.9.3) with SMTP id JAA03034
	for <linux-mtd@lists.infradead.org>; Thu, 06 Sep 2001 09:36:28 -0700
Message-ID: <617933180D08D311AB500090273F1F96026A354E@storm.corp.directvbroadband.net>
From: "Fry, Dan" <dfry@bb.directv.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: JFFS2 NAND support?
Date: Thu, 6 Sep 2001 09:15:03 -0700 
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

Newbie Questions:

I'm currently working on a project that is switching from Intel Strata Flash
to a Toshiba TC58V64AFT part.  I've been using JFFS2 on the Intel and wanted
to continue on the Toshiba part.  Is anyone working on provisioning JFFS2
with NAND support?   

If no one is currently working on this could someone explain what's involved
in getting JFFS2 to function with a raw NAND flash?

Also what's the best strategy for handling bad blocks in MTD.  Should NFTL
be modified to eliminate its current dependency on DiskOnChip ECC hardware?
If not what's the best course of action? 

Thanks,


Dan Fry
Software Engineer

DIRECTV Broadband, Inc.
490 Race Street, San Jose, CA 95126
Phone - (408) 863-8313
Fax - (408) 861-8613
