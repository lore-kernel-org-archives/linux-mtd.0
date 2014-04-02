Received: from extmail.intranet.gr ([192.92.155.11])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WVGQY-0004Md-KB
 for linux-mtd@lists.infradead.org; Wed, 02 Apr 2014 08:21:43 +0000
Received: from mailserv.intranet.gr (mailserv.intranet.GR [146.124.14.106])
 by extmail.intranet.gr (8.14.5/8.14.5) with ESMTP id s328LKUY020782
 for <linux-mtd@lists.infradead.org>; Wed, 2 Apr 2014 11:21:20 +0300 (EEST)
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
 by mailserv.intranet.gr (8.13.6/8.13.1) with ESMTP id s328LKnb002868
 for <linux-mtd@lists.infradead.org>; Wed, 2 Apr 2014 11:21:20 +0300 (EEST)
Received: from iris.intranet.gr (iris.intranet.GR [146.124.80.178])
 by mailserv.intranet.gr (8.13.6/8.13.1) with ESMTP id s328LKYv002865
 for <linux-mtd@lists.infradead.org>; Wed, 2 Apr 2014 11:21:20 +0300 (EEST)
Received: from pcrh103.intranet.gr ([146.124.34.84] verified)
 by iris.intranet.gr (CommuniGate Pro SMTP 5.3.13)
 with ESMTP id 62281803 for linux-mtd@lists.infradead.org;
 Wed, 02 Apr 2014 11:21:41 +0300
Message-ID: <533BC826.9010504@intracom-telecom.com>
Date: Wed, 02 Apr 2014 11:19:50 +0300
From: Apostolos Manolitzas <manap@intracom-telecom.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: UBIFS and High Availability schemes
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I am in the middle of researching for technical options for high
availability (replication mainly) between two systems with NAND
flash(UBIFS). I found the file systems drbd <http://www.drbd.org/> and 
GlusterFS <http://www.gluster.org/>  but I didn't have much success on
configuring drbd above UBIFS. In the UBI FAQ, it  notes that doesn't
support NFS but it's the same for the drbd?

Thanks for sharing any experiences that you may have with a similar
setup or similar problem.

-Apostolos
