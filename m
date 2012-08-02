Received: from e28smtp02.in.ibm.com ([122.248.162.2])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SwljA-0007SK-03
 for linux-mtd@lists.infradead.org; Thu, 02 Aug 2012 03:05:32 +0000
Received: from /spool/local
 by e28smtp02.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <hejianet@linux.vnet.ibm.com>;
 Thu, 2 Aug 2012 08:35:21 +0530
Received: from d28av01.in.ibm.com (d28av01.in.ibm.com [9.184.220.63])
 by d28relay04.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
 q7235JjC25886756
 for <linux-mtd@lists.infradead.org>; Thu, 2 Aug 2012 08:35:19 +0530
Received: from d28av01.in.ibm.com (loopback [127.0.0.1])
 by d28av01.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
 q728Yrqs022503
 for <linux-mtd@lists.infradead.org>; Thu, 2 Aug 2012 14:04:53 +0530
Received: from [127.0.0.1] ([9.123.236.172])
 by d28av01.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
 q728YHpn021255
 for <linux-mtd@lists.infradead.org>; Thu, 2 Aug 2012 14:04:50 +0530
Message-ID: <5019EE49.7000208@linux.vnet.ibm.com>
Date: Thu, 02 Aug 2012 11:04:41 +0800
From: hejianet <hejianet@linux.vnet.ibm.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: jffs2 copy too long after mounting
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi All
my kernel is 2.6.16
after mounting the nand flash with jffs2 partition, the first copy operation
for a 15M file(from jffs2 partition to jffs2 partition) take 9
minutes,but the
second copy operation takes 1 minutes.
the disk usage(df result) is over 85%.
I wonder is there any patch ported to such old kernel?
Thanks

B.R.
Jia
