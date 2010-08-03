Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OgAhQ-00041j-Ke
	for linux-mtd@lists.infradead.org; Tue, 03 Aug 2010 06:10:08 +0000
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L6K00BNA9UB3R70@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 03 Aug 2010 14:27:47 +0900 (KST)
Received: from roh83 ([107.108.214.183])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L6K00LBT9U71U@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 03 Aug 2010 14:27:46 +0900 (KST)
Date: Tue, 03 Aug 2010 10:57:42 +0530
From: Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>
Subject: RE: Is repartitioning possible while one of the partitions is mounted?
In-reply-to: <1280755953.2174.24.camel@pc816>
To: 'Tim Cussins' <timcussins@eml.cc>, linux-mtd@lists.infradead.org
Message-id: <000001cb32cc$9af7a830$d0e6f890$%hs@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=Windows-1252
Content-language: en-us
Content-transfer-encoding: 7BIT
References: <1280755953.2174.24.camel@pc816>
Cc: v.dalal@samsung.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Tim

> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf
> Of Tim Cussins
> Sent: Monday, August 02, 2010 7:03 PM
> To: linux-mtd@lists.infradead.org
> Subject: Is repartitioning possible while one of the partitions is mounted?
> 
> Hi all,
> 
> I just spotted post regarding upcoming Runtime Partitioning Support
> (http://lists.infradead.org/pipermail/linux-mtd/2010-July/031200.html)
> 
> After taking a cursory glance at the patch it's not immediately obvious
> ( uh, to me anyway :D ) whether you can create/delete partitions while
> a filesystem (e.g. rootfs) is mounted from another partition on the same
> mtd device.
> 
Its possible to partition another partition; if file system is mounted on another partition of same device. Utility is tested for
all such scenarios.

> Under what conditions can you create/delete partitions?
This is a runtime utility. Currently the redefined partition table will exist in current power cycle. We are working on restoring
the partition table on Power ON. Once the utility is pushed in mainline then we will release patch for that.
> 
> Cheers,
> Tim
> 
> 
Regards
Rohit HS
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
